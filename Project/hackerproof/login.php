<?php
$link=mysqli_connect("localhost","root","0927","testdb");
mysqli_query($link,"set names utf8");
$acc = $_REQUEST["acc"];
$pwd = $_REQUEST["pwd"];
if ($acc == "" | $acc == null) {
    ?><script>alert("賬號不可爲空！！");</script><?php
    ?><script>window.location.reload();</script><?php
}else {
    $chk = mysqli_query($link, "SELECT `passwd` FROM `user` WHERE `account` = '$acc'");
    $rs=mysqli_fetch_row($chk);
    if ($rs[0] == "" | $rs[0] == null) {//比對賬號
        ?><script>alert("該賬號未注冊！！");
		window.location.replace("index.html");</script><?php
    }
    else if ($pwd == $rs[0]) { //比對密碼
        echo "<span>登入成功，</span><a href='index.html' onclick='logout()'><button>登出</button></a>";
    }
    else if ($pwd == "" | $pwd == null) {
        ?><script>alert("密碼不可爲空！！");
		window.location.replace("index.html");</script><?php
    }/* else if () {
        ?><script>window.location.replace("login.html");</script><?php
    }*/
    else {
        ?><script>alert("密碼錯誤");
        window.location.replace("index.html");</script><?php
        
    }
}
?>