import React, { Component } from 'react';
import { connect } from 'dva';
import { FormComponentProps } from 'antd/es/form';
import { Dispatch } from 'redux';
import styles from './Login.less';

import { Form, Input, Button, Icon } from 'antd';

interface IFormComponentProps extends FormComponentProps {
  dispatch: Dispatch<any>;
  submitting: boolean;
}

@connect(({ loading }: { loading: { effects: { [key: string]: string } } }) => ({
  submitting: loading.effects['login/login'],
}))

class LoginPage extends Component<IFormComponentProps> {
  handleSubmit = (e: React.FormEvent) => {
    const { dispatch, form } = this.props;
    e.preventDefault();
    form.validateFieldsAndScroll((err, values) => {
      console.log(values);
      if (!err) {
        dispatch({
          type: 'login/login',
          payload: values,
        });
      }
    });
  };

  render() {
    const { submitting } = this.props;

    const {
      form: { getFieldDecorator },
    } = this.props;

    return (
      <div className={styles.main}>
        <Form onSubmit={this.handleSubmit}>
          <Form.Item>
            {getFieldDecorator('username')(
              <Input
                prefix={<Icon type="user" style={{ color: 'rgba(0,0,0,.25)' }} />}
                placeholder="用户名"
              />,
            )}
          </Form.Item>
          <Form.Item>
            {getFieldDecorator('password')(
              <Input
                prefix={<Icon type="lock" style={{ color: 'rgba(0,0,0,.25)' }} />}
                type="password"
                placeholder="密码"
              />,
            )}
          </Form.Item>
          <Form.Item>
            <Button
              type="primary"
              loading={submitting}
              htmlType="submit"
              className={styles.loginFormButton}
            >
              登录
            </Button>
          </Form.Item>
        </Form>
      </div>
    );
  }
}

export default Form.create<IFormComponentProps>()(LoginPage);
