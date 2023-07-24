<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Main</title>
    <script src="js/jquery-3.7.0.min.js"></script>
    <style>
        #v1 {
            display: block;
        }
        #v2 {
            display: none;
        }
        #c1:hover  #v1{
            display: none;
        }
        #c1:hover #v2{
            display: block;
        }
        html {
            overflow: hidden;
        }

        * {
            margin: 0px;
            padding: 0px;
        }

        body {
            width: 100%;
            height: 100%;
        }

        #c1, #c2, #c3 {
            width: 21.5%;
            height: 100%;
            float: left;
            margin-left: 5.9%;
            margin-right: 5.9%;
            position: relative;
            cursor: pointer;
            justify-content: center;
            display: flex;
            align-items: center;
            border-radius: 10px;
            box-shadow: 6px 6px 12px 1px white;
        }

        #c-text1 {
            position: absolute;
            font-size: 2.5rem;
            font-family: a타이틀고딕5;
            color: white;
            /* transition: 0.5s color; */
            color: #ffffff;
            /* float: none; */
            z-index: 1;
        }

        #c-text2 {
            position: absolute;
            font-size: 2.5rem;
            font-family: a타이틀고딕5;
            color: white;
            transition: 0.5s color;
            color: #ffffff;
            z-index: 1;
        }

        #c-text3 {
            position: absolute;
            font-size: 2.5rem;
            font-family: a타이틀고딕5;
            color: white;
            transition: 0.5s color;
            color: #ffffff;
            z-index: 1;
        }

        #c-text1:hover {
            transition: 0.5s color;
            color: #e58282;
        }

        #c-text2:hover {
            transition: 0.5s color;
            color: #e58282;
        }

        #c-text3:hover {
            transition: 0.5s color;
            color: #e58282;
        }

        #m1, #m2, #m3, #m4, #m5, #m6 {
            width: 22%;
            height: 33%;
            float: left;
            margin-top: 2%;
            margin-left: 8.75%;
            background-color: white;
            border-radius: 5px;
        }

        /*************************************/
        .search {
            margin: 0 auto;
            position: relative;
            width: 600px; /*%로 수정*/
            top: 19%;
            background-color: rgba(255, 255, 255, 0.5);
            box-sizing: border-box;
            border-radius: 15px;
            border-style: none;
        }

        input#search {
            width: 100%;
            border-style: none;
            border-radius: 15px;
            padding: 10px 12px;
            font-size: 14px;
            text-align: center;
            background-color: black;
            color: white;
            opacity: 90%;
        }

        #vocal {
            width: 100%;
            height: 100%;
            border-radius: 3%;
        }

        #comp {
            width: 100%;
            height: 100%;
            border-radius: 3%;
        }

        #lyr {
            width: 100%;
            height: 100%;
            border-radius: 3%;
        }

        #glass {
            position: absolute;
            width: 22px; /*%로 수정*/
            top: 14px; /*%로 수정*/
            left: 92%;
            /*right: 30%;*/
            margin: 0;
            cursor: pointer;
        }

        #glass3 {
            color: white;
            position: absolute;
            width: 17px; /*%로 수정*/
            top: 16px; /*%로 수정*/
            left: 87%;
            /*right: 30%;*/
            margin: 0;
        }

        #glass2 {
            visibility: hidden;
            position: absolute;
            width: 12px; /*%로 수정*/
            top: 18px; /*%로 수정*/
            left: 82%;
            /*right: 30%;*/
            margin: 0;
            cursor: pointer;
        }

        .view:nth-child(1) {
            background-color: black;
            background-image: url("/images/musicabg.png");
            background-size: contain;
            background-position: top;
            background-repeat: no-repeat;
        }

        .view:nth-child(2) {
            background-color: black;
            background-image: url("/images/musicabg.png");
            background-size: contain;
            background-position: top;
            background-repeat: no-repeat;
        }

        .view:nth-child(3) {
            background-color: black;
            background-image: url("/images/musicabg.png");
            background-size: contain;
            background-position: top;
            background-repeat: no-repeat;
        }

        div.view span a {
            font-family: a타이틀고딕5;
            color: white;
            text-decoration: none;
        }


        /************************ PAGE 2 *****************************/
        #best {
            text-align: center;
            font-family: a타이틀고딕5;
            font-size: 2rem;
            padding-top: 3%; /*%로 수정*/
            color: white;
        }

        #is {
            text-align: center;
            padding-left: 1%;
            font-family: a타이틀고딕5;
            font-size: 3rem;
            padding-top: 8%;
            color: white;
        }

        #bg {
            width: 95%;
            height: 45%;
            margin-left: 2.5%;
            background-size: cover;
            margin-top: 6%;
        }

        #pr {
            text-align: center;
            margin-top: 2%;
            color: white;
        }

        #mcon-top {
            width: 90%;
            height: 100%;
            margin-left: 5%;
            margin-right: 5%;
        }

        /*******************검색분류기능**********************/
        #sep-search {
            max-width: 800px;
            width: 100%;
            height: 60%;
            position: absolute;
            top: 36%;
            display: none;
            text-align: center;
            left: 50%;
            transform: translate(-50%);
        }

        #sep1, #sep2, #sep3 {
            font-family: a타이틀고딕2;
            margin-right: 8%;
            color: white;
        }

        #sep3 {
            margin-right: 0;
        }

        #sep-s1, #sep-s2, #sep-s3 {
            min-width: 55px;
            margin-left: 0.5%;
            padding-left: 0.5%;
            width: 5%;
            height: 5%;
            background-color: rgba(255, 255, 255, 0);
            color: white;
            border-radius: 10px;
            border-collapse: collapse;
            box-sizing: border-box;
            border: 1px solid white;
        }

        #separate {
            position: absolute;
            width: 3.6%;
            top: 29.6%;
            left: 3%;
            margin: 0;
        }

        #sep-btn {
            position: absolute;
            width: 12%; /*%로 수정*/
            height: 90%;
            top: 5%; /*%로 수정*/
            left: 2%;
            margin: 0;
            cursor: pointer;
            border: 1px solid rgba(0, 0, 0, 0);
            background-color: rgba(0, 0, 0, 0);
            color: rgba(0, 0, 0, 0);
        }

        select {
            outline: white;
        }

        option {
            background-color: rgba(0, 0, 0, .8);
            border-collapse: collapse;
            box-sizing: border-box;
            border: 1px solid white;
        }

        p#bg-banner {
            text-align: center;
            margin-top: 2%;
            z-index: 10;
        }

        p#bg-banner {
            position: absolute;
            width: 15%;
            height: 4%;
            line-height: 40px;
            left: 42%;
            top: 275%;
            font-size: 1.1rem;
            font-family: a타이틀고딕3;
            text-align: center;
            background-color: rgba(255, 255, 255, 0);
            transition: 0.5s border;
            border: 3px solid white;
            border-radius: 50px;
            transition: 0.5s color;
            color: #ffffff;
            z-index: 10;
        }

        p#bg-banner:hover {
            transition: 0.5s color;
            color: #e58282;
            transition: 0.3s border;
            border: 3px solid #e58282;
        }

        #det-btn {
            position: absolute;
            background-color: rgba(0, 0, 0, 0);
            font-family: a타이틀고딕3;
            width: 25%;
            height: 3%;
            left: 36.9%;
            top: 285%;
            text-align: center;
            color: #ffffff;
            border-style: none;
            z-index: 1;
        }

        #det-btn:hover {
            color: #e58282;
            font-family: a타이틀고딕5;
        }

        #cat-area {
            width: 90%;
            height: 37%;
            margin-top: 17%;
            margin-left: 5%;
            margin-right: 5%;
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
        /***************************************************/
    </style>
    <script>
        $(function () {
            let count = "${count}";
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
                $("#messagecount").css("display","none");
            } else {
                if (count == null || count == "" || count == "0"){
                    $("#messagecount").css("display","none");
                } else{
                    $("#messagecount").css("display","block");
                };
                let spantag = $("#mname");
                spantag.append("<span>" + loginName + " 님</span>")
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
<section id="sec">
    <div class="view" style="background-color: black">
        <div class="search">
            <input style="height: 50px" type="text" id="search" autocomplete="off"
                   placeholder="SEARCH THE ARTWORK, ARTIST..."
                   onkeypress="javascript:if (event.keyCode===13){searchArticle()}">
            <img id="glass2" src="/images/close2.png" onclick="delkeyword()">
            <img id="glass3" src="/images/split.png">
            <img id="glass" src="/images/glass.png" onclick="searchArticle()">
            <img style="height: 20px" id="separate" src="/images/separate.png"><%-- 검색분류기능 --%>
            <button id="sep-btn" onclick="showSeparate()">test</button>
        </div>
        <div id="sep-search">
            <span id="sep1">카테고리<select id="sep-s1">
                <option value="all" selected>전체</option>
                <option value="lyricist">작사</option>
                <option value="composition">작곡</option>
                <option value="vocal">보컬</option>
            </select></span>
            <span id="sep2">장르<select id="sep-s2">
                <option value="all" selected>전체</option>
                <option value="KPOP">KPOP</option>
                <option value="Ballad">발라드</option>
                <option value="Indie">인디</option>
                <option value="Rap/Hip-hop">랩·힙합</option>
                <option value="POP">POP</option></select></span>
            <span id="sep3">기타분류<select id="sep-s3">
                <option value="all" selected>전체</option>
                <option value="a_title">제목</option>
                <option value="mnick">작성자</option>
            </select></span>
        </div>
        <div id="cat-area">
            <div id="c1">
                <img id="vocal" src="images/mic2.jpg">
                <span id="c-text1">VOCAL</span>
            </div>
            <div id="c2">
                <img id="comp" src="images/mixer2.jpg">
                <span id="c-text2">COMPOSITION</span>
            </div>
            <div id="c3">
                <img id="lyr" src="images/lyric2.jpg">
                <span id="c-text3">LYRICIST</span>
            </div>
        </div>
    </div>
    <div class="view" style="background-color: black">
        <div id="best">지금, 가장 인기있는 작업물을 들어보세요!</div>
        <div id="mcon-top">
            <c:forEach var="aitem" items="${aList}" varStatus="st">
                <div id="m${st.count}" onmouseover="showcate(${st.count})" onmouseout="showinfo(${st.count})">
                    <div id="a_${st.count}" style="animation-duration: 0.5s;"><%-- 디스플레이 논 없애기  --%>
                        <c:if test="${aitem.af_imgoriname != 'none.PNG'}">
                            <div class="artbox-img"
                                 style="width: 100%; border-top-left-radius: 5px; border-top-right-radius: 5px;
                                         height: 80%;margin:0;background-image: url('/upload/image/${aitem.af_imgsysname}'); background-size: 100% 100%"></div>
                        </c:if>
                        <c:if test="${aitem.af_imgoriname == 'none.PNG'}">
                            <div class="artbox-img"
                                 style="width: 100%;
                                 height: 80%;margin:0;background-image: url('/images/Noimage.png'); background-size: 100% 100%"></div>
                        </c:if>
                        <div class="artbox-explain" style="width: 100%;">
                            <p style="padding-top: 2%; padding-left: 3%; font-size: large">제목 : ${aitem.a_title}</p>
                            <p style="padding-left: 3%; font-size: small;">작성자 : ${aitem.mnick}</p>
                        </div>
                    </div>
                    <div id="ac_${st.count}" style="display: none; background-color: #dddddd; height: 100%;animation-duration: 0.5s;border-radius: 5px; ">
                        <p style="padding-left: 3%; color: black;display: flex;height: 100%; flex-direction: column; justify-content: center; font-size: large;text-transform: uppercase">${aitem.a_contents}</p>

                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="view" style="background-color: black">
        <h1 id="is">LIME IS...</h1>
        <p id="pr">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
            industry's <br> standard dummy text ever since the 1500s, when an unknown printer took a galley of type and
            scrambled it to make a type specimen book.</p>
        <div id="bg">
            <p id="bg-banner" onclick="goboard()">게시판 이동하기 > </p>
            <button id="det-btn">이용안내</button>
        </div>
    </div>
</section>
<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
<script>
    function goboard() {
        location.href = "/board?type=all&pageNum=1";
    }

    let dh = window.innerHeight;
    let contents = document.querySelectorAll(".view");
    // //화면의 높이로 각 content의 높이 설정
    for (let cont of contents) {
        cont.style.height = dh + "px";
    }
    let mHtml = $("body");
    window.addEventListener("resize", () => {
        dh = window.innerHeight;
        for (let cont of contents) {
            cont.style.height = dh + "px";
        }
    })


    let page = 1;
    mHtml.animate({scrollTop: 0}, 10);
    $(window).on("wheel", function (e) {
        if (mHtml.is(":animated")) return;
        if (e.originalEvent.deltaY > 0) {
            if (page == 4) return;
            page++;
        } else if (e.originalEvent.deltaY < 0) {
            if (page == 1) return;
            page--;
        }
        let posTop = (page - 1) * $(".view").height();
        mHtml.animate({scrollTop: posTop});
    });


    function searchArticle() {
        let keyword = $("#search").val();
        let category = $("#sep-s1").val();
        let genre = $("#sep-s2").val();
        let colname = $("#sep-s3").val();
        location.href = '/goartwork?category=' + category + '&genre=' + genre + '&colname=' + colname + '&keyword=' + keyword + '&pageNum=1';
    }

    function showSeparate() {
        $(".name").css("color", "white");
        if ($("#sep-search").css("display") == "none") {
            $("#sep-search").css("display", "block");
            $(".view:nth-child(1)").css({"background-image": "linear-gradient( rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.8) ),url(/images/musicabg.png)"}, {"transition": "background 5s"});
            $("#c1").css("display", "none");
            $("#c2").css("display", "none");
            $("#c3").css("display", "none");
            $("#vocal").css("display", "none");
            $("#lyr").css("display", "none");
            $("#comp").css("display", "none");
            $("#c-text1").css("display", "none");
            $("#c-text2").css("display", "none");
            $("#c-text3").css("display", "none");
            $(".view").on('scroll mousewheel', function (e) {
                e.preventDefault();
                e.stopPropagation();
                return false;
            });

        } else if ($("#sep-search").css("display") == "block") {
            $("#sep-search").css("display", "none");
            $(".view:nth-child(1)").css({"background-image": "url(/images/musicabg.png)"});
            $("#c1").css("display", "flex");
            $("#c2").css("display", "flex");
            $("#c3").css("display", "flex");
            $("#vocal").css("display", "block");
            $("#lyr").css("display", "block");
            $("#comp").css("display", "block");
            $("#c-text1").css("display", "block");
            $("#c-text2").css("display", "block");
            $("#c-text3").css("display", "block");
            $(".view").off('scroll mousewheel');
        }
    }

    $(document).on("keyup", "#search", function () {
        if ($("#search").val() != "") {
            $("#glass2").css("visibility", "visible");
        } else {
            $("#glass2").css("visibility", "hidden");
        }
    })

    function delkeyword() {
        $("#search").val("");
        $("#glass2").css("visibility", "hidden");
    }

    $("#c1").on("click", function () {
        location.href = "/goartwork?category=vocal&genre=all&colname=all&keyword=all&pageNum=1";
    })
    $("#c2").on("click", function () {
        location.href = "/goartwork?category=composition&genre=all&colname=all&keyword=all&pageNum=1";
    })
    $("#c3").on("click", function () {
        location.href = "/goartwork?category=lyricist&genre=all&colname=all&keyword=all&pageNum=1";
    })

    function showcate(num) {
        $("#ac_" + num).css("display", "block");
        $("#a_" + num).css("display", "none");
        $("#ac_"+num).css("-webkit-animation-name", "duration");
    }

    function showinfo(num) {
        $("#ac_" + num).css("display", "none");
        $("#a_" + num).css("display", "block");
        $("#a_"+num).css("-webkit-animation-name", "duration");
    }
</script>
</html>
