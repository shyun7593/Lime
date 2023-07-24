<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Server error</title>
  <script src="js/jquery-3.7.0.min.js"></script>
    <style>
        * {
            margin : 0;
            padding: 0;
        }
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
    <jsp:include page="../header.jsp"></jsp:include>
  </header>
  <section>

        <h1>There is a problem with the server.</h1>
        <p>Contact your manager.</p>
        <a href="/main">메인으로 돌아가기</a>
  </section>
  <footer>

  </footer>
</body>
</html>
