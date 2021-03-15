<html>
    <head>
        <meta charset='utf-8'>
        <title>神奇寶貝圖鑑</title>
        <?php  //定義那些User Agent String屬於手機瀏覽
        function check_mobile(){
            $regex_match="/(nokia|iphone|android|motorola|^mot\-|softbank|foma|docomo|kddi|up\.browser|up\.link|";
            $regex_match.="htc|dopod|blazer|netfront|helio|hosin|huawei|novarra|CoolPad|webos|techfaith|palmsource|";
            $regex_match.="blackberry|alcatel|amoi|ktouch|nexian|samsung|^sam\-|s[cg]h|^lge|ericsson|philips|sagem|wellcom|bunjalloo|maui|";
            $regex_match.="symbian|smartphone|midp|wap|phone|windows ce|iemobile|^spice|^bird|^zte\-|longcos|pantech|gionee|^sie\-|portalmmm|";   
            $regex_match.="jig\s browser|hiptop|^ucweb|^benq|haier|^lct|opera\s*mobi|opera\*mini|320x320|240x320|176x220";
            $regex_match.=")/i";
            return preg_match($regex_match, strtolower($_SERVER['HTTP_USER_AGENT']));
        } ?>
    <?php if( check_mobile() ) {  //如果是手機瀏覽，則執行此段語法 
    ?> 
        <link rel=stylesheet type="text/css" href="indexMobile.css">
    <?php } else { ?>
        <link rel=stylesheet type="text/css" href="indexPc.css">
    <?php } ?> 
        
    </head>
    <body>
        <div id="logo">
            <img src="image/logo.png" width="700" >
        </div>
            <div id="Content">
            <form  method="get" action="search.php?">
                    <a>寶可夢查詢：</a>
                    <input name="search" placeholder="請輸入寶可夢的名字。"></input>
                    <button class="button" type="submit">GO</button>
            </form>
         </div>
         <footer>
            首頁內容使用 
             <a href="https://creativecommons.org/licenses/by-nc-sa/3.0/deed.zh_TW">姓名標示-相同方式分享3.0</a>授權條款。
             <a href="https://zh-yue.wikipedia.org/wiki/%E5%AF%B5%E7%89%A9%E5%B0%8F%E7%B2%BE%E9%9D%88">圖片資料來源</a>
         </footer>
    </body>
</html>