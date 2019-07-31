<?php

namespace App\Http\Controllers\Tools;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\Helper;
use App\Models\Sms;
use Session;

class SmsController extends Controller
{
    /**
     * 发送短信验证码
     * @param  integer
     * @return string
     */
    public function send(Request $request)
    {
        $phone = $request->input('phone');
        $captcha = $request->input('captcha');
        $type = $request->input('type');
        $getCaptcha = Session::get('captcha');

        // 暂时关掉图形验证码
        if (empty($captcha) || ($captcha != $getCaptcha)) {
            return $this->error('验证码错误！');
        }

        if(empty($phone)) {
            return $this->error('手机号不能为空！');
        }

        if(!preg_match("/^1[34578]\d{9}$/", $phone)) {
            return $this->error('手机号格式不正确！');
        }

        $sms = Sms::where('phone',$phone)
        ->orderBy('id', 'desc')
        ->first();

        // 每隔60秒才能发送短信
        if(!empty($sms)) {
            if((time() - strtotime($sms->created_at)) < 60 ) {
                return $this->error('抱歉，您短信发送过于频繁！');
            }
        }

        $sendDayCount = Sms::whereBetween('created_at', [date('Y-m-d 00:00:00'), date('Y-m-d 23:59:59')])
        ->where('phone',$phone)->count();

        // 每天最多发送15条短信
        if($sendDayCount >15) {
            return $this->error('抱歉，每个手机号一天最多获取十五条短信！');
        }

        // 生成验证码
        $code = Helper::makeRand();
        $content = '验证码：'.$code.'，请及时输入完成验证。如非本人操作，请忽略。';

        switch ($type) {
            case 'sioo': // 希奥发送短信验证码
                $result = Helper::siooSendSms($phone,$content);
                break;
            
            default: // 默认阿里大鱼短信验证码
                $templateCode = Helper::getConfig('ALIDAYU_TEMPLATE_CODE');
                $smsParam = [ 'code' => $code];
                $result = Helper::alidayuSendSms($templateCode,$phone,$smsParam);
                break;
        }

        $data['phone'] = $phone;
        $data['code'] = $code;
        $data['content'] = $content;

        if($result) {
            $data['status'] = 1;
            Sms::create($data);
            return $this->success('短信已发送，请注意查收！');
        } else {
            $data['status'] = 2;
            Sms::create($data);
            return $this->error('短信发送失败！');
        }
    }
}
