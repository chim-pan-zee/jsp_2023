<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
    <link rel="stylesheet" href="login.css">
    
</head>
<%
String id = (String)session.getAttribute("id");

%>
<body>
    <!-- GIF 이미지를 랜덤한 위치에 배치합니다. -->
    <img src="https://i.gifer.com/Imiq.gif" class="gif-image" style="top: 50px; left: 100px;">
    <img src="https://i.gifer.com/Pc35.gif" class="gif-image" style="top: 150px; left: 200px;">
    <!-- 필요한 만큼 GIF 이미지를 추가하고 위치를 지정하세요. -->
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrYwvJH2F8nOBMxHjoo6FY5Z9l4YBImCDNscyw8o_aiakOhcsy2XI6FDEaquNE74xR8GA&usqp=CAU" class="gif-image" style="top: 200px; left: 300px;">
    <img src="https://i.gifer.com/origin/f7/f7f7a89507593d612c1e25174f299d2b_w200.gif" class="gif-image" style="top: 250px; left: 400px;">
    <img src="https://i.pinimg.com/originals/96/d2/29/96d229d8c1be97c0d8c297b16a65ae0d.gif" class="gif-image" style="top: 300px; left: 500px;">    <img src="gif8.gif" class="gif-image" style="top: 400px; left: 700px;">
    <img src="https://helios-i.mashable.com/imagery/articles/07AVBJLHSxivlZGTkkJ3QAo/images-3.fit_lim.size_376x.gif" class="gif-image" style="top: 450px; left: 800px;">
    <img src="https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif" class="gif-image" style="top: 500px; left: 900px">
    

    <div id="login-container">
        <h2>로그인</h2>
        <form action="loginProcess.jsp" method="post">
            <input type="text" id="username" name="username" placeholder="사용자 이름" required><br><br>
            <input type="password" id="password" name="password" placeholder="비밀번호" required><br><br>
            <button type="submit">로그인</button>
        </form>
    </div>
</body>
</html>