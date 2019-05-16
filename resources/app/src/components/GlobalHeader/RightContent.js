import React, { PureComponent } from 'react';
import { FormattedMessage, formatMessage } from 'umi/locale';
import { Spin, Tag, Menu, Icon, Avatar, Tooltip } from 'antd';
import moment from 'moment';
import groupBy from 'lodash/groupBy';
import NoticeIcon from '../NoticeIcon';
import HeaderSearch from '../HeaderSearch';
import HeaderDropdown from '../HeaderDropdown';
import SelectLang from '../SelectLang';
import styles from './index.less';

export default class GlobalHeaderRight extends PureComponent {

  render() {
    const {
      accountInfo,
      fetchingMoreNotices,
      fetchingNotices,
      loadedAllNotices,
      onNoticeVisibleChange,
      onMenuClick,
      onNoticeClear,
      skeletonCount,
      theme,
    } = this.props;
    const menu = (
      <Menu className={styles.menu} selectedKeys={[]} onClick={onMenuClick}>
        <Menu.Item key="info">
          <Icon type="setting" />
          <FormattedMessage id="menu.account.settings" defaultMessage="account settings" />
        </Menu.Item>
        <Menu.Divider />
        <Menu.Item key="logout">
          <Icon type="logout" />
          <FormattedMessage id="menu.account.logout" defaultMessage="logout" />
        </Menu.Item>
      </Menu>
    );

    let className = styles.right;
    if (theme === 'dark') {
      className = `${styles.right}  ${styles.dark}`;
    }
    return (
      <div className={className}>
        <HeaderSearch
          className={`${styles.action} ${styles.search}`}
          placeholder={formatMessage({ id: 'component.globalHeader.search' })}
          dataSource={[
            formatMessage({ id: 'component.globalHeader.search.example1' }),
            formatMessage({ id: 'component.globalHeader.search.example2' }),
            formatMessage({ id: 'component.globalHeader.search.example3' }),
          ]}
          onSearch={value => {
            console.log('input', value); // eslint-disable-line
          }}
          onPressEnter={value => {
            console.log('enter', value); // eslint-disable-line
          }}
        />
        <Tooltip title={formatMessage({ id: 'component.globalHeader.help' })}>
          <a
            target="_blank"
            href="https://www.kancloud.cn/tangtanglove/admincms"
            rel="noopener noreferrer"
            className={styles.action}
          >
            <Icon type="question-circle-o" />
          </a>
        </Tooltip>
        {accountInfo.nickname ? (
          <HeaderDropdown overlay={menu}>
            <span className={`${styles.action} ${styles.account}`}>
              <Avatar
                size="small"
                className={styles.avatar}
                src={accountInfo.cover_path}
                alt="avatar"
              />
              <span className={styles.name}>{accountInfo.nickname}</span>
            </span>
          </HeaderDropdown>
        ) : (
          <Spin size="small" style={{ marginLeft: 8, marginRight: 8 }} />
        )}
        <SelectLang className={styles.action} />
      </div>
    );
  }
}
