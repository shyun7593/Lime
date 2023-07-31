<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>상세보기</title>
    <script src="js/jquery-3.7.0.min.js"></script>
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        body {
            width: 100%;
            height: 100%;
            background-image: url("/images/musicabg.png");
        }

        /*앨범사진, 설명, 수정/삭제 버튼*/
        #albumAndFile {
            margin-left: 10%;
        }

        /*앨범사진*/
        #album {
            text-align: center;
            z-index: 1;
            width: 28.5%;
            height: 35%;
            position: relative;
            float: left;
            margin: 2% 2% 0 3%;
        }

        #aw-fileInput {
            display: none;
        }

        .btn-upload {
            font-family: "에스코어 드림 4 Regular";
            color: white;
            float: left;
            font-size: 5rem;
            text-align: center;
            margin-top: 72.4%;
            margin-left: 5%;
            width: 5%;
            height: 5%;
            border: none;
            transition: 0.5s color;
            color: white;
            /* bottom: 17px; */
            position: relative;
            border-radius: 10px;
            z-index: 1;
            background-image: url("/images/picture.png");
            background-size: 100%, 100%;
            background-repeat: no-repeat;
            background-position: center;
        }

        .btn-upload2 {
            font-family: "에스코어 드림 4 Regular";
            float: left;
            color: white;
            font-size: 5rem;
            text-align: center;
            margin-top: 79.65%;
            margin-left: -5%;
            width: 5%;
            height: 4.95%;
            border: none;
            transition: 0.5s color;
            color: white;
            /* bottom: 17px; */
            position: relative;
            border-radius: 10px;
            z-index: 1;
            background-image: url(/images/music.png);
            background-size: 90%, 99%;
            background-repeat: no-repeat;
            background-position: center;
        }

        .btn-defaultimg {
            font-family: "에스코어 드림 4 Regular";
            float: left;
            color: white;
            font-size: 5rem;
            text-align: center;
            margin-top: 79.7%;
            margin-left: -5%;
            height: 5%;
            border: none;
            transition: 0.5s color;
            color: white;
            /* bottom: 17px; */
            position: relative;
            border-radius: 10px;
            z-index: 1;
        }

        .btn-upload:hover {
            transition: 0.5s color;
            color: #ff3d02;
        }

        /*음원 설명*/
        #artinfo {
            border: 1px solid black;
            float: left;
            width: 20%;
            height: 35%;
            margin-top: 1.75%;
            vertical-align: middle;
            border: 1px solid black;
            background: linear-gradient(45deg, rgba(182, 181, 181, 0.8), rgba(255, 255, 255, 0.8));
            border-radius: 10px;
        }

        #artinfo > p {
            font-family: "에스코어 드림 2 ExtraLight";
            text-align: left;
            padding-left: 5%;
            color: white;
            font-size: 1.8rem;
            margin-top: 2%;
            margin-bottom: 2%;
        }

        #artinfo1 {
            position: relative;
            text-align: center;
            height: 75%;
        }

        /*수정/삭제 버튼*/
        #aupdate-btn, #adelete-btn {
            visibility: hidden;
            font-size: x-large;
        }

        #adelete-btn {
            width: 100%;
            height: 100%;
            font-size: 1.5rem;
            position: absolute;
            top: 0%;
            border-radius: 10px;
            border: none;
            background: linear-gradient(45deg, rgba(0, 0, 0, 0), rgba(112, 112, 112, 0));
            transition: 0.5s color;
            color: white;
            cursor: pointer;
        }

        /*구매 버튼*/
        #aupdate-btn {
            width: 100%;
            height: 100%;
            font-size: 1.5rem;
            position: absolute;
            top: 0%;
            border-radius: 10px;
            border: none;
            background: linear-gradient(45deg, rgba(0, 0, 0, 0), rgba(112, 112, 112, 0));
            transition: 0.5s color;
            color: white;
            cursor: pointer;
        }

        #update-area {
            position: absolute;
            top: 75.55%;
            left: 51.1%;
            width: 9%;
            height: 10%;
            border: none;
            border-radius: 10px;
            background: linear-gradient(45deg, rgba(0, 0, 0, 0.5), rgba(112, 112, 112, 0.5));
        }

        #aupdate-btn:hover {
            transition: 0.5s color;
            color: #ff3d02;
        }

        #sale-btn, #send-message {
            display: none;
            width: 100%;
            height: 100%;
            font-size: 1.5rem;
            position: absolute;
            top: 0%;
            border-radius: 10px;
            border: none;
            background: linear-gradient(45deg, rgba(0, 0, 0, 0), rgba(112, 112, 112, 0));
            transition: 0.5s color;
            color: white;
            cursor: pointer;
        }

        #sale-btn:hover, #send-message:hover {
            transition: 0.5s color;
            color: #ff3d02;
        }

        #bought {
            visibility: hidden;
            position: relative;
            top: 50%;
            transform: translateY(-50%);
            text-align: center;
        }

        #buttons {
            width: 9.5%;
            height: 10%;
            font-size: 1.5rem;
            position: absolute;
            top: 75.59%;
            left: 40.3%;
            border-radius: 10px;
            border: none;
            background: linear-gradient(45deg, rgba(0, 0, 0, 0.8), rgba(112, 112, 112, 0.8));
            transition: 0.5s color;
            color: white;
        }

        #aback-btn {
            width: 9.5%;
            height: 10%;
            font-size: 3.5rem;
            position: absolute;
            top: 75.59%;
            left: 40.3%;
            border-radius: 10px;
            border: none;
            background: linear-gradient(45deg, rgba(0, 0, 0, 0.8), rgba(112, 112, 112, 0.8));
            transition: 0.5s color;
            color: white;
            cursor: pointer;
        }

        #aback-btn:hover {
            transition: 0.5s color;
            color: #ff3d02;
        }


        /*앨범상세*/
        #albumdetail {
            border: none;
            width: 20%;
            height: 23%;
            float: left;
            margin-top: 20.5%;
            position: absolute;
            margin-left: 40.25%;
            background: linear-gradient(45deg, rgba(255, 255, 255, 0.8), rgba(182, 181, 181, 0.8));
            border-radius: 10px;
        }

        #albumdetail > p {
            font-family: "에스코어 드림 2 ExtraLight";
            text-align: left;
            padding-left: 5%;
            color: white;
            font-size: 1.8rem;
            margin-top: 3%;
            margin-bottom: 5%;
            height: 15%;
        }
        #albumdetail > .info-titles > p {
            height: 20%;
        }
        #albumdetail > .info-values > p {
            height: 20%;
        }
        #album-info-box {
            border: 1px solid black;
            width: 26%;
            height: 74.1%;
            float: left;
            margin-top: 1.68%;
            position: absolute;
            margin-left: 62%;
            background: linear-gradient(45deg, rgba(255, 255, 255, 0.8), rgba(182, 181, 181, 0.8));
            padding-left: 1.3%;
            border-radius: 10px;
        }

        #album-info-box > p {
            font-family: "에스코어 드림 2 ExtraLight";
            text-align: left;
            color: white;
            font-size: 1.8rem;
            margin-top: 1%;
            margin-bottom: 1%;
        }


        #albumdetail > * {
            height: 75%;
            margin-top: 1.5%;
            margin-bottom: 1.5%;
            color: black;
            background-color: rgba(0, 0, 0, 0);
        }

        /*댓글*/
        #commentinfo {
            font-family: "에스코어 드림 2 ExtraLight";
            text-align: left;

            font-size: 1.5rem;
            margin-bottom: 1%;
            font-family: a타이틀고딕1;
            border: none;
            width: 25.8%;
            height: 23.6%;
            position: absolute;
            top: 62%;
            margin-left: 12.7%;
            border-radius: 10px;
            background: linear-gradient(45deg, rgba(0, 0, 0, 0.8), rgba(112, 112, 112, 0.8));
            color: white;
        }

        #commentinfo > p {
            font-family: a타이틀고딕5;
            padding-top: 1%;
            padding-left: 2%;
            color: white;
        }

        #commentinfo > div {
            font-size: 1.1rem;
            margin-top: 1%;
            margin-left: 3%;
        }

        #commentinfo > p:first-child {
            font-family: a타이틀고딕3;
            color: white;
        }

        /*섹션*/
        #infosection {
            width: 100%;
            height: 100%;
            border-radius: 10px;
        }


        /*파일 업로드*/
        .filebox {
            margin-left: 2.7%;
            position: absolute;
            top: 11.5%;
            background: linear-gradient(45deg, rgba(0, 0, 0, 0.8), rgba(112, 112, 112, 0.8));
            width: 25.8%;
            height: 47%;
            border-collapse: collapse;
            box-sizing: border-box;
            border-radius: 10px;
        }

        select {
            font-family: a타이틀고딕3;
        }

        input[type="date"] {
            font-family: a타이틀고딕3;
        }

        textarea#aw-album-info::placeholder {
            padding-left: 0.6%;
            padding-top: 0.4%;
            color: black;
            font-family: a타이틀고딕3;
        }

        textarea#aw-album-info {
            border-radius: 10px;
            height: 88%;
            margin-top: 1%;
            background-color: rgba(255, 255, 255, 0.7);
            border: none;
            padding-top: 1%;
            padding-left: 1%;
        }

        #artinfo1 > * {
            margin-top: 2%;
            margin-bottom: 2.5%;
            border-radius: 10px;
            height: 100%;
            color: black;
            background-color: rgba(0, 0, 0, 0);
        }

        .info-titles {
            display: flex;
            width: 26%;
            float: left;
            box-sizing: border-box;
            flex-direction: column;
            text-align: justify;
            margin-left: 6%;
        }

        .info-titles p {
            display: flex;
            flex-direction: column;
            justify-content: center;
            border:2px solid rgba(255, 0, 0, 0);
            height: 13%;
            border-radius: 5px;
            margin-top: 6%;
        }

        .info-titles > p:after {
            content: "";
            display: inline-block;
            width: 100%;
        }

        .info-values {
            display: flex;
            width: 50%;
            height: 100%;
            float: left;
            box-sizing: border-box;
            flex-direction: column;
            text-align: center;
        }

        .info-values > p {
            background-color: white;
            border: 2px solid;
            margin-top: 3%;
            border-radius: 5px;
            height: 13%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .audio-btn{
            position: absolute;
            top: 76%;
            left: 7%;
            width: 87%;
        }
    </style>
    <script>
        $(function () {
            let msg = "${msg}";
            if (msg != "") {
                alert(msg);
            }
            let count = "${count}";
            let curid = "${mb.mid}";
            let loginName = "${mb.mnick}";
            let Grade = "${mb.gname}";
            console.log(loginName);
            if (loginName == "") {
                $(".name").css("display", "none");
                $(".grade").css("display", "none");
                $(".logout").css("display", "none");
                $("#buttons").css("width", "20%");
                $("#update-area").css("display", "none");
                if ("${aDto.a_category}" == "lyricist"){
                    $("#send-message").css("display","block");
                } else {
                    $("#sale-btn").css("display","block");
                }
            } else {
                if (count == null || count == "" || count == "0"){
                    $("#messagecount").css("display","none");
                } else{
                    $("#messagecount").css("display","block");
                };
                if (curid == "${aDto.a_id}") {
                    $("#aupdate-btn").css("visibility", "visible");
                    $("#adelete-btn").css("visibility", "visible");
                    $("#sale-btn").css("display", "none");
                } else if("${aDto.a_category}" == "lyricist"){
                    $("#buttons").css("width","20%");
                    $("#send-message").css("display","block");
                    $("#update-area").css("display","none");
                }
                else {
                    $("#sale-btn").css("display","block");
                    $("#buttons").css("width", "20%");
                    $("#update-area").css("display", "none");
                }
                if ("${isbought}" == "true") {
                    $("#sale-btn").css("visibility", "hidden");
                    $("#bought").css("visibility", "visible");$("#send-message").css("visibility","hidden");
                }
                let spantag = $("#mname");
                spantag.append("<span>" + loginName + " 님</span>")
                //$(".name").html(loginName + " 님");
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
<section id="infosection">

    <div id="albumAndFile">
        <c:if test="${afDto.af_imgoriname == 'none.PNG'}">
            <div id="album">
                <img class="preview" width="auto" height="80%" style="margin-top: 6%" src="/images/Noimage.png">
            </div>
            <div class="filebox">
                <audio class="audio-btn" src="/upload/music/${afDto.af_musicsysname}" controls controlsList="nodownload">
            </div>
        </c:if>
        <c:if test="${afDto.af_imgoriname != 'none.PNG'}">
            <div id="album">
                <img class="preview" width="auto" height="80%" style="margin-top: 6%"
                     src="/upload/image/${afDto.af_imgsysname}">
            </div>
            <div class="filebox">
                <audio class="audio-btn" src="/upload/music/${afDto.af_musicsysname}" controls controlsList="nodownload">
            </div>
        </c:if>
    </div>

    <div id="artinfo">
        <p>기본 정보 입력</p>
        <div id="artinfo1" style="position: relative;">
            <div class="info-titles">
                <p>작성자</p>
                <p>제목</p>
                <p>카테고리</p>
                <p>장르</p>
                <p>발매일</p>
                <p>가격</p>
            </div>
            <div class="info-values" style="display: flex; vertical-align: middle">
                <p>${aDto.a_id}</p>
                <p>${aDto.a_title}</p>
                <p>${aDto.a_category}</p>
                <p>${aDto.a_genre}</p>
                <p>${aDto.a_release}</p>
                <p><fmt:formatNumber value="${aDto.a_price}" pattern="#,###" /></p>
            </div>
        </div>
    </div>
    <div id="commentinfo">
        <p>아티스트 소개</p>
        <div style="width: 90%; height: 70%;">
            <textarea disabled style="resize: none;width: 100%;color: white;height: 100%;border: none;background: none;">${mtext}</textarea>
        </div>
    </div>
    <div id="albumdetail">
        <p>제작사</p>
        <div class="info-titles">
            <p>싱글/그룹</p>
            <p>발매사 </p>
            <p>기획사 </p>
        </div>
        <div class="info-values">
            <p>${aDto.a_group}</p>
            <p>${aDto.a_publisher}</p>
            <p>${aDto.a_agency}</p>
        </div>

    </div>
    <div id="album-info-box">
        <p>음원설명</p>
        <textarea id="aw-album-info" name="a_contents" style="resize: none; width: 95%"
                  placeholder="당신의 앨범을 소개해주세요." disabled>${aDto.a_contents}</textarea>
    </div>
    <div id="aback-area" style="position: absolute;width: 7%; height: 3%">
        <button type="button" id="aback-btn" onclick="aback('${aDto.a_num}')"><</button>
    </div>
    <div id="buttons">
        <input type="button" id="adelete-btn" value="삭제" onclick="adel(${aDto.a_num})">
        <input type="button" id="sale-btn" value="구매하기" onclick="buybtn(${aDto.a_num})">
        <input type="button" id="send-message" value="문의하기" onclick="sendmessage('${aDto.a_id}','${aDto.a_num}')">
        <p id="bought">구매완료</p>
    </div>

    <div id="update-area">
        <input type="button" id="aupdate-btn" value="수정" onclick="aupdate(${aDto.a_num})">
    </div>


</section>
<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
<script>
    function buybtn(a_num) {
        if ("${mb.mnick}" == null || "${mb.mnick}" == "") {
            let popOption = "width = "+400+", height = "+350+", left = "+((window.screen.width / 2) - (400 / 2))+", top = "+((window.screen.height / 2) - (350 / 2));
            window.open("/popup?page=login", "login", popOption);
        } else {
            let popOption = "width = "+650+", height = "+550+", left = "+((window.screen.width / 2) - (650 / 2))+", top = "+((window.screen.height / 2) - (550 / 2));
            window.open("/kakaoPay?a_num=" + a_num, "카카오페이", popOption);
        }
    }
    function sendmessage(a_id, a_num){
        if ("${mb.mnick}" == null || "${mb.mnick}" == "") {
            let popOption = "width = "+400+", height = "+350+", left = "+((window.screen.width / 2) - (400 / 2))+", top = "+((window.screen.height / 2) - (350 / 2));
            window.open("/popup?page=login", "login", popOption);
        } else {
            let popOption = "width = "+400+", height = "+350+", left = "+((window.screen.width / 2) - (400 / 2))+", top = "+((window.screen.height / 2) - (350 / 2));
            window.open("/popup?page=sendmessage&a_id=" + a_id+"&a_num=" + a_num,"Message", popOption);
        }
    }

    function aback() {
        console.log("${page}");
        if ("${page}" == "artwork") {
            location.href = '/mypage?page=${page}&category=${sDto.category}&genre=${sDto.genre}&pageNum=${pageNum}';
        } else if("${page}" == "home"){
            location.href = '/main';
        }
        else{
            location.href = '/artwork?category=${sDto.category}&genre=${sDto.genre}&colname=${sDto.colname}&keyword=${sDto.keyword}&pageNum=${pageNum}';
        }
    }

    function aupdate(a_num) {
        location.href = '/artworkupdate?a_num=' + a_num;
    }

    function adel(a_num) {
        location.href = '/artworkdelete?a_num=' + a_num;
    }
    let audio = $(".audio-btn").get(0);
    audio.addEventListener("timeupdate", function (){
        if (audio.currentTime>59){
            console.log("1분 끝");
            audio.pause();
            audio.currentTime=0;
            return;
        }
        console.log(audio.currentTime);
    })

</script>
</html>
