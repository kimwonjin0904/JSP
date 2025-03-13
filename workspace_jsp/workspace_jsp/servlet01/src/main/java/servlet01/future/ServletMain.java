package servlet01.future;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletMain extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res) //req = 클라이언트가 보낸 요청 데이터,res 클라이언트에게 보낼 응답 데이터 
            throws ServletException, IOException {
        
        System.out.println("main");
        
        // 요청에서 nm 값을 가져오기
        String nm = req.getParameter("nm");  //req.getParameter는 nm값을 가져올때 사용. getparameter은 즉 url을 가져옴
        System.out.println(nm);
        
        // 응답 설정
        res.setContentType("text/html; charset=utf-8"); //응답 데이터가 HTML 형식임을 지정.
        res.setCharacterEncoding("utf-8"); 				// 문자 인코딩을 UTF-8로 설정하여 한글 깨짐을 방지.

        // PrintWriter를 사용하여 응답 작성
        PrintWriter out = res.getWriter();	//res response응답 
        out.println("<script>");
        out.println("alert('" + nm + "님 반가워요^^');");   
        out.println("</script>"); 
    }
}
