package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//DAO Data Access Object
public class UserDAO {

		private static UserDAO instance = new UserDAO();
		
		public static UserDAO getInstance() {
			return instance;
		}
		private UserDAO() {};
		//user조회
		public UserVo selectUser(Connection conn, String id) throws SQLException {
			//db 조회하는 부분
			StringBuffer query = new StringBuffer();
			query.append("SELECT user_id, user_pw, user_nm ");
			query.append("FROM tb_user ");
			query.append("WHERE use_yn = 'Y' ");
			query.append("AND user_id = ? ");
			PreparedStatement ps = conn.prepareStatement(query.toString());
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			//결과를 리턴
			UserVo vo = new UserVo();
			while(rs.next()) {
				vo.setUserId(rs.getString("user_id"));
				vo.setUserPw(rs.getString("user_pw"));
				vo.setUserNm(rs.getString("user_nm"));
			}
			if(ps != null) ps.close();
			if(rs != null) rs.close();
			return vo;
		}
		//회원가입
		public int insertUser(Connection conn, UserVo vo) throws SQLException{
			StringBuffer query = new StringBuffer();
			query.append("");
			//insert 쿼리
			StringBuffer query2 = new StringBuffer();
			query.append("SELECT user_id, user_pw, user_nm");
			query.append("FROM tb_user ");
			query.append("AND user_id = ? ");
			query.append("AND user_pw = ? ");
			query.append("WHERE use_yn = 'Y' ");
			
			
			PreparedStatement ps = conn.prepareStatement(query.toString());
			int idx = 0;
			ps.setString(idx++, vo.getUserId());
			ps.setString(idx++, vo.getUserPw());
			ps.setString(idx++, vo.getUserNm());
			int cnt = ps.executeUpdate();
			if(ps != null) ps.close();
			//정상적으로  insert 는 1
			return cnt;
		}
}
