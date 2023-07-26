<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>마이페이지</title>
    <script src="js/jquery-3.7.0.min.js"></script>
    <style>

        * {
            margin: 0px;
            padding: 0px;
        }

        body {
            width: 100%;
            height: 100%;
            background-attachment: fixed;
            background-image: url("/images/bg-white2.jpg");
            background-size: cover;
            background-repeat: no-repeat;
        }

        #print {
            height: 70%;
            width: 70%;
            margin-left: 20%;
            float: left;
            border-radius: 10px;
            margin-top: 5%;
        }

        #icon-btn {
            height: 95%;
            width: 180px;
            border: solid;
            text-align: right;
            position: relative;
            background-color: black;
        }

        #icon > div {
            cursor: pointer;
        }

        #i1 {
            border-radius: 10px;
            height: 5.5%;
            width: 85%;
            top: 10%;
            left: 5%;
            position: absolute;
            color: white;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            border: 2px solid white;
            cursor: pointer;
        }

        #i2 {
            border-radius: 10px;
            height: 5.5%;
            width: 85%;
            top: 15.7%;
            left: 5%;
            position: absolute;
            color: white;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            border: 2px solid white;
            cursor: pointer;
        }

        #i3 {
            border-radius: 10px;
            height: 5.5%;
            width: 85%;
            top: 21.5%;
            left: 5%;
            position: absolute;
            color: white;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            border: 2px solid white;
            cursor: pointer;
        }

        #i4 {
            border-radius: 10px;
            height: 5.5%;
            width: 85%;
            top: 27.2%;
            left: 5%;
            position: absolute;
            color: white;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            border: 2px solid white;
            cursor: pointer;
        }

        #i5 {
            border-radius: 10px;
            height: 5.5%;
            width: 85%;
            top: 33%;
            left: 5%;
            position: absolute;
            color: white;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            border: 2px solid white;
            cursor: pointer;
        }

        #showprofile {
            height: 90%;
            width: 90%;
            display: none;
            position: relative;
            border-right: 1px solid black;
        }

        #updateprofile {
            height: 100%;
            width: 90%;
            display: none;
            position: relative;
            margin: 0 auto;
            text-align: center;
            vertical-align: middle;
        }

        #userconfirm {
            position: relative;
            height: 100%;
            width: 30%;
            margin: 0 auto;
            top: 40%;
            text-align: center;
            display: none;
        }

        #userconfirm {
            margin-top: 3%;
        }

        #confirmbtn1 {
            margin-top: 3%;
        }

        #mysecret {
            margin-top: 3%;
        }

        #modify2 {
            margin-top: 5%;
            width: 100%;
            height: 5%;
            background-color: #3f3f3f;
            color: white;
            font-family: a타이틀고딕3;
            border: none;
            border: 1px solid black;
            border-radius: 10px;
        }

        #modify3 {
            margin-top: 5%;
            width: 100%;
            height: 5%;
            padding-left: 3%;
            background-color: rgba(0,0,0,0);
            border: none;
            border: 1px solid black;
            border-radius: 5px;
        }

        #modify4 {
            margin-top: 5%;
            /* margin-bottom: 3%; */
            width: 100%;
            height: 5%;
            border: none;
            border: 1px solid black;
            border-radius: 5px;
            padding-left: 3%;
            background-color: rgba(0,0,0,0);
        }

        input#membernick {
            width: 100%;
            height: 5%;
            margin-top: 5%;
            border: none;
            border: 1px solid black;
            border-radius: 5px;
            background-color: rgba(0,0,0,0);
            padding-left: 3%;
        }

        #modify6 {
            margin-top: 5%;
            width: 100%;
            height: 5%;
            border: none;
            border: 1px solid black;
            border-radius: 5px;
            padding-left: 3%;
            background-color: rgba(0,0,0,0);
        }

        #modify7 {
            width: 100%;
            height: 20%;
            resize: none;
            border: none;
            border: 1px solid black;
            border-radius: 5px;
            margin-top: 5%;
            padding-top: 3%;
            padding-left: 3%;
        }

        #modify8 {
            margin-top: 5%;
            width: 100%;
            height: 10%;
            font-family: a타이틀고딕3;
            color: white;
            background-color: #3f3f3f;
            border: none;
            border: 1px solid black;
            border-radius: 10px;
        }

        #question {
            margin-top: 3%;
        }

        #memberid {
            margin-top: 7%;
            width: 100%;
            height: 5%;
            padding-left: 3%;
            border: none;
            background-color: rgba(0,0,0,0);
            border: 1px solid black;
            border-radius: 10px;
        }

        .ti-cen {
            margin-top: 3%;
        }

        #pass {
            display: none;
            width: 100%;
        }

        #mywrite > p {
            margin: 0 auto;
        }

        #mywrite > p > span {
            cursor: pointer;
        }

        #board {
            display: none;
        }

        #buypayment {
            display: none;
        }

        #salepayment{
            display: none;
        }

        .paging {
            width: 100%;
            margin: 0px auto;
            opacity: 0.8;
            text-align: center;
        }

        .paging > a {
            text-decoration: none;
        }

        .paging > a:visited {
            color: #575757;
        }

        #store {
            height: 100%;
            width: 85%;
            margin:0 auto;
            display: none;
        }

        #gowrite {
            visibility: hidden;
            animation-duration: 0.5s;
            background-color: white;
            text-align: center;
        }

        #gowrite ul {
            list-style: none;
        }

        @-webkit-keyframes duration {
            from {
                visibility: hidden;
                opacity: 0;
            }
            to {
                visibility: visible;
                opacity: 1;
            }
        }

        @-webkit-keyframes duration2 {
            from {
                visibility: visible;
                opacity: 1;
            }
            to {
                visibility: hidden;
                opacity: 0;
            }
        }

        #showprofile {
            box-sizing: border-box;
            width: 100%;
            float: left;
            font-family: a타이틀고딕5;
        }


        #showprofile p {
            text-align: center;
            margin-top: 3%;
            font-size: medium;
            position: relative;
        }

        #showprofile {
            position: relative;
            width: 50%;
            height: 90%;
            float: left;
        }

        #myprofile {
            display: none;
            box-sizing: border-box;
            width: 50%;
            height: 90%;
            float: left;
            font-size: medium;
            text-align: center;
            vertical-align: 50%;
            position: relative;
        }

        #myprofile2 {
            color: black;
            width: 90%;
            height: 8%;
            font-size: medium;
            position: relative;
            margin: 0 auto;
        }

        #myprofile2 h1 {
            position: relative;
            top: 20%;
        }

        #information {
            width: 80%;
            margin: 0 auto;
            position: relative;
            margin-top: 30%;
        }

        #myprofile1 {
            margin-top: 25%;
        }

        #modifybtn {
            display: none;
            height: 100%;
            margin-bottom: 0;
            font-size: large;
            margin-bottom: 5%;
        }

        #modifybtn1 {
            text-align: center;
            height: 100%;
        }

        #update1 {
            width: 25%;
            height: 7%;
            position: relative;
            margin-top: 3%;
            background-color: black;
            color: white;
            font-size: large;
            border-radius: 5px;
            font-family: a타이틀고딕5;
            border: 0px;
        }

        #update1:hover {
            background-color: #5b5b5b;
            color: white;
        }

        #artinfo {
            color: black;
            width: 90%;
            height: 8%;
            text-align: center;
            margin: 0 auto;
        }

        .ptable {
            width: 74%;
            height: 57%;
            border-collapse: collapse;
            border-radius: 10px;
            border-style: hidden;
            box-shadow: 0 0 0 1px #000;
            margin: 1% auto 3% auto;
            background-color: white;
        }

        .ptable tr {
            width: 100%;
        }

        .ptable th {
            padding: 14px 21px;
            background: black;
            color: white;
            font-size: 12px;
            border-top: 2px solid #333;
            border-bottom: 2px solid #ddd;
        }

        .ptable td {
            padding: 14px 21px;
            font-size: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        .ptable .in-data:hover {
            background: #eee;
        }
        .in-data{
            cursor: pointer;
        }
        .no-data {
            border-style: none;
        }

        .ptp {
            height: 10%;
        }

        #classification, #mclassification, #pclassification {
            width: 100%;
            color: white;
            display: none;
        }

        .p-artwork, .p-board {
            cursor: pointer;
            float: left;
            position: absolute;
        }

        .p-artwork {
            border: none;
            display: block;
            text-align: center;
            cursor: pointer;
            text-transform: uppercase;
            outline: none;
            overflow: hidden;
            position: relative;
            color: #fff;
            font-weight: 700;
            font-size: 15px;
            background-color: #222;
            padding: 17px 60px;
            margin: 0 auto;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.20);
            width: 10%;
            height: 7%;
        }


        .p-artwork span {
            position: relative;
            z-index: 1;
        }

        .p-artwork:after {
            content: "";
            position: absolute;
            left: 0;
            top: 12%;
            height: 380%;
            width: 140%;
            background: darkgray;
            -webkit-transition: all .5s ease-in-out;
            transition: all .5s ease-in-out;
            -webkit-transform: translateX(-98%) translateY(-25%) rotate(45deg);
            transform: translateX(-98%) translateY(-25%) rotate(45deg);
        }

        .p-artwork:hover:after {
            -webkit-transform: translateX(-9%) translateY(-25%) rotate(45deg);
            transform: translateX(-9%) translateY(-25%) rotate(45deg);
        }

        #artwork, #sendmessage, #receivemessage {
            display: none;
        }

        .p-board {
            border: none;
            display: block;
            text-align: center;
            cursor: pointer;
            text-transform: uppercase;
            outline: none;
            overflow: hidden;
            position: relative;
            color: #fff;
            font-weight: 700;
            font-size: 15px;
            background-color: #222;
            padding: 17px 60px;
            margin: 0 auto;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.20);
            width: 10%;
            height: 7%;
            left: 1%;
        }

        .p-board span {
            position: relative;
            z-index: 1;
        }

        .p-board:after {
            content: "";
            text-align: center;
            position: absolute;
            left: 0;
            top: 12%;
            height: 380%;
            width: 140%;
            background: darkgray;
            -webkit-transition: all .5s ease-in-out;
            transition: all .5s ease-in-out;
            -webkit-transform: translateX(-98%) translateY(-25%) rotate(45deg);
            transform: translateX(-98%) translateY(-25%) rotate(45deg);
        }

        .p-board:hover:after {
            -webkit-transform: translateX(-9%) translateY(-25%) rotate(45deg);
            transform: translateX(-9%) translateY(-25%) rotate(45deg);
        }

        /*결제 내역*/
        table {
            width: 55%;
            height: 45%;
            border-collapse: collapse;
            border-style: hidden;
            box-shadow: 0 0 0 1px #000;
            margin: 7% auto;
            background-color: white;
            min-width: 0px;
        }

        tr {
            font-weight: bold;
        }

        table th {
            padding: 14px 21px;
            background: black;

            color: white;
            font-size: 12px;
            border-top: 2px solid #333;
            border-bottom: 2px solid #ddd;
        }

        table td {
            padding: 14px 21px;
            color: black;
            font-size: 12px;
            border-bottom: 1px solid black;
            text-align: center;
        }

        #wlist {
            text-align: center;
            font-size: x-large;
        }

        .le {
            border-top-left-radius: 10px;
        }

        .ri {
            border-top-right-radius: 10px;
        }

        /*보관함*/
        #pdstyle {
            width: 100%;
            height: 100%;
            box-sizing: border-box;
        }

        .writebtn:before,
        .writebtn:after {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            height: 2px;
            width: 0;
            background: #fff;
            transition: 400ms ease all;
        }

        .writebtn {
            background: #fff;
            color: #000;
            line-height: 42px;
            padding: 0;
            border: none;
            width: 80px;
            font-family: a타이틀고딕3;
            border-radius: 5px;
        }

        .writebtn:hover {
            background: transparent;
            color: #fff;
            box-shadow: -7px -7px 20px 0px #fff9,
            -4px -4px 5px 0px #fff9,
            7px 7px 20px 0px #0002,
            4px 4px 5px 0px #0001;
            background-color: black;
        }

        .writebtn:before,
        .writebtn:after {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            height: 2px;
            width: 0;
            background: #fff;
            transition: 400ms ease all;
        }

        .writebtn:after {
            right: inherit;
            top: inherit;
            left: 0;
            bottom: 0;
        }

        .writebtn:hover:before,
        .writebtn:hover:after {
            width: 100%;
            transition: 800ms ease all;
        }

        .pwrite {
            width: 74%;
            margin: 0 auto;
            text-align: end;
        }

        .pwrite > button {
            border: none;
            color: white;
            font-size: large;
            border-radius: 5px;
            padding: 5px;
            background-color: black;
        }

        .gowrite {
            cursor: pointer;
        }
        #messagecount{
            display: none;
        }

        .to-left {
            width: 25.5%;
            margin: 0 auto;
        }

        #pwChangeInput {
            margin-top: 2.5%;
            width: 100%;
            height: 5%;
            padding-left: 3%;
            border: none;
            background-color: rgba(0,0,0,0);
            border: 1px solid black;
            border-radius: 10px;
        }

        button#b2 {
            position: absolute;
            border: 0px;
            right: 38.5%;
            top: 38.2%;
            color: black;
            font-family: a타이틀고딕3;
            background-color: rgba(0,0,0,0);
        }

        button#b2:hover {
            color: #ff3d02;
        }

        .posi {
            margin-top: 2%;
            margin-bottom: 1%;
        }
    </style>
    <script>
        $(function () {
            let pagetype = "${page}"

            switch (pagetype) {
                case "showprofile":
                    $("#showprofile").css("display", "block");
                    $("#myprofile").css("display", "block");
                    $("#modifybtn").css("display", "block");
                    $("#i1").css("background-color", "white");
                    $("#i1").css("color", "black");
                    $("#i1").css("border-radius", "none")
                    $("#i1").css("left", "15%");
                    $("#i1").css("border-radius", "10px 0px 0px 10px");
                    break;
                case "artwork":
                    $("#mywrite").css("display", "block");
                    $("#artwork").css("display", "block");
                    $("#classification").css("display", "block");
                    $(".p-board").css("color", "white");
                    $(".p-board").css("font-size", "large");
                    $(".p-board").css("border-radius", "5px");
                    $(".p-board").css("padding", "5px");
                    $(".p-artwork").css("color", "white");
                    $(".p-artwork").css("font-size", "large");
                    $(".p-artwork").css("border-radius", "5px");
                    $(".p-artwork").css("padding", "5px");
                    $(".p-artwork").css("background-color", "darkgray");
                    $("#i2").css("background-color", "white");
                    $("#i2").css("color", "black");
                    $("#i2").css("left", "15%");
                    $("#i2").css("border-radius", "10px 0px 0px 10px");
                    break;
                case "board":
                    $("#mywrite").css("display", "block");
                    $("#board").css("display", "block");
                    $("#classification").css("display", "block");
                    $(".p-artwork").css("color", "white");
                    $(".p-board").css("color", "white");
                    $(".p-board").css("font-size", "large");
                    $(".p-board").css("border-radius", "5px");
                    $(".p-board").css("padding", "5px");
                    $(".p-artwork").css("font-size", "large");
                    $(".p-artwork").css("border-radius", "5px");
                    $(".p-artwork").css("padding", "5px");
                    $(".p-board").css("background-color", "darkgray");
                    $("#i2").css("background-color", "white");
                    $("#i2").css("background-color", "white");
                    $("#i2").css("color", "black");
                    $("#i2").css("left", "15%");
                    $("#i2").css("border-radius", "10px 0px 0px 10px");
                    break;
                case "mystore":
                    $("#store").css("display", "block");
                    $("#i3").css("background-color", "white");
                    $("#i3").css("color", "black");
                    $("#i3").css("left", "15%");
                    $("#i3").css("border-radius", "10px 0px 0px 10px");
                    break;
                case "buypayment":
                    $("#pclassification").css("display","block");
                    $("#buypayment").css("display", "block");
                    $(".p-board").css("color", "white");
                    $(".p-board").css("font-size", "large");
                    $(".p-board").css("border-radius", "5px");
                    $(".p-board").css("padding", "5px");
                    $(".p-artwork").css("color", "white");
                    $(".p-artwork").css("font-size", "large");
                    $(".p-artwork").css("border-radius", "5px");
                    $(".p-artwork").css("padding", "5px");
                    $(".p-artwork").css("background-color", "darkgray");
                    $("#i4").css("background-color", "white");
                    $("#i4").css("color", "black");
                    $("#i4").css("left", "15%");
                    $("#i4").css("border-radius", "10px 0px 0px 10px");
                    break;
                case "salepayment":
                    $("#pclassification").css("display","block");
                    $("#salepayment").css("display", "block");
                    $(".p-artwork").css("color", "white");
                    $(".p-board").css("color", "white");
                    $(".p-board").css("font-size", "large");
                    $(".p-board").css("border-radius", "5px");
                    $(".p-board").css("padding", "5px");
                    $(".p-artwork").css("font-size", "large");
                    $(".p-artwork").css("border-radius", "5px");
                    $(".p-artwork").css("padding", "5px");
                    $(".p-board").css("background-color", "darkgray");
                    $("#i4").css("background-color", "white");
                    $("#i4").css("color", "black");
                    $("#i4").css("left", "15%");
                    $("#i4").css("border-radius", "10px 0px 0px 10px");
                    break;
                case "sendmessage":
                    $("#mclassification").css("display", "block");
                    $(".p-artwork").css("color", "white");
                    $(".p-board").css("color", "white");
                    $(".p-board").css("font-size", "large");
                    $(".p-board").css("border-radius", "5px");
                    $(".p-board").css("padding", "5px");
                    $(".p-artwork").css("font-size", "large");
                    $(".p-artwork").css("border-radius", "5px");
                    $(".p-artwork").css("padding", "5px");
                    $(".p-board").css("background-color", "darkgray");
                    $("#sendmessage").css("display", "block");
                    $("#i5").css("background-color", "white");
                    $("#i5").css("color", "black");
                    $("#i5").css("left", "15%");
                    $("#i5").css("border-radius", "10px 0px 0px 10px");
                    break;
                case "receivemessage":
                    $("#mclassification").css("display", "block");
                    $(".p-board").css("color", "white");
                    $(".p-board").css("font-size", "large");
                    $(".p-board").css("border-radius", "5px");
                    $(".p-board").css("padding", "5px");
                    $(".p-artwork").css("color", "white");
                    $(".p-artwork").css("font-size", "large");
                    $(".p-artwork").css("border-radius", "5px");
                    $(".p-artwork").css("padding", "5px");
                    $(".p-artwork").css("background-color", "darkgray");
                    $("#receivemessage").css("display", "block");
                    $("#i5").css("background-color", "white");
                    $("#i5").css("color", "black");
                    $("#i5").css("left", "15%");
                    $("#i5").css("border-radius", "10px 0px 0px 10px");
                    break;
            }
            let count = ${count};
            let msg = "${msg}";
            if (msg != "") {
                alert(msg);
            }
            let loginName = "${mb.mnick}";
            let Grade = "${mb.gname}";
            console.log(loginName);
            if (loginName == "") {
                $(".name").css("display", "none");
                $(".grade").css("display", "none");
                $(".logout").css("display", "none");
            } else {
                let spantag = $("#mname");
                if (count == 0){
                    $("#messagecount").css("display","none");
                } else {
                    $("#messagecount").css("display","block");
                }
                spantag.append("<span>" + loginName + " 님</span>")
                $(".grade").html("등급 : [" + Grade + "]");
                $(".register").css("display", "none");
                $(".login").css("display", "none");
            }
        })

    </script>
</head>
<body>
<header style="height: 8%; background-color: black">
    <jsp:include page="header.jsp"></jsp:include>
</header>
<section id="sec">
    <div id="contentwrite">
        <div id="print">
            <div id="showprofile">
                <div id="artinfo">
                    <h1 style="top: 20%; position: relative">ArtistInfo</h1>
                </div>
                <div style="text-align: center; margin-top: 2%">──────────LIME──────────</div>
                <div id="myprofile1">
                    <p>이름 : ${userInfo.mname}</p>
                    <p>닉네임 : ${userInfo.mnick}</p>
                    <p>포인트 : ${userInfo.mpoint}</p>
                    <p>등급 : ${mb.gname}</p>
                    <p>카카오이메일 : ${userInfo.mkakao}</p>
                </div>
            </div>
            <div id="myprofile">
                <div id="myprofile2">
                    <h1>AboutMe</h1>
                </div>
                <div style="text-align: center; margin-top: 2%">──────────LIME──────────</div>
                <div id="information">
                    <p>
                        ${userInfo.mtext}
                    </p>
                </div>
            </div>
            <div id="modifybtn">
                <div id="modifybtn1">
                    <button id="update1" onclick="updateInfo()">수정하기</button>
                </div>
            </div>
            <div id="userconfirm">
                <p>나만의 비밀 답:</p>
                <input type="text" id="mysecret" autocomplete="off"><br>
                <button id="confirmbtn" onclick="userConfirm()">확인</button>
                <button id="confirmbtn1" onclick="backbtn()">뒤로가기</button>
            </div>
            <div id="updateprofile">
                <form action="updateProc" method="post" id="modify" class="register-form" name="jForm"
                      autocomplete="off"
                      onsubmit="return check()">
                    <h1 class="ti-cen">L&nbsp;&nbsp;&nbsp;I&nbsp;&nbsp;&nbsp;M&nbsp;&nbsp;&nbsp;E</h1>
                    <h6 id="modify1" class="posi">─────────────프로필 수정─────────────</h6>
                    <div class="con-cen">
                        <div class="to-left">
                            <p><input type="text" class="" id="memberid" name="mid" maxlength="15" placeholder="  ID"
                                      title="ID" readonly value="${userInfo.mid}"></p>
                            <button type="button" id="modify2" onclick="updatePassword()">비밀번호 변경</button>
                            <p id="pass"><input type="password" id="pwChangeInput" name="mpwd" placeholder="  Password"
                                                title="Password" value="default"></p>
                            <p><input type="text" class="" id="modify3" name="mname" placeholder="  Name" title="Name"
                                      value="${userInfo.mname}" required></p>
                            <p><input type="email" class="" id="modify4" name="mkakao" placeholder="  Kakao email"
                                      title="email"
                                      value="${userInfo.mkakao}">
                            </p>
                            <%--  닉네임 이벤트 함수 처리  --%>
                            <p><input id="membernick" type="text" class="" id="modify5" name="mnick"
                                      placeholder="  Nickname"
                                      title="Nickname" value="${userInfo.mnick}" readonly>
                            </p>
                            <p id="question">나만의 비밀</p>
                            <p><input type="text" class="" id="modify6" name="msecret" placeholder="  답" title="나만의 비밀" required
                                      value="${userInfo.msecret}"></p>
                            <p><textarea name="mtext" class="mar-bo" id="modify7"
                                         style="resize : none"
                                         placeholder="  자기소개">${userInfo.mtext}</textarea></p>
                            <p><input type="submit" class="neulleo" id="modify8" value="수정하기"></p>
                        </div>
                    </div>
                </form>
            </div>
            <div style="margin-left: 13%; width: 100%">
                <p id="classification">
                    <button class="p-artwork" onclick="showartwork()"><span>Work</span></button>
                    <button class="p-board" onclick="showboard()"><span>Board</span></button>
                </p>
            </div>
            <div id="artwork" style="float: none;">
                <br>
                <p class="pwrite">
                    <button class="gowrite" onclick="artwrite()"><span>Write</span></button>
                </p>
                <table class="ptable">
                    <tr class="ptp">
                        <th class="le" style="border-top-left-radius: 10px">제목</th>
                        <th>카테고리</th>
                        <th>장르</th>
                        <th class="ri" style="border-top-right-radius: 10px">작성일자</th>
                    </tr>
                    <c:if test="${empty aList}">
                        <tr>
                            <td colspan="4">
                                내용이 없습니다.
                            </td>
                        </tr>
                        <c:forEach begin="2" end="9">
                            <tr class="no-data">
                                <td colspan="4" style="border : none;color: white">
                                    no
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    <c:if test="${!empty aList}">
                        <c:choose>
                            <c:when test="${fn:length(aList) % 9 == 0}">
                                <c:forEach var="aitem" items="${aList}">
                                    <tr class="in-data"
                                        onclick="location.href='/artworkdetail?a_num=${aitem.a_num}'">
                                        <td>${aitem.a_title}</td>
                                        <td class="subject">${aitem.a_category}</td>
                                        <td>${aitem.a_genre}</td>
                                        <td><fmt:formatDate value="${aitem.a_date}"
                                                            pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="aitem" items="${aList}">
                                    <tr class="in-data"
                                        onclick="location.href='/artworkdetail?a_num=${aitem.a_num}'">
                                        <td>${aitem.a_title}</td>
                                        <td class="subject">${aitem.a_category}</td>
                                        <td>${aitem.a_genre}</td>
                                        <td><fmt:formatDate value="${aitem.a_date}"
                                                            pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
                                    </tr>
                                </c:forEach>
                                <c:forEach begin="${fn:length(aList) % 9}" end="8">
                                    <tr class="no-data">
                                        <td colspan="4" style="border: none; color: white">no</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </table>
                <c:if test="${!empty aList}">
                    <div class="btn-parea">
                        <div class="paging">${paging}</div>
                    </div>
                </c:if>
            </div>
            <div id="board">
                <div class="pwrite">
                    <br>
                    <button class="gowrite" onclick="boardwrite()"><span>Write</span></button>
                </div>
                <table class="ptable">
                    <tr class="ptp">
                        <th class="le">닉네임</th>
                        <th>글제목</th>
                        <th><select id="type" onchange="ordertype()"
                                    style="background-color: black; color: white; border-style: none">
                            <option value="all" ${test == null || test == 'all' ? 'selected="selected"' : ''}>
                                전체
                            </option>
                            <option value="QnA" ${test == 'QnA' ? 'selected="selected"' : ''}>
                                Q&A
                            </option>
                            <option value="협업" ${test == '협업' ? 'selected="selected"' : ''}>
                                협업
                            </option>
                            <option value="ETC" ${test == 'ETC' ? 'selected="selected"' : ''}>
                                ETC
                            </option>
                        </select></th>
                        <th class="ri">작성일자</th>
                    </tr>
                    <c:if test="${empty bList}">
                        <tr>
                            <td colspan="4">
                                내용이 없습니다.
                            </td>
                        </tr>
                        <c:forEach begin="2" end="9">
                            <tr class="no-data">
                                <td colspan="4" style="border : none;color: white">
                                    내용이 없습니다.
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    <c:if test="${!empty bList}">
                        <c:choose>
                            <c:when test="${fn:length(bList) % 9 == 0}">
                                <c:forEach var="bitem" items="${bList}">
                                    <tr class="in-data" onclick="location.href='/boarddetail?b_num=${bitem.b_num}'">
                                        <td class="subject">${bitem.mnick}</td>
                                        <td>${bitem.b_title}</td>
                                        <td>${bitem.b_type}</td>
                                        <td><fmt:formatDate value="${bitem.b_date}"
                                                            pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="bitem" items="${bList}">
                                    <tr class="in-data" onclick="location.href='/boarddetail?b_num=${bitem.b_num}'">
                                        <td class="subject">${bitem.mnick}</td>
                                        <td>${bitem.b_title}</td>
                                        <td>${bitem.b_type}</td>
                                        <td><fmt:formatDate value="${bitem.b_date}"
                                                            pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
                                    </tr>
                                </c:forEach>
                                <c:forEach begin="${fn:length(bList) % 9}" end="8">
                                    <tr class="no-data">
                                        <td colspan="4" style="border: none; color: white">no</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </table>
                <c:if test="${!empty bList}">
                    <div class="btn-area">
                        <div class="paging">${paging}</div>
                    </div>
                </c:if>
            </div>
            <div id="store">
                <div id="wlist">────── My Box ──────</div>
                <div id="pdstyle">
                    <c:if test="${empty sList}">
                        <div style="font-size: x-large;text-align: center;margin-top: 20%;font-weight: bolder">
                            보관중인 파일이 없습니다.
                        </div>

                    </c:if>
                    <c:if test="${!empty sList}">
                        <c:forEach var="sitem" items="${sList}" varStatus="st">
                            <div id="pd${st.count}"
                                 onclick="downloadfile('${sitem.af_musicoriname}','${sitem.af_musicsysname}')" style="margin-left: 9% ;width: 20%;
            height: 30%;
            background-color: darkgray;
            float: left;
            margin-top: 7%;
            position: relative;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 2px 2px 2px 2px;">
                                <c:if test="${sitem.af_imgsysname == null}">
                                    <div style="width: 100%; height: 85%; position: relative; background-image: url('images/Noimage.png'); background-size: 100% 100%">
                                    </div>
                                </c:if>
                                <c:if test="${sitem.af_imgsysname != null}">
                                    <div style="width: 100%; height: 85%; position: relative; background-image: url('/upload/image/${sitem.af_imgsysname}'); background-size: 100% 100%">
                                    </div>
                                </c:if>
                                <div style="width: 100%; height: 15%; position: relative; background-color: white;">
                                    <p style="margin-left: 5%;
    height: 100%;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;">${sitem.af_musicoriname}</p>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
                <c:if test="${!empty sList}">
                    <div class="btn-area">
                        <div class="paging">${paging}</div>
                    </div>
                </c:if>
            </div>
            <div style="margin-left: 13%; width: 100%">
                <p id="pclassification">
                    <button class="p-artwork" onclick="showbuypayment()"><span>Buy</span></button>
                    <button class="p-board" onclick="showsalepayment()"><span>Sale</span></button>
                </p>
            </div>
            <div id="buypayment">
                <table class="ptable" style="margin-top: 5%">
                    <tr>
                        <th class="le">판매자</th>
                        <th >제목</th>
                        <th>가격</th>
                        <th class="ri">구매일자</th>
                    </tr>
                    <c:if test="${empty pList}">
                        <tr>
                            <td colspan="4">no data</td>
                        </tr>
                        <c:forEach begin="2" end="9">
                            <tr class="no-data">
                                <td colspan="4" style="border:none; color: white">no data</td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    <c:if test="${!empty pList}">
                        <c:choose>
                            <c:when test="${fn:length(pList) % 9 == 0}">
                                <c:forEach var="pitem" items="${pList}">
                                    <tr>
                                        <td>${pitem.mnick}</td>
                                        <td>${pitem.a_title}</td>
                                        <td><fmt:formatNumber value="${pitem.p_price}" pattern="#,###" />  원</td>
                                        <td><fmt:formatDate value="${pitem.p_date}"
                                                            pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="pitem" items="${pList}">
                                    <tr>
                                        <td>${pitem.mnick}</td>
                                        <td>${pitem.a_title}</td>
                                        <td><fmt:formatNumber value="${pitem.p_price}" pattern="#,###" />  원</td>
                                        <td><fmt:formatDate value="${pitem.p_date}"
                                                            pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                                    </tr>
                                </c:forEach>
                                <c:forEach begin="${fn:length(pList) % 9}" end="8">
                                    <tr class="no-data">
                                        <td colspan="4" style="border: none; color: white">no</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </table>
                <c:if test="${!empty pList}">
                    <div class="paging" style="top: 90%;">${paging}</div>
                </c:if>
            </div>
            <div id="salepayment">
                <table class="ptable" style="margin-top: 5%">
                    <tr>
                        <th class="le">구매자</th>
                        <th>제목</th>
                        <th>가격</th>
                        <th class="ri">구매일자</th>
                    </tr>
                    <c:if test="${empty psList}">
                        <tr>
                            <td colspan="4">no data</td>
                        </tr>
                        <c:forEach begin="2" end="9">
                            <tr class="no-data">
                                <td colspan="4" style="border:none; color: white">no data</td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    <c:if test="${!empty psList}">
                        <c:choose>
                            <c:when test="${fn:length(psList) % 9 == 0}">
                                <c:forEach var="psitem" items="${psList}">
                                    <tr>
                                        <td>${psitem.bmnick}</td>
                                        <td>${psitem.a_title}</td>
                                        <td><fmt:formatNumber value="${psitem.p_price}" pattern="#,###" />  원</td>
                                        <td><fmt:formatDate value="${psitem.p_date}"
                                                            pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="psitem" items="${psList}">
                                    <tr>
                                        <td>${psitem.bmnick}</td>
                                        <td>${psitem.a_title}</td>
                                        <td><fmt:formatNumber value="${psitem.p_price}" pattern="#,###" />  원</td>
                                        <td><fmt:formatDate value="${psitem.p_date}"
                                                            pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                                    </tr>
                                </c:forEach>
                                <c:forEach begin="${fn:length(psList) % 9}" end="8">
                                    <tr class="no-data">
                                        <td colspan="4" style="border: none; color: white">no</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </table>
                <c:if test="${!empty psList}">
                    <div class="paging" style="top: 90%;">${paging}</div>
                </c:if>
            </div>
            <div style="margin-left: 13%; width: 100%">
                <p id="mclassification">
                    <button class="p-artwork" onclick="showreceivemessage()"><span>받은 메시지</span></button>
                    <button class="p-board" onclick="showsendmessage()"><span>보낸 메시지</span></button>

                </p>
            </div>
            <div id="sendmessage" style="float: none;">
                <br>
                <p class="pwrite">
                    <button class="gowrite" onclick="messagewrite()"><span>Write</span></button>
                </p>
                <table class="ptable">
                    <tr class="ptp">
                        <th class="le" style="border-top-left-radius: 10px">받은사람</th>
                        <th>제목</th>
                        <th class="ri" style="border-top-right-radius: 10px">작성일자</th>
                    </tr>
                    <c:if test="${empty sendDto}">
                        <tr>
                            <td colspan="3">
                                내용이 없습니다.
                            </td>
                        </tr>
                        <c:forEach begin="2" end="9">
                            <tr class="no-data">
                                <td colspan="3" style="border : none;color: white">
                                    no
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    <c:if test="${!empty sendDto}">
                        <c:choose>
                            <c:when test="${fn:length(sendDto) % 9 == 0}">
                                <c:forEach var="sitem" items="${sendDto}">
                                    <tr class="in-data"
                                        onclick="showmessage(${sitem.m_num})">
                                        <td>${sitem.rmnick}</td>
                                        <td>${sitem.m_title}</td>
                                        <td><fmt:formatDate value="${sitem.m_date}"
                                                            pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="sitem" items="${sendDto}">
                                    <tr class="in-data"
                                        onclick="showmessage(${sitem.m_num})">
                                        <td>${sitem.rmnick}</td>
                                        <td>${sitem.m_title}</td>
                                        <td><fmt:formatDate value="${sitem.m_date}"
                                                            pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
                                    </tr>
                                </c:forEach>
                                <c:forEach begin="${fn:length(sendDto) % 9}" end="8">
                                    <tr class="no-data">
                                        <td colspan="3" style="border: none; color: white">no</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </table>
                <c:if test="${!empty sendDto}">
                    <div class="btn-parea">
                        <div class="paging">${paging}</div>
                    </div>
                </c:if>
            </div>
            <div id="receivemessage">
                <div class="pwrite">
                    <br>
                    <button class="gowrite" onclick="messagewrite()"><span>Write</span></button>
                </div>
                <table class="ptable">
                    <tr class="ptp">
                        <th class="le" style="width: 10%;"><select id="messagetype" style="background-color: black; color: white; border-style: none; text-align: center"
                                               onchange="readtype()">
                            <option value="all" ${test == null || test == 'all' ? 'selected="selected"' : ''}>전체
                            </option>
                            <option value="read" ${test == 'read' ? 'selected="selected"' : ''}>
                                읽은 메시지
                            </option>
                            <option value="unread" ${test == 'unread' ? 'selected="selected"' : ''}>
                                안읽은 메시지
                            </option>
                        </select></th>
                        <th>보낸사람</th>
                        <th>제목</th>
                        <th class="ri">작성일자</th>
                    </tr>
                    <c:if test="${empty receiveDto}">
                        <tr>
                            <td colspan="4">
                                내용이 없습니다.
                            </td>
                        </tr>
                        <c:forEach begin="2" end="9">
                            <tr class="no-data">
                                <td colspan="4" style="border : none;color: white">
                                    내용이 없습니다.
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    <c:if test="${!empty receiveDto}">
                        <c:choose>
                            <c:when test="${fn:length(receiveDto) % 9 == 0}">
                                <c:forEach var="ritem" items="${receiveDto}">
                                    <tr class="in-data" onclick="showmessage(${ritem.m_num})">
                                        <c:if test="${ritem.m_isread == 'read'}">
                                            <td style="color: gray">읽음</td>
                                        </c:if>
                                        <c:if test="${ritem.m_isread != 'read'}">
                                            <td>안읽음</td>
                                        </c:if>
                                        <td  <c:if test="${ritem.m_isread == 'read'}">style="color:gray"</c:if>>${ritem.mnick}</td>
                                        <td  <c:if test="${ritem.m_isread == 'read'}">style="color:gray"</c:if>>${ritem.m_title}</td>
                                        <td  <c:if test="${ritem.m_isread == 'read'}">style="color:gray"</c:if>><fmt:formatDate value="${ritem.m_date}"
                                                            pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="ritem" items="${receiveDto}">
                                    <tr class="in-data" onclick="showmessage(${ritem.m_num})">
                                        <c:if test="${ritem.m_isread == 'read'}">
                                        <td style="color: gray">읽음</td>
                                        </c:if>
                                        <c:if test="${ritem.m_isread != 'read'}">
                                            <td>안읽음</td>
                                        </c:if>
                                        <td  <c:if test="${ritem.m_isread == 'read'}">style="color:gray"</c:if>>${ritem.mnick}</td>
                                        <td  <c:if test="${ritem.m_isread == 'read'}">style="color:gray"</c:if>>${ritem.m_title}</td>
                                        <td  <c:if test="${ritem.m_isread == 'read'}">style="color:gray"</c:if>><fmt:formatDate value="${ritem.m_date}"
                                                                                                                                pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
                                    </tr>

                                </c:forEach>
                                <c:forEach begin="${fn:length(receiveDto) % 9}" end="8">
                                    <tr class="no-data">
                                        <td colspan="4" style="border: none; color: white">no</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </table>
                <c:if test="${!empty receiveDto}">
                    <div class="btn-area">
                        <div class="paging">${paging}</div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
    <div id="icon-btn">
        <div id="i1" onclick="showprofile()">프로필</div>
        <div id="i2" onclick="mywrite()">내가 쓴 글</div>
        <div id="i3" onclick="mystore()">보관함</div>
        <div id="i4" onclick="mypayment()">결제내역</div>
        <div id="i5" onclick="mymessage()">메시지</div>
    </div>
    <div id="writediv" style="position: fixed; right: 5px; bottom: 6.8%; width: 80px">
        <ul id="gowrite" style="list-style: none">
            <li><a style="text-decoration: none; cursor: pointer"
                   href="/goartwork?category=all&genre=all&colname=all&keyword=all&pageNum=1">Artwork</a></li>
            <li><a style="text-decoration: none; cursor: pointer;margin-top: 7%;"
                   href="/board?type=all&pageNum=1">Board</a></li>
        </ul>
        <div style="position: fixed; right: 5px; bottom: 10px;">
            <button class="writebtn" onclick="showwrite()">Go List!</button>
        </div>
    </div>
</section>
<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>

</body>
<script>
    function updateInfo() {
        let popOption = "width = "+463+", height = "+350+", left = "+((window.screen.width / 2) - (463 / 2))+", top = "+((window.screen.height / 2) - (350 / 2));
        window.open("/popup?page=profile", "login", popOption);

    }

    function updatePassword() {
        if($("#pass").css("display") == "none"){
            $("#pass").css("display", "block");
        } else {
            $("#pass").css("display", "none");
        }

    }

    function userConfirm() {
        let answer = $("#mysecret").val();
        console.log(answer);
        let sendData = {"mysecret": answer, "mid": '${mb.mid}'};
        $.ajax({
            url: "userConfirm",
            type: "post",
            data: sendData,
            success: function (result) {
                if (result == "true") {
                    $("#userconfirm").css("display", "none");
                    $("#updateprofile").css("display", "block");

                } else {
                    alert("비밀번호가 일치하지 않습니다.");
                    $("#userconfirm").css("display", "none");
                    $("#showprofile").css("display", "block");
                }
            },
            error: function (error) {
                console.log(error);
                alert("관리자에게 문의하세요.");
            }
        })
    }

    function backbtn() {
        location.href = "/profile?page=profile";
    }

    function check() {
        // 중복 체크 먼저
        if (ck == false) {
            alert("Please check ID duplicate.");
            return false;
        }

        // form 태그의 내용 확인 (누락된 부분)
        const jfrm = document.jForm;
        console.log(jfrm);

        let length = jfrm.length - 2;
        for (let i = 0; i < length; i++) {
            if (jfrm[i].value == "" || jfrm[i].value == null) {
                if (jfrm[i].tagName == "BUTTON") {

                } else {
                    alert("Please enter your " + jfrm[i].title);
                    jfrm[i].focus();
                    return false;
                }
            }
        }
        return true;
    }

    function showartwork() {
        location.href = "/mypage?page=artwork&category=all&genre=all&pageNum=1";


    }

    function showboard() {
        location.href = "/mypage?page=board&type=all&pageNum=1";

    }

    function showwrite() {
        if ($("#gowrite").css("visibility") == "hidden") {
            $("#gowrite").css("-webkit-animation-name", "duration");
            $("#gowrite").css("visibility", "visible");
        } else {
            $("#gowrite").css("visibility", "hidden");
            $("#gowrite").css("-webkit-animation-name", "duration2");
            $("#gowrite").css("visibility", "hidden");
            $("#writediv").css("visiblity", "visible");
        }
    }

    function ordertype() {
        let b_type = $("#type").val();

        console.log(b_type);
        location.href = "/profile?page=board" + "&type=" + b_type + "&pageNum=1";
    }

    function downloadfile(oriname, sysname) {
        location.href = '/downloadfile?oriname=' + oriname + '&sysname=' + sysname;
    }

    function boardwrite() {
        location.href = '/boardwrite';
    }

    function artwrite() {
        location.href = '/artworkwrite';
    }

    function showsendmessage() {
        location.href = 'mypage?page=sendmessage&type=all&pageNum=1'
    }

    function showreceivemessage() {
        location.href = 'mypage?page=receivemessage&type=all&pageNum=1';
    }
    function showmessage(m_num){
        let popOption = "width = "+400+", height = "+350+", left = "+((window.screen.width / 2) - (400 / 2))+", top = "+((window.screen.height / 2) - (350 / 2));
        window.open("/popup?page=showmessage&m_num=" + m_num, "login", popOption);
    }
    function messagewrite(){
        let popOption = "width = "+400+", height = "+350+", left = "+((window.screen.width / 2) - (400 / 2))+", top = "+((window.screen.height / 2) - (350 / 2));
        window.open("/popup?page=sendmessage","Message", popOption);
    }
    function readtype(){
        let type = $("#messagetype").val();
        location.href = 'mypage?page=receivemessage&type=' + type + '&pageNum=1';
    }
    function showbuypayment(){
        location.href = 'mypage?page=buypayment&pageNum=1';
    }

    function showsalepayment(){
        location.href = 'mypage?page=salepayment&pageNum=1';
    }
</script>
</html>
