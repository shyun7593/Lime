<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <script src="js/jquery-3.7.0.min.js"></script>
    <style>
        html {

        }

        * {
            margin: 0px;
            padding: 0px;
        }

        body {
            width: 100%;
            height: 150%;
        }

        section {
            width: 100%;
            height: 130%;
        }

        .view {
            width: 100%;
            height: 100%;
            background-image: url(/images/musicabg.png);
            background-size: auto;
        }

        /*************************************/
        .search-box {
            margin: 0 auto;
            position: relative;
            width: 40%;
            top: 5.83%;
            background-color: rgba(255, 255, 255, 0.5);
            box-sizing: border-box;
            border-radius: 15px;
            border-style: none;
        }

        input {
            width: 100%;
            border-style: none;
            border-radius: 15px;
            padding: 10px 12px;
            font-size: 14px;
            text-align: center;
            background-color: rgba(0, 0, 0, 0.86);
            color: white;
            opacity: 90%;
        }

        #glass3 {
            color: white;
            position: absolute;
            width: 17px; /*%로 수정*/
            top: 6px; /*%로 수정*/
            left: 87%;
            /*right: 30%;*/
            margin: 0;
        }

        #glass2 {
            visibility: hidden;
            position: absolute;
            width: 12px; /*%로 수정*/
            top: 9px; /*%로 수정*/
            left: 82%;
            /*right: 30%;*/
            margin: 0;
            cursor: pointer;
        }

        #glass {
            position: absolute;
            width: 17px; /*%로 수정*/
            top: 6px; /*%로 수정*/
            left: 92%;
            /*right: 30%;*/
            margin: 0;
            cursor: pointer;
        }

        /*******************검색메인분류기능**********************/
        #sep-search {
            width: 32%;
            height: 60%;
            position: absolute;
            left: 40%;
            top: 24%;
            display: none;
        }

        /*******분류제목*********/
        #sep1, #sep2 {
            font-family: a타이틀고딕2;
            font-size: 0.8rem;
            margin-right: 8%;
            color: white;
        }

        #sep1 {
            margin-right: 16%;
        }

        /********분류목록********/
        #sep-s1, #sep-s2 {
            margin-left: 2%;
            padding-left: 0.5%;
            width: 12%;
            height: 3.5%;
            background-color: rgba(255, 255, 255, 0);
            color: white;
            border-radius: 10px;
            border-collapse: collapse;
            box-sizing: border-box;
            border: 1px solid white;
            font-size: 0.8rem;
        }

        #sep-s2 {
            margin-left: 2%;
            padding-left: 0.5%;
            width: 12%;
            height: 3.5%;
            background-color: rgba(255, 255, 255, 0);
            color: white;
            border-radius: 10px;
            border-collapse: collapse;
            box-sizing: border-box;
            border: 1px solid white;
            font-size: 0.8rem;
        }

        /******검색분류아이콘*********/
        #separate {
            position: absolute;
            width: 15px; /*%로 수정*/
            top: 8px; /*%로 수정*/
            left: 3%;
            /*right: 30%;*/
            margin: 0;
        }

        /******검색분류아이콘버튼*********/
        #sep-btn {
            position: absolute;
            width: 12%; /*%로 수정*/
            height: 90%;
            top: 5%; /*%로 수정*/
            left: 2%;
            /*right: 30%;*/
            margin: 0;
            cursor: pointer;
            border: 1px solid rgba(0, 0, 0, 0);
            background-color: rgba(0, 0, 0, 0);
            color: rgba(0, 0, 0, 0);
        }

        /******분류select 양식 설정*********/
        select {
            outline: white;
        }

        option {
            background-color: rgba(0, 0, 0, .8);
            border-collapse: collapse;
            box-sizing: border-box;
            border: 1px solid white;
        }

        /***********************검색서브분류기능*********************************/
        #sep-search-sub {
            width: 75%;
            height: 90%;
            margin-left: 12.5%;
            margin-top: 7.5%;

        }

        #sepSub1 {
            font-family: a타이틀고딕2;
            padding: 5px 1% 5px 1%;
            border-radius: 10px;
            border: 1px solid white;
            font-size: 0.8rem;
            margin-left: 26.4%;
            margin-right: 5.95%;
            color: white;
        }

        #sepSub2 {
            font-family: a타이틀고딕2;
            padding: 5px 2.2% 5px 2.2%;
            border-radius: 10px;
            border: 1px solid white;
            font-size: 0.8rem;
            margin-right: 5.95%;
            color: white;
        }

        #sepSub3 {
            font-family: a타이틀고딕2;
            padding: 5px 1% 5px 1%;
            border-radius: 10px;
            border: 1px solid white;
            font-size: 0.8rem;
            color: white;
        }

        #sep-sub1 {
            padding-left: 0.5%;
            margin-top: 2%;
            width: 6%;
            height: 1.5%;
            background-color: rgba(0, 0, 0, 0);
            color: white;
            border-radius: 10px;
            border-collapse: collapse;
            box-sizing: border-box;
            border-style: none;
            cursor: pointer;
        }

        #sep-sub2 {
            padding-left: 0.5%;
            margin-top: 2%;
            width: 6%;
            height: 1.5%;
            background-color: rgba(0, 0, 0, 0);
            color: white;
            border-radius: 10px;
            border-collapse: collapse;
            box-sizing: border-box;
            border-style: none;
            cursor: pointer;
        }

        #sep-sub3 {
            padding-left: 0.5%;
            margin-top: 2%;
            width: 6%;
            height: 1.5%;
            background-color: rgba(0, 0, 0, 0);
            color: white;
            border-radius: 10px;
            border-collapse: collapse;
            box-sizing: border-box;
            border-style: none;
            cursor: pointer;
        }

        .sep-sub-op {
            background-color: white;
            color: black;
        }

        #content-print {
            /*background-color: rgb(255,255,255);*/
            width: 90%;
            height: 85%;
            overflow: hidden;
            text-align: center;
            margin: 0 auto;
            margin-top: 1%;
            /*border: 2px dashed white;*/
            box-sizing: border-box;
        }

        #content-print #noneDataMsg{
            color: white;
        }

        .artwork-box {
            cursor: pointer;
            text-align: center;
            width: 20.25%;
            height: 20%;
            margin: 2%;
            background-color: #ffffff;
            float: left;
            border-radius: 5px;
            box-shadow: 6px 6px 12px 1px white;
        }

        .artbox-img {
            background-color: #333333;
            width: 100%;
            height: 80%;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            margin: 0;
        }

        .artbox-explain {
            width: 100%;
        }

        .artbox-explain > p {
            text-align: start;
            margin-left: 5%;
        }

        #board-btn {
            height: 60px;
            background-color: rgba(0, 0, 0, 0);
            border: none;
        }

        #board-btn2 {
            height: 60px;
            background-color: rgba(0, 0, 0, 0);
            border: none;
        }

        .paging > a, font {
            color : white;
        }
        #writeMsg {
            position: absolute;
            text-align: center;
            bottom: 0%;
            right: 61%;
            font-size: 0.8rem;
            width: 100px;
            height: 30px;
            line-height: 30px;
            color: white;
        }

        #boardMsg {
            position: absolute;
            text-align: center;
            bottom: 0%;
            right: 8.8%;
            font-size: 0.8rem;
            width: 100px;
            height: 30px;
            line-height: 30px;
            color: white;
        }
        @-webkit-keyframes duration {
            from {
                display: none;
                opacity: 0;
            }
            to {
                display: block;
                opacity: 1;
            }
        }

        @-webkit-keyframes duration2 {
            from {
                display: none;
                opacity: 1;
            }
            to {
                display: block;
                opacity: 0;
            }
        }
    </style>
    <script>
        $(function () {
            let count = "${count}";
            let msg = "${msg}";
            if (msg != "") {
                alert(msg);
            }
            ;
            let loginName = "${mb.mnick}";
            let Grade = "${mb.gname}";
            console.log(loginName);
            if (loginName == "") {
                $(".message-form").css("display", "none");
                $(".name").css("display", "none");
                $(".grade").css("display", "none");
                $(".logout").css("display", "none");
            } else {
                if (count == null || count == "" || count == "0") {
                    $("#messagecount").css("display", "none");
                } else {
                    $("#messagecount").css("display", "block");
                }
                ;
                let spantag = $("#mname");
                spantag.append("<span>" + loginName + " 님</span>")
                //$(".name").html(loginName + " 님");
                $(".grade").html("등급 : [" + Grade + "]");
                $(".register").css("display", "none");
                $(".login").css("display", "none");
                if (count > 0) {
                    $(".message-count").css("display", "block");
                }
            }
        })
    </script>
</head>
<body>
<header>
    <jsp:include page="header.jsp"></jsp:include>
</header>
<section id="sec">
    <div class="view">
        <div class="search-box">
            <input style="height: 30px" type="text" id="search" autocomplete="off" value="${sDto.keyword}"
                   placeholder="SEARCH THE ARTWORK, ARTIST..."
                   onkeypress="javascript:if (event.keyCode===13){searchArticle()}">
            <c:if test="${!empty sDto.keyword}">
                <c:set var="con" value="true"></c:set>
            </c:if>
            <img id="glass2" src="/images/close2.png" onclick="delkeyword()">
            <img id="glass3" src="/images/split.png">
            <img id="glass" src="/images/glass.png" onclick="searchArticle()">
        </div>

        <div id="sep-search-sub">
            <span id="sepSub1">카테고리<select id="sep-sub1" onchange="searchArticle()">
                <option class="sep-sub-op"
                        value="all" ${sDto.category == 'all' ? 'selected="selected"' : ''}>전체</option>
                <option class="sep-sub-op"
                        value="vocal" ${sDto.category == 'vocal' ? 'selected="selected"' : ''}>보컬</option>
                <option class="sep-sub-op"
                        value="composition" ${sDto.category == 'composition' ? 'selected="selected"' : ''}>작곡</option>
                <option class="sep-sub-op" value="lyricist" ${sDto.category == 'lyricist' ? 'selected="selected"' : ''}>작사</option>
            </select></span>

            <span id="sepSub2">장르<select id="sep-sub2" onchange="searchArticle()">
                <option class="sep-sub-op" value="all" ${sDto.genre == 'all' ? 'selected="selected"' : ''}>전체</option>
                <option class="sep-sub-op"
                        value="KPOP" ${sDto.genre == 'KPOP' ? 'selected="selected"' : ''}>KPOP</option>
                <option class="sep-sub-op"
                        value="Ballad" ${sDto.genre == 'Ballad' ? 'selected="selected"' : ''}>발라드</option>
                <option class="sep-sub-op"
                        value="Indie" ${sDto.genre == 'Indie' ? 'selected="selected"' : ''}>인디</option>
                <option class="sep-sub-op"
                        value="Rap/Hip-hop" ${sDto.genre == 'Rap/Hip-hop' ? 'selected="selected"' : ''}>랩·힙합</option>
                <option class="sep-sub-op" value="POP" ${sDto.genre == 'POP' ? 'selected="selected"' : ''}>POP</option>
            </select></span>

            <span id="sepSub3">기타분류&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<select id="sep-sub3">
                <option class="sep-sub-op" value="all" ${sDto.colname == 'all' ? 'selected="selected"' : ''}>전체</option>
                <option class="sep-sub-op"
                        value="a_title" ${sDto.colname == 'a_title' ? 'selected="selected"' : ''}>제목</option>
                <option class="sep-sub-op"
                        value="mnick" ${sDto.colname == 'mnick' ? 'selected="selected"' : ''}>작성자</option>
            </select></span>

            <div id="content-print">
                <c:if test="${empty aList}">
                    <p id="noneDataMsg"> 검색 결과가 없습니다.</p>
                </c:if>
                <c:if test="${!empty aList}">
                    <c:forEach var="aitem" items="${aList}">
                        <div class="artwork-box" onclick="goartworkdetail(${aitem.a_num})" onmouseover="showcate(${aitem.a_num})" onmouseout="showinfo(${aitem.a_num})">
                            <div id="a_${aitem.a_num}" style="animation-duration: 0.5s;">
                                <c:if test="${aitem.af_imgoriname != 'none.PNG'}">
                                    <div class="artbox-img"
                                         style="background-image: url('/upload/image/${aitem.af_imgsysname}'); background-size: 100% 100%"></div>
                                </c:if>
                                <c:if test="${aitem.af_imgoriname == 'none.PNG'}">
                                    <div class="artbox-img"
                                         style="background-image: url('/images/Noimage.png'); background-size: 100% 100%"></div>
                                </c:if>
                                <div class="artbox-explain">
                                    <p style="padding-top:2%; font-size: large">제목 : ${aitem.a_title}</p>
                                    <p style="font-size: small;">작성자 : ${aitem.mnick}</p>
                                </div>
                            </div>
                            <div id="ac_${aitem.a_num}" style="display: none;background-color: lightgray; height: 100%;animation-duration: 0.5s;border-radius: 5px">
                                <p style="display: flex;height: 100%;
    color: black;
    flex-direction: column;
    justify-content: center;
    font-size: large;text-transform: uppercase">${aitem.a_category}>${aitem.a_genre}<br>가격 : <fmt:formatNumber value="${aitem.a_price}" pattern="#,###" />  원 </p>

                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
            <c:if test="${!empty aList}">
                <div class="artwork-paging" style="text-align: center;width: 100%">${paging}</div>
            </c:if>
        </div>
    </div>
    <div id="btn-area" style="position: fixed; right: 5px; bottom: 10px; width: 10%; height:5%">
        <p id="writeMsg">글 작성하기</p>
        <button id="board-btn" onclick="artwrite('${mb.mnick}')"><img src="images/edit2.png"
                                                                                     style="height: 45px; width: 43px; position: absolute; bottom: 72%; right: 77%;">
        </button>
        <p id="boardMsg"> 게시판 이동</p>
        <button id="board-btn2" onclick="goboard()"><img src="images/people.png"
                                                                          style="height: 61px; width: 49px; position: absolute; bottom: 30%; right: 22%;">
        </button>
    </div>
</section>
<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
<script>
    function searchArticle() {
        let category = $("#sep-sub1").val();
        if (category == null) {
            category = "all";
        }
        let genre = $("#sep-sub2").val();
        if (genre == null) {
            genre = "all";
        }
        let colname = $("#sep-sub3").val();
        if (colname == null) {
            genre = "all";
        }
        let keyword = $("#search").val();
        if (keyword == null) {
            keyword = "all";
        }
        $("#search").val("");
        location.href = "/artwork?category=" + category + "&genre=" + genre + "&colname=" + colname + "&keyword=" + keyword + "&pageNum=${pageNum}";
    }

    function multiPart() {
        if ($(".sep-sub-op").val() == "보컬") {
            $("#sep-search-sub").css("background-color") == "rgba(255, 38, 0, 0.6)"
        } else if ($(".sep-sub-op").val() == "작사") {
            $("#sep-search-sub").css("background-color") == "rgba(63,133,0,0.6)"
        } else if ($(".sep-sub-op").val() == "작곡") {
            $("#sep-search-sub").css("background-color") == "rgba(33,145,210,0.6)"
        }
    }

    /* 검색메인-화면테마변경관련 */
    function showSeparate() {
        $(".name").css("color", "white");
        if ($("#sep-search").css("display") == "none") {
            $("#sep-search").css("display", "block");
            $(".view:nth-child(1)").css({"background-image": "linear-gradient( rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.8) ),url(/images/typography.png)"}, {"transition": "background 5s"});
            $("#sep-search-sub").css("display", "none");
            $(".view").on('scroll mousewheel', function (e) {
                e.preventDefault();
                e.stopPropagation();
                return false;
            });

        } else if ($("#sep-search").css("display") == "block") {
            $("#sep-search").css("display", "none");
            $(".view:nth-child(1)").css({"background-image": "url(/images/typography.png)"});
            $("#sep-search-sub").css("display", "block");
            $(".view").off('scroll mousewheel');
        }
    }

    /* 검색서브-display:none/block */
    function goartworkdetail(a_num) {
        console.log(a_num);
        location.href = '/artworkdetail?a_num=' + a_num;
    }

    function delkeyword() {
        $("#search").val("");
        $("#glass2").css("visibility", "hidden");
    }

    $(document).on("keyup", "#search", function () {
        if ($("#search").val() != "") {
            $("#glass2").css("visibility", "visible");
        } else {
            $("#glass2").css("visibility", "hidden");
        }
    })
    if ("${con}" == "true") {
        $("#glass2").css("visibility", "visible");
    }

    function artwrite(login) {
        if (login == null || login == "") {
            let popOption = "width = " + 400 + ", height = " + 350 + ", left = " + ((window.screen.width / 2) - (400 / 2)) + ", top = " + ((window.screen.height / 2) - (350 / 2));
            window.open("/popup?page=login", "login", popOption);
        } else {
            location.href = '/artworkwrite';
        }
    }

    function goboard() {
        location.href = "/board?type=all&pageNum=1";
    }

    function showcate(num) {
        $("#ac_" + num).css("display", "block");
        $("#a_" + num).css("display", "none");
        $("#ac_"+num).css("-webkit-animation-name", "duration");
    }

    function showinfo(num) {
        $("#ac_" + num).css("display", "none");
        $("#a_" + num).css("display", "block");
        $("#a_"+num).css("-webkit-animation-name", "duration")
    }
</script>
</html>
