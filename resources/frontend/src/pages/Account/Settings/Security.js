import React, { PureComponent } from 'react';
import { connect } from 'dva';
import router from 'umi/router';
import styles from './Style.less';
import PageHeaderWrapper from '@ant-design/pro-layout/es/PageHeaderWrapper';

import { Menu, Form, Input, Button } from 'antd';

@connect(({ account }) => ({
  account,
}))
@Form.create()
class SecurityPage extends PureComponent {
  state = {
    msg: '',
    url: '',
    data: {},
    status: '',
    pagination: {},
    loading: false,
  };

  handleSubmit = e => {
    e.preventDefault();
    this.props.form.validateFields((err, values) => {
      // 验证正确提交表单
      if (!err) {
        this.props.dispatch({
          type: 'account/changeAccountPassword',
          payload: {
            ...values,
          },
        });
      }
    });
  };

  handleMenuClick = ({ key }) => {
    if (key === 'info') {
      router.push('/account/settings/info');
      return;
    }

    if (key === 'security') {
      router.push('/account/settings/security');
      return;
    }
  };

  render() {
    const { getFieldDecorator } = this.props.form;

    const formItemLayout = {
      labelCol: {
        xs: { span: 24 },
        sm: { span: 4 },
      },
      wrapperCol: {
        xs: { span: 24 },
        sm: { span: 20 },
      },
    };

    return (
      <PageHeaderWrapper>
        <div className={styles.container}>
          <div className={styles.sider}>
            <Menu
              onClick={this.handleMenuClick}
              style={{ width: 256, minHeight: 500 }}
              defaultSelectedKeys={['security']}
              mode="inline"
            >
              <Menu.Item key="info">基本信息</Menu.Item>
              <Menu.Item key="security">账户安全</Menu.Item>
            </Menu>
          </div>
          <div className={styles.content}>
            <div>
              <span className={styles.title}>账户安全</span>
            </div>
            <div>
              <Form onSubmit={this.handleSubmit}>
                <Form.Item style={{ marginBottom: 8 }} {...formItemLayout} label="原密码">
                  {getFieldDecorator('oldPassword', {
                    rules: [{ required: true, message: '请输入原密码！' }],
                  })(
                    <Input
                      className={styles.smallItem}
                      type="password"
                      placeholder="请输入原密码"
                    />,
                  )}
                </Form.Item>
                <Form.Item style={{ marginBottom: 8 }} {...formItemLayout} label="新密码">
                  {getFieldDecorator('password', {
                    rules: [{ required: true, message: '请输入新密码！' }],
                  })(
                    <Input
                      className={styles.smallItem}
                      type="password"
                      placeholder="请输入新密码"
                    />,
                  )}
                </Form.Item>
                <Form.Item style={{ marginBottom: 8 }} {...formItemLayout} label="确认密码">
                  {getFieldDecorator('repassword', {
                    rules: [{ required: true, message: '请输入确认密码！' }],
                  })(
                    <Input
                      className={styles.smallItem}
                      type="password"
                      placeholder="请输入确认密码"
                    />,
                  )}
                </Form.Item>
                <Form.Item wrapperCol={{ span: 12, offset: 5 }}>
                  <Button type="primary" htmlType="submit">
                    提交
                  </Button>
                </Form.Item>
              </Form>
            </div>
          </div>
        </div>
      </PageHeaderWrapper>
    );
  }
}

export default SecurityPage;
