import React, { PureComponent } from 'react';
import { connect } from 'dva';
import router from 'umi/router';
import styles from './Style.less';
import PageHeaderWrapper from '@/components/PageHeaderWrapper';

import { Row, Col, Menu, Form, Input, Button } from 'antd';

@connect(({ account }) => ({
  account,
}))
@Form.create()
class InfoPage extends PureComponent {
  state = {
    msg: '',
    url: '',
    data: {},
    status: '',
    pagination: {},
    loading: false,
  };

  // 当挂在模板时，初始化数据
  componentDidMount() {
    // loading
    this.setState({ loading: true });

    // 调用model
    this.props.dispatch({
      type: 'account/getAccountInfo',
      callback: res => {
        // 执行成功后，进行回调
        if (res) {
          // 接口得到数据，放到state里
          this.setState({ data: res.data, loading: false });
        }
      },
    });
  }

  handleSubmit = e => {
    e.preventDefault();
    this.props.form.validateFields((err, values) => {
      // 验证正确提交表单
      if (!err) {
        this.props.dispatch({
          type: 'account/changeAccountProfile',
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
              defaultSelectedKeys={['info']}
              mode="inline"
            >
              <Menu.Item key="info">基本信息</Menu.Item>
              <Menu.Item key="security">账户安全</Menu.Item>
            </Menu>
          </div>
          <div className={styles.content}>
            <div>
              <span className={styles.title}>基本信息</span>
            </div>
            <div>
              <Form onSubmit={this.handleSubmit}>
                <Form.Item style={{ marginBottom: 8 }} {...formItemLayout} label="用户名">
                  {this.state.data.username}
                </Form.Item>
                <Form.Item style={{ marginBottom: 8 }} {...formItemLayout} label="昵称">
                  {getFieldDecorator('nickname', {
                    rules: [{ required: true, message: '请输入昵称！' }],
                    initialValue: this.state.data.nickname,
                  })(<Input className={styles.smallItem} placeholder="请输入昵称" />)}
                </Form.Item>
                <Form.Item style={{ marginBottom: 8 }} {...formItemLayout} label="邮箱">
                  {getFieldDecorator('email', {
                    rules: [{ required: true, message: '请输入邮箱！' }],
                    initialValue: this.state.data.email,
                  })(<Input className={styles.smallItem} placeholder="请输入邮箱" />)}
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

export default InfoPage;
