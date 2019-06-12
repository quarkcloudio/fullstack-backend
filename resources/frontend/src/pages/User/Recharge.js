import React, { PureComponent } from 'react';
import { connect } from 'dva';
import router from 'umi/router';
import styles from './Recharge.less';
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
  Form,
  Input,
  Button,
  Radio,
  Upload,
  message,
} from 'antd';

const { TextArea } = Input;

@connect(({ model }) => ({
  model,
}))
@Form.create()
class RechargePage extends PureComponent {
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

  // 当挂在模板时，初始化数据
  componentDidMount() {
    // loading
    this.setState({ loading: true });

    // 获得url参数
    const params = this.props.location.query;

    // 调用model
    this.props.dispatch({
      type: 'model/edit',
      payload: {
        modelName: this.modelName,
        ...params,
      },
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
      // 数据id
      values.id = this.state.data.id;

      // 验证正确提交表单
      if (!err) {
        this.props.dispatch({
          type: 'user/recharge',
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

    return (
      <PageHeaderWrapper>
        <div className={styles.container}>
          <Card
            size="small"
            title="会员充值"
            bordered={false}
            extra={<a href="javascript:history.go(-1)">返回上一页</a>}
          >
            <Form onSubmit={this.handleSubmit} style={{ marginTop: 8 }}>
              <Form.Item style={{ marginBottom: 8 }} {...formItemLayout} label="充值用户">
                {this.state.data.name}（{this.state.data.nickname}）
              </Form.Item>
              <Form.Item style={{ marginBottom: 8 }} {...formItemLayout} label="当前余额">
                <span style={{ color: '#f81d22' }}>{this.state.data.money}</span>
              </Form.Item>
              <Form.Item style={{ marginBottom: 8 }} {...formItemLayout} label="当前积分">
                <span style={{ color: '#0b8235' }}>{this.state.data.point}</span>
              </Form.Item>
              <Form.Item style={{ marginBottom: 8 }} {...formItemLayout} label="余额充值">
                {getFieldDecorator('money', {
                  initialValue: 0,
                })(<Input className={styles.smallItem} placeholder="请输入充值金额" />)}
                （正数为充值，负数为扣款）
              </Form.Item>
              <Form.Item style={{ marginBottom: 8 }} {...formItemLayout} label="积分充值">
                {getFieldDecorator('point', {
                  initialValue: 0,
                })(<Input className={styles.smallItem} placeholder="请输入充值数量" />)}
                （正数为充值，负数为扣除）
              </Form.Item>
              <Form.Item style={{ marginBottom: 8 }} {...formItemLayout} label="充值理由">
                {getFieldDecorator('remark', {
                  rules: [{ required: true, message: '充值理由必填！' }],
                })(
                  <TextArea
                    className={styles.middleItem}
                    placeholder="请输入充值理由"
                    autosize={{ minRows: 3, maxRows: 6 }}
                  />,
                )}
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

export default RechargePage;
