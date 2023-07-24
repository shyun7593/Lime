<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>게시판</title>
    <script src="js/jquery-3.7.0.min.js"></script>
    <style>
        * {
            margin: 0px;
            padding: 0px;
        }

        body {
            width: 100%;
            height: 100%;
            background-image: url('/images/bg-white2.jpg');
        }


        ul,
        li {
            list-style: none;
        }


        .btable {
            width: 54%;
            height: 40%;
            border-collapse: collapse;
            border-radius: 10px;
            border-style: hidden;
            box-shadow: 0 0 0 1px #000;
            margin: 7% auto;
            background-color: white;
            min-width: 700px;
        }

        .btable tr {
            width: 100%;
            height: 100%;
        }

        .btable th {
            padding: 14px 21px;
            background: black;
            color: white;
            font-size: 12px;
            border-top: 2px solid #333;
            border-bottom: 2px solid #ddd;
        }

        .btable td {
            padding: 14px 21px;
            color: #666;
            font-size: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        .btable .in-data:hover {

            background: #eee;
        }

        .no-data td {
            border-color: white;
        }

        .paging {
            padding: 20px 0;
            width: 100%;
            margin-top: 5%;
            margin-bottom: 1%;
        }

        .paging > a, font {
            color : white;
        }

        .paging > ul {
            display: flex;
            justify-content: center;
        }

        .paging > ul > li {
            padding: 8px;
            background: #efefef;
            border: 1px solid #999;
            font-size: 12px;
            margin-left: 10px;
        }

        .paging > ul > li:hover {
            background: #333;
            color: #fff;
        }

        .le {
            border-top-left-radius: 10px;
        }

        .ri {
            border-top-right-radius: 10px;
        }

        #wrap {
            min-height: 100vh;
            position: relative;
            width: 100%;
        }

        #type {
            background-color: black;
            color: white;
            border: none;
        }

        section {
            padding-bottom: 110px; /* footer의 height값과 동일 */
        }

        html, body {
            margin: 0;
            padding: 0;
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
    </style>
    <script>
        $(function () {
            let msg = "${msg}";
            if (msg != "") {
                alert(msg);
            }
            let count = "${count}";
            let loginName = "${mb.mnick}";
            let Grade = "${mb.gname}";
            console.log(loginName);
            if (loginName == "") {
                $(".message-form").css("display","none");
                $(".name").css("display", "none");
                $(".grade").css("display", "none");
                $(".logout").css("display", "none");
            } else {
                if (count == null || count == "" || count == "0"){
                    $("#messagecount").css("display","none");
                } else{
                    $("#messagecount").css("display","block");
                };
                let spantag = $("#mname");
                spantag.append("<span>" + loginName + " 님</span>")
                //$(".name").html(loginName + " 님");
                $(".grade").html("등급 : [" + Grade + "]");
                $(".register").css("display", "none");
                $(".login").css("display", "none");
                if (count>0){
                    $(".message-count").css("display","block");
                }
            }
        })
    </script>
</head>
<body style="background-image: url(/images/musicabg.png);">
<div id="wrap">
    <header style="height: 10%">
        <jsp:include page="header.jsp"></jsp:include>
    </header>
    <section>
        <div>
            <table class="btable">
                <tr>
                    <th class="le" style="width: 15%">번호</th>
                    <th style="width: 15%">아이디</th>
                    <th style="width: 15%">글제목</th>
                    <th style="width: 15%"><select id="type" onchange="ordertype()">
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
                    <th class="ri" style="width: 40%">작성일자</th>
                </tr>
                <c:if test="${empty bList}">
                    <tr>
                        <td colspan="5">
                            내용이 없습니다.
                        </td>
                    </tr>
                    <c:forEach begin="1" end="6">
                        <tr class="no-data">
                            <td colspan="5" style="color: white">no</td>
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${!empty bList}">
                    <c:choose>
                        <c:when test="${fn:length(bList) % 7 == 0}">
                            <c:forEach var="bitem" items="${bList}">
                                <tr class="in-data" onclick="location.href='/boarddetail?b_num=${bitem.b_num}'">
                                    <td>${bitem.b_num}</td>
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
                                    <td>${bitem.b_num}</td>
                                    <td class="subject">${bitem.mnick}</td>
                                    <td>${bitem.b_title}</td>
                                    <td>${bitem.b_type}</td>
                                    <td><fmt:formatDate value="${bitem.b_date}"
                                                        pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
                                </tr>
                            </c:forEach>
                            <c:forEach begin="${fn:length(bList) % 7}" end="6">
                                <tr class="no-data">
                                    <td colspan="5" style="color: white">no</td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </c:if>
            </table>
            <%--    <button id="btn">글 작성하기</button>--%>
            <c:if test="${!empty bList}">
            <div class="paging" style="text-align: center">${paging}</div>
            </c:if>
            <div id="btn-area" style="position: fixed; right: 5px; bottom: 10px; width: 10%; height:5%">
                <p id="writeMsg">글 작성하기</p>
                <button id="board-btn" onclick="boardwrite('${mb.mnick}')"><img src="images/edit2.png" style="height: 45px; width: 43px; position: absolute; bottom: 72%; right: 77%;">
                </button>
                <p id="boardMsg"> 작품 이동</p>
                <button id="board-btn2" onclick="goArticle()"><img src="images/people.png" style="height: 61px; width: 49px; position: absolute; bottom: 30%; right: 22%;">
                </button>
            </div>
    </section>
    <footer>
        <jsp:include page="footer.jsp"></jsp:include>
    </footer>
</div>
</body>
<script>
    function boardwrite(login) {
        if (login == null || login == "") {
            let popOption = "width = "+400+", height = "+350+", left = "+((window.screen.width / 2) - (400 / 2))+", top = "+((window.screen.height / 2) - (350 / 2));
            window.open("/popup?page=login", "login", popOption);
        } else {
            location.href = '/boardwrite';
        }

    }

    function ordertype() {
        let type = $("#type").val();
        console.log(type);
        location.href = "/board" + "?type=" + type + "&pageNum=1";
    }

    function goArticle() {
        location.href="/artwork?category=all&genre=all&colname=all&keyword=all&pageNum=1";
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
</script>
</html>
