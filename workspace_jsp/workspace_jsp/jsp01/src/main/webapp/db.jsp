<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import= "java.sql.Connection" %>
    <%@page import= "java.sql.DriverManager" %>
    <%@page import= "java.sql.PreparedStatement" %>
    <%@page import= "java.sql.ResultSet" %>
    <%@page import= "java.sql.SQLException" %>
    <%@page import ="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% ArrayList<String> list = new ArrayList<>(); %>
	<%
	//db연결 객체
			Connection conn = null;
			//SQL 명령
			PreparedStatement ps = null;
			//쿼리 결과
			ResultSet rs = null;
			//1.드라이버 로딩
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				System.out.println("드라이버 로딩 성공");
			} catch (ClassNotFoundException e) {
				System.out.println("실패");
				e.printStackTrace();
				System.exit(0);			//프로그램 종료
			}
			
			//2.db연결
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";  //localhost도가능
			String db_id = "java";
			String db_pw = "oracle";
			try {
				conn = DriverManager.getConnection(url,db_id, db_pw);
				System.out.println("접속 성공");
				
				StringBuffer query = new StringBuffer();
				query.append(" select info_no  ");
				query.append("      ,nm  ");
				query.append("      ,email  ");
				query.append("      ,hobby  ");
				query.append(" from tb_info  ");
				query.append(" where nm LiKE ?||'%' ");			//? 변수
				ps = conn.prepareStatement(query.toString());
				ps.setString(1, "이");			//검색조건 이씨 성찾기
				rs = ps.executeQuery(); 		//쿼리문 실행!
				//조회결과 만큼 반복
				while(rs.next()) {
					int no = rs.getInt("info_no");
					String nm = rs.getString("nm");
					String email = rs.getString("email");
					String hobby = rs.getString("hobby");
					System.out.println(no+"|" +nm+"|"+email+"|" +hobby);
					list.add(nm);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				System.out.println("접속 종료");
				if(rs != null) {try { rs.close();}catch(SQLException e) {}}
				if(ps != null) {try { ps.close();}catch(SQLException e) {}}
				if(conn != null) {try { conn.close();}catch(SQLException e) {}}
			}
	%>
	<h1>학생</h1>
	<ul>
		<% for(int i=0; i<list.size(); i++){
		%>	
			<li>이름 : <%=list.get(i) %></li>
		<%
			}
		%>
	</ul>
</body>
</html>