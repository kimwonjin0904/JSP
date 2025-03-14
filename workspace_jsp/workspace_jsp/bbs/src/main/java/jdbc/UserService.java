package jdbc;
import java.sql.Connection;
import java.sql.SQLException;
// 비즈니스 로직을 처리하는 부분
public class UserService {
    private UserDAO dao = UserDAO.getInstance();
    private ConnectionPool cp = ConnectionPool.getInstance();
	private Connection conn;

    // 싱글톤 패턴 적용
    private static UserService instance = new UserService();
    public static UserService getInstance() {
        return instance;
    }

    private UserService() { };
    // 로그인 처리 메서드 
    public UserVo loginUser(String id,String pw) {
    	Connection conn = cp.getConnection();
    	
    	UserVo user;
		try {
			user = dao.selectUser(conn, id);
			if(user != null && user.getUserPw().equals(pw)) {
	    		return user;
	    	}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(conn != null) cp.releaseConnection(conn); 		//사용 완료 후 돌려주기
		}
    	return null;
    }
    //회원가입
    public int insertUser(UserVo vo) {
    	
    	Connection conn = cp.getConnection();
    	try {
    		return dao.insertUser(conn, vo);
    	} catch (SQLException e) {
    		System.out.println("중복된 아이디");
    		e.printStackTrace();
    	} finally {
    		if(conn != null) cp.releaseConnection(conn);
    		
    	}
    	return 0;
    	
    }
}
