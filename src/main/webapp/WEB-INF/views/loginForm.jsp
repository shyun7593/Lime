<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="js/jquery-3.7.0.min.js"></script>
    <style>
        * {
            margin: 0px;
            padding: 0px;
        }

        body {
            width: 100%;
            height: 100%;
            background-image: url("/images/bg-white2.jpg");
        }

        section {
            height: 93%;
        }

        .lo-title {
            text-align: center;
            margin-top: 1%;
            font-size: 4rem;
            font-weight: bolder;
            font-family: "Segoe UI Black";
            margin-bottom: 1%;
            text-align: center;
        }

        .lo-inputBox {
            width: 25%;
            text-align: center;
            box-sizing: border-box;
            border: 1px solid black;
            border-radius: 20px;
            background-color: white;
            min-width: 400px;
            margin: 0 auto;
            margin-top: 0.5%;
        }

        .lo-input {
            width: 90%;
            height: 5%;
            margin: 2% auto;
            display: flex;
            justify-content: center;
            margin-top: 5%;
        }


        .lo-login {
            height: 5%;
            background-color: black;
            font-size: 1.2rem;
            font-family: a타이틀고딕1;
            color: white;
            border-radius: 10px;
            margin-top: 15%;
            border: 0px;
            cursor: pointer;
        }

        .lo-sub-title {
            font-weight: bolder;
            top: 21.5%;
            text-align: center;
            text-align: center;
        }

        #lo-sip-area {
            font-size: 0.8rem;
        }

        .lo-kakao-area {
            width: 90%;
            height: 5%;
            text-align: center;
            background-color: #fdd000;
            border-radius: 10px;
            line-height: 50px;
            font-size: 1.2rem;
            border: 0px;
            justify-content: center;
            display: flex;
            align-items: center;
            margin: 0 auto;
            margin-bottom: 5%;
        }


        .lo-kakao-login {
            font-family: a타이틀고딕1;
            color: white;
            text-decoration: none;
            color: black;
        }

        .lo-searchIdPw {
            cursor: pointer;
        }

        #lo-sip-icon1 {
            text-decoration: none;
            color: black;
            font-family: a타이틀고딕2;
        }

        #lo-sip-icon1:hover {
            color: #ff3d02;
        }

        #kakaoimg {
            top: 79%;
            left: 28%;
        }
    </style>
    <script>
        $(function () {
            let msg = "${msg}";
            if (msg != "") {
                alert(msg);
            }
            let loginName = "${mb.m_name}";
            let Grade = "${mb.g_name}";
            console.log(loginName);
            if (loginName == "") {
                $(".name").css("display", "none");
                $(".grade").css("display", "none");
                $(".logout").css("display", "none");
            } else {
                $(".name").html(loginName + " 님");
                $(".grade").html("등급 : [" + Grade + "]");
                $(".register").css("display", "none");
                $(".login").css("display", "none");
            }
        })
    </script>
</head>
<body>
<header style="height: 8%">
    <jsp:include page="header.jsp"></jsp:include>
</header>
<section>
    <form action="loginProc" method="post" class="">
        <h1 class="lo-title">L&nbsp;&nbsp;&nbsp;I&nbsp;&nbsp;&nbsp;M&nbsp;&nbsp;&nbsp;E</h1>
        <h6 class="lo-sub-title">─────────────&nbsp;&nbsp;&nbsp;L&nbsp;&nbsp;0&nbsp;&nbsp;G&nbsp;&nbsp;I&nbsp;&nbsp;N&nbsp;&nbsp;&nbsp;──────────────</h6>
        <div class="lo-inputBox">
                <p><input type="text" class="lo-input" id="memberid" name="mid" maxlength="15" placeholder="  ID"
                          autofocus
                          title="ID" required></p>
                <p><input type="password" class="lo-input" name="mpwd" placeholder="  Password" title="Password"
                          required></p>
                <p id="lo-sip-area"><div style="width: 86.5%; text-align: left; margin: 0 auto;"><a id="lo-sip-icon1" class="lo-searchIdPw" href="/searchIdPw?page=searchId">아이디/비밀번호 찾기</a></div></p>

                <p><input type="submit" class="lo-login lo-input" value="LOGIN"></p>
                <p class="lo-kakao-area">
                    <a class="lo-kakao-login"
                       href="https://kauth.kakao.com/oauth/authorize?client_id=b692bd8f02d3ba6238585cdd05ba7765&redirect_uri=http://192.168.0.107/login&response_type=code">
                        <img id="kakaoimg" src="images/speech-bubble.png" style="width: 25px; height: 25px; float: left"></a><a class="lo-kakao-login"
                href="https://kauth.kakao.com/oauth/authorize?client_id=b692bd8f02d3ba6238585cdd05ba7765&redirect_uri=http://192.168.0.107/login&response_type=code">&nbsp;&nbsp;KAKAO LOGIN</a></p>
        </div>
    </form>
</section>
<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>
