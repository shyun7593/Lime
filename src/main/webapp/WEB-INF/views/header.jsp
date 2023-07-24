<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    * {
        font-family: a타이틀고딕1;
    }

    .top-bar {
        height: 8%;
        background-color: #090909;
        position: fixed;
        top: 0px;
        width: 100%;
        z-index: 100;
    }

    .top-right {
        float: right !important;
        margin-top: 24px;
        margin-right: 12px;
    }

    .top-right ul {
        list-style: none;
        padding: 0px;
        margin: 0px;
        color: white;
    }

    .top-right ul li {
        float: left;
        padding-left: 40px;
    }

    .top-left {
        float: left !important;
        padding: 0px;
        margin: 0px;
        color: white;
        font-family: a타이틀고딕3;
    }

    .logo {
        margin-top: 10px;
        margin-right: 5px;
        width: 50px;
        border-radius: 10px;
        margin-left: 48%;
    }

    .top-right ul li a {
        text-decoration: none;
    }

    .top-right ul li a:link {
        color: white;
    }

    .top-right ul li a:visited {
        color: #fff;
    }

    .top-right ul li a:hover {
        color: #8c8c8c;
    }

    .content {
        padding-right: 15px;
        padding-left: 15px;
        margin-right: auto;
        margin-left: auto;
        max-width: 100%;
    }

    .top-home {
        margin-top: 20px;
        padding-right: 10px;
        margin-right: auto;
        margin-left: auto;
    }

    .name {
        color: white;
    }

    .name:hover {
        color: #8c8c8c;
    }

    ul.myPage > li {
        display: inline-block;
        width: 80px;
        padding: 5px 10px;
        border: 1px solid #eee;
        text-align: center;
        position: relative;
    }

    ul.submenu {
        background-color: white;
        border-radius: 10px;
        border: 1px solid black;
        margin-right: -2px;
        right: 1px;
    }

    ul > li ul.submenu {
        float: none;
        display: none;
        position: absolute;
        top: 100%;
        background-color: black;
        border: 0.5px solid white
    }

    ul > li ul.submenu > li {
        width: 160px;
        padding: 10px 10px;
        /* border: 1px solid #eee; */
        text-align: left;
        color: white;
    }

    ul .submenu > li {
        float: none;
        color: #090909;
    }

    ul .submenu > li a{
        font-family: a타이틀고딕1;
        color: black;
        z-index: 10;
    }

    img#logoIcon{
        position: absolute;
        top: 20px;
    }
    #messagecount{
        display: none;
        color: white;
        font-size: medium;
        position: fixed;
        top: 1%;
        right: 9%;
        text-align: center;
        line-height: 15px;
    }
</style>
<div class="top-bar">
    <div class="content">
        <span id="messagecount">New!</span>
        <h2 class="top-left top-home" onclick="goHome()" style="cursor: pointer">L&nbsp;&nbsp;I&nbsp;&nbsp;M&nbsp;&nbsp;E</h2>
        <span><img id="logoIcon" src="/images/fruit.png" style="width: 28px; height: 28px;"></span>
        <nav class="top-right">
            <ul>
                <li class="grade" id="mgrade"></li>
                <li class="name" id="mname" onclick="showlist()" style="cursor: pointer">
                    <ul class="submenu">
                        <li onclick="showprofile()"><img src="images/user.png" style="position:absolute; width: 20px; height: 20px; top: 5%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;프로필 보기</li>
                        <li onclick="mywrite()"><img src="images/edit2.png" style="position:absolute; width: 20px; height: 20px; top: 25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내가 쓴 글</li>
                        <li onclick="mystore()"><img src="images/box.png" style="position:absolute; width: 20px; height: 20px; top: 45%; left: 5.15%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;보관함</li>
                        <li onclick="mypayment()"><img src="images/invoice.png" style="position:absolute; width: 25px; height: 22px; top: 65%; left: 4.16%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;결제 내역</li>
                        <li onclick="mymessage()"><img src="images/msg.png" style="position:absolute; width: 25px; height: 22px; top: 85%; left: 4.16%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;메시 지</li>
                    </ul>
                </li>
                <li class="login"><a href="loginForm">Log in</a></li>
                <li class="logout"><a href="logOut">Log out</a></li>
                <li class="register"><a href="registerForm">Join</a></li>
            </ul>
        </nav>
    </div>
</div>

<script>
    function goHome() {
        location.href = "/main";
    }
    function showprofile(){
        location.href = '/mypage?page=showprofile';
    }

    function mywrite(){
        location.href = '/mypage?page=artwork&category=all&genre=all&pageNum=1';
    }

    function mystore(){
        location.href = '/mypage?page=mystore&pageNum=1';
    }

    function mypayment(){
        location.href = '/mypage?page=buypayment&pageNum=1';
    }
    function mymessage(){
        location.href = '/mypage?page=receivemessage&type=all&pageNum=1';
    }
    function showlist() {
        $(".name").css("color", "white");
        if ($(".submenu").css("display") == "block") {
            $(".submenu").css("display", "none");
        } else {
            $(".submenu").css("display", "block")
        }
    }
</script>
