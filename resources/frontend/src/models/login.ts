import { routerRedux } from 'dva/router';
import { Reducer, AnyAction } from 'redux';
import { EffectsCommandMap } from 'dva';
import { stringify, parse } from 'qs';
import { accountLogin } from '@/services/api';
import { message } from 'antd';

export function getPageQuery() {
  return parse(window.location.href.split('?')[1]);
}

export type Effect = (
  action: AnyAction,
  effects: EffectsCommandMap & { select: <T>(func: (state: {}) => T) => T },
) => void;

export interface ModelType {
  namespace: string;
  state: {};
  effects: {
    login: Effect;
    logout: Effect;
  };
  reducers: {
    changeLoginStatus: Reducer<{}>;
  };
}

const Model: ModelType = {
  namespace: 'login',

  state: {
    status: undefined,
  },

  effects: {
    *login({ payload }, { call, put }) {
      const response = yield call(accountLogin, payload);

      yield put({
        type: 'changeLoginStatus',
        payload: response,
      });
      // Login successfully
      if (response.status === 'success') {
        // 记录登录凭据
        sessionStorage.setItem('token', response.token);

        const urlParams = new URL(window.location.href);
        const params = getPageQuery();
        let { redirect } = params;
        if (redirect) {
          const redirectUrlParams = new URL(redirect);
          if (redirectUrlParams.origin === urlParams.origin) {
            redirect = redirect.substr(urlParams.origin.length);
            if (redirect.match(/^\/.*#/)) {
              redirect = redirect.substr(redirect.indexOf('#') + 1);
            }
          } else {
            window.location.href = redirect;
            return;
          }
        }
        yield put(routerRedux.replace(redirect || '/'));
      } else {
        message.error(response.msg, 3);
      }
    },

    *logout(_, { put }) {
      // 注销登录凭据
      sessionStorage.removeItem('token');

      const { redirect } = getPageQuery();
      // redirect
      if (window.location.pathname !== '/login' && !redirect) {
        yield put(
          routerRedux.replace({
            pathname: '/login',
            search: stringify({
              redirect: window.location.href,
            }),
          }),
        );
      }
    },
  },

  reducers: {
    changeLoginStatus(state, { payload }) {
      return {
        ...state,
        status: payload.status,
        type: payload.type,
      };
    },
  },
};

export default Model;
