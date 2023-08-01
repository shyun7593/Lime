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
            margin: 0 auto;
            width: 60%;
            height: 90%;
            left: 35%;
        }
        #bwrtie-btn{
            cursor: pointer;
            position: relative;
            width: 15%;
            height: 70%;
            color: white;
            border: 1px solid gray;
            border-radius: 5px;
            background-color: rgba(0, 0, 0, .8);
            top: 15%;
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
            height: 75%;
            color: black;
            background-color: #fff;
            border: 1px solid white;
            text-align: start;
        }

        #write-contents::placeholder {
            text-align: center;
            position: relative;
            top: 50%;
            transform: translateY(-50%);
        }

        #edit-btn {
            width: 100%;
            height: 7%;
            background-color: black;
            text-align: center;
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
        #bback-btn {
            cursor: pointer;
            position: relative;
            width: 15%;
            height: 70%;
            color: white;
            border: 1px solid gray;
            border-radius: 5px;
            background-color: rgba(0, 0, 0, .8);
            top: 15%;
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
        <div class="boardWrite-form">
            <form action="boardWriteProc" method="post" id="writeForm">
                <div id="write-top">
                    <div style="height: 7%;width: 100%;display: flex;justify-content: start;align-items: center;background:black;color: white;border-bottom: 3px solid gray;">
                        <select id="sep-type" style="background-color: black;" name="b_type" required>
                            <option value="QnA">
                                Q&A
                            </option>
                            <option value="협업">
                                협업
                            </option>
                            <option value="ETC">
                                ETC
                            </option>
                        </select>
                        <p style="text-align: center;width: 100%">작성자 : &nbsp<input style="color: white; background-color: black; border: none" type="text" readonly value="${mb.mid}" name="b_id"></p>
                    </div>
                    <input type="text" id="write-title" autocomplete="off" maxlength="50"
                            placeholder="제목" name="b_title" autofocus required>
                </div>
                <textarea id="write-contents" maxlength="1000" style="resize: none;" name="b_contents" placeholder="글내용을 작성해주세요." required
                          ></textarea>
                <div style="text-align: end; width:100%;background: black;color:white">
                    <p class="textCount" style="display: inline-block;">0자</p>
                    <p class="textTotal" style="display: inline-block;">/1000자</p>
                </div>
                <div id="edit-btn">
                    <button type="button" id="bback-btn" onclick="goback()">뒤로가기</button>
                    <input type="submit" id="bwrtie-btn" value="작성">
                </div>
            </form>


        </div>
    </div>
</section>
<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
<script>
    function goback(){
        if ("${page}"=="board"){
            location.href ="/profile?page=${page}&type=${test}&pageNum=${pageNum}";
        } else {
            location.href ="/board?type=${test}&pageNum=${pageNum}";
        }
    }
    $('#write-contents').keyup(function (e) {
        let content = $(this).val();

        // 글자수 세기
        if (content.length == 0 || content == '') {
            $('.textCount').text('0자');
        } else {
            $('.textCount').text(content.length + '자');
        }

        // 글자수 제한
        if (content.length > 1000) {
            $(this).val($(this).val().substring(0, 999));
            alert('글자수는 1000자까지 입력 가능합니다.');
        };
    });
</script>
</html>
