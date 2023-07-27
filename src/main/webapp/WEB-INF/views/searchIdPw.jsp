<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="js/jquery-3.7.0.min.js"></script>
    <title>Title</title>
    <style>
        button{
            cursor: pointer;
        }
        * {
            margin: 0;
            padding: 0;
        }

        body {
            background-image: url("/images/bg-white2.jpg");
        }

        .content-bar {
            width: 100%;
            height: 100%;

        }

        .idpw {
            margin-left: 1%;
            width: 20%;
            text-align: center;
        }

        .idsearch {
            width: 100%;
            height: 80%;
            display: none;
        }
        .p-id{
            cursor: pointer;
            padding: 5px;
            border-radius: 5px;
        }

        .pwsearch {
            display: none;
            width: 100%;
            height: 80%;
        }
        .p-pw{
            cursor: pointer;
            padding: 5px;
            border-radius: 5px;
        }

        .inputform {
            min-width: 630px;
            position: relative;
            width: 40%;
            height: 60%;
            border: 3px solid black;
            margin: 0 auto;
            border-radius: 10px;
            background-color: white;
            opacity: 85%;
        }

        .userconfirm {
            text-align: center;
        }

        .confirmbtn, #back-btn, .gologin, #gosearchpw, #change-btn {
            width:20%;
            background-color: white;
            border-color: black;
            border-radius: 5px;
            padding: 4px;
            margin-top: 4%;
        }
        #gosearchpw{
            margin-top: 0;
        }


        #successpw {
            display: none;
            text-align: center;
        }

        #chkNotice {
            font-size: small;
            height: 1%;
        }

        #fid {
            margin-left: 1%;
            margin-top: 2%;
            font-weight: bolder;
            font-size: x-large;
            margin-bottom: 2%;
            color: black;
        }

        #fpw {
            margin-left: 1%;
            margin-top: 2%;
            font-weight: bolder;
            font-size: x-large;
            margin-bottom: 2%;
            color: black;
        }

        #sec, #sec2 {
            width: 151px;
            margin: 0 auto;
            text-align: start;
            margin-top: 5%;
            color: black;
            font-size: large;
        }

        #name, #wid {
            width: 151px;
            margin: 0 auto;
            text-align: start;
            margin-top: 5%;
            color: black;
            font-size: large;
        }


        #m-name {
            margin-top: 1%;
        }

        #my-secret {
            margin-top: 1%;
        }

        #m-mid {
            margin-top: 1%;
        }

        #m-msecret {
            margin-top: 1%;
        }
        /*아이디 찾기 버튼*/
        .idpw {
            width: 40%;
            margin: 0px auto;
            text-align: start;
            margin-top: 7%;
        }
        .custom-btn {
            height: 40px;
            padding: 10px 25px;
            border: 2px solid #000;
            font-family: a타이틀고딕3;
            font-weight: 500;
            background: transparent;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            display: inline-block;
            background: white;
            z-index: 0;
            margin: 1% 0;
        }

        .p-id {
            color: #000;
            margin-top: 10%;
            margin-right: 1%;
        }
        .p-id:before{
            background-color: white;
            height: 100%;
            width: 0%;
        }
        .p-id:after {
            position: absolute;
            content: "";
            width: 0;
            height: 100%;
            top: 0;
            right: 0;
            z-index: -2;
            background: #000;
            transition: all 0.3s ease;
        }
        .p-id:hover {
            color: #fff;
        }
        .p-id:hover:after {
            left: 0;
            width: 100%;
        }
        .p-id:active {
            top: 2px;
        }
        /*비밀번호 찾기 버튼*/
        .custom-btn {
            width: 130px;
            height: 40px;
            padding: 10px 25px;
            border: 2px solid #000;
            font-family: a타이틀고딕3
            font-weight: 500;
            background: transparent;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            display: inline-block;
            background: white;
            z-index: 0;
        }
        button {
            margin-bottom: 4%;
            outline: none;
        }
        .p-pw {
            color: #000;
        }
        .p-id:before{
            background-color: white;
            height: 100%;
            width: 0%;
        }
        .p-pw:after {
            position: absolute;
            content: "";
            width: 0;
            height: 100%;
            top: 0;
            right: 0;
            z-index: -2;
            background: #000;
            transition: all 0.3s ease;
        }
        .p-pw:hover {
            color: #fff;
        }
        .p-pw:hover:after {
            left: 0;
            width: 100%;
        }
        .p-pw:active {
            top: 2px;
        }
        #showid{
            text-align: center;
            margin-top: 15%;
        }
        #showpw{
            text-align: center;
        }
#change-btn{
    width: 15%;
    margin-top: 1%;
}
    </style>
    <script>
        $(function () {
            let page = "${page}";
            if (page == "searchId") {
                $(".idsearch").css("display", "block");
                $(".p-id").css("background-color", "black");
                $(".p-id").css("color", "white");
            } else {
                $(".pwsearch").css("display", "block");
                $(".p-pw").css("background-color", "black");
                $(".p-pw").css("color", "white");
            }

            let msg = "${msg}";
            if (msg != "") {
                alert(msg);
            }
            let loginName = "${mb.mname}";
            let Grade = "${mb.gname}";
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
    <div class="content-bar">
        <p class="idpw"><button class="custom-btn p-id" onclick="searchId()">Search ID</button><button class="custom-btn p-pw"
                                                                                                       onclick="searchPw()">Search PW</button>
        </p>
        <div class="idsearch">
            <div class="inputform">
                <p id="fid">ID찾기</p>
                <hr>
                <div class="userconfirm">
                    <p id="name">이름 : </p>
                    <input type="text" id="m-name" autocomplete="off">
                    <p id="sec">나만의 비밀 답:</p>
                    <input type="text" onkeyup="enteridsearch()" id="my-secret" autocomplete="off">
                    <br>
                    <button class="confirmbtn" onclick="idsearch()">Search!</button>
                </div>
                <div id="showid">

                </div>
            </div>
        </div>
        <div class="pwsearch">
            <div class="inputform">
                <p id="fpw">PW찾기</p>
                <hr>
                <div class="userconfirm">
                    <p id="wid">아이디 : </p>
                    <input type="text" id="m-mid" autocomplete="off">
                    <p id="sec2">나만의 비밀 답:</p>
                    <input type="text" onkeyup="enterpwsearch()" id="m-msecret" autocomplete="off">
                    <br>
                    <button class="confirmbtn" onclick="pwsearch()">Search!</button>
                </div>
                <div id="showpw">

                </div>
                <div id="successpw">
                    <p style="margin-top: 15%; font-size: x-large">수정이 완료되었습니다.</p>
                    <button class="gologin" onclick="goLogin()">로그인</button>
                </div>
            </div>
        </div>

    </div>

</section>
<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
<script>
    let conf = false;

    function enteridsearch() {
        if (window.event.keyCode == 13) {
            idsearch();
        }
    }

    function enterpwsearch() {
        if (window.event.keyCode == 13) {
            pwsearch();
        }
    }

    function searchId() {
        location.href = "/searchIdPw?page=searchId";
    }

    function searchPw() {
        location.href = "/searchIdPw?page=searchPw";
    }

    function idsearch() {
        let answer = $("#my-secret").val();
        let mname = $("#m-name").val();
        console.log(answer + ", " + mname);
        let sendData = {"mysecret": answer, "mname": mname};
        $.ajax({
            url: "searchId",
            type: "post",
            data: sendData,
            success: function (result) {
                $("#showid").css("display", "block");
                $(".userconfirm").css("display", "none");
                if (result == "No Member") {
                    $("#showid").append("<p> 회원정보가 없습니다. </p>");
                    $("#showid").append("<button id='back-btn' onclick='backid()'>돌아가기</button>");
                } else if (result == "False Answer") {
                    $("#showid").append("<p> 비밀이 틀렸습니다. </p>");
                    $("#showid").append("<button id='back-btn' onclick='backid()'>돌아가기</button>");
                } else {
                    $("#showid").append("<p style='font-size: x-large'> ID : " + result + "</p>");
                    $("#showid").append("<button class='gologin' onclick='goLogin()'>로그인</button><br>");
                    $("#showid").append("<button id='gosearchpw' onclick='gosearchPw()'>비밀번호 찾기</button>")
                }
            },
            error: function (error) {
                console.log(error);
                alert("관리자에게 문의하세요.");
            }
        })
    }

    function pwsearch() {
        let answer = $("#m-msecret").val();
        let m_mid = $("#m-mid").val();
        console.log(answer + ", " + mname);
        let sendData = {"mysecret": answer, "mid": m_mid};
        $.ajax({
            url: "searchPw",
            type: "post",
            data: sendData,
            success: function (result) {
                $("#showid").css("display", "block");
                $(".userconfirm").css("display", "none");
                if (result == "No Member") {
                    $("#showpw").append("<p style='margin-top: 15%;'> 회원정보가 없습니다. </p>");
                    $("#showpw").append("<button id='back-btn' onclick='backpw()'>돌아가기</button>");
                } else if (result == "false") {
                    $("#showpw").append("<p> 비밀이 틀렸습니다. </p>");
                    $("#showpw").append("<button id='back-btn' onclick='backpw()'>돌아가기</button>");
                } else {
                    $("#showpw").append("<input id='my-mid' type='text' readonly value='${mDto.getMid()}' style='display : none'>")
                    $("#showpw").append("<p style='width: 151px;margin: 0 auto;text-align: start;margin-top: 5%;'>새 비밀번호입력 : </p>");
                    $("#showpw").append("<input style='margin-top: 1%;' id='new-pass' autofocus type='password'>");
                    $("#showpw").append("<p style='width: 151px;margin: 0 auto;text-align: start;margin-top: 3%';>비밀번호 확인 : </p>");
                    $("#showpw").append("<input style='margin-top: 1%;' id='con-pass' onkeyup='updateEnter()' type='password'>");
                    $("#showpw").append("<p style='width: 151px;margin: 0 auto;text-align: start;' id='chkNotice'></p>")
                    $("#showpw").append("<br><button id='change-btn' onclick='updatePw()'>수정하기</button>");
                }
            },
            error: function (error) {
                console.log(error);
                alert("관리자에게 문의하세요.");
            }
        })
    }

    function updateEnter() {
        if (window.event.keyCode == 13) {
            updatePw();
        }
    }

    $(document).on("keyup", "#new-pass", function () {
        $("#chkNotice").html('');
    });

    $(document).on("keyup", '#con-pass', function () {
        if ($("#new-pass").val() != $("#con-pass").val()) {
            $("#chkNotice").html('일치하지 않음<br><br>');
            $("#chkNotice").css("color", "red");
            conf = false;
        } else {
            if ($("#new-pass").val() != null && $("#new-pass").val() != '') {
                $("#chkNotice").html('일치함<br><br>');
                $("#chkNotice").css("color", "#336fc9");
                conf = true;
            } else {
                $("#chkNotice").html('');
                conf = false;
            }
        }
    })


    function backpw() {
        location.href = '/searchIdPw?page=searchPw';
    }

    function backid() {
        location.href = '/searchIdPw?page=searchId';
    }

    function goLogin() {
        location.href = '/loginForm';
    }

    function gosearchPw() {
        location.href = '/searchIdPw?page=searchPw';
    }


    function updatePw() {
        if (conf == false) {
            alert('비밀번호를 다시 확인해 주세요.');
            $("#new-pass").focus();
            return;
        }
        let mid = $("#my-mid").val();
        console.log(mid);
        let pw = $("#con-pass").val();
        let sendData = {"mid": mid, "mpwd": pw};
        $.ajax({
            url: "updatePw",
            type: "post",
            data: sendData,
            success: function (res) {
                if (res == '수정 성공') {
                    $("#showpw").css("display", "none");
                    $("#successpw").css("display", "block");
                } else {
                    alert('실패했습니다.');
                    location.href = '/searchIdPw?page=searchPw';
                }
            },
            error: function (err) {
                console.log(err);
                alert('관리자에게 문의하세요.');
            }
        })
    }
</script>
</html>