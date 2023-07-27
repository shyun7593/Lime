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
        /*margin-top: 20%;*/
        text-align: left;
        font-size: large;
    }

    .Complete-Paymant2 {
        text-align: left;
        margin-top: 10%;
        margin-bottom: 10%;
        font-size: large;
    }

    #closebtn {
        cursor: pointer;
        margin: 0 auto;
        background-color: lightgray;
        border-radius: 10px;
        border: 0px;
        height: 10%;
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
<div style="border: 3px solid lightgray; border-top: 0px">
<div id="paymentdiv" style="width: 70%; height: 90%">
    <div class="Complete-Payment">
        <br>
        카카오페이 결제가 정상적으로 완료되었습니다.<br>
        <br>
        결제금액
        <div><fmt:formatNumber value="${info.amount.total}" pattern="#,###" />  원</div>
    </div>
    <div class="Complete-Paymant2">
        결제일시: ${info.approved_at} <br/>
        주문번호: ${info.partner_order_id} <br/>
        상품명: ${info.item_name} <br/>
        결제방법: 카카오페이<br/>
        <br>
        <br>
        *현금영수증 발행 여부는 구매처를 통해 확인하세요.
    </div>
    <div style="text-align: center">
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
