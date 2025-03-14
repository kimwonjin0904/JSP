<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="jdbc.UserService" %>
<%@ page import ="jdbc.UserVo" %>
<%@ page import = "java.io.PrintWriter" %>              <!--회원가입 후 틀렸을때 -->
<!-- java 빈(Bean) 데이터를 저장 및 관리를 하기 위하 자바 객체
	 조건: 기본생성자, private 필드, getter/setter 필요
	 장점: 데이터 관리의 효율성 및 코드 가독성 증가
 -->
<jsp:useBean id="user" class="jdbc.UserVo" scope="page" />
<jsp:setProperty property="userId" name="user" />
<jsp:setProperty property="userPw" name="user" />
<jsp:setProperty property="userNm" name="user" />
 <%
 	UserService service = UserService.getInstance();
	System.out.println(user);
	int cnt = service.insertUser(user);
	out.println("<script>");
	if(cnt > 0){
		out.println("회원가입이 완료되었습니다.");         //내가 수정한 부분
		out.println("location.href='login.jsp'");		
	}else{
		out.println("alert('문제가 있음!! 다시 시도하세요!')");
		out.println("histroy.back();");
	}
	out.println("</script>");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>