import { message } from 'antd';
import { getAccountInfo,changeAccountProfile,changeAccountPassword } from '@/services/api';

export default {
  namespace: 'account',

  state: {
    accountInfo: {},
  },

  effects: {

    // 登录账号信息
    *getAccountInfo({ callback}, { put, call }) {
      const response = yield call(getAccountInfo);
      if (response.status === 'success') {
        yield put({
          type: 'save',
          payload: response.data,
        });

        if (callback && typeof callback === 'function') {
          callback(response); // 返回结果
        }
      }
    },

    // 修改个人资料
    *changeAccountProfile({ payload }, { call, put }) {
      const response = yield call(changeAccountProfile,payload);

      if (response.status === 'success') {
        message.success(response.msg, 3);
      } else {
        message.error(response.msg, 3);
      }
    },

    // 修改密码
    *changeAccountPassword({ payload }, { call, put }) {
      const response = yield call(changeAccountPassword,payload);
      if (response.status === 'success') {
        message.success(response.msg, 3);
      } else {
        message.error(response.msg, 3);
      }
    },
  },

  reducers: {
    save(state, action) {
      return {
        ...state,
        accountInfo: action.payload || {},
      };
    },
  },
};
