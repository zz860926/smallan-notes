<html>
    <head><meta charset='utf-8'>
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
                <link rel=stylesheet type="text/css" href="baseMobile.css">
        <?php } else { ?>
                <link rel=stylesheet type="text/css" href="basePc.css">
        <?php } ?> 
    </head>
    <body>
    <h1>搜尋結果</h1>
        <?php
            $link=mysqli_connect("localhost","root","","pokemondb");
            mysqli_query($link,"set names utf8");
            $M_name = "$_GET[monster]";
        ?>
        <div id="Content">
        <div id="leftContent">
            <?php
            $sel = mysqli_query($link,"SELECT * FROM `monsters` WHERE `名字` = '$M_name'");
            $rs = mysqli_fetch_row($sel);
            $sel2 = mysqli_query($link,"SELECT * FROM `skill` WHERE `編號` = '$rs[0]'");
            $sel3 = mysqli_query($link,"SELECT * FROM `image` WHERE `編號` = '$rs[0]'");
            $rs3 = mysqli_fetch_row($sel3);
            ?>
            <table id="mainTable">
                <tr>
                    <th class="title">
                        <?php echo $rs[1]?></th>
                    <th class="title">
                        <?php echo $rs[0]?></th>
                <tr>
                    <td colspan = 2><img src=<?php echo "imageData/".$rs3[1]?>  width="300">
                <tr>
                    <th>屬性<th>特性
                <tr>
                    <td><?php echo $rs[2]?><td><?php echo $rs[3]?>
            </table>
        </div>
        <div id="rightContent">
        <table  id="skillTable">
                <tr>
                    <th>等級<th>招式<th>屬性<th>分類<th>威力<th>命中<th>PP
                <?php
                    $times = mysqli_num_rows($sel2);
                    for($i=0;$i<$times;$i++)
                    {
                        $rs2 = mysqli_fetch_row($sel2);
                        $LV = $rs2[1];
                        $move = $rs2[2];
                        $type = $rs2[3];
                        $move_type = $rs2[4];
                        $power = $rs2[5];
                        $accuracy = $rs2[6];
                        $move_PP = $rs2[7];
                ?>
                <tr>
                    <td><?php echo $LV?><td><?php echo $move?>
                    <td class=<?php 
                        switch($type)
                        {
                            case "一般":
                            echo "NT";
                            break;
                            case "格鬥":
                            echo "FightT";
                            break;
                            case "飛行":
                            echo "FlyT";
                            break;
                            case "毒":
                            echo "PT";
                            break;
                            case "地面":
                            echo "GroundT";
                            break;
                            case "岩石":
                            echo "RT";
                            break;
                            case "蟲":
                            echo "BT";
                            break;
                            case "幽靈":
                            echo "GhT";
                            break;
                            case "鋼":
                            echo "ST";
                            break;
                            case "火":
                            echo "FireT";
                            break;
                            case "水":
                            echo "WaterT";
                            break;
                            case "草":
                            echo "GrassT";
                            break;
                            case "電":
                            echo "ET";
                            break;
                            case "超能力":
                            echo "PT";
                            break;
                            case "冰":
                            echo "IT";
                            break;
                            case "龍":
                            echo "DT";
                            break;
                            case "惡":
                            echo "DarkT";
                            break;
                            case "妖精":
                            echo "FairyT";
                            break;
                        }
                    ?>>
                        <?php echo $type?>
                    <td class=<?php 
                    if($move_type=="物理")echo "PM";
                    else if($move_type=="變化") echo "SM";
                    else if($move_type=="特殊") echo "SpecialM"
                    ?> >
                        <?php echo $move_type?>
                    <td><?php echo $power?><td><?php echo $accuracy?><td><?php echo $move_PP?>
                <?php
                    }
                ?>
            </table>
        </div>
        <div class="clearfloat"></div>
        </div>
      <!--  <div id="leftImage">
            <img src="image/pika2.png" width="300">
        </div>
        <div id="rightImage">
            <img src="image/4.jpg" width="350">
        </div>-->
        <footer>
            本頁內容均使用 
             <a href="https://creativecommons.org/licenses/by-nc-sa/3.0/deed.zh_TW">姓名標示-非商業性-相同方式分享 3.0</a>授權條款
             <a href="https://wiki.52poke.com/wiki/%E4%B8%BB%E9%A1%B5">原始資料來源</a>
         </footer>>
    </body>
</html>