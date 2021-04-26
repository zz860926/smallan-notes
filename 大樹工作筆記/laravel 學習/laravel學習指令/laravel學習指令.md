## 傳遞變數
>DAY10-View介紹
https://ithelp.ithome.com.tw/articles/10191569
```php
    public function show_id($id){
        //第一種傳變數進view的方法
        return view('hello')->with('id',$id);
        //第二種方法
        return view('hello',compact('id',$id));
    }
```
```php
/ path resources/views  
// hello.blade.php


<!doctype html>
<html lang="{{ app()->getLocale() }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Laravel</title>

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,600" rel="stylesheet" type="text/css">

        <!-- Styles -->
        <style>
            
        </style>
    </head>
    <body>
        <div class="container">
          <!--變數必須用大括號包起來 -->
          <h1>news_id：{{$id}}</h1>
        </div>
    </body>
</html>
```

## 分類select
```html
<option value="0">請選擇...</option>
                                    <option value="2" >
Angelica Will
</option>
                                    <option value="3" selected>
Burley Kub
</option>
                                    <option value="6" >
Dr. Annabell Hegmann
</option>
                                    <option value="1" >
Dr. Damon Pollich PhD
</option>
                                    <option value="7" >
Gladyce Upton
</option>
                                    <option value="10" >
```
```php
@foreach($post_types as $post_type)
    <option value="{{ $post_type->id }}" {{ ($post->type == $post_type->id)?"selected":"" }}>
        {{ $post_type->name }}
    </option>
@endforeach
```

\