import { message } from 'antd';
import { getAccountInfo, changeAccountProfile, changeAccountPassword } from '@/services/api';
import { Effect } from 'dva';
import { Reducer } from 'redux';

export interface CurrentUser {
  avatar?: string;
  name?: string;
  title?: string;
  group?: string;
  signature?: string;
  geographic?: any;
  tags?: {
    key: string;
    label: string;
  }[];
  unreadCount?: number;
}

export interface UserModelState {
  currentUser?: CurrentUser;
}

export interface UserModelType {
  namespace: 'account';
  state: UserModelState;
  effects: {
    getAccountInfo: Effect;
    changeAccountProfile: Effect;
    changeAccountPassword: Effect;
  };
  reducers: {
    save: Reducer<UserModelState>;
    changeNotifyCount: Reducer<UserModelState>;
  };
}

const AccountModel: UserModelType = {
  namespace: 'account',

  state: {
    accountInfo: {},
  },

  effects: {
    // 登录账号信息
    *getAccountInfo({ callback }, { put, call }) {
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
      const response = yield call(changeAccountProfile, payload);

      if (response.status === 'success') {
        message.success(response.msg, 3);
      } else {
        message.error(response.msg, 3);
      }
    },

    // 修改密码
    *changeAccountPassword({ payload }, { call, put }) {
      const response = yield call(changeAccountPassword, payload);
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
    changeNotifyCount(
      state = {
        currentUser: {},
      },
      action,
    ) {
      return {
        ...state,
        currentUser: {
          ...state.currentUser,
          notifyCount: action.payload.totalCount,
          unreadCount: action.payload.unreadCount,
        },
      };
    },
  },
};

export default AccountModel;
