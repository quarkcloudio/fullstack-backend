import request from '@/utils/request';
import { stringify } from 'qs';

// 账号登录
export async function accountLogin(params) {
  return request('/api/admin/login', {
    method: 'POST',
    body: params,
  });
}

// 当前用户信息
export async function getAccountInfo() {
  return request('/api/admin/account/info');
}

// 修改当前用户的资料
export async function changeAccountProfile(params) {
  return request(`/api/admin/account/profile`, {
    method: 'POST',
    body: params,
  });
}

// 修改当前用户的密码
export async function changeAccountPassword(params) {
  return request(`/api/admin/account/password`, {
    method: 'POST',
    body: params,
  });
}

// 用户充值
export async function recharge(params) {
  return request(`/api/admin/user/recharge`, {
    method: 'POST',
    body: params,
  });
}

// 获取权限菜单
export async function getAccountMenus() {
  return request('/api/admin/account/menus');
}

// 获取网站设置
export async function getWebsiteConfig(params) {
  console.log('xxx');
  return request(`/api/admin/config/website?${stringify(params)}`);
}

// 保存网站设置
export async function saveWebsiteConfig(params) {
  return request(`/api/admin/config/saveWebsite`, {
    method: 'POST',
    body: params,
  });
}