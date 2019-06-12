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
  Tree,
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
const { TreeNode } = Tree;

@connect(({ model }) => ({
  model,
}))
@Form.create()
class CreatePage extends PureComponent {
  // 定义要操作的模型名称
  modelName = 'role';
  // guardName
  guardlName = 'admin';

  state = {
    msg: '',
    url: '',
    data: {
      menus: [],
    },
    status: '',
    pagination: {},
    loading: false,
    checkedKeys: [],
  };

  // 当挂在模板时，初始化数据
  componentDidMount() {
    // loading
    this.setState({ loading: true });

    // 获得url参数
    const params = this.props.location.query;

    // 调用model
    this.props.dispatch({
      type: 'model/create',
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
      values.menuIds = this.state.checkedKeys;

      // 验证正确提交表单
      if (!err) {
        this.props.dispatch({
          type: 'model/store',
          payload: {
            modelName: this.modelName,
            guard_name: this.guardlName,
            ...values,
          },
        });
      }
    });
  };

  renderTreeNodes = data =>
    data.map(item => {
      if (item.children) {
        return (
          <TreeNode title={item.title} key={item.key} dataRef={item}>
            {this.renderTreeNodes(item.children)}
          </TreeNode>
        );
      }
      return <TreeNode {...item} />;
    });

  onCheck = checkedKeys => {
    this.setState({ checkedKeys: checkedKeys });
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
            title="添加角色"
            bordered={false}
            extra={<a href="javascript:history.go(-1)">返回上一页</a>}
          >
            <Form onSubmit={this.handleSubmit} style={{ marginTop: 8 }}>
              <Form.Item {...formItemLayout} label="名称">
                {getFieldDecorator('name', {
                  rules: [{ required: true, message: '名称必填！' }],
                })(<Input className={styles.smallItem} placeholder="请输入名称" />)}
              </Form.Item>
              <Form.Item {...formItemLayout} label="权限">
                <Tree
                  checkable
                  autoExpandParent={true}
                  defaultCheckedKeys={this.state.selectedKeys}
                  onCheck={this.onCheck}
                >
                  {this.renderTreeNodes(this.state.data.menus)}
                </Tree>
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
