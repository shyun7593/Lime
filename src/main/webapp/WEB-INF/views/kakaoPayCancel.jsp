<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-07-06
  Time: 오후 4:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<style>
    #pay-top {
        background-color: #ffeb00;
        height: 8%;
        font-size: xx-large;
        margin: 0;
        background-image: url("/images/paymen.png");
        background-repeat: no-repeat;
        text-align: right;
    }
    #paymentdiv{
        margin: 0 auto;
    }

    .Complete-Payment {
        text-align: center;
        font-size: large;
    }

    #closebtn {
        cursor: pointer;
        margin: 0 auto;
        background-color: lightgray;
        border-radius: 10px;
        border: 0px;
        width: 50%;
        color: black;
        font-family: a타이틀고딕2;
        font-size: large;
        margin-left: 25%;
        margin: 0 auto;
    }
</style>
<head>
    <title>Title</title>
</head>
<body>
<div id="pay-top" ></div>
<div style="border: 3px solid lightgray; border-top: 0px;">
    <div id="paymentdiv" style="width: 70%; height: 90%;display: flex;flex-direction: column;justify-content: center;">
        <div class="Complete-Payment">
            <p style="font-size: x-large;font-weight: bold">카카오페이 결제가 취소되었습니다.</p>
        </div>
        <div style="text-align: center; margin-top: 20%">
            <p>확인 버튼을 누르면 창이 닫힙니다.</p>
            <button id="closebtn" onclick="closebtn()">확인</button>
        </div>
    </div>
</div>
</body>
<script>
    function closebtn() {
        window.close()
        opener.parent.location.reload();
    }
</script>
</html>
