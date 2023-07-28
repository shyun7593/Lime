<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

        #c1:hover #v1 {
            display: none;
        }

        #c1:hover #v2 {
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
            width: 20%;
            height: 38%;
            float: left;
            margin-top: 1.5%;
            margin-left: 10.75%;
            border-radius: 5px;
            background-color: white;
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
            padding-top: 0.5%; /*%로 수정*/
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
            text-align: center;
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
            margin: 0 auto;
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
            cursor: pointer;
            margin: 0 auto;
            width: 15%;
            height: 7%;
            font-size: 1.1rem;
            font-family: a타이틀고딕3;
            text-align: center;
            background-color: rgba(255, 255, 255, 0);
            transition: 0.5s border;
            border: 3px solid white;
            border-radius: 50px;
            transition: 0.5s color;
            color: #ffffff;
            margin-bottom: 1%;
            z-index: 10;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        p#bg-banner:hover {
            transition: 0.5s color;
            color: #e58282;
            transition: 0.3s border;
            border: 3px solid #e58282;
        }

        #det-btn {
            background-color: rgba(0, 0, 0, 0);
            font-family: a타이틀고딕3;
            width: 15%;
            height: 3%;
            margin: 0 auto;
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

        select {
            cursor: pointer;
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
                $("#messagecount").css("display", "none");
            } else {
                if (count == null || count == "" || count == "0") {
                    $("#messagecount").css("display", "none");
                } else {
                    $("#messagecount").css("display", "block");
                }
                ;
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
            <button id="sep-btn" onclick="showSeparate()"></button>
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
    <div class="view">
        <div id="best">지금, 가장 인기있는 작업물을 들어보세요!</div>
        <div id="mcon-top">
            <c:forEach var="aitem" items="${aList}" varStatus="st">
            <div id="m${st.count}" style="cursor: pointer" onclick="goartworkdetail(${aitem.a_num})"
                 onmouseover="showcate(${st.count})" onmouseout="showinfo(${st.count})">
                <div id="a_${st.count}"><%-- 디스플레이 논 없애기  --%>
                    <c:if test="${aitem.af_imgoriname != 'none.PNG'}">
                        <div class="artbox-img"
                             style="width: 100%; border-top-left-radius: 5px; border-top-right-radius: 5px;
                                     height: 80%;margin:0;background-image: url('/upload/image/${aitem.af_imgsysname}'); background-size: cover;background-position: center"></div>
                    </c:if>
                    <c:if test="${aitem.af_imgoriname == 'none.PNG'}">
                        <div class="artbox-img"
                             style="width: 100%;
                                 height: 80%;margin:0;background-image: url('/images/Noimage.png'); background-size: 100% 100%;background-position: center"></div>
                    </c:if>
                    <div class="artbox-explain" style="width: 100%;">
                        <p style="padding-top: 2%; padding-left: 3%; font-size: large">제목 : ${aitem.a_title}</p>
                        <p style="padding-left: 3%; font-size: small;">작성자 : ${aitem.mnick}</p>
                    </div>
                </div>
                    <%--                    <div id="ac_${st.count}" style="display: none; background: linear-gradient(45deg, rgba(10, 10, 10, 0.9), rgba(0, 0, 0, 0.6)); height: 100%;animation-duration: 0.5s;border-radius: 5px; ">--%>
                <c:if test="${aitem.af_imgoriname != 'none.PNG'}">
                <div id="ac_${st.count}"
                     style="display: none;background-image: linear-gradient(
                             rgba(0, 0, 0, 0.8),
                             rgba(0, 0, 0, 0.8)
                             ), url('/upload/image/${aitem.af_imgsysname}');
                             background-color: rgba(0, 0, 0, 0.8);
                             background-size:cover;height: 100%;animation-duration: 0.2s;border-radius: 5px;background-repeat: no-repeat;background-position: center">
                    </c:if>

                    <c:if test="${aitem.af_imgoriname == 'none.PNG'}">
                    <div id="ac_${st.count}"
                         style="display: none;background-image: linear-gradient(
        rgba(0, 0, 0, 0.8),
        rgba(0, 0, 0, 0.8)
      ), url('/images/Noimage.png');
      background-color: rgba(0, 0, 0, 0.8);
                          background-size: cover;height: 100%;animation-duration: 0.2s;border-radius: 5px;background-repeat: no-repeat;background-position: center">
                        </c:if>
                        <div style="display: flex; width: 100%; height: 100%; align-items: center;">
                            <p style="width: 90%;margin: 0 auto;color: white">곡 설명 :<br>
                                <c:choose>
                                    <c:when test="${fn:length(aitem.a_contents) gt 310}">
                                        <c:out value="${fn:substring(aitem.a_contents,0,310)}"></c:out>...
                                    </c:when>
                                    <c:otherwise>
                                        <c:out value="${aitem.a_contents}"></c:out>
                                    </c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
        <div class="view" style="background-color: black">
            <h1 id="is">Lime is...</h1>
            <p style="text-align: center;margin-top: 2%;color: white;">
                알려지지 않은 음악인들의 재능을 모두에게 표현할 수 있는 기회로 만들고, 여러 방면의 음악적 재능으로 소통하는 사이트입니다.
            </p><br>
            <br>
            <p id="pr">더 많은 사람들에게 음악이 발견될 수 있도록 서포트 하고 있습니다.<br>
                작품을 올려 당신의 재능을 모두에게 보여주세요. 사람들이 모이는 곳에 항상 당신의 음악이 있을거에요.<br>

                <br>
                <br>다양한 음악인들과 연결을 해드려요.
                <br>게시판, 메시지를 이용하여 여러 사람들과 소통하면서 새로운 작품을 만들거나 재능을 키울 수 있을거에요.</p>
            <div id="bg">
                <p id="bg-banner" onclick="goboard()">게시판 이동하기 > </p>
                <button id="det-btn">이용안내</button>
            </div>
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
        $("#ac_" + num).css("-webkit-animation-name", "duration");
    }

    function showinfo(num) {
        $("#ac_" + num).css("display", "none");
        $("#a_" + num).css("display", "block");
        $("#a_" + num).css("-webkit-animation-name", "duration");
    }

    function goartworkdetail(a_num) {
        console.log(a_num);
        location.href = '/artworkdetail?a_num=' + a_num;
    }
</script>
</html>
