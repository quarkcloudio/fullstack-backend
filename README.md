# Fullstack CMS

鉴于市面上CMS都已陈旧的情况，作者用更先进的laravel和ant-design重新设计、架构新时代的CMS。开源不易，请尊重版权！ 

## 安装说明

首先需要将web环境的默认目录指向public目录

命令行安装系统

编辑.env文件，配置数据库信息

命令行下执行数据迁移

第一步：php artisan migrate(您需要将php加入到环境变量)

第二步：php artisan db:seed(注意: 如果在执行迁移时发生「class not found」错误，试着先执行 composer dump-autoload 命令后再进行一次。)

默认用户名：administrator 密码：123456

## 官方支持

github地址:https://github.com/tangtanglove/fullstack


## License

未获商业授权之前，不得将本软件用于商业用途（包括但不限于企业网站、经营性网站、以营利为目或实现盈利的网站）不得对本软件或与之关联的商业授权进行出租、出售、抵押或发放子许可证。 禁止在 Fullstack 的整体或任何部分基础上以发展任何派生版本、修改版本或第三方版本用于重新分发。 如果您未能遵守本协议的条款，您的授权将被终止，所被许可的权利将被收回，并承担相应法律责任。
