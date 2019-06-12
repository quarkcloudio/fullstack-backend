import React, { PureComponent } from 'react';
import { connect } from 'dva';
import router from 'umi/router';
import styles from './Index.less';
import PageHeaderWrapper from '@ant-design/pro-layout/lib/PageHeaderWrapper';
import { routerRedux } from 'dva/router';
import { stringify } from 'qs';

import {
  Row,
  Col,
  Icon,
  Select,
  Input,
  Form,
  Button,
  Tag,
  Modal,
  message,
  Table,
  Divider,
  Popconfirm,
  DatePicker,
  TimePicker,
  Switch,
  InputNumber,
} from 'antd';

const Search = Input.Search;
const { RangePicker } = DatePicker;
const ButtonGroup = Button.Group;
const confirm = Modal.confirm;
const Option = Select.Option;

@connect(({ modal }) => ({
  modal,
}))
@Form.create()
class IndexPage extends PureComponent {
  // 定义要操作的模型名称
  modelName = 'menu';
  // 定义guardName
  guardName = 'admin';

  state = {
    msg: '',
    url: '',
    data: {
      categorys: [],
      menuTreeLists: [],
      permissions: [],
      icons: [],
    },
    status: '',
    pagination: {},
    loading: false,
    previewVisible: false,
    previewImage: '',
    expand: false, // 高级搜索是否展开
    selectedRowKeys: [],
    createModalVisible: false,
    editModalVisible: false,
    form: {
      name: '',
      pid: '',
      sort: 0,
      icon: '',
      path: '',
    },
  };

  // 当挂在模板时，初始化数据
  componentDidMount() {
    // loading
    this.setState({ loading: true });

    // 调用model
    this.props.dispatch({
      type: 'model/index',
      payload: {
        modelName: this.modelName,
        guardName: this.guardName,
      },
      callback: res => {
        // 执行成功后，进行回调
        if (res) {
          this.setState({ ...res, loading: false });
        }
      },
    });
  }

  // 删除操作
  handleDestroy = id => {
    const { dispatch } = this.props;
    dispatch({
      type: 'model/destroy',
      payload: {
        modelName: this.modelName,
        id: id,
      },
    }).then(() => {
      // 操作成功
      if (this.state.status === 'success') {
        const { dispatch } = this.props;
        // 调用model
        dispatch({
          type: 'model/index',
          payload: {
            modelName: this.modelName,
            ...this.state.pagination,
            search: this.state.search,
          },
          callback: res => {
            // 执行成功后，进行回调
            if (res) {
              this.setState({ ...res, loading: false });
            }
          },
        });
      }
    });
  };

  // 删除多个操作
  handleMultiDestroy = () => {
    const that = this;
    confirm({
      title: '确定删除这些数据吗？',
      content: '删除后数据不可恢复，请谨慎操作！',
      okText: '确认',
      cancelText: '取消',
      centered: true,
      onOk() {
        let ids = that.state.selectedRowKeys;
        const { dispatch } = that.props;
        dispatch({
          type: 'model/destroy',
          payload: {
            modelName: that.modelName,
            id: ids,
          },
        }).then(() => {
          // 操作成功
          const { dispatch } = that.props;
          // 调用model
          dispatch({
            type: 'model/index',
            payload: {
              modelName: that.modelName,
              ...that.state.pagination,
              search: that.state.search,
            },
            callback: res => {
              // 执行成功后，进行回调
              if (res) {
                that.setState({ ...res, loading: false });
              }
            },
          });
        });
      },
      onCancel() {},
    });
  };

  // 改变数据状态操作
  handleStatusChange = (id, status) => {
    // loading
    this.setState({ loading: true });

    const { dispatch } = this.props;
    dispatch({
      type: 'model/changeStatus',
      payload: {
        modelName: this.modelName,
        id: id,
        status: status,
      },
    }).then(() => {
      const { dispatch } = this.props;
      // 调用model
      dispatch({
        type: 'model/index',
        payload: {
          modelName: this.modelName,
          ...this.state.pagination,
          search: this.state.search,
        },
        callback: res => {
          // 执行成功后，进行回调
          if (res) {
            this.setState({ ...res, loading: false });
          }
        },
      });
    });
  };

  // 改变多个数据状态操作
  handleMultiStatusChange = status => {
    // loading
    this.setState({ loading: true });

    let ids = this.state.selectedRowKeys;

    const { dispatch } = this.props;
    dispatch({
      type: 'model/changeStatus',
      payload: {
        modelName: this.modelName,
        id: ids,
        status: status,
      },
    }).then(() => {
      const { dispatch } = this.props;
      // 调用model
      dispatch({
        type: 'model/index',
        payload: {
          modelName: this.modelName,
          ...this.state.pagination,
          search: this.state.search,
        },
        callback: res => {
          // 执行成功后，进行回调
          if (res) {
            this.setState({ ...res, loading: false });
          }
        },
      });
    });
  };

  // 分页切换
  handleTableChange = (pagination, filters, sorter) => {
    // loading
    this.setState({ loading: true });
    const { dispatch } = this.props;
    // 调用model
    dispatch({
      type: 'model/index',
      payload: {
        modelName: this.modelName,
        pageSize: pagination.pageSize, // 分页数量
        current: pagination.current, // 当前页码
        sortField: sorter.field, // 排序字段
        sortOrder: sorter.order, // 排序规则
        ...filters, // 筛选
        search: this.state.search,
        guardName: this.guardName,
      },
      callback: res => {
        // 执行成功后，进行回调
        if (res) {
          this.setState({ ...res, loading: false, selectedRowKeys: [] });
        }
      },
    });
  };

  // 展开或收缩高级搜索
  toggle = () => {
    const { expand } = this.state;
    this.setState({ expand: !expand });
  };

  // 全选
  handleSelectAll = () => {
    let rowKeys = this.state.data.lists.map(item => {
      return item.id;
    });

    console.log(rowKeys);

    this.setState({
      selectedRowKeys: rowKeys,
    });
  };

  // 取消全选
  handleCancelSelectAll = () => {
    this.setState({
      selectedRowKeys: [],
    });
  };

  // 选择事件
  onSelectChange = selectedRowKeys => {
    console.log('selectedRowKeys changed: ', selectedRowKeys);
    this.setState({ selectedRowKeys });
  };

  // 搜索
  handleSearch = e => {
    e.preventDefault();

    this.props.form.validateFields((err, values) => {
      if (values.dateRange) {
        if (values.dateRange[0] && values.dateRange[1]) {
          // 时间标准化
          let dateStart = values.dateRange[0].format('YYYY-MM-DD');
          let dateEnd = values.dateRange[1].format('YYYY-MM-DD');

          // 先清空对象
          values.dateRange = [];

          // 重新赋值对象
          values.dateRange = [dateStart, dateEnd];
        }
      }

      // 验证正确提交表单
      if (!err) {
        const { dispatch } = this.props;
        // 调用model
        dispatch({
          type: 'model/index',
          payload: {
            modelName: this.modelName,
            ...this.state.pagination,
            search: values,
            guardName: this.guardName,
          },
          callback: res => {
            // 执行成功后，进行回调
            if (res) {
              this.setState({ ...res, loading: false });
            }
          },
        });
      }
    });
  };

  // 搜索重置
  handleResetSearch = () => {
    this.props.form.resetFields();
  };

  // 显示创建弹窗
  showCreateFormModal = () => {
    this.setState({
      createModalVisible: true,
    });
  };

  // 提交创建
  handleStoreFormData = e => {
    // loading
    this.setState({ loading: true });

    e.preventDefault();
    this.props.form.validateFields((err, values) => {
      console.log(values);

      // 验证正确提交表单
      if (!err) {
        this.props
          .dispatch({
            type: 'model/modalStore',
            payload: {
              modelName: this.modelName,
              ...values,
            },
          })
          .then(() => {
            const { dispatch } = this.props;
            // 调用model
            dispatch({
              type: 'model/index',
              payload: {
                modelName: this.modelName,
                ...this.state.pagination,
                search: this.state.search,
              },
              callback: res => {
                this.props.form.resetFields();

                // 执行成功后，进行回调
                if (res) {
                  this.setState({ ...res, loading: false, createModalVisible: false });
                }
              },
            });
          });
      }
    });
  };

  // 取消创建菜单
  handleCancelStoreFormData = () => {
    this.setState({ createModalVisible: false });
  };

  // 显示编辑弹窗
  showEditFormModal = (id = null) => {
    this.setState({
      editModalVisible: true,
    });

    // 编辑数据
    if (id) {
      // loading
      this.setState({ loading: true });

      // 调用model
      this.props.dispatch({
        type: 'model/edit',
        payload: {
          modelName: this.modelName,
          id: id,
        },
        callback: res => {
          // 执行成功后，进行回调
          if (res) {
            // 接口得到数据，放到state里
            this.setState({ form: res.data, loading: false });
            console.log(this.state.data);
          }
        },
      });
    }
  };

  // 提交编辑
  handleSaveFormData = e => {
    // loading
    this.setState({ loading: true });

    e.preventDefault();
    this.props.form.validateFields((err, values) => {
      // 数据id
      values.id = this.state.form.id;

      // 验证正确提交表单
      if (!err) {
        this.props
          .dispatch({
            type: 'model/modalSave',
            payload: {
              modelName: this.modelName,
              ...values,
            },
          })
          .then(() => {
            const { dispatch } = this.props;
            // 调用model
            dispatch({
              type: 'model/index',
              payload: {
                modelName: this.modelName,
                ...this.state.pagination,
                search: this.state.search,
              },
              callback: res => {
                this.props.form.resetFields();
                // 执行成功后，进行回调
                if (res) {
                  this.setState({ ...res, loading: false, editModalVisible: false });
                }
              },
            });
          });
      }
    });
  };

  // 取消编辑菜单
  handleCancelSaveFormData = () => {
    this.setState({ editModalVisible: false });
  };

  render() {
    const { getFieldDecorator } = this.props.form;

    // 默认选中的行
    const { selectedRowKeys } = this.state;

    // 行选中配置
    const rowSelection = {
      selectedRowKeys,
      onChange: this.onSelectChange,
      getCheckboxProps: record => ({
        name: record.name,
      }),
      fixed: 'left',
    };

    const columns = [
      {
        title: '名称',
        dataIndex: 'name',
        key: 'name',
      },
      {
        title: '排序',
        dataIndex: 'sort',
        key: 'sort',
      },
      {
        title: '图标',
        dataIndex: 'icon',
        key: 'icon',
        render: (text, record) => (
          <span>
            <Icon type={text} />
          </span>
        ),
      },
      {
        title: '路由',
        dataIndex: 'path',
        key: 'path',
      },
      {
        title: '权限url',
        dataIndex: 'permission_name',
        key: 'permission_name',
        render: (text, record) => <span dangerouslySetInnerHTML={{ __html: text }}></span>,
      },
      {
        title: '显示',
        dataIndex: 'show',
        key: 'show',
      },
      {
        title: '状态',
        key: 'status',
        dataIndex: 'status',
        render: (text, record) => (
          <span>
            <Tag color={text === '已禁用' ? 'red' : 'blue'}>{text}</Tag>
          </span>
        ),
      },
      {
        title: '操作',
        key: 'action',
        fixed: 'right',
        width: 260,
        render: (text, record) => (
          <span>
            <a
              href="javascript:;"
              onClick={() => this.handleStatusChange(record.id, record.status == '正常' ? 2 : 1)}
            >
              {record.status == '正常' ? '禁用' : '启用'}
            </a>
            <Divider type="vertical" />
            <a href="javascript:;" onClick={() => this.showEditFormModal(record.id)}>
              编辑
            </a>
            <Divider type="vertical" />
            <Popconfirm title="确定删除吗？" onConfirm={() => this.handleDestroy(record.id)}>
              <a href="javascript:;">删除</a>
            </Popconfirm>
          </span>
        ),
      },
    ];

    const rangeConfig = {
      rules: [{ type: 'array', required: true, message: 'Please select time!' }],
    };

    const formItemLayout = {
      labelCol: {
        xs: { span: 24 },
        sm: { span: 6 },
      },
      wrapperCol: {
        xs: { span: 24 },
        sm: { span: 18 },
      },
    };

    return (
      <PageHeaderWrapper>
        <div className={styles.container}>
          <div className={styles.tableHeader}>
            <Row type="flex" justify="start">
              <Col span={12}>
                <h5 className={styles.tableHeaderTitle}>菜单列表</h5>
              </Col>
              <Col span={12}>
                <div className={styles.floatRight}>
                  <Button type="primary" onClick={() => this.showCreateFormModal()}>
                    <Icon type="plus-circle" />
                    新增菜单
                  </Button>
                  &nbsp;
                  <a
                    href={
                      '/api/admin/' +
                      this.modelName +
                      '/export?' +
                      stringify({ search: this.state.search })
                    }
                    target="_blank"
                  >
                    <Button>
                      <Icon type="export" />
                      导出数据
                    </Button>
                  </a>
                </div>
              </Col>
            </Row>
          </div>
          <Divider style={{ marginBottom: 10 }} />
          <div className={styles.tableToolBar}>
            <Row type="flex" justify="start">
              <Col span={8}>
                <ButtonGroup>
                  <Button onClick={() => this.handleSelectAll()}>全选</Button>
                  <Button onClick={() => this.handleCancelSelectAll()}>取消</Button>
                </ButtonGroup>
                <Divider type="vertical" />
                <Button onClick={() => this.handleMultiStatusChange(1)}>启用</Button>&nbsp;
                <Button onClick={() => this.handleMultiStatusChange(2)}>禁用</Button>&nbsp;
                <Button onClick={() => this.handleMultiDestroy()} type="danger">
                  删除
                </Button>
              </Col>
              <Col span={16}>
                <div className={styles.floatRight}>
                  <Form layout="inline" onSubmit={this.handleSearch}>
                    <Form.Item style={{ display: 'inline-block' }}>
                      {getFieldDecorator('query')(
                        <Input placeholder="请输入要搜索的内容" style={{ width: 200 }} />,
                      )}
                    </Form.Item>
                    <Form.Item style={{ display: 'inline-block' }}>
                      <Button htmlType="submit">搜索</Button>
                    </Form.Item>
                    <Form.Item style={{ marginRight: 10 }}>
                      <a style={{ fontSize: 12 }} onClick={this.toggle}>
                        高级搜索 <Icon type={this.state.expand ? 'up' : 'down'} />
                      </a>
                    </Form.Item>
                  </Form>
                </div>
              </Col>
            </Row>
          </div>

          <div
            className={styles.tableAdvancedSearchBar}
            style={{ display: this.state.expand ? 'block' : 'none' }}
          >
            <Row>
              <Col span={24}></Col>
            </Row>
          </div>

          <div className={styles.tableData}>
            <Table
              rowKey={record => record.id}
              rowSelection={rowSelection}
              columns={columns}
              dataSource={this.state.data.lists}
              pagination={this.state.pagination}
              loading={this.state.loading}
              onChange={this.handleTableChange}
            />
          </div>

          <Modal
            title="编辑菜单"
            width={520}
            visible={this.state.editModalVisible}
            onCancel={this.handleCancelSaveFormData}
            centered={true}
            footer={false}
          >
            <Form layout="horizontal" onSubmit={this.handleSaveFormData}>
              <Form.Item label="名称" {...formItemLayout} style={{ marginBottom: 8 }}>
                {getFieldDecorator('name', {
                  initialValue: this.state.form.name,
                })(<Input className={styles.smallItem} placeholder="请输入名称" />)}
              </Form.Item>
              <Form.Item style={{ marginBottom: 8 }} {...formItemLayout} label="父节点">
                {getFieldDecorator('pid', {
                  initialValue: this.state.form.pid ? this.state.form.pid.toString() : undefined,
                })(
                  <Select style={{ width: 200 }} placeholder="选择父节点">
                    {this.state.data.menuTreeLists.length !== 0
                      ? this.state.data.menuTreeLists.map(d => <Option key={d.id}>{d.name}</Option>)
                      : console.log('select data null')}
                  </Select>,
                )}
              </Form.Item>
              <Form.Item label="排序" {...formItemLayout} style={{ marginBottom: 8 }}>
                {getFieldDecorator('sort', {
                  initialValue: this.state.form.sort,
                })(<InputNumber className={styles.smallItem} min={0} max={100000} />)}
              </Form.Item>
              <Form.Item label="图标" {...formItemLayout} style={{ marginBottom: 8 }}>
                {getFieldDecorator('icon', {
                  initialValue: this.state.form.icon ? this.state.form.icon : undefined,
                })(
                  <Select showSearch style={{ width: 200 }} placeholder="选择图标">
                    {this.state.data.icons.length !== 0
                      ? this.state.data.icons.map(d => (
                          <Option key={d}>
                            {' '}
                            <Icon type={d} /> {d}
                          </Option>
                        ))
                      : console.log('select data null')}
                  </Select>,
                )}
              </Form.Item>
              <Form.Item label="路由" {...formItemLayout} style={{ marginBottom: 8 }}>
                {getFieldDecorator('path', {
                  initialValue: this.state.form.path,
                })(<Input className={styles.smallItem} placeholder="请输入前台系统路由" />)}
              </Form.Item>
              <Form.Item label="绑定权限" {...formItemLayout} style={{ marginBottom: 8 }}>
                {getFieldDecorator('permissionIds', {
                  initialValue: this.state.form.permissionIds,
                })(
                  <Select mode="multiple" style={{ width: '100%' }} placeholder="选择绑定权限">
                    {this.state.data.permissions.length !== 0
                      ? this.state.data.permissions.map(d => <Option key={d.id}>{d.name}</Option>)
                      : console.log('select data null')}
                  </Select>,
                )}
              </Form.Item>
              <Form.Item label="显示" {...formItemLayout} style={{ marginBottom: 8 }}>
                {getFieldDecorator('show', {
                  initialValue: this.state.form.show === 1,
                  valuePropName: 'checked',
                })(<Switch checkedChildren="是" unCheckedChildren="否" />)}
              </Form.Item>
              <Form.Item label="状态" {...formItemLayout} style={{ marginBottom: 8 }}>
                {getFieldDecorator('status', {
                  initialValue: this.state.form.status === 1,
                  valuePropName: 'checked',
                })(<Switch checkedChildren="正常" unCheckedChildren="禁用" />)}
              </Form.Item>
              <div style={{ height: '50px' }}></div>
              <div
                style={{
                  position: 'absolute',
                  left: 0,
                  bottom: 0,
                  width: '100%',
                  borderTop: '1px solid #e9e9e9',
                  padding: '10px 16px',
                  textAlign: 'right',
                }}
              >
                <Button onClick={this.handleCancelSaveFormData} style={{ marginRight: 8 }}>
                  取消
                </Button>
                <Button type="primary" htmlType="submit">
                  提交
                </Button>
              </div>
            </Form>
          </Modal>

          <Modal
            title="新增菜单"
            width={520}
            visible={this.state.createModalVisible}
            onCancel={this.handleCancelStoreFormData}
            centered={true}
            footer={false}
          >
            <Form layout="horizontal" onSubmit={this.handleStoreFormData}>
              <Form.Item label="名称" {...formItemLayout} style={{ marginBottom: 8 }}>
                {getFieldDecorator('name')(
                  <Input className={styles.smallItem} placeholder="请输入名称" />,
                )}
              </Form.Item>
              <Form.Item style={{ marginBottom: 8 }} {...formItemLayout} label="父节点">
                {getFieldDecorator('pid')(
                  <Select style={{ width: 200 }} placeholder="选择父节点">
                    {this.state.data.menuTreeLists.length !== 0
                      ? this.state.data.menuTreeLists.map(d => <Option key={d.id}>{d.name}</Option>)
                      : console.log('select data null')}
                  </Select>,
                )}
              </Form.Item>
              <Form.Item label="排序" {...formItemLayout} style={{ marginBottom: 8 }}>
                {getFieldDecorator('sort', {
                  initialValue: 0,
                })(<InputNumber className={styles.smallItem} min={0} max={100000} />)}
              </Form.Item>
              <Form.Item label="图标" {...formItemLayout} style={{ marginBottom: 8 }}>
                {getFieldDecorator('icon')(
                  <Select showSearch style={{ width: 200 }} placeholder="选择图标">
                    {this.state.data.icons.length !== 0
                      ? this.state.data.icons.map(d => (
                          <Option key={d}>
                            {' '}
                            <Icon type={d} /> {d}
                          </Option>
                        ))
                      : console.log('select data null')}
                  </Select>,
                )}
              </Form.Item>
              <Form.Item label="路由" {...formItemLayout} style={{ marginBottom: 8 }}>
                {getFieldDecorator('path')(
                  <Input className={styles.smallItem} placeholder="请输入前台系统路由" />,
                )}
              </Form.Item>
              <Form.Item label="绑定权限" {...formItemLayout} style={{ marginBottom: 8 }}>
                {getFieldDecorator('permissionIds')(
                  <Select mode="multiple" style={{ width: '100%' }} placeholder="选择绑定权限">
                    {this.state.data.permissions.length !== 0
                      ? this.state.data.permissions.map(d => <Option key={d.id}>{d.name}</Option>)
                      : console.log('select data null')}
                  </Select>,
                )}
              </Form.Item>
              <Form.Item label="显示" {...formItemLayout} style={{ marginBottom: 8 }}>
                {getFieldDecorator('show', {
                  initialValue: true,
                  valuePropName: 'checked',
                })(<Switch checkedChildren="是" unCheckedChildren="否" />)}
              </Form.Item>
              <Form.Item label="状态" {...formItemLayout} style={{ marginBottom: 8 }}>
                {getFieldDecorator('status', {
                  initialValue: true,
                  valuePropName: 'checked',
                })(<Switch checkedChildren="正常" unCheckedChildren="禁用" />)}
              </Form.Item>
              <div style={{ height: '50px' }}></div>
              <div
                style={{
                  position: 'absolute',
                  left: 0,
                  bottom: 0,
                  width: '100%',
                  borderTop: '1px solid #e9e9e9',
                  padding: '10px 16px',
                  textAlign: 'right',
                }}
              >
                <Button onClick={this.handleCancelStoreFormData} style={{ marginRight: 8 }}>
                  取消
                </Button>
                <Button type="primary" htmlType="submit">
                  提交
                </Button>
              </div>
            </Form>
          </Modal>
        </div>
      </PageHeaderWrapper>
    );
  }
}

export default IndexPage;
