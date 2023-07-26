<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>상세보기</title>
    <script src="js/jquery-3.7.0.min.js"></script>
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        body {
            width: 100%;
            height: 100%;
            background-image: url("/images/musicabg.png");
        }

        /*앨범사진, 설명, 수정/삭제 버튼*/
        #albumAndFile {
            margin-left: 10%;
        }

        /*앨범사진*/
        #album {
            text-align: center;
            z-index: 1;
            width: 28.5%;
            height: 35%;
            position: relative;
            float: left;
            margin: 2% 2% 0 3%;
        }

        #aw-fileInput {
            display: none;
        }

        .btn-upload {
            font-family: "에스코어 드림 4 Regular";
            color: white;
            float: left;
            font-size: 5rem;
            text-align: center;
            margin-top: 72.4%;
            margin-left: 5%;
            width: 5%;
            height: 5%;
            border: none;
            transition: 0.5s color;
            color: white;
            /* bottom: 17px; */
            position: relative;
            border-radius: 10px;
            z-index: 1;
            background-image: url("/images/picture.png");
            background-size: 100%, 100%;
            background-repeat: no-repeat;
            background-position: center;
        }

        .btn-upload2 {
            font-family: "에스코어 드림 4 Regular";
            float: left;
            color: white;
            font-size: 5rem;
            text-align: center;
            margin-top: 79.65%;
            margin-left: -5%;
            width: 5%;
            height: 4.95%;
            border: none;
            transition: 0.5s color;
            color: white;
            /* bottom: 17px; */
            position: relative;
            border-radius: 10px;
            z-index: 1;
            background-image: url(/images/music.png);
            background-size: 90%, 99%;
            background-repeat: no-repeat;
            background-position: center;
        }
        .btn-defaultimg{
            font-family: "에스코어 드림 4 Regular";
            float: left;
            color: white;
            font-size: 5rem;
            text-align: center;
            margin-top: 79.7%;
            margin-left: -5%;
            height: 5%;
            border: none;
            transition: 0.5s color;
            color: white;
            /* bottom: 17px; */
            position: relative;
            border-radius: 10px;
            z-index: 1;
        }

        .btn-upload:hover {
            transition: 0.5s color;
            color: #ff3d02;
        }

        /*음원 설명*/
        #artinfo {
            border: 1px solid black;
            float: left;
            width: 20%;
            height: 35%;
            margin-top: 1.75%;
            vertical-align: middle;
            border: 1px solid black;
            background: linear-gradient(45deg, rgba(182, 181, 181, 0.8), rgba(255, 255, 255, 0.8));
            border-radius: 10px;
        }

        #artinfo > p {
            font-family: "에스코어 드림 2 ExtraLight";
            text-align: left;
            padding-left: 5%;
            color: white;
            font-size: 1.8rem;
            margin-top: 2%;
            margin-bottom: 2%;
        }

        #artinfo1 {
            position: relative;
            text-align: center;
        }

        /*수정/삭제 버튼*/
        #aupdate-btn, #adelete-btn {
            visibility: hidden;
            font-size: x-large;
        }

        #setting-btn {
            position: absolute;
            margin-left: 5%;
            margin-top: 17%;
        }

        /*구매 버튼*/
        #update-btn {
            width: 100%;
            height: 100%;
            font-size: 1.5rem;
            position: absolute;
            top: 0%;
            border-radius: 10px;
            border: none;
            background: linear-gradient(45deg, rgba(0, 0, 0, 0), rgba(112, 112, 112, 0));
            transition: 0.5s color;
            color: white;
        }

        #update-area {
            position: absolute;
            top: 75.55%;
            left: 51.1%;
            width: 9%;
            height: 10%;
            border: none;
            border-radius: 10px;
            background: linear-gradient(45deg, rgba(0, 0, 0, 0.5), rgba(112, 112, 112, 0.5));
        }

        #update-btn:hover {
            transition: 0.5s color;
            color: #ff3d02;
        }

        #aback-btn {
            width: 9.5%;
            height: 10%;
            font-size: 1.5rem;
            position: absolute;
            top: 75.59%;
            left: 40.3%;
            border-radius: 10px;
            border: none;
            background: linear-gradient(45deg, rgba(0, 0, 0, 0.8), rgba(112, 112, 112, 0.8));
            transition: 0.5s color;
            color: white;
        }

        #aback-btn:hover {
            transition: 0.5s color;
            color: #ff3d02;
        }


        /*앨범상세*/
        #albumdetail {
            border: none;
            width: 20%;
            height: 23%;
            float: left;
            margin-top: 20.5%;
            position: absolute;
            margin-left: 40.25%;
            background: linear-gradient(45deg, rgba(255, 255, 255, 0.8), rgba(182, 181, 181, 0.8));
            border-radius: 10px;
        }


        #albumdetail > p {
            font-family: "에스코어 드림 2 ExtraLight";
            text-align: left;
            padding-left: 5%;
            color: white;
            font-size: 1.8rem;
            margin-top: 1%;
            margin-bottom: 5%;
        }

        #album-info-box {
            border: 1px solid black;
            width: 26%;
            height: 74.1%;
            float: left;
            margin-top: 1.68%;
            position: absolute;
            margin-left: 62%;
            background: linear-gradient(45deg, rgba(255, 255, 255, 0.8), rgba(182, 181, 181, 0.8));
            padding-left: 1.3%;
            border-radius: 10px;
        }

        #album-info-box > p {
            font-family: "에스코어 드림 2 ExtraLight";
            text-align: left;
            color: white;
            font-size: 1.8rem;
            margin-top: 1%;
            margin-bottom: 1%;
        }


        #albumdetail > * {
            height: 15%;
            margin-top: 1.5%;
            margin-bottom: 1.5%;
            color: black;
            background-color: rgba(0, 0, 0, 0);
        }

        /*댓글*/
        #commentinfo {
            font-family: a타이틀고딕1;
            border: none;
            width: 25.8%;
            height: 23.6%;
            position: absolute;
            top: 62.4%;
            margin-left: 12.7%;
            border-radius: 10px;
            background: linear-gradient(45deg, rgba(0, 0, 0, 0.8), rgba(112, 112, 112, 0.8));
            color: white;
        }

        #commentinfo > p {
            padding-top: 1%;
            padding-left: 2%;
            color: white;
        }

        #commentinfo > div {
            font-family: a타이틀고딕1;
            font-size: 0.8rem;
            padding-top: 1%;
            padding-left: 2%;
        }

        #commentinfo > p:first-child {
            font-family: a타이틀고딕3;
            color: white;
        }

        /*섹션*/
        #infosection {
            width: 100%;
            height: 100%;
            border-radius: 10px;
        }

        /*파일 업로드*/
        .filebox {
            margin-left: 2.7%;
            position: absolute;
            top: 11.5%;
            background: linear-gradient(45deg, rgba(0, 0, 0, 0.8), rgba(112, 112, 112, 0.8));
            width: 25.8%;
            height: 47%;
            border-collapse: collapse;
            box-sizing: border-box;
            border-radius: 10px;
        }

        #aw-input1 {
            padding-left: 0.8%;
            color: black;
        }

        #aw-input1::placeholder {
            padding-left: 0.8%;
            color: black;
        }

        select#aw-SorG {
            height: 30%;
            border-radius: 10px;
            margin-top: 1%;
            background-color: rgba(0, 0, 0, 0);
        }

        #bal {
            padding-left: 0.8%;
        }

        #aw-price {
            padding-left: 0.8%;
        }

        #aw-input1::placeholder {
            padding-left: 0.8%;
            font-family: a타이틀고딕3;
            color: black;
        }

        #aw-select1::placeholder {
            padding-left: 0.8%;
            font-family: a타이틀고딕3;
            color: black;
        }

        select {
            font-family: a타이틀고딕3;
        }

        input[type="date"] {
            font-family: a타이틀고딕3;
        }

        #bal::placeholder {
            padding-left: 0.8%;
            font-family: a타이틀고딕3;
            color: black;
        }

        #aw-price::placeholder {
            padding-left: 0.8%;
            font-family: a타이틀고딕3;
            color: black;
        }

        #aw-select2::placeholder {
            padding-left: 0.8%;
            font-family: a타이틀고딕3;
            color: black;
        }

        #aw-price::placeholder {
            padding-left: 0.8%;
            font-family: a타이틀고딕3;
            color: black;
        }

        #aw-balmae {
            padding-left: 0.6%;
            height: 30%;
            margin-top: 2%;
            border-radius: 10px;
            background-color: rgba(0, 0, 0, 0);
        }

        #aw-balmae::placeholder {
            font-family: a타이틀고딕3;
            color: black;
        }

        #aw-giheik {
            padding-left: 0.6%;
            height: 30%;
            margin-top: 2%;
            border-radius: 10px;
            background-color: rgba(0, 0, 0, 0);
        }

        #aw-giheik::placeholder {
            font-family: a타이틀고딕3;
            color: black;
        }
        #label1, #label3 > p {
            position: relative;
            top: 83%;
            color: white;
            margin-left: 14%;
        }
        #label2, #label4 > p {
            position: relative;
            top: 85%;
            color: white;
            margin-left: 14%;
        }
        #label1, #label2, #label3, #label4{
            left: 3%;
        }
        textarea#aw-album-info::placeholder {
            padding-left: 0.6%;
            padding-top: 0.4%;
            color: black;
            font-family: a타이틀고딕3;
        }

        textarea#aw-album-info {
            border-radius: 10px;
            height: 88%;
            margin-top: 1%;
            background-color: rgba(255, 255, 255, 0.7);
            border: none;
            padding-top: 1%;
            padding-left: 1%;
        }

        #artinfo1 > * {
            margin-top: 2%;
            margin-bottom: 2.5%;
            border-radius: 10px;
            height: 10%;
            color: black;
            background-color: rgba(0, 0, 0, 0);
        }

        #aw-input1 {
            margin-top: 3%;
        }

    </style>
    <script>
        $(function (){
            let count = "${count}";
        let msg = "${msg}";
        if (msg != ""){
            alert(msg);
        }
        let loginName = "${mb.mnick}";
        let Grade = "${mb.gname}";
        console.log(loginName);
        if (loginName == "") {
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
            spantag.append("<span>"+loginName +" 님</span>")
            //$(".name").html(loginName + " 님");
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
<section id="infosection">
    <form action="WriteArt" method="POST" enctype="multipart/form-data" name="WForm" autocomplete="off" onsubmit="return check()">
        <div id="albumAndFile">
                <div id="album">
                    <img id="preview" width="auto" height="80%" style="margin-top: 6%" src="/images/Muimage.png">
                    <p style="color: white; font-size: small;margin-top: 3%;">1:1비율 권장</p>
                </div>
                <div class="filebox">
                    <label class="aw-filebutton" for="aw-imgfileInput">
                        <div class="btn-upload"></div>
                    </label>
                    <label class="aw-filebutton" for="aw-musicfileInput">
                        <div class="btn-upload2" aria-required="true"></div>
                    </label>
                    <input style="display: none" id="aw-imgfileInput" type="file" name="img_file" onchange="readUrl(this)" accept="image/*">
                    <input style="display: none" id="aw-musicfileInput" type="file" name="music_file" accept="audio/*">
                    <label id="label1" style="width: 100%;">
                        <p>현재사진 : <span class="now-photo">없음</span></p>
                    </label>
                    <label id="label2" style="width: 100%;">
                        <p>현재음원 : <span class="now-music">없음</span></p>
                    </label>
                </div>
        </div>

        <div id="artinfo">
            <p>기본 정보 입력</p>
            <div id="artinfo1" style="position: relative;">
                <input style="width: 90%; border: none; border: 1px solid black" id="aw-input1"
                       type="text" name="a_title" placeholder="제목" required>
                <input id="aw-input2" type="hidden" name="a_id" value="${mb.mid}">
                <select id="aw-select1" name="a_category"
                        style="width: 90%; border: none; border: 1px solid black" required>
                    <option value="composition">작곡</option>
                    <option value="vocal">보컬</option>
                    <option value="lyricist">작사</option>
                </select>
                <select id="aw-select2" name="a_genre"
                        style="width: 90%; border: none; border: 1px solid black" required>
                    <option value="KPOP" >KPOP</option>
                    <option value="Ballad">발라드</option>
                    <option value="Indie">인디</option>
                    <option value="Rap/Hip-hop">랩·힙합
                    </option>
                    <option value="POP">POP</option>
                </select>
                <input style="width: 90%; border: none; border: 1px solid black"
                       type="date" name="a_release" id="bal" placeholder="발매일"
                       onchange="clock()">
                <input id="aw-price" type="text"
                       style="width: 90%; border: none; border: 1px solid black" name="a_price"
                       placeholder="가격" required>
            </div>
        </div>
        <div id="commentinfo">
            <p>아티스트 소개</p>
            <div style="width: 90%; height: 70%">

            </div>
        </div>
        </div>
        <div id="albumdetail">
            <p>제작사</p>
            <div style="position: relative; left: 5%; height: 50%">
                <select id="aw-SorG" style="width: 90%; border: 1px solid black" name="a_group">
                    <option value="single">싱글</option>
                    <option value="group" >그룹</option>
                </select>
                <input style="width: 90%; border: 1px solid black" id="aw-balmae"
                       type="text"
                       name="a_publisher" placeholder="발매사"  required>
                <input style="width: 90%; border: 1px solid black; margin-bottom: 3%"
                       id="aw-giheik" type="text" name="a_agency" placeholder="기획사"  required>
            </div>
        </div>
        <div id="album-info-box">
            <p>음원설명</p>
            <textarea id="aw-album-info" name="a_contents" style="resize: none; width: 95%"
                      placeholder="당신의 앨범을 소개해주세요."></textarea>
        </div>
        <div id="aback-area">
            <button type="button" id="aback-btn" onclick="adback()">< 뒤로가기</button>
        </div>
        <div id="update-area">
            <input type="submit" id="update-btn" value="작성 >">
        </div>
    </form>
</section>
<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
<script>
    function adback() {
        console.log("${page}");
        if ("${page}" == "artwork") {
            location.href = '/mypage?page=${page}&category=${sDto.category}&genre=${sDto.genre}&pageNum=${pageNum}';
        } else {
            location.href = '/artwork?category=${sDto.category}&genre=${sDto.genre}&colname=${sDto.colname}&keyword=${sDto.keyword}&pageNum=${pageNum}';
        }
    }
    $(document).on("change","#aw-imgfileInput",function () {
        let imgname =  $("#aw-imgfileInput")[0].files[0].name;
        $(".now-photo").html(imgname);
    })
    function readUrl(input) {
        if (input.files && input.files[0]) {
            let reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('preview').src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        } else {
            document.getElementById('preview').src = "";
        }
    }

    $(document).on("change","#aw-musicfileInput",function () {
        let imgname =  $("#aw-musicfileInput")[0].files[0].name;
        $(".now-music").html(imgname);
    })

    function check(){
        if ($("#aw-musicfileInput").val() == ""){
            console.log("음원파일을 넣어주세요!");
            alert("음원파일은 반드시 필요합니다!");
            return false;
        } else {
            return true;
        }
    }
</script>
</html>