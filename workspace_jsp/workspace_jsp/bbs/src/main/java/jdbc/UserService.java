package jdbc;
import java.sql.Connection;
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
    	UserVo user = dao.selectUser(conn, id);
    	if(user.getUserPw().equals(pw)) {
    		return user;
    	}
    	return null;
    }
}
