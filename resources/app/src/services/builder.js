import request from '@/utils/request';
import { stringify } from 'qs';

export async function index(params) {
  return request(`../../api/admin/${params.controllerName}/index?${stringify(params)}`);
}

export async function destroy(params) {
  return request(`../../api/admin/${params.controllerName}/destroy`, {
    method: 'POST',
    body: params,
  });
}

export async function changeStatus(params) {
  return request(`../../api/admin/${params.controllerName}/changeStatus`, {
    method: 'POST',
    body: params,
  });
}

export async function create(params) {
  return request(`../../api/admin/${params.controllerName}/create?${stringify(params)}`);
}

export async function store(params) {
  return request(`../../api/admin/${params.controllerName}/store`, {
    method: 'POST',
    body: params,
  });
}

export async function edit(params) {
  return request(`../../api/admin/${params.controllerName}/edit?${stringify(params)}`);
}

export async function save(params) {
  return request(`../../api/admin/${params.controllerName}/save`, {
    method: 'POST',
    body: params,
  });
}