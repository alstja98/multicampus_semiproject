<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
html {
  height: 100%;
}
body {
  margin:0;
  padding:0;
  font-family: sans-serif;
  background: linear-gradient(#141e30, #243b55);
}
.main-box {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 50%;
  padding: 40px;
  transform: translate(-50%, -50%);
  background: rgba(0,0,0,.5);
  box-sizing: border-box;
  box-shadow: 0 15px 25px rgba(0,0,0,.6);
  border-radius: 10px;

}

.main-box h1 {
  margin: 0 0 30px;
  padding: 0;
  color: #fff;
  text-align: center;
}

.main-box h2 {
  margin: 0 0 30px;
  padding: 0;
  color: #fff;
  text-align: left;
}

.main-box a {
  margin: 0 0 30px;
  padding: 0;
  color: white;
  margin-left: 25%;
}


</style>
<body>
   <div class="main-box">
   <h1>안녕하세요 </h1>
   <h1>동물병원을 찾아 드립니다</h1>
   <h2>소중한 우리 강아지, 고양이등..</h2>
   <a href="/loginok">회원 이용</a>
   <a href="/mapmain">비회원 이용</a>
   </div>
</body>
</html>