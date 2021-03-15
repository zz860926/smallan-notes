<html>
    <head><meta charset='utf-8'>
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
        <link rel=stylesheet type="text/css" href="mobile.css">
    <?php } else { ?>
        <link rel=stylesheet type="text/css" href="pc.css">
    <?php } ?> 
    <title>神奇寶貝圖鑑</title>
        
    </head>
    <body>
        <?php
            $link=mysqli_connect("localhost","root","","pokemondb");
            mysqli_query($link,"set names utf8");
            $name = "$_GET[search]";
        ?>
        <div id="Content">
        <h2>搜尋結果</h2>
        <table>
            <tr>
                <th>編號<th>圖像<th>寶可夢<th>屬性
            <?php
            $data = mysqli_query($link,"SELECT * FROM monsters WHERE`名字`LIKE'%$name%' ORDER BY `編號`");
            $times = mysqli_num_rows($data);
            for($i=0;$i<$times;$i++)
            {
                $rs = mysqli_fetch_row($data);
                $M_id = $rs[0];
                $M_name = $rs[1];
                $M_type = $rs[2];
                $M_charac = $rs[3];
                $href = "basedata.php?monster=";
                $sel3 = mysqli_query($link,"SELECT * FROM `image` WHERE `編號` = '$M_id'");
                $rs3 = mysqli_fetch_row($sel3);
                ?>
                <tr>
                    <td><?php echo $M_id ?>
                    <td><img src=<?php echo "imageData/".$rs3[1]?>>
                    <td><a href="<?php echo $href,$M_name; ?>"><span><?php echo $M_name; ?></span></a>
                    <td><?php echo $M_type ?>
                <?php
            }
            ?>
            </table>
        </div>
        <!--<div id="leftImage">
            <img src="image/fat.png" width="450">
        </div>-->
        <footer>
            本頁內容均使用 
             <a href="https://creativecommons.org/licenses/by-nc-sa/3.0/deed.zh_TW">姓名標示-非商業性-相同方式分享 3.0</a>授權條款
             <a href="https://wiki.52poke.com/wiki/%E4%B8%BB%E9%A1%B5">原始資料來源</a>
         </footer>

 

    </body>
</html>