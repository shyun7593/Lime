<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
    <script src="js/jquery-3.7.0.min.js"></script>
    <style>
        button {
            cursor: pointer;
        }

        .login-alert, .register-alert, .profile-confirm, .Imessage, .result, .showmessage {
            display: none;
        }

        .profile-confirm {
            height: 90%;
            width: 100%;
            text-align: center;
        }

        * {
            margin: 0;
            font-family: a타이틀고딕1;
            overflow-y: hidden;
        }

        .login-alert, .register-alert, .profile-confirm {
            background-image: url("/images/bg-white2.jpg");
            width: 100%;
            height: 100%;
        }

        .login-alert #login-head, .register-alert #register-head, .profile-confirm #profile-head, .login-head {
            background-color: black;
            width: 100%;
            height: 9%;
            box-sizing: border-box;
            display: flex;
            align-items: center;
            justify-content: center
        }

        .login-alert #login-logo, .register-alert #register-logo, .profile-confirm #profile-logo, .login-logo {
            text-align: center;
            font-family: "Segoe UI Black";
            font-size: 1.2rem;
            color: white;
            height: 100%;
            /* justify-content: center; */
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .login-alert #login-msg, .register-alert #register-msg, .profile-confirm #profile-msg {
            text-align: center;
            padding-top: 13%;
            font-family: "a타이틀고딕5";
            font-size: 1.5rem;
        }

        .login-alert #btn-area, .register-alert #btn-area2 {
            text-align: center;
            margin-top: 15%;
        }

        .login-alert #login-btn1, .register-alert #register-btn1 {
            width: 75%;
            height: 10%;
            border: none;
            font-size: 1.2rem;
            font-family: a타이틀고딕3;
            background-color: #e5e4e4;
            border: 1px solid black;
            border-radius: 10px;
            margin: 3% auto;
            display: block;
        }

        .login-alert #login-btn2, .register-alert #register-btn2 {
            width: 75%;
            height: 10%;
            border: none;
            font-size: 1.2rem;
            font-family: a타이틀고딕3;
            background-color: #e5e4e4;
            border: 1px solid black;
            border-radius: 10px;
            margin: 0 auto;
            display: block;
        }

        .login-alert #login-guide, .register-alert #register-guide {
            display: none;
            position: absolute;
            margin-left: 28%;
            text-align: center;
            font-size: 0.8rem;
            margin-top: 2.5%;
        }

        .login-alert #login-sub-msg, .register-alert #register-sub-msg, .profile-confirm #profile-sub-msg {
            text-align: center;
            margin-top: 5%;
            font-size: 0.8rem;
        }

        .login-alert #login-sub-msg:hover {
            transition: 0.5s color;
            color: #e58282;
        }

        .register-alert #register-sub-msg:hover {
            transition: 0.5s color;
            color: #e58282;
        }


        .login-alert, .register-alert, .profile-confirm, .delfile-alert, .user-profile {
            display: none;
        }

        #profile-guide {
            display: none;
            width: 79%;
            height: 5%;
            font-size: 0.8rem;
            /* position: absolute; */
            text-align: center;
            padding-top: 4.3%;
            background-color: rgba(0, 0, 0, 0);
        }

        #mysecret {
            margin-top: 7%;
            border: none;
            border: 1px solid black;
            border-radius: 10px;
            width: 59%;
            height: 8.9%;
        }

        #mysecret::placeholder {
            text-align: center;
        }

        #btn-area3 {
            margin: 0 3%;
            margin-top: 3%;
            text-align: center;
        }

        #confirmbtn {
            width: 30%;
            margin-right: 0.8%;
            border: none;
            border: 1px solid black;
            border-radius: 7px;
            background-color: #e5e4e4;
        }

        #confirmbtn1 {
            width: 30%;
            margin-left: 0.8%;
            border: none;
            border: 1px solid black;
            border-radius: 7px;
            background-color: #e5e4e4;
        }

        body {
            background-image: url("/images/bg-white2.jpg");
            background-repeat: no-repeat;
        }


    </style>
    <script>
        $(function () {
            let mid = "${mb.mid}";
            console.log(mid);
            let page = "${pages}";
            if (page == "login") {
                $(".login-alert").css("display", "block");
            } else if (page == "register") {
                $(".register-alert").css("display", "block");
            } else if (page == "delboard") {
                $(".delboard-alert").css("display", "block");
            } else if (page == "profile") {
                $(".profile-confirm").css("display", "block");
            } else if (page == "sendmessage") {
                $(".Imessage").css("display", "block");
            } else if (page == "result") {
                $(".result").css("display", "block");
            } else if (page == "showmessage") {
                $(".showmessage").css("display", "block");
            } else if (page == "userprofile"){
                $(".user-profile").css("display", "block");
            }
        })
    </script>
</head>
<body>
<div class="user-profile" >
    <div class="login-head">
        <p class="login-logo">L&nbsp;&nbsp;I&nbsp;&nbsp;M&nbsp;&nbsp;E</p>
    </div>
    <div style="padding: 10px; margin-top: 1%; width: 90%; height: 80%">
        <p style="width: 70px;float: left">닉네임 </p>
        <p style="width: 290px; float: left"> : <input style="width: 90%;
    border: none;
    border-bottom: 1px solid lightgray;font-family: a타이틀고딕3" type="text" disabled value="${memDto.mnick}"><br></p>
        <p style="width: 70px;float: left">등급 </p>
        <p style="width: 290px; float: left"> : <input style="width: 90%;;font-family: a타이틀고딕3;
    border: none;
    border-bottom: 1px solid lightgray" type="text" disabled value="${memDto.gname}"><br></p>
        <textarea disabled style="width: 100%; resize: none; height: 200px;border: none;font-family: a타이틀고딕3;margin-top: 4%">${memDto.mtext}</textarea>
    </div>
</div>
<div class="login-alert">
    <div id="login-head">
        <p id="login-logo">L&nbsp;&nbsp;I&nbsp;&nbsp;M&nbsp;&nbsp;E</p>
    </div>
    <p id="login-msg">로그인이 필요한 서비스입니다.</p>
    <p id="login-sub-msg" onclick="showGuide()">회원가입 하셨나요?</p>
    <p id="login-guide">메인화면 > 우측 상단 > JOIN 클릭</p>
    <div id="btn-area">
        <button id="login-btn1" onclick="goLogin()">로그인</button>
        <button id="login-btn2" onclick="closepop()">돌아가기</button>
    </div>
</div>
<div class="register-alert">
    <div id="register-head">
        <p id="register-logo">L&nbsp;&nbsp;I&nbsp;&nbsp;M&nbsp;&nbsp;E</p>
    </div>
    <p id="register-msg">회원가입이 필요한 서비스입니다.</p>
    <p id="register-sub-msg" onclick="showGuide()">회원가입 방법</p>
    <p id="register-guide">메인화면 > 우측 상단 > JOIN 클릭</p>
    <div id="btn-area2">
        <button id="register-btn1" onclick="goRegister()">회원가입</button>
        <button id="register-btn2" onclick="closepop()">돌아가기</button>
    </div>
</div>
<div class="profile-confirm">
    <div id="profile-head">
        <p id="profile-logo">L&nbsp;&nbsp;I&nbsp;&nbsp;M&nbsp;&nbsp;E</p>
    </div>
    <p id="profile-msg">본인 인증</p>
    <p id="profile-sub-msg">프로필을 수정하려면 본인 인증이 필요합니다.</p>
    <p id="profile-guide" style="margin: 0 auto;">회원가입할 때 입력하신 나만의 비밀 답변을 입력해주세요.</p>
    <div id="input-area">
        <input type="text" id="mysecret" placeholder="나만의 비밀 답변" autofocus autocomplete="off"
               onkeyup="enterconfirm()"><br>
    </div>
    <div id="btn-area3">
        <button id="confirmbtn" onclick="userConfirm()">확인</button>
        <button id="confirmbtn1" onclick="closeback()">취소</button>
    </div>
</div>
<div class="delfile-alert">
    <button onclick="closepop()">취소</button>
</div>
<div class="Imessage">
    <div style="width: 100%;height: 35px; line-height: 35px ;background-color: black; text-align: center; color:white">
        메시지 보내기
    </div>
    <form style="width: 90%;
    margin: 2% auto; background-color: white; min-width: 300px; padding: 3%" action="InquireMessage" method="post"
          enctype="multipart/form-data"
          autocomplete="off">
        <input type="hidden" name="m_anum" value="${a_num}">
        <input type="hidden" name="m_mid" value="${mb.mid}">
        <c:if test="${a_id == null || a_id == ''}">
            <div style="margin-top: 1%; width: 100%; display: flex; justify-content: center">
                <p style="width: 70px; float: left">받는사람 </p>
                <p style="width: 290px; float: left">: <input
                        style="width: 90%; border: none; border-bottom: 1px solid lightgray" type="text" name="m_rmid"
                        required><br></p>
            </div>
        </c:if>
        <c:if test="${a_id !=null && a_id != ''}">
            <div style="margin-top: 1%; width: 100%; display: flex; justify-content: center">
                <p style="width: 70px;float: left">받는사람 </p>
                <p style="width: 290px; float: left">: <input
                        style="width: 90%; border: none; border-bottom: 1px solid lightgray" type="text" name="m_rmid"
                        readonly value="${a_id}"><br></p>
            </div>
        </c:if>
        <div style="margin-top: 1%; width: 100%; display: flex; justify-content: center">
            <p style="width: 70px;float: left;">제목 </p>
            <p style="width: 290px;float: left">: <input
                    style="width: 90%; border: none; border-bottom: 1px solid lightgray" type="text" name="m_title"
                    required><br></p>
        </div>
        <div style="margin-top: 1%; width: 100%; display: flex; justify-content: center">
            <textarea id="mtext" name="m_text" maxlength="300" placeholder="내용" required
                      style="margin-top: 2%; border: none; width: 340px; resize: none; height: 126px;"></textarea>
        </div>
        <div style="margin-top: 1%; width: 100%;display: flex;justify-content: space-between">
            <input id="msg-file" type="file" name="file" style="width: 280px">
            <p class="textCount" style="display: inline-block;font-size: small">0자</p>
            <p class="textTotal" style="display: inline-block;font-size: small">/300자</p>
        </div>
        <c:if test="${mDto.m_anum != null}">
            <c:if test="${owner != mb.mid}">

            </c:if>
            <c:if test="${owner == mb.mid}">
                <c:if test="${mDto.m_ispay != '1'}">
                    <input type='checkbox' style="display: inline-block"
                           onclick='showpay()'><span>결제요청 : <input id="m_pay" style="display: none; width: 100px"
                                                                   type="number" placeholder="가격" name="m_price"></span></input>
                </c:if>
                <c:if test="${mDto.m_ispay == '1'}">

                </c:if>
            </c:if>
        </c:if>
        <div style="margin-top: 2%; width: 100%; display: flex; justify-content: space-between">
            <c:if test="${m_num == null || m_num == ''}">
                <button style="cursor: pointer; width: 100px; height: 30px; border-radius: 5px; background-color: black; color: white"
                        type="button" onclick="closepop()">닫기
                </button>
            </c:if>
            <c:if test="${m_num !=null && m_num != ''}">
                <button style="cursor: pointer; width: 100px; height: 30px; border-radius: 5px; background-color: black; color: white"
                        type="button" onclick="backMessage(${m_num})">뒤로가기
                </button>
            </c:if>
            <input id="iSendBtn"
                   style="cursor: pointer; width: 100px; height: 30px;border-radius: 5px; border: none; background-color: black; color: white"
                   value="전송" type="submit">
        </div>
        <c:if test="${mDto.m_anum == null}">

        </c:if>
    </form>

</div>


<div class="result" style="text-align: center;">
    <div style="width: 100%;height: 35px; line-height: 35px ;background-color: black; text-align: center; color:white">
        메시지
    </div>
    <p style="  margin-top: 24%; font-family: a타이틀고딕5; font-size: 1.8rem;">${result}</p>
    <p style="font-size: 0.8rem; margin-top: 2%;">메시지 탭에서 확인하실 수 있습니다. </p>
    <button style="color: white;
    width: 60px;
    background-color: #000000;
    margin-top: 20%;
    border: none;
    border-radius: 8px;
    height: 25px;" onclick="closepop()">닫기
    </button>
</div>

<div class="showmessage">
    <div style="width: 100%;height: 35px; line-height: 35px ;background-color: black; text-align: center; color:white">
        메시지
    </div>
    <div style="width: 90%;margin: 2% auto; background-color: white; padding: 3%">
        <c:if test="${mDto.m_rmid != mb.mid}">
            <p style="width: 70px;float: left">받는 사람 </p>
            <p style="width: 290px; float: left"> : <input style="width: 90%;
    border: none;
    border-bottom: 1px solid lightgray" type="text" disabled value="${mDto.rmnick}"><br></p>
        </c:if>
        <c:if test="${mDto.m_rmid == mb.mid}">
            <p style="width: 70px;float: left">보낸 사람 </p>
            <p style="width: 290px; float: left"> : <input style="width: 90%;
    border: none;
    border-bottom: 1px solid lightgray" type="text" disabled value="${mDto.mnick}"><br></p>
        </c:if>
        <p style="width: 70px;float: left">제목 </p>
        <p style="width: 290px; float: left">: <input style="width: 90%;
    border: none;
    border-bottom: 1px solid lightgray" type="text" disabled value="${mDto.m_title}"><br></p>
        <textarea name="m_text" style="margin-top: 2%; border: none;    width: 360px;
    resize: none;
    height: 150px;" disabled>${mDto.m_text}</textarea>
        <c:if test="${mDto.m_fileoriname == null}">
            <p>파일이 없습니다.</p>
        </c:if>
        <c:if test="${mDto.m_fileoriname != null}">
            <c:if test="${mDto.m_anum == null}">
                <p style="width: 360px; white-space: nowrap; text-overflow: ellipsis;overflow: hidden;cursor: pointer;"
                   onclick="downloadfile('${mDto.m_fileoriname}','${mDto.m_filesysname}')">파일
                    : <c:choose>
                        <c:when test="${fn:length(mDto.m_fileoriname) gt 15}">
                            <c:out value="${fn:substring(mDto.m_fileoriname,0,15)}"></c:out>...
                        </c:when>
                        <c:otherwise>
                            <c:out value="${mDto.m_fileoriname}"></c:out>
                        </c:otherwise>
                    </c:choose></p>
            </c:if>
            <c:if test="${mDto.m_anum != null}">
                <c:if test="${mb.mid != mDto.m_mid}">
                    <c:if test="${saler == mDto.m_rmid}">
                        <p style="cursor:pointer;width: 360px; white-space: nowrap; text-overflow: ellipsis;overflow: hidden;"
                           onclick="downloadfile('${mDto.m_fileoriname}','${mDto.m_filesysname}')">파일
                            : <c:choose>
                                <c:when test="${fn:length(mDto.m_fileoriname) gt 15}">
                                    <c:out value="${fn:substring(mDto.m_fileoriname,0,15)}"></c:out>...
                                </c:when>
                                <c:otherwise>
                                    <c:out value="${mDto.m_fileoriname}"></c:out>
                                </c:otherwise>
                            </c:choose></p>
                    </c:if>
                    <c:if test="${saler != mDto.m_rmid}">
                        <c:if test="${mDto.m_ispay == '1'}">
                            <p style="cursor:pointer;width: 360px; white-space: nowrap; text-overflow: ellipsis;overflow: hidden;"
                               onclick="downloadfile('${mDto.m_fileoriname}','${mDto.m_filesysname}')">파일
                                : <c:choose>
                                    <c:when test="${fn:length(mDto.m_fileoriname) gt 15}">
                                        <c:out value="${fn:substring(mDto.m_fileoriname,0,15)}"></c:out>...
                                    </c:when>
                                    <c:otherwise>
                                        <c:out value="${mDto.m_fileoriname}"></c:out>
                                    </c:otherwise>
                                </c:choose></p>
                        </c:if>
                        <c:if test="${mDto.m_ispay == '0'}">
                            <p style="width: 360px; white-space: nowrap; text-overflow: ellipsis;overflow: hidden;float: left;cursor: pointer"
                               onclick="showalram()">파일 : <c:choose>
                                <c:when test="${fn:length(mDto.m_fileoriname) gt 15}">
                                    <c:out value="${fn:substring(mDto.m_fileoriname,0,15)}"></c:out>...
                                </c:when>
                                <c:otherwise>
                                    <c:out value="${mDto.m_fileoriname}"></c:out>
                                </c:otherwise>
                            </c:choose> <span id="adtext"
                                                                                      style="font-size: x-small;color: blue;"></span>
                            </p>
                        </c:if>
                    </c:if>
                </c:if>
                <c:if test="${mb.mid == mDto.m_mid}">
                    <p style="cursor: pointer;width: 360px; white-space: nowrap; text-overflow: ellipsis;overflow: hidden;"
                       onclick="downloadfile('${mDto.m_fileoriname}','${mDto.m_filesysname}')">파일
                        : <c:choose>
                            <c:when test="${fn:length(mDto.m_fileoriname) gt 15}">
                                <c:out value="${fn:substring(mDto.m_fileoriname,0,15)}"></c:out>...
                            </c:when>
                            <c:otherwise>
                                <c:out value="${mDto.m_fileoriname}"></c:out>
                            </c:otherwise>
                        </c:choose></p>
                </c:if>
            </c:if>
        </c:if>
        <div style="display: flex;justify-content: space-between; margin-top:2%;width: 100%">
            <button style="width:100px;height: 30px; border-radius: 5px; background-color: black; color: white"
                    type="button" onclick="closepop()">닫기
            </button>
            <c:if test="${mb.mid != mDto.m_mid}">
                <button style="width:100px;height: 30px; border-radius: 5px; background-color: black; color: white"
                        type="button" onclick="sendmessage('${mDto.m_mid}',${mDto.m_num}, ${mDto.m_anum})">답장
                </button>
            </c:if>
            <c:if test="${mDto.m_price != null}">
                <c:if test="${mDto.m_rmid != mb.mid}">

                </c:if>
                <c:if test="${mDto.m_rmid == mb.mid}">
                    <c:if test="${mDto.m_ispay != '1'}">
                        <button style="height: 30px; border-radius: 5px; background-color: black; color: white"
                                type="button" onclick="buybtn(${mDto.m_price},${mDto.m_anum},${mDto.m_num})">결제
                        </button>
                        <span style="line-height: 30px"> <fmt:formatNumber value="${mDto.m_price}"
                                                                           pattern="#,###"/>  원</span>
                    </c:if>
                    <c:if test="${mDto.m_ispay == '1'}">

                    </c:if>
                </c:if>
            </c:if>

        </div>
    </div>
</div>
</body>
<script>
    function showGuide() {
        if ($("#login-guide").css("display") == "none") {
            $("#login-guide").css("display", "block");
        } else if ($("#login-guide").css("display") == "block") {
            $("#login-guide").css("display", "none");
        }
    }


    function closeback() {
        window.close();
        opener.parent.location.href = "/profile?page=showprofile";
    }

    function enterconfirm() {
        if (window.event.keyCode == 13) {
            userConfirm();
        }
    }

    function goLogin() {
        window.close();
        opener.parent.location.href = "/loginForm";
    }

    function goRegister() {
        window.close();
        opener.parent.location.href = "/registerForm";
    }

    function closepop() {
        window.close();
        opener.parent.location.reload();
    }

    function userConfirm() {
        let answer = $("#mysecret").val();
        console.log(answer);
        let sendData = {"mysecret": answer, "mid": '${mb.mid}'};
        $.ajax({
            url: "userConfirm",
            type: "post",
            data: sendData,
            success: function (result) {
                if (result == "true") {
                    window.close();
                    $("#showprofile", opener.document).css("display", "none");
                    $("#myprofile", opener.document).css("display", "none");
                    $("#modifybtn", opener.document).css("display", "none");
                    $("#information", opener.document).css("display", "none");
                    $("#userconfirm", opener.document).css("display", "none");
                    $("#updateprofile", opener.document).css("display", "block");
                } else {
                    alert("비밀번호가 일치하지 않습니다.");
                    $("#mysecret").val("");
                    $("#mysecret").focus();
                }
            },
            error: function (error) {
                console.log(error);
                alert("관리자에게 문의하세요.");
            }
        })
    }

    function sendmessage(a_id, m_num, a_num) {
        if (a_num == null) {
            location.href = '/popup?page=sendmessage&a_id=' + a_id + '&m_num=' + m_num;
        } else {
            location.href = '/popup?page=sendmessage&a_id=' + a_id + '&m_num=' + m_num + '&a_num=' + a_num;
        }
    }

    function downloadfile(oriname, sysname) {
        location.href = '/downloadfile?oriname=' + oriname + '&sysname=' + sysname;
    }

    function backMessage(m_num) {
        location.href = '/popup?page=showmessage&m_num=' + m_num;
    }

    function showpay() {
        if ($("#m_pay").css("display") == "none") {
            $("#m_pay").css("display", "inline");
            $("#m_pay").attr("required", "true");
            $("#msg-file").attr("required", "true");
        } else {
            $("#msg-file").attr("required", false);
            $("#m_pay").css("display", "none");
            $("#m_pay").attr("required", false);

        }
    }

    function buybtn(price, a_num, m_num) {
        let popOption = "width = " + 650 + ", height = " + 550 + ", left = " + ((window.screen.width / 2) - (650 / 2)) + ", top = " + ((window.screen.height / 2) - (550 / 2));
        window.open("/kakaoPay?a_num=" + a_num + "&price=" + price + "&m_num=" + m_num, "카카오페이", popOption);
    }

    function showalram() {
        $("#adtext").html("결제후 다운받을 수 있습니다.");
    }

    $('#mtext').keyup(function (e) {
        let content = $(this).val();

        // 글자수 세기
        if (content.length == 0 || content == '') {
            $('.textCount').text('0자');
        } else {
            $('.textCount').text(content.length + '자');
        }

        // 글자수 제한
        if (content.length > 300) {
            $(this).val($(this).val().substring(0, 299));
            alert('글자수는 300자까지 입력 가능합니다.');
        }
        ;
    });
</script>
</html>