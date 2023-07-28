<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
    <script src="js/jquery-3.7.0.min.js"></script>
    <script>
        $(function () {
            let msg = "${msg}";
            if (msg != ""){
                alert(msg);
            }
            let count = "${count}";
            let loginName = "${mb.mnick}";
            let Grade = "${mb.gname}";
            console.log(loginName);
            if (loginName == "") {
                $(".name").css("display", "none");
                $(".grade").css("display", "none");
                $(".logout").css("display", "none");
                $("#messagecount").css("display","none");
            } else {
                if (count == null || count == "" || count == "0"){
                    $("#messagecount").css("display","none");
                } else{
                    $("#messagecount").css("display","block");
                };
                let spantag = $("#mname");
                spantag.append("<span>"+loginName +" 님</span>")
                //$(".name").html(loginName + " 님");
                $(".grade").html("등급 : [" + Grade + "]");
                $(".register").css("display", "none");
                $(".login").css("display", "none");
            }
        })
    </script>
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

        .ti-cen {
            text-align: center;
            margin-top: 20px;
            font-size: 4rem;
            font-weight: bolder;
            font-family: "Segoe UI Black";
            margin-bottom: 40px;
        }

        .con-cen {
            position: relative;
            min-width: 400px;
            width: 25%;
            height: 75%;
            margin: 0 auto;
            text-align: center;
            box-sizing: border-box;
            border: 1px solid black;
            border-radius: 20px;
            background-color: white;
        }

        .to-left {
            text-align: left;
            margin: 5%;

        }

        input {
            width: 100%;
            height: 8%;
            margin-bottom: 10px;
            padding-left: 10px;
        }

        section {
            height: 90%;
        }

        button {
            width: 19px;
            height: 35px;
            font-weight: bolder;
            background-color: white;
            border: 1px solid black;
            border-radius: 10px;
            color: white;
            opacity: 100%;
            color: black;
            cursor: pointer;
        }

        button:hover {
            color: #ff3d02;
        }

        button#b1 {
            position: absolute;
            border: 0px;
            right: 6.5%;
            top: 4.5%;
        }

        button#b2 {
            position: absolute;
            border: 0px;
            right: 6.5%;
            top: 44.5%;
        }

        #question {
            margin-left: 5px;
            margin-bottom: 7px;
        }

        .mar-bo {
            resize: none;
            width: 100%;
            height: 17%;
            margin-bottom: 10px;
            padding-left: 10px;
        }

        .neulleo {
            height: 10%;
            background-color: black;
            font-size: 1.2rem;
            font-family: a타이틀고딕1;
            color: white;
            border-radius: 10px;
            cursor: pointer;
            border-radius: 10px;
        }

        .posi {
            font-weight: bolder;
            position: absolute;
            top: 21.5%;
            width: 100%;
            text-align: center;
        }

    </style>

</head>
<body>
<header style="height: 8%">
    <jsp:include page="header.jsp"></jsp:include>
</header>
<section>
    <form action="registerProc" method="post" class="register-form" name="jForm" autocomplete="off"
          onsubmit="return check()">
        <h1 class="ti-cen">L&nbsp;&nbsp;&nbsp;I&nbsp;&nbsp;&nbsp;M&nbsp;&nbsp;&nbsp;E</h1>
        <h6 class="posi">─────────────&nbsp;&nbsp;&nbsp;S&nbsp;&nbsp;I&nbsp;&nbsp;G&nbsp;&nbsp;N&nbsp;&nbsp;&nbsp;&nbsp;I&nbsp;&nbsp;N&nbsp;&nbsp;&nbsp;─────────────</h6>
        <div class="con-cen">
            <div class="to-left">
                <input type="text" class="" id="memberid" name="mid" maxlength="15" placeholder="  ID" autofocus
                       title="ID">
                <button type="button" id="b1" onclick="idcheck()">V</button>

                <input type="password" class="" name="mpwd" placeholder="  Password" title="Password">
                <input type="text" class="" name="mname" placeholder="  Name" title="Name">

                <input type="email" class="" name="mkakao" placeholder="  Kakao email" title="email" value="${email}">

                <%--  닉네임 이벤트 함수 처리  --%>
                <input type="text" class="" id="membernick" name="mnick" placeholder="  Nickname" title="Nickname">
                <button type="button" id="b2" onclick="nickcheck()">V</button>
                <p id="question">나만의 비밀</p>
                <input type="text" class="" name="msecret" placeholder="  답" title="나만의 비밀">
                <textarea name="mtext" class="mar-bo" placeholder="  자기소개"></textarea>
                <input type="submit" class="neulleo" value="SIGN IN">
            </div>
        </div>
    </form>
</section>
<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
<script>
    let ck = false;

    function check() {
        // 중복 체크 먼저
        if (ck == false) {
            alert("Please check ID duplicate.");
            return false;
        }
        // form 태그의 내용 확인 (누락된 부분)
        const jfrm = document.jForm;

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

    function nickcheck() {
        let nick = $("#membernick").val();

        if (nick == "") {
            alert("Please enter your Nickname.");
            $("#membernick").focus();
            return;
        }
        let sendNick = {"mnick": nick};
        $.ajax({
            url: "nickCheck",
            type: "get",
            data: sendNick,
            success: function (res) {
                if (res == "ok") {
                    alert("Nickname is available.");
                    ck = true;
                } else {
                    alert("This is a duplicate Nickname.")
                    $("#membernick").val("");
                    $("#membernick").focus();
                    ck = false;
                }
            },
            error: function (err) {
                console.log(err);
                alert("관리자에게 문의하세요.");
            }
        })
    }

    function idcheck() {
        let id = $("#memberid").val();

        if (id == "") {
            // 입력 안했을 경우
            alert("Please enter your ID.");
            $("#memberid").focus();
            return;
        }

        let sendId = {"mid": id};
        // 서버로 id 전송
        $.ajax({
            url: "idCheck",
            type: "get",
            data: sendId,
            success: function (result) {
                if (result == "ok") {
                    alert("ID is available.");
                    ck = true;
                    $("#memberid").css("background-color", "lightgray");
                    $("#b1").css("display", "none");
                } else {
                    alert("This is a duplicate ID.")
                    $("#memberid").val("");
                    $("#memberid").focus();
                    ck = false;
                }
            },
            error: function (error) {
                alert("Something is wrong.");
                console.log(error);
                ck = false;
            }
        })
    }

</script>
</html>
