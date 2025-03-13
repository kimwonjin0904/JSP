<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 주석 ctrl +shift + c-->
<!-- 디렉티브-->
<%@ page import = "java.util.Date" %>   <!--  컨트롤 알트 아래 하면 밑에 복사됨 -->
<%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		public int multiply(int x, int y){
			return x * y;
		}
	%>
	<!--선언부 -->
    <%
		Date today = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String dateStr = format.format(today);   //2025년 3월 13일이라면, dateStr에는 "2025-03-13"이 저장(객체를 문자열로 저장)
		int result = multiply(2,10);
	%>
	<h1> hello</h1>
	<h1>오늘은: <%=dateStr%></h1>
	<h1>결과: 2*10: <%=result %></h1>  <!-- 화면에 출력하려면 =result 처럼 =을 써야함 -->
</body>
</html>