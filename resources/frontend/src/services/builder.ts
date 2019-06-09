import request from '@/utils/request';
import { stringify } from 'qs';

export async function index(params: any) {
  return request(`../../api/admin/${params.controllerName}/index?${stringify(params)}`);
}

export async function destroy(params: any) {
  return request(`../../api/admin/${params.controllerName}/destroy`, {
    method: 'post',
    body: params,
  });
}

export async function changeStatus(params: any) {
  return request(`../../api/admin/${params.controllerName}/changeStatus`, {
    method: 'post',
    body: params,
  });
}

export async function create(params: any) {
  return request(`../../api/admin/${params.controllerName}/create?${stringify(params)}`);
}

export async function store(params: any) {
  return request(`../../api/admin/${params.controllerName}/store`, {
    method: 'post',
    body: params,
  });
}

export async function edit(params: any) {
  return request(`../../api/admin/${params.controllerName}/edit?${stringify(params)}`);
}

export async function save(params: any) {
  return request(`../../api/admin/${params.controllerName}/save`, {
    method: 'post',
    body: params,
  });
}
