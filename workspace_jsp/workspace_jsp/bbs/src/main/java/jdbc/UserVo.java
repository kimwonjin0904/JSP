package jdbc;

// Value Object (VO)
public class UserVo {
    private String userId;  // camelCase 표기법 적용
    private String userPw;
    private String userNm;
    private String userYn;

    // 1. 기본 생성자
    public UserVo() {
    }

    // 2. Getter 및 Setter
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPw() {
        return userPw;
    }

    public void setUserPw(String userPw) {
        this.userPw = userPw;
    }

    public String getUserNm() {
        return userNm;
    }

    public void setUserNm(String userNm) {
        this.userNm = userNm;
    }

    public String getUserYn() {
        return userYn;
    }

    public void setUserYn(String userYn) {
        this.userYn = userYn;
    }

    // 3. toString() 메서드
    @Override
    public String toString() {
        return "UserVo{" +
                "userId='" + userId + '\'' +
                ", userPw='" + userPw + '\'' +
                ", userNm='" + userNm + '\'' +
                ", userYn='" + userYn + '\'' +
                '}';
    }
}
