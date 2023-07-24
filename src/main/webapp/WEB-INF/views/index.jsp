<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-06-23
  Time: 오전 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lime</title>
    <script src="js/jquery-3.7.0.min.js"></script>
</head>
<style>
    body {
        padding: 0px;
        margin: 0px;
    }

    .video-box {
        position: relative;
        width: 100%;
        height: 100%;
        overflow: hidden;
        margin: 0px auto;
    }

    video {
        width: 100%;
    }

    .video-text {
        text-align: center;
        position: absolute;
        top: 70%;
        left: 44%;
        width: 200px;
        font-weight: bolder;
        font-size: xx-large;
        display: none;
    }

    p {
        color: white;
        -webkit-transition: 0.5s;
        -moz-transition: 0.5s;
        -o-transition: 0.5s;
        -ms-transition: 0.5s;
        transition: 0.5s;
    }

    p:hover {
        color: #6DFF94;
        -webkit-transform: scale(1.5, 1.5);
        -moz-transform: scale(1.5, 1.5);
        -o-transform: scale(1.5, 1.5);
        -ms-transform: scale(1.5, 1.5);
        transform: scale(1.5, 1.5);
    }
</style>
<body>
<div class="video-box">
    <video id="video" style="object-fit: cover" height="100%" width="100%" muted autoplay
           src="video/IndexVideo.mp4"></video>
</div>
<div class="video-text">
    <p onclick="goHome()">시작하기></p>
</div>
</body>
<script>
    // 0.2초마다 영상이 끝났는지 확인 후 영상이 종료되었으면 메인으로 가기 버튼 나타남
    // let interval = setInterval(function (){
    //     if($("#video").prop("ended")){
    //         $("#video").setAttribute("src", "video/MainVideo.mp4#t=00:00:02")
    //     }
    // },200)
    setTimeout(() => $(".video-text").css("display", "block"), 4000);

    function goHome() {
        location.href = "main";
    }
</script>
</html>
