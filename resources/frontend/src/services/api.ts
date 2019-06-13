import request from '@/utils/request';
import { stringify } from 'qs';

// 账号登录
export async function accountLogin(params: any) {
  return request('/api/admin/login', {
    method: 'post',
    data: params,
  });
}

// 获取手机验证码
export async function getCaptcha(params: any) {
  return request('/api/admin/tool/sms', {
    method: 'post',
    data: params,
  });
}

// 当前用户信息
export async function getAccountInfo() {
  return request('/api/admin/account/info');
}

// 当前用户消息
export async function getNotices(): Promise<any> {
  return request('/api/notices');
}

// 修改当前用户的资料
export async function changeAccountProfile(params: any) {
  return request(`/api/admin/account/profile`, {
    method: 'post',
    data: params,
  });
}

// 修改当前用户的密码
export async function changeAccountPassword(params: any) {
  return request(`/api/admin/account/password`, {
    method: 'post',
    data: params,
  });
}

// 用户充值
export async function recharge(params: any) {
  return request(`/api/admin/user/recharge`, {
    method: 'post',
    data: params,
  });
}

// 获取权限菜单
export async function getAccountMenus() {
  return request('/api/admin/account/menus');
}

// 获取网站设置
export async function getWebsiteConfig(params: any) {
  return request(`/api/admin/config/website?${stringify(params)}`);
}

// 保存网站设置
export async function saveWebsiteConfig(params: any) {
  return request(`/api/admin/config/saveWebsite`, {
    method: 'POST',
    data: params,
  });
}
