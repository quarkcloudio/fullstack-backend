import 'antd/lib/page-header/style';
import _PageHeader from 'antd/lib/page-header';
import 'antd/lib/tabs/style';
import _Tabs from 'antd/lib/tabs';

function _objectSpread(target) {
  for (var i = 1; i < arguments.length; i++) {
    var source = arguments[i] != null ? arguments[i] : {};
    var ownKeys = Object.keys(source);
    if (typeof Object.getOwnPropertySymbols === 'function') {
      ownKeys = ownKeys.concat(
        Object.getOwnPropertySymbols(source).filter(function(sym) {
          return Object.getOwnPropertyDescriptor(source, sym).enumerable;
        }),
      );
    }
    ownKeys.forEach(function(key) {
      _defineProperty(target, key, source[key]);
    });
  }
  return target;
}

function _defineProperty(obj, key, value) {
  if (key in obj) {
    Object.defineProperty(obj, key, {
      value: value,
      enumerable: true,
      configurable: true,
      writable: true,
    });
  } else {
    obj[key] = value;
  }
  return obj;
}

function _objectWithoutProperties(source, excluded) {
  if (source == null) return {};
  var target = _objectWithoutPropertiesLoose(source, excluded);
  var key, i;
  if (Object.getOwnPropertySymbols) {
    var sourceSymbolKeys = Object.getOwnPropertySymbols(source);
    for (i = 0; i < sourceSymbolKeys.length; i++) {
      key = sourceSymbolKeys[i];
      if (excluded.indexOf(key) >= 0) continue;
      if (!Object.prototype.propertyIsEnumerable.call(source, key)) continue;
      target[key] = source[key];
    }
  }
  return target;
}

function _objectWithoutPropertiesLoose(source, excluded) {
  if (source == null) return {};
  var target = {};
  var sourceKeys = Object.keys(source);
  var key, i;
  for (i = 0; i < sourceKeys.length; i++) {
    key = sourceKeys[i];
    if (excluded.indexOf(key) >= 0) continue;
    target[key] = source[key];
  }
  return target;
}

import React from 'react';
import './index.less';
import GridContent from '@ant-design/pro-layout/lib/GridContent';
import RouteContext from '@ant-design/pro-layout/lib/RouteContext';

var prefixedClassName = 'ant-pro-page-header-wrap';
/**
 * render Footer tabList
 * In order to be compatible with the old version of the PageHeader
 * basically all the functions are implemented.
 */

var renderFooter = function renderFooter(_ref) {
  var tabList = _ref.tabList,
    tabActiveKey = _ref.tabActiveKey,
    onTabChange = _ref.onTabChange,
    tabBarExtraContent = _ref.tabBarExtraContent;
  return tabList && tabList.length
    ? React.createElement(
        _Tabs,
        {
          className: ''.concat(prefixedClassName, '-tabs'),
          activeKey: tabActiveKey,
          onChange: function onChange(key) {
            if (onTabChange) {
              onTabChange(key);
            }
          },
          tabBarExtraContent: tabBarExtraContent,
        },
        tabList.map(function(item) {
          return React.createElement(_Tabs.TabPane, {
            tab: item.tab,
            key: item.key,
          });
        }),
      )
    : null;
};

var renderPageHeader = function renderPageHeader(content, extraContent) {
  if (!content && !extraContent) {
    return null;
  }

  return React.createElement(
    'div',
    {
      className: ''.concat(prefixedClassName, '-detail'),
    },
    React.createElement(
      'div',
      {
        className: ''.concat(prefixedClassName, '-main'),
      },
      React.createElement(
        'div',
        {
          className: ''.concat(prefixedClassName, '-row'),
        },
        content &&
          React.createElement(
            'div',
            {
              className: ''.concat(prefixedClassName, '-content'),
            },
            content,
          ),
        extraContent &&
          React.createElement(
            'div',
            {
              className: ''.concat(prefixedClassName, '-extraContent'),
            },
            extraContent,
          ),
      ),
    ),
  );
};

var defaultPageHeaderRender = function defaultPageHeaderRender(props) {
  var title = props.title,
    content = props.content,
    pageHeaderRender = props.pageHeaderRender,
    extraContent = props.extraContent,
    restProps = _objectWithoutProperties(props, [
      'title',
      'content',
      'pageHeaderRender',
      'extraContent',
    ]);

  return React.createElement(RouteContext.Consumer, null, function(value) {
    if (pageHeaderRender) {
      return pageHeaderRender(_objectSpread({}, props, value));
    }

    return React.createElement(
      _PageHeader,
      Object.assign(
        {},
        value,
        {
          title: title,
        },
        restProps,
        {
          footer: renderFooter(restProps),
        },
      ),
      renderPageHeader(content, extraContent),
    );
  });
};

var PageHeaderWrapper = function PageHeaderWrapper(props) {
  var children = props.children;
  return React.createElement(
    'div',
    {
      style: {
        margin: '-24px -24px 0',
      },
    },
    React.createElement(
      'div',
      {
        className: ''.concat(prefixedClassName, '-page-header-warp'),
      },
      React.createElement(GridContent, null, defaultPageHeaderRender(props)),
    ),
    children
      ? React.createElement(
          GridContent,
          null,
          React.createElement(
            'div',
            {
              className: ''.concat(prefixedClassName, '-children-content'),
            },
            children,
          ),
        )
      : null,
  );
};

export default PageHeaderWrapper;
