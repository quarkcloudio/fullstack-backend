import React, { PureComponent } from 'react';
import { connect } from 'dva';
import router from 'umi/router';
import styles from './Edit.less';
import PageHeaderWrapper from '@ant-design/pro-layout/lib/PageHeaderWrapper';
import moment from 'moment';
import 'moment/locale/zh-cn';
moment.locale('zh-cn');
import locale from 'antd/lib/date-picker/locale/zh_CN';

import {
  Card,
  Row,
  Col,
  InputNumber,
  DatePicker,
  Tabs,
  Switch,
  Icon,
  Tag,
  Form,
  Select,
  Input,
  Button,
  Checkbox,
  Radio,
  Upload,
  message,
  Modal,
} from 'antd';

const { TextArea } = Input;
const TabPane = Tabs.TabPane;
const Option = Select.Option;
const RadioGroup = Radio.Group;

@connect(({ model }) => ({
  model,
}))
@Form.create()
class CreatePage extends PureComponent {
  // 定义要操作的模型名称
  modelName = 'user';

  state = {
    msg: '',
    url: '',
    data: {
      categorys: [],
      file_id: null,
      file_name: null,
      file_path: null,
    },
    status: '',
    pagination: {},
    loading: false,
  };

  handleSubmit = e => {
    e.preventDefault();

    this.props.form.validateFields((err, values) => {
      // 数据id
      values.id = this.state.data.id;
      // 封面图id
      values.cover_id = this.state.data.cover_id;

      // 验证正确提交表单
      if (!err) {
        this.props.dispatch({
          type: 'model/store',
          payload: {
            modelName: this.modelName,
            ...values,
          },
        });
      }
    });
  };

  render() {
    const { getFieldDecorator } = this.props.form;

    const formItemLayout = {
      labelCol: {
        xs: { span: 24 },
        sm: { span: 2 },
      },
      wrapperCol: {
        xs: { span: 24 },
        sm: { span: 22 },
      },
    };

    let state = {
      loading: false,
    };

    const uploadButton = (
      <div>
        <Icon type="plus" />
        <div className="ant-upload-text">上传图片</div>
      </div>
    );

    // 图片上传
    const uploadPictureProps = {
      name: 'file',
      listType: 'picture-card',
      showUploadList: false,
      action: '/api/admin/picture/upload',
      headers: {
        authorization: 'Bearer ' + sessionStorage['token'],
      },
      beforeUpload: file => {
        if (file.type !== 'image/jpeg' && file.type !== 'image/png') {
          message.error('请上传jpg或png格式的图片!');
          return false;
        }
        const isLt2M = file.size / 1024 / 1024 < 2;
        if (!isLt2M) {
          message.error('图片大小不可超过2MB!');
          return false;
        }
        return true;
      },
      onChange: info => {
        if (info.file.status === 'uploading') {
          this.setState({ loading: true });
          return;
        }

        if (info.file.status === 'done') {
          // Get this url from response in real world.
          if (info.file.response.status === 'success') {
            let stateData = this.state.data;
            stateData.cover_id = info.file.response.data.id;
            stateData.cover_path = info.file.response.data.url;

            this.setState({ data: stateData, loading: false });
          } else {
            message.error(info.file.response.msg);
          }
        }
      },
    };

    // 附件上传
    const uploadFileProps = {
      name: 'file',
      action: '/api/admin/file/upload',
      headers: {
        authorization: 'Bearer ' + sessionStorage['token'],
      },
      onChange(info) {
        if (info.file.status !== 'uploading') {
          console.log(info.file, info.fileList);
        }
        if (info.file.status === 'done') {
          message.success(`${info.file.name} 上传成功！`);
        } else if (info.file.status === 'error') {
          message.error(`${info.file.name} 上传失败！`);
        }
      },
    };

    return (
      <PageHeaderWrapper>
        <div className={styles.container}>
          <Card
            size="small"
            title="新增会员"
            bordered={false}
            extra={<a href="javascript:history.go(-1)">返回上一页</a>}
          >
            <Form onSubmit={this.handleSubmit} style={{ marginTop: 8 }}>
              <Form.Item style={{ marginBottom: 8 }} {...formItemLayout} label="头像">
                <Upload {...uploadPictureProps}>
                  {this.state.data.cover_path ? (
                    <img src={this.state.data.cover_path} alt="avatar" width={80} />
                  ) : (
                    uploadButton
                  )}
                </Upload>
              </Form.Item>
              <Form.Item style={{ marginBottom: 8 }} {...formItemLayout} label="用户名">
                {getFieldDecorator('name', {
                  rules: [{ required: true, message: '用户名必填！' }],
                })(<Input className={styles.smallItem} placeholder="请输入用户名" />)}
              </Form.Item>
              <Form.Item style={{ marginBottom: 8 }} {...formItemLayout} label="昵称">
                {getFieldDecorator('nickname', {
                  rules: [{ required: true, message: '昵称必填！' }],
                })(<Input className={styles.smallItem} placeholder="请输入昵称" />)}
              </Form.Item>
              <Form.Item style={{ marginBottom: 8 }} {...formItemLayout} label="邮箱">
                {getFieldDecorator('email', {
                  rules: [{ required: true, message: '邮箱必填！' }],
                })(<Input className={styles.smallItem} placeholder="请输入邮箱" />)}
              </Form.Item>
              <Form.Item style={{ marginBottom: 8 }} {...formItemLayout} label="性别">
                {getFieldDecorator('sex', {
                  initialValue: 1,
                })(
                  <RadioGroup>
                    <Radio value={1}>男</Radio>
                    <Radio value={2}>女</Radio>
                  </RadioGroup>,
                )}
              </Form.Item>
              <Form.Item style={{ marginBottom: 8 }} {...formItemLayout} label="密码">
                {getFieldDecorator('password', {
                  rules: [{ required: true, message: '密码必填！' }],
                })(<Input className={styles.smallItem} type="password" placeholder="请输入密码" />)}
              </Form.Item>
              <Form.Item style={{ marginBottom: 8 }} {...formItemLayout} label="手机号">
                {getFieldDecorator('phone', {
                  rules: [{ required: true, message: '手机号必填！' }],
                })(<Input className={styles.smallItem} placeholder="请输入手机号" />)}
              </Form.Item>
              <Form.Item style={{ marginBottom: 8 }} {...formItemLayout} label="状态">
                {getFieldDecorator('status', {
                  initialValue: true,
                  valuePropName: 'checked',
                })(<Switch checkedChildren="正常" unCheckedChildren="禁用" />)}
              </Form.Item>
              <Form.Item wrapperCol={{ span: 12, offset: 5 }}>
                <Button type="primary" htmlType="submit">
                  提交
                </Button>
              </Form.Item>
            </Form>
          </Card>
        </div>
      </PageHeaderWrapper>
    );
  }
}

export default CreatePage;
