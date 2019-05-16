<?php

namespace App\Providers;

use Illuminate\Support\Facades\Blade;
use Illuminate\Support\ServiceProvider;
use Illuminate\Http\Request;
use App\Services\Helper;
use Db;

class BladeExtendServiceProvider extends ServiceProvider
{
    /**
     * Blade模板扩展
     *
     * @return void
     */
    public function boot(Request $request)
    {
        // 导航模板标签开始 参数：循环对象，父id
        Blade::directive('navs', function ($expression) {
            $expressions = explode(',',$expression);

            // 循环对象
            isset($expressions[0]) ? $obj = $expressions[0] : $obj = '';

            // 父id
            isset($expressions[1]) ? $pid = $expressions[1] : $pid = '';

            // 解析字符串
            $parseStr  = $parseStr   = '<?php ';
            // 读取导航
            $parseStr .= '$__NAVIGATIONS__ = App\Models\Navigation::where(\'status\',1)->orderBy(\'sort\', \'asc\')->get()->toArray();';
            // 数组转换成tree
            $parseStr .= '$__NAVIGATIONSTREE__ = App\Services\Helper::listToTree($__NAVIGATIONS__,\'id\',\'pid\',\'_child\','.$pid.');';
            $parseStr .= ' foreach($__NAVIGATIONSTREE__ as $key=>'.$obj.') { ?>';
            
            return $parseStr;
        });

        // 导航模板标签结束
        Blade::directive('endnavs', function () {
            return "<?php } ?>";
        });

        // banner模板标签开始 参数：循环对象，广告位置名称
        Blade::directive('banners', function ($expression) {
            $expressions = explode(',',$expression);

            // 循环对象
            isset($expressions[0]) ? $obj = $expressions[0] : $obj = '';

            // 广告位置名称
            isset($expressions[1]) ? $postionName = $expressions[1] : $postionName = '';

            // 解析字符串
            $parseStr  = $parseStr   = '<?php ';
            // 获取分类信息
            $parseStr .= '$__BANNERCATEGORY__ = App\Models\BannerCategory::where(\'status\',1)->where(\'name\','.$postionName.')->first();';
            // 获取广告列表
            $parseStr .= '$__BANNERS__ = App\Models\Banner::where(\'status\',1)->where(\'category_id\',$__BANNERCATEGORY__->id)->orderBy(\'sort\', \'asc\')->get();';
            $parseStr .= ' foreach($__BANNERS__ as $key=>'.$obj.') { ?>';

            return $parseStr;
        });

        // banner模板标签结束
        Blade::directive('endbanners', function () {
            return "<?php } ?>";
        });

        // category模板标签开始 参数：循环对象，类型，父id
        Blade::directive('categorys', function ($expression) {

            $expressions = explode(',',$expression);

            // 循环对象
            isset($expressions[0]) ? $obj = $expressions[0] : $obj = '';

            // 类型
            isset($expressions[1]) ? $type = $expressions[1] : $type = '';

            // 父id
            isset($expressions[2]) ? $pid = $expressions[2] : $pid = 0;

            // 解析字符串
            $parseStr  = $parseStr   = '<?php ';
            // 获取分类信息
            $parseStr .= '$__CATEGORYS__ = App\Models\Category::where(\'status\',1)->where(\'type\','.$type.')->where(\'pid\','.$pid.')->orderBy(\'sort\', \'asc\')->get();';
            $parseStr .= 'foreach($__CATEGORYS__ as $key=>'.$obj.') { ?>';

            return $parseStr;
        });

        // category模板标签结束
        Blade::directive('endcategorys', function () {
            return "<?php } ?>";
        });

        // category模板标签开始 参数：循环对象，category名称
        Blade::directive('category', function ($expression) {
            $expressions = explode(',',$expression);

            // 循环对象
            isset($expressions[0]) ? $obj = $expressions[0] : $obj = '';

            // 类型
            isset($expressions[1]) ? $categoryName = $expressions[1] : $categoryName = '';

            // 父id
            isset($expressions[2]) ? $type = $expressions[2] : $type = 'ARTICLE';

            // 解析字符串
            $parseStr  = $parseStr   = '<?php ';
            // 获取分类信息
            $parseStr .= '$__CATEGORY__ = App\Models\Category::where(\'status\',1)->where(\'type\','.$type.')->where(\'name\','.$categoryName.')->first();';
            $parseStr .= 'foreach($__CATEGORY__ as $key=>'.$obj.') { ?>';

            return $parseStr;
        });

        // category模板标签结束
        Blade::directive('endcategory', function () {
            return "<?php } ?>";
        });

        // page模板标签开始 参数：循环对象，page名称
        Blade::directive('page', function ($expression) {
            $expressions = explode(',',$expression);

            // 循环对象
            isset($expressions[0]) ? $obj = $expressions[0] : $obj = '';

            // page名称
            isset($expressions[1]) ? $pageName = $expressions[1] : $pageName = '';

            // 解析字符串
            $parseStr  = $parseStr   = '<?php ';
            // 读取page信息
            $parseStr .= '$__PAGE__ = App\Models\Post::where(\'status\',1)->where(\'type\',\'PAGE\')->where(\'name\','.$pageName.')->first();';
            $parseStr .= 'if(isset($__PAGE__)) { '.$obj.' = $__PAGE__ ?>';

            return $parseStr;
        });

        // page模板标签结束
        Blade::directive('endpage', function () {
            return "<?php } ?>";
        });

        // articles模板标签开始 参数：循环对象，分类名称，读取数量,读取位置,推荐位,排序类型,日期
        Blade::directive('articles', function ($expression) {
            $expressions = explode(',',$expression);

            // 循环对象
            isset($expressions[0]) ? $obj = $expressions[0] : $obj = '';

            // 分类名称
            isset($expressions[1]) ? $categoryName = $expressions[1] : $categoryName = '';

            // 读取数量
            isset($expressions[2]) ? $num = $expressions[2] : $num = '';

            // 读取位置
            isset($expressions[3]) ? $offset = $expressions[3] : $offset = '';

            // 推荐位
            isset($expressions[4]) ? $position = $expressions[4] : $position = '';

            // 排序类型
            isset($expressions[5]) ? $sort = $expressions[5] : $sort = '';

            // 日期
            isset($expressions[6]) ? $date = $expressions[6] : $date = '';


            // 解析字符串
            $parseStr  = $parseStr   = '<?php ';
            if($categoryName != '\'ALL\'') {
                // 分类信息
                $parseStr .= '$__CATEGORY__ = App\Models\Category::where(\'status\',1)->where(\'name\','.$categoryName.')->first();';
            }

            // 定义查询对象
            $parseStr .= '$__QUERY__ = App\Models\Post::query();';
            $parseStr .= 'switch ('.$position.') {
                case \'1\':
                    $__QUERY__->whereIn(\'position\', [1,3,5,7,9,15]);
                    break;
                case \'2\':
                    $__QUERY__->whereIn(\'position\', [2,3,6,7,9,10,14,15]);
                    break;
                case \'4\':
                    $__QUERY__->whereIn(\'position\', [4,5,6,7,12,13,14,15]);
                    break;
                case \'8\':
                    $__QUERY__->whereIn(\'position\', [8,9,10,11,12,13,14,15]);
                    break;
                default:
                    break;
            }';

            if(!empty($offset)) {
                $parseStr .= '$__QUERY__->offset('.$offset.');';
            }

            if($categoryName != '\'ALL\'') {
                $parseStr .= '$__QUERY__->where(\'category_id\',$__CATEGORY__->id);';
            }

            // 排序
            if(!empty($sort)) {
                $parseStr .= 'switch ('.$sort.') {
                    case \'view_desc\':
                            $__QUERY__->orderBy(\'view\', \'desc\');
                        break;

                    case \'view_asc\':
                            $__QUERY__->orderBy(\'view\', \'asc\');
                        break;

                    case \'level_desc\':
                            $__QUERY__->orderBy(\'level\', \'desc\');
                        break;

                    case \'level_asc\':
                            $__QUERY__->orderBy(\'level\', \'asc\');
                        break;

                    case \'id_desc\':
                            $__QUERY__->orderBy(\'id\', \'desc\');
                        break;

                    case \'id_asc\':
                            $__QUERY__->orderBy(\'id\', \'asc\');
                        break;

                    default:
                        break;
                }';

            } else {
                $parseStr .= '$__QUERY__->orderBy(\'id\', \'desc\');';
            }

            // 指定日期
            if(!empty($date)) {
                if(is_numeric($date)) {
                    $parseStr .= '$__QUERY__->whereBetween(\'created_at\', [date(\'Y-m-d 00:00:00\',strtotime(\'-7 day\')), date(\'Y-m-d 23:59:59\')]);';
                } else {
                    $parseStr .= 'switch ('.$date.') {
                        case \'today\':
                                $__QUERY__->whereBetween(\'created_at\', [date(\'Y-m-d 00:00:00\'), date(\'Y-m-d 23:59:59\')]);
                            break;
                        case \'yesterday\':
                                $__QUERY__->whereBetween(\'created_at\', [date(\'Y-m-d 00:00:00\',strtotime(\'-1 day\')), date(\'Y-m-d 23:59:59\',strtotime(\'-1 day\'))]);
                            break;
                        case \'week\':
                                $__WEEKSTART__ = date(\'Y-m-d H:i:s\',mktime(0, 0 , 0,date(\'m\'),date(\'d\')-date(\'w\')+1,date(\'Y\'))); 
                                $__WEEKEND__ = date(\'Y-m-d H:i:s\',mktime(23,59,59,date(\'m\'),date(\'d\')-date(\'w\')+7,date(\'Y\'))); 
                                $__QUERY__->whereBetween(\'created_at\', [$__WEEKSTART__, $__WEEKEND__]);
                            break;
                        case \'month\':
                                $__STARTDATE__ = date(\'Y-m-01 00:00:00\');
                                $__ENDDATE__ = date(\'Y-m-d\', mktime(23, 59, 59, date(\'m\', strtotime($__STARTDATE__))+1, 00));
                                $__QUERY__->whereBetween(\'created_at\', [$__STARTDATE__, $__ENDDATE__]);
                            break;
                        default:
                            break;
                    }';
                }
            }

            $parseStr .= '$__ARTICLES__ = $__QUERY__->where(\'status\',1)
            ->where(\'type\',\'ARTICLE\')
            ->limit('.$num.')
            ->get();';

            $parseStr .= ' foreach($__ARTICLES__ as $key=>'.$obj.') { ?>';

            return $parseStr;
        });

        // articles模板标签结束
        Blade::directive('endarticles', function () {
            return "<?php } ?>";
        });

        // goods模板标签开始 参数：循环对象，分类名称，读取数量,推荐位
        Blade::directive('goods', function ($expression) {
            $expressions = explode(',',$expression);

            // 循环对象
            isset($expressions[0]) ? $obj = $expressions[0] : $obj = '';

            // 分类名称
            isset($expressions[1]) ? $categoryName = $expressions[1] : $categoryName = '';

            // 读取数量
            isset($expressions[2]) ? $num = $expressions[2] : $num = '';

            // 读取位置
            isset($expressions[3]) ? $offset = $expressions[3] : $offset = '';

            // 推荐位
            isset($expressions[4]) ? $position = $expressions[4] : $position = '';

            // 解析字符串
            $parseStr  = $parseStr   = '<?php ';
            if($categoryName != '\'ALL\'') {
                // 分类信息
                $parseStr .= '$__CATEGORY__ = Category::where(\'status\',1)->where(\'name\','.$categoryName.')->first();';
            }

            // 定义查询对象
            $parseStr .= '$__QUERY__ = App\Models\Goods::query();';
            $parseStr .= 'switch ('.$position.') {
                case \'1\':
                    $__QUERY__->whereIn(\'position\', [1,3,5,7,9,15]);
                    break;
                case \'2\':
                    $__QUERY__->whereIn(\'position\', [2,3,6,7,9,10,14,15]);
                    break;
                case \'4\':
                    $__QUERY__->whereIn(\'position\', [4,5,6,7,12,13,14,15]);
                    break;
                case \'8\':
                    $__QUERY__->whereIn(\'position\', [8,9,10,11,12,13,14,15]);
                    break;
                default:
                    break;
            }';

            if(!empty($offset)) {
                $parseStr .= '$__QUERY__->offset('.$offset.');';
            }

            if($categoryName != '\'ALL\'') {
                $parseStr .= '$__QUERY__->where(\'category_id\',$__CATEGORY__->id);';
            }

            $parseStr .= '$__GOODS__ = $__QUERY__->where(\'status\',1)
            ->orderBy(\'level\', \'desc\')
            ->orderBy(\'id\', \'desc\')
            ->limit('.$num.')
            ->get()
            ->toArray();';

            $parseStr .= 'foreach ($__GOODS__ as $__KEY__ => $__VALUE__) {
                $__COVERIDS__ = json_decode($__VALUE__[\'cover_ids\'], true);
                foreach ($__COVERIDS__ as $__COVERKEY__ => $__COVERVALUE__) {
                    $__GOODS__[$__KEY__][\'cover_paths\'][$__COVERKEY__] =  App\Services\Helper::getPicture($__COVERVALUE__);
                }
                $__GOODS__[$__KEY__][\'spu_data\'] =  json_decode($__COVERVALUE__[\'spu_data\'], true);

                $__SKUIDS__ = json_decode($__COVERVALUE__[\'sku_ids\'], true);
                $__SKUDATA__ = App\Models\GoodsSku::where(\'status\',1)
                ->whereIn(\'id\',$__SKUIDS__)
                ->orderBy(\'sort\', \'asc\')
                ->get()
                ->toArray();

                $__GOODS__[$__KEY__][\'sku_data\'] = $__SKUDATA__;
            }';

            $parseStr .= ' foreach($__GOODS__ as $key=>'.$obj.') { ?>';
            
            return $parseStr;
        });

        // goods模板标签结束
        Blade::directive('endgoods', function () {
            return "<?php } ?>";
        });

        // link模板标签开始 参数：循环对象
        Blade::directive('links', function ($expression) {
            $expressions = explode(',',$expression);

            // 循环对象
            isset($expressions[0]) ? $obj = $expressions[0] : $obj = '';

            // 解析字符串
            $parseStr  = $parseStr   = '<?php ';
            // 读取page信息
            $parseStr .= '$__LINKS__ = App\Models\Link::where(\'status\',1)->orderBy(\'sort\', \'asc\')->get();';
            $parseStr .= ' foreach($__LINKS__ as $key=>'.$obj.') { ?>';

            return $parseStr;
        });

        // link模板标签结束
        Blade::directive('endlinks', function () {
            return "<?php } ?>";
        });

        // tags模板标签开始 参数：循环对象，模型名称
        Blade::directive('tags', function ($expression) {
            $expressions = explode(',',$expression);

            // 循环对象
            isset($expressions[0]) ? $obj = $expressions[0] : $obj = '';

            // 模型名称
            isset($expressions[1]) ? $modelName = $expressions[1] : $modelName = '';

            // 解析字符串
            $parseStr  = $parseStr   = '<?php ';

            // 定义查询对象
            $parseStr .= '$__OBJECTNAME__ = App\Models\\'.$modelName.';';

            // 读取page信息
            $parseStr .= '$__QUERY__ = new $__OBJECTNAME__();';
            $parseStr .= '$__TAGS__ = $__QUERY__::query()->where(\'status\',1)
            ->groupBy(\'tags\')
            ->select(\'tags\')
            ->get()
            ->toArray();';
            $parseStr .= '$__LISTS__ = [];';
            $parseStr .= 'if(!empty($__TAGS__)) {
                foreach($__TAGS__ as $__TAG__) {
                    $__ARRS__ = explode(\',\',$__TAG__[\'tags\']);
                    if(!empty($__ARRS__)) {
                        foreach($__ARRS__ as $__ARR__) {
                            if(!in_array($__ARR__,$__LISTS__)) {
                                $__LISTS__[] = $__ARR__;
                            }
                        }
                    } else {
                        if(!in_array($__TAG__[\'tags\'],$__LISTS__)) {
                            $__LISTS__[] = $__TAG__[\'tags\'];
                        }
                    }
                }
            }';

            $parseStr .= 'foreach ($__LISTS__ as $__KEY__ => $__LIST__) {
                $__NEWOBJECTNAME__ = App\Models\\'.$modelName.';
                $__NEWQUERY__ = new $__NEWOBJECTNAME__();
                
                $__GETDATA__[\'count\'] = $__NEWQUERY__::query()->where(\'status\',1)
                ->where(\'tags\',\'like\',\'%\'.$__LIST__.\'%\')
                ->count();

                $__GETDATA__[\'title\'] = $__LIST__;
                $__DATA__[] = $__GETDATA__;
            }';
            
            $parseStr .= 'foreach($__DATA__ as $key=>'.$obj.') { ?>';
            return $parseStr;
        });

        // tags模板标签结束
        Blade::directive('endtags', function () {
            return "<?php } ?>";
        });

        // 万能模板标签开始 参数：表名称，循环对象，读取数量,读取位置,读取条件
        Blade::directive('querys', function ($expression) {
            $expressions = explode(',',$expression);

            // 表名
            isset($expressions[0]) ? $table = $expressions[0] : $table = '';

            // 循环对象
            isset($expressions[1]) ? $obj = $expressions[1] : $obj = '';

            // 读取数量
            isset($expressions[2]) ? $num = $expressions[2] : $num = '';

            // 读取位置
            isset($expressions[3]) ? $offset = $expressions[3] : $offset = '';

            // 读取条件
            if(isset($expressions[4])) {
                $replaceString = $expressions[0].','.$expressions[1].','.$expressions[2].','.$expressions[3].',';
                $where = str_replace($replaceString,'',$expression);
            } else {
                $where = 'where(\'status\',1)';
            }

            // 解析字符串
            $parseStr  = $parseStr   = '<?php ';
            // 读取page信息
            $parseStr .= '$__QUERY__ = DB::table('.$table.')->'.$where.';';

            if(!empty($offset)) {
                $parseStr .= '$__QUERY__->offset('.$offset.');';
            }

            $parseStr .= '$__LISTS__ = $__QUERY__
            ->take('.$num.')
            ->orderBy(\'id\', \'desc\')
            ->get()
            ->map(function ($value) {
                return (array)$value;
            })->toArray();';

            $parseStr .= 'foreach($__LISTS__ as $key=>'.$obj.') { ?>';

            return $parseStr;
        });

        // 万能模板标签结束
        Blade::directive('endquerys', function () {
            return "<?php } ?>";
        });

        // 相似文章标签开始 参数：循环对象，文章id，读取数量
        Blade::directive('similarArticles', function ($expression) {
            $expressions = explode(',',$expression);

            // 循环对象
            isset($expressions[0]) ? $obj = $expressions[0] : $obj = '';

            // 文章id
            isset($expressions[1]) ? $id = $expressions[1] : $id = '';

            // 读取数量
            isset($expressions[2]) ? $num = $expressions[2] : $num = '';

            // 解析字符串
            $parseStr  = $parseStr   = '<?php ';
            $parseStr .= '$__ARTICLE__ = App\Models\Post::where(\'id\', '.$id.')->first();';
            $parseStr .= '$__TAGS__ = explode(\',\',$__ARTICLE__->tags);';
            $parseStr .= '$__IDS__ = [];';
            $parseStr .= 'foreach ($__TAGS__ as $__KEY__ => $__VALUE__) {
                $__GETIDS__ = App\Models\Post::where(\'status\',1)
                ->where(\'tags\',\'like\',\'%\'.$__VALUE__.\'%\')
                ->take(10)
                ->orderBy(\'id\', \'desc\')
                ->select(\'id\')
                ->get()
                ->toArray();
                foreach ($__GETIDS__ as $__KEY1__ => $__VALUE1__) {
                    $__IDS__[] = $__VALUE1__;
                }
            }';
            $parseStr .= '$__SIMILARARTICLES__ = [];';
            $parseStr .= 'if(!empty($__IDS__)) {
                $__SIMILARARTICLES__ = App\Models\Post::where(\'status\',1)
                ->where(\'id\',\'<>\',$__ARTICLE__->id)
                ->whereIn(\'id\',$__IDS__)
                ->take('.$num.')
                ->orderBy(\'id\', \'desc\')
                ->get()
                ->toArray();
            }';
            $parseStr .= ' foreach($__SIMILARARTICLES__ as $key=>'.$obj.') { ?>';

            return $parseStr;
        });

        // 相似文章标签结束
        Blade::directive('endsimilarArticles', function () {
            return "<?php } ?>";
        });

        // 评论标签开始 参数：循环对象，评论对象id，评论类型，pid，读取数量
        Blade::directive('comments', function ($expression) {
            $expressions = explode(',',$expression);

            // 循环对象
            isset($expressions[0]) ? $obj = $expressions[0] : $obj = '';

            // 评论对象id
            isset($expressions[1]) ? $id = $expressions[1] : $id = '';

            // 评论类型
            isset($expressions[2]) ? $type = $expressions[2] : $type = '';

            // pid
            isset($expressions[3]) ? $pid = $expressions[3] : $pid = 0;

            // 读取数量
            isset($expressions[4]) ? $num = $expressions[4] : $num = '';

            // 解析字符串
            $parseStr  = $parseStr   = '<?php ';
            $parseStr .= '$__COMMENTS__ = App\Models\Comment::where(\'status\',1)
                ->where(\'object_id\','.$id.')
                ->where(\'type\','.$type.')
                ->where(\'pid\','.$pid.')
                ->take('.$num.')
                ->orderBy(\'id\', \'desc\')
                ->get()
                ->toArray();';

            $parseStr .= ' foreach($__COMMENTS__ as $key=>'.$obj.') { ?>';

            return $parseStr;
        });

        // 评论标签结束
        Blade::directive('endcomments', function () {
            return "<?php } ?>";
        });
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
