import React, { PureComponent } from 'react';
import { connect } from 'dva';
import router from 'umi/router';
import styles from './Edit.less';
import PageHeaderWrapper from '@ant-design/pro-layout/lib/PageHeaderWrapper';
import BraftEditor from 'braft-editor';
import 'braft-editor/dist/index.css';
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

@connect(({ config }) => ({
  config,
}))
@Form.create()
class EditPage extends PureComponent {
  // 定义要操作的模型名称
  modelName = 'config';

  state = {
    msg: '',
    url: '',
    previewVisible: false,
    previewImage: '',
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

  handleCancel = () => this.setState({ previewVisible: false });

  handlePreview = file => {
    this.setState({
      previewImage: file.url || file.thumbUrl,
      previewVisible: true,
    });
  };

  // 当挂在模板时，初始化数据
  componentDidMount() {
    // loading
    this.setState({ loading: true });

    // 获得url参数
    const params = this.props.location.query;

    // 调用model
    this.props.dispatch({
      type: 'config/edit',
      payload: {
        modelName: this.modelName,
        ...params,
      },
      callback: res => {
        // 执行成功后，进行回调
        if (res) {
          res.data.content = BraftEditor.createEditorState(res.data.content);

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
      // 编辑器内容
      values.content = this.state.data.content;
      // 封面图id
      values.cover_id = this.state.data.cover_id;

      // 验证正确提交表单
      if (!err) {
        this.props.dispatch({
          type: 'config/save',
          payload: {
            modelName: this.modelName,
            ...values,
          },
        });
      }
    });
  };

  submitContent = async () => {
    // 在编辑器获得焦点时按下ctrl+s会执行此方法
    // 编辑器内容提交到服务端之前，可直接调用editorState.toHTML()来获取HTML格式的内容
    const htmlContent = this.state.content.toHTML();
    // const result = await saveEditorContent(htmlContent)
  };

  handleEditorChange = htmlContent => {
    this.state.data.content = htmlContent.toHTML();
  };

  handleEditorUpload = param => {
    const serverURL = '/api/admin/picture/upload';
    const xhr = new XMLHttpRequest();
    const fd = new FormData();

    const successFn = response => {
      // 假设服务端直接返回文件上传后的地址
      // 上传成功后调用param.success并传入上传后的文件地址

      const responseObj = JSON.parse(xhr.responseText);

      if (responseObj.status === 'success') {
        param.success({
          url: responseObj.data.url,
          meta: {
            id: responseObj.data.id,
            title: responseObj.data.title,
            alt: responseObj.data.title,
            loop: true, // 指定音视频是否循环播放
            autoPlay: true, // 指定音视频是否自动播放
            controls: true, // 指定音视频是否显示控制栏
            poster: responseObj.data.url, // 指定视频播放器的封面
          },
        });
      } else {
        // 上传发生错误时调用param.error
        param.error({
          msg: responseObj.msg,
        });
      }
    };

    const progressFn = event => {
      // 上传进度发生变化时调用param.progress
      param.progress((event.loaded / event.total) * 100);
    };

    const errorFn = response => {
      // 上传发生错误时调用param.error
      param.error({
        msg: 'unable to upload.',
      });
    };

    xhr.upload.addEventListener('progress', progressFn, false);
    xhr.addEventListener('load', successFn, false);
    xhr.addEventListener('error', errorFn, false);
    xhr.addEventListener('abort', errorFn, false);

    fd.append('file', param.file);
    xhr.open('POST', serverURL, true);
    xhr.setRequestHeader('Authorization', 'Bearer ' + sessionStorage['token']);
    xhr.send(fd);
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
            title="编辑配置"
            bordered={false}
            extra={<a href="javascript:history.go(-1)">返回上一页</a>}
          />
          <Form onSubmit={this.handleSubmit}>
            <Form.Item style={{ marginBottom: 0 }} {...formItemLayout} label="标题">
              <Form.Item style={{ display: 'inline-block', marginBottom: 8 }}>
                {getFieldDecorator(
                  'title',
                  {
                    initialValue: this.state.data.title,
                  },
                  {
                    rules: [{ required: true, message: '请输入标题！' }],
                  },
                )(<Input className={styles.smallItem} placeholder="请输入标题" />)}
              </Form.Item>
            </Form.Item>
            <Form.Item style={{ marginBottom: 0 }} {...formItemLayout} label="表单类型">
              <Form.Item style={{ display: 'inline-block', marginBottom: 8 }}>
                {getFieldDecorator(
                  'type',
                  {
                    initialValue: this.state.data.type,
                  },
                  {
                    rules: [{ required: true, message: '请选择表单类型！' }],
                  },
                )(
                  <Select style={{ width: 200 }} placeholder="选择表单类型">
                    <Option value="text">输入框</Option>
                    <Option value="textarea">文本域</Option>
                    <Option value="picture">图片</Option>
                    <Option value="file">文件</Option>
                    <Option value="switch">开关</Option>
                  </Select>,
                )}
              </Form.Item>
            </Form.Item>
            <Form.Item style={{ marginBottom: 0 }} {...formItemLayout} label="名称">
              <Form.Item style={{ display: 'inline-block', marginBottom: 8 }}>
                {getFieldDecorator(
                  'name',
                  {
                    initialValue: this.state.data.name,
                  },
                  {
                    rules: [{ required: true, message: '请输入名称！' }],
                  },
                )(<Input className={styles.smallItem} placeholder="请输入名称" />)}
              </Form.Item>
            </Form.Item>
            <Form.Item style={{ marginBottom: 0 }} {...formItemLayout} label="分组名称">
              <Form.Item style={{ display: 'inline-block', marginBottom: 8 }}>
                {getFieldDecorator(
                  'groupName',
                  {
                    initialValue: this.state.data.group_name,
                  },
                  {
                    rules: [{ required: true, message: '请输入分组名称！' }],
                  },
                )(<Input className={styles.smallItem} placeholder="请输入分组名称" />)}
              </Form.Item>
            </Form.Item>
            <Form.Item style={{ marginBottom: 8 }} {...formItemLayout} label="备注">
              {getFieldDecorator('remark', {
                initialValue: this.state.data.remark,
              })(
                <TextArea
                  className={styles.middleItem}
                  placeholder="请输入备注"
                  autosize={{ minRows: 3, maxRows: 6 }}
                />,
              )}
            </Form.Item>
            <Form.Item style={{ marginBottom: 8 }} {...formItemLayout} label="启用">
              {getFieldDecorator('status', {
                initialValue: this.state.data.status === 1,
                valuePropName: 'checked',
              })(<Switch checkedChildren="是" unCheckedChildren="否" />)}
            </Form.Item>
            <Form.Item wrapperCol={{ span: 12, offset: 5 }}>
              <Button type="primary" htmlType="submit">
                提交
              </Button>
            </Form.Item>
          </Form>
        </div>
      </PageHeaderWrapper>
    );
  }
}

export default EditPage;
