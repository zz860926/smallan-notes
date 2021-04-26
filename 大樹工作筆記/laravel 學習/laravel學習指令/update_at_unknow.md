
## 【Laravel-Eloquent ORM】SQLSTATE[42S22]: Column not found: 1054 Unknown column ‘updated_at‘ in ‘field

https://blog.csdn.net/weixin_43967505/article/details/110958595

```
SQLSTATE[42S22]: Column not found: 1054 Unknown column 'updated_at' in 'field list' (SQL: update `table_name` set `STATE` = 1, `updated_at` = 2020-12-10 18:05:37 where `column_1` = xxx and `STATE` = 0 and `column_2` = xxx )
————————————————
版权声明：本文为CSDN博主「FULLNOTFOOL」的
原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/weixin_43967505/article/details/110958595
```
```
	public $timestamps = false;
```
