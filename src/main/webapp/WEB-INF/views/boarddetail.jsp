<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>글 상세보기</title>
    <script src="js/jquery-3.7.0.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: a타이틀고딕1;
        }

        body {
            width: 100%;
            height: 105%;
            background-color: black;
            background-image: url("/images/musicabg.png");
            background-size: contain;
            background-position: top;
            background-repeat: no-repeat;

        }

        section {
            width: 100%;
            height: 100%;
        }

        .boardWrite-form {
            margin: -3% auto;
            width: 60%;
            height: 90%;
            left: 35%;
            background-color: #e9e9e9;
        }

        #sep-type {
            width: 10%;
            height: 100%;
            background-color: black;
            color: white;
            box-sizing: border-box;
            text-align: center;
            float: left;
            opacity: 1;
            border: none;
        }

        option {
            background-color: black;
            border-collapse: collapse;
            box-sizing: border-box;
            border: 1px solid white;
            padding-right: 10px;
        }

        #writeForm {
            margin: 0 auto;
            background-color: gray;
        }

        /*#selectType {*/
        /*    float: left;*/
        /*    width: 10%;*/
        /*    box-sizing: border-box;*/
        /*    border: 1px solid black;*/
        /*    border-radius: 10px;*/
        /*    background-color: white;*/
        /*}*/


        #write-contents {
            width: 100%;
            height: 40%;
            color: black;
            background-color: #fff;
            border: 1px solid white;
            text-align: start;
        }

        #write-contents::placeholder {
            text-align: center;
            padding-top: 30%;
            color: rgba(255, 255, 255, .8);
        }

        #edit-btn {
            width: 100%;
            height: 7%;
            background-color: black;
            text-align: center;
        }

        #bupdate-btn {
            cursor: pointer;
            visibility: hidden;
            position: relative;
            width: 15%;
            height: 70%;
            color: white;
            border: 1px solid gray;
            border-radius: 5px;
            background-color: rgba(0, 0, 0, .8);
            top: 15%;
        }
        #bback-btn{
            cursor: pointer;
            position: relative;
            width: 10%;
            color: white;
            font-size: xxx-large;
            /* border: 1px solid gray; */
            /* border-radius: 5px; */
            border: none;
            top: 5%;
            background: none;
        }

        #bupdate-btn:hover {
            transition: 0.5s color;
            color: #ff3d02;
        }

        #bdelete-btn {
            cursor: pointer;
            visibility: hidden;
            position: relative;
            width: 15%;
            height: 70%;
            color: white;
            border: 1px solid gray;
            border-radius: 5px;
            background-color: rgba(0, 0, 0, .8);
            top: 15%;
        }

        #bdelete-btn:hover {
            transition: 0.5s color;
            color: #ff3d02;
        }

        section {
            height: 90%;
        }

        #wrap {
            position: relative;
            width: 100%;
            height: 100%;
            margin-top: 5%;
        }

        #write-top {
            width: 100%;
            text-align: center;
            background-color: black;
        }

        #write-title {
            width: 100%;
            height: 7%;
            color: white;
            background-color: black;
            text-align: center;
            float: left;
            border: none;
        }

        #write-title::placeholder {
            color: rgba(255, 255, 255, .8);
        }
        .on-reply{
            background-color: white;
            width: 100%;
            color: black;
            height: 45%;
            margin-bottom: 1%;
            border-bottom: 1px solid lightgray;
        }
        .reply{
            background-color: white;
            width: 100%;
            color: black;
            height: 45%;
            margin-bottom: 1%;
            border-bottom: 1px solid lightgray;
        }

        #reply-box {
            margin: 0 auto;
            width: 100%;
            height: 20%;
        }

        #reply-topbar {
            border-bottom: 1px solid gray;
            background-color: #333333;
            width: 100%;
            height: 20%;
        }

        #reply-write {
            line-height: 100%;
            width: 7%;
            height: 7%;
            top: 64.3%;
            left: 5%;
            font-family: a타이틀고딕5;
            font-size: 1.7rem;
            color: white;
            border-style: none;
            background-color: rgba(0, 0, 0, 0);
        }

        #reply-print {
            background-color: white;
            color: black;
            height: 30%;
            text-align: left;
            overflow: scroll;
        }

        #reply-print::-webkit-scrollbar {
            opacity: 0;
        }

        #reply-print::-webkit-scrollbar-thumb {
            background-color: #999999;
            border-radius: 5px;
        }

        #reply-print > p {
            box-sizing: border-box;
            border: 1px solid gray;
        }
        .write_reply{
            resize: none;
            height: 5%;
            width: 95%;
            position: relative;
            float: left;
            margin-top: 1.5%;
            border: none;
        }
        #reply-btn {
            cursor: pointer;
            width: 5%;
            height: 5%;
            color: white;
            border-top: none;
            background-color: black;
            position: relative;
            margin-top: 1.5%;
        }

        #reply-form{
            margin-bottom: 1%;
        }


        select {
            -webkit-appearance:none; /* 크롬 화살표 없애기 */
            -moz-appearance:none; /* 파이어폭스 화살표 없애기 */
            appearance:none; /* 화살표 없애기 */
            background-color: black;
        }

        .del-reply{
            cursor: pointer;
            position: relative;
            float: right;
            right: 2%;
            padding: 5px;
            background-color: white;
        }

        @media screen and (max-width: 600px) {
            font-size: 3rem;
        }
        /*Basic Button Style*/
           .on-reply > button {
               box-sizing: border-box;
               appearance: none;
               background-color: transparent;
               border: 2px solid black;
               border-radius: 5px;
               cursor: pointer;
               display: flex;
               align-self: center;
               font-size: 1rem;
               font-weight: 400;
               line-height: 1;
               text-decoration: none;
               text-align: center;
               text-transform: uppercase;
               font-weight: 700;

        &:hover, &:focus {
             color: #fff;
             outline: 0;
         }
        }

        .del-reply {
            transition: box-shadow 300ms ease-in-out, color 300ms ease-in-out;
        &:hover {
             box-shadow: 0 0 40px 40px black inset;
         }
        }


    </style>
    <script>
        $(function () {
            let msg = "${msg}";
            if (msg != "") {
                alert(msg);
            }
            console.log("${page}");
            let curid = "${mb.mid}";
            let loginName = "${mb.mnick}";
            let Grade = "${mb.gname}";
            console.log(loginName);
            if (loginName == "") {
                $(".name").css("display", "none");
                $(".grade").css("display", "none");
                $(".logout").css("display", "none");
            } else {
                if (curid == "${bDto.b_id}") {
                    $("#bupdate-btn").css("visibility", "visible");
                    $("#bdelete-btn").css("visibility", "visible");
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
<header>
    <jsp:include page="header.jsp"></jsp:include>
</header>
<section id="sec">
    <div id="wrap">
        <button type="button" id="bback-btn" onclick="goback()"><</button>
        <div class="boardWrite-form">
            <div id="writeForm">
                <div id="write-top">

                    <div style="height: 7%;width: 70%;float: left;display: flex;justify-content: start;align-items: center;background:black;color: white;border-bottom: 3px solid gray;">
                        <select id="sep-type" disabled style="background-color: black;margin-right: 5%">
                            <option value="QnA" ${bDto.b_type == 'QnA' ? 'selected="selected"' : ''}>
                                Q&A
                            </option>
                            <option value="협업" ${bDto.b_type == '협업' ? 'selected="selected"' : ''}>
                                협업
                            </option>
                            <option value="ETC" ${bDto.b_type == 'ETC' ? 'selected="selected"' : ''}>
                                ETC
                            </option>
                        </select>
                        <p style="color: white">작성자 :&nbsp&nbsp${bDto.mnick} </p></div>
                    <div style="height: 7%;width: 30%;display: flex;justify-content: center;align-items: center;background:black;color: white;"><p>작성일 : <fmt:formatDate value="${bDto.b_date}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></p></div>
                    <input type="text" id="write-title" autocomplete="off" maxlength="50"
                     disabled value="${bDto.b_title}">
                </div>
                <textarea id="write-contents" style="resize: none;padding: 10px"
                          disabled>${bDto.b_contents}</textarea>
            </div>

            <div id="edit-btn">
                <button type="button" id="bupdate-btn" onclick="goboardUpdate(${bDto.b_num})">수정</button>
                <button type="button" id="bdelete-btn" onclick="delboard(${bDto.b_num})"> 삭제</button>
            </div>
            <div>
            <form id="reply-form">
                <input type="hidden" name="r_id" value="${mb.mid}">
                <textarea maxlength="50" name="r_contents" rows="3" class="write_reply" id="comment" placeholder="Please write a comment. Max length 50."
                          required onkeypress="javascript:if (event.keyCode===13){replyInsert()}"></textarea>
                <input type="hidden" name="r_bnum" value="${bDto.b_num}">
                <input id="reply-btn" type="button" value="Write!"  onclick="replyInsert()">
            </form>
            </div>
            <div id="reply-print">
                <c:forEach var="ritem" items="${rList}">
                    <div class="on-reply" id="reply${ritem.r_num}">
                        <p style="float: left;height: 10%">&nbsp;&nbsp&nbsp${ritem.mnick}</p>
                        <p style="margin-left: 8%;margin-top:1%;color: darkgray; font-size: small"><fmt:formatDate value="${ritem.r_date}"
                                                                                                     pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                        <p style="margin-top: 1%">&nbsp;&nbsp ${ritem.r_contents}</p>
                        <c:if test="${ritem.r_id == mb.mid}">
                            <button class="del-reply" type="button" value="삭제" onclick="delreply(${ritem.r_num})">삭제</button>
                        </c:if></p>
                        </div>
                </c:forEach>

            </div>


    </div>
    </div>
</section>
<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
<script>
    function goboardUpdate(b_num) {
        location.href ="/boardupdate?b_num="+b_num;
    }
    function delboard(b_num){
        if(confirm("삭제하겠습니까?")){
            location.href = "/DeleteBoard?b_num="+b_num;
        } else {
            return;
        }
    }
    function goback(){
        if ("${page}"=="board"){
            location.href ="/profile?page=${page}&type=${test}&pageNum=${pageNum}";
        } else {
            location.href ="/board?type=${test}&pageNum=${pageNum}";
        }
    }

    function replyInsert(){
        if ("${mb.mid}" == ""){
            let popOption = "width = "+400+", height = "+350+", left = "+((window.screen.width / 2) - (400 / 2))+", top = "+((window.screen.height / 2) - (350 / 2));
            window.open("/popup?page=login", "login", popOption);
            return;
        }
        if ($("#comment").val() == null || $("#comment").val() == ""){
            $("#comment").focus();
            alert("댓글 내용을 작성해 주세요.");
            return;
        }
        const replyForm = $("#reply-form").serialize();
        console.log("replyForm" + replyForm);
        $.ajax({
            url : "replyInsert",
            type : "POST",
            data : replyForm,
            success : function (res){
                if (res != null && res != ""){
                    let str = "";
                    let curid = res.r_id;
                    if (curid == "${mb.mid}")
                    {
                        str += "<div class='on-reply' id=" + "reply" + res.r_num + ">"
                            + "<p style='background-color: white;float: left;height: 10%'>&nbsp&nbsp&nbsp" + res.mnick + "</p>"
                            + "<p style='margin-left: 8%;margin-top:1%;color: darkgray;font-size: small;'>" + res.r_date
                            + "<p style='margin-top: 1%'>&nbsp&nbsp&nbsp" + res.r_contents + "</p>"
                            + "<button class='del-reply' type='button' onclick=delreply(" + res.r_num + ")>삭제</button>"
                        + "</div>";
                    } else {
                        str += "<div class='on-reply' id=" + "reply" + res.r_num + ">"
                            + "<p>" + res.mnick + "</p>"
                            + "<p>" + res.r_contents + "</p>"
                            + "<p>" + res.r_date + "</p>"
                            + "<button style='visibility: hidden' class='del-reply' type='button'onclick=delreply(" + res.r_num + ")>삭제</button>"
                            + "</div>";
                    }

                    $("#reply-print").prepend(str);
                    $("#comment").val("");
                } else {
                    alert("댓글 작성 실패.");
                    $("#comment").val("");
                }
            },
            error : function (err){
                console.log(err);
                alert("댓글 작성 실패. 관리자에게 문의하세요.")
            }
        })
    }
    function delreply(r_num){
        sendData = {"r_num" : r_num};
        $.ajax({
            url : "replyDelete",
            type: "POST",
            data : sendData,
            success : function (res){
                if(res == "true"){
                    $("#reply" + r_num).remove();
                } else {
                    alert("실패");
                }
            },
            error : function (err){
                console.log(err);
                alert("실패. 관리자에게 문의하세요.")
            }
        })
    }

    $("#comment").keyup(function (e){
        let content = $(this).val();
        if (content.length > 50){
            alert('50자까지 입력 가능합니다.')
        }
    })
</script>
</html>
