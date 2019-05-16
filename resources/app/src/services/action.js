import request from '@/utils/request';
import { stringify } from 'qs';

export async function index(params) {
  return request(`../../api/admin/${params.modelName}/index?${stringify(params)}`);
}

export async function myPublished(params) {
  return request(`../../api/admin/${params.modelName}/myPublished?${stringify(params)}`);
}

export async function destroy(params) {
  return request(`../../api/admin/${params.modelName}/destroy`, {
    method: 'POST',
    body: params,
  });
}

export async function changeStatus(params) {
  return request(`../../api/admin/${params.modelName}/changeStatus`, {
    method: 'POST',
    body: params,
  });
}

export async function create(params) {
  return request(`../../api/admin/${params.modelName}/create?${stringify(params)}`);
}

export async function store(params) {
  return request(`../../api/admin/${params.modelName}/store`, {
    method: 'POST',
    body: params,
  });
}

export async function edit(params) {
  return request(`../../api/admin/${params.modelName}/edit?${stringify(params)}`);
}

export async function save(params) {
  return request(`../../api/admin/${params.modelName}/save`, {
    method: 'POST',
    body: params,
  });
}