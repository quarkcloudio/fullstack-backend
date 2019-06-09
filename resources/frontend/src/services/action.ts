import request from '@/utils/request';
import { stringify } from 'qs';

export async function index(params: any) {
  return request(`../../api/admin/${params.modelName}/index?${stringify(params)}`);
}

export async function myPublished(params: any) {
  return request(`../../api/admin/${params.modelName}/myPublished?${stringify(params)}`);
}

export async function destroy(params: any) {
  return request(`../../api/admin/${params.modelName}/destroy`, {
    method: 'post',
    data: params,
  });
}

export async function changeStatus(params: any) {
  return request(`../../api/admin/${params.modelName}/changeStatus`, {
    method: 'post',
    data: params,
  });
}

export async function create(params: any) {
  return request(`../../api/admin/${params.modelName}/create?${stringify(params)}`);
}

export async function store(params: any) {
  return request(`../../api/admin/${params.modelName}/store`, {
    method: 'post',
    data: params,
  });
}

export async function edit(params: any) {
  return request(`../../api/admin/${params.modelName}/edit?${stringify(params)}`);
}

export async function save(params: any) {
  return request(`../../api/admin/${params.modelName}/save`, {
    method: 'post',
    data: params,
  });
}
