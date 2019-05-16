import router from 'umi/router';

export default {
  namespace: 'global',

  state: {
    collapsed: false,
  },

  effects: {

  },

  reducers: {
    changeLayoutCollapsed(state, { payload }) {
      return {
        ...state,
        collapsed: payload,
      };
    },
  },

  subscriptions: {
    setup({ history }) {
      // Subscribe history(url) change, trigger `load` action if pathname is `/`
      return history.listen(({ pathname, search }) => {

        // 未登录用户，进行登录
        if(!sessionStorage['token'] && pathname!=='/login') {
          router.push('/login');
        }

        if (typeof window.ga !== 'undefined') {
          window.ga('send', 'pageview', pathname + search);
        }
      });
    },
  },
};
