package membership;

import java.util.ArrayList;
import java.util.List;

import common.DBConnPool;
import common.JDBConnect;
import java.lang.*;


public class MemberDAO extends JDBConnect {
	public MemberDAO() {
	
	}
    // 명시한 데이터베이스로의 연결이 완료된 MemberDAO 객체를 생성합니다.
    public MemberDAO(String drv, String url, String id, String pw) {
        super(drv, url, id, pw);
    }

    // 명시한 아이디/패스워드와 일치하는 회원 정보를 반환합니다.
    public List<MemberDTO> getMemberDTO(String uid, String upass) {
        MemberDTO dto = new MemberDTO();  // 회원 정보 DTO 객체 생성
        List<MemberDTO> mlist = new ArrayList<MemberDTO>();
        
        String query = "SELECT * FROM member1 WHERE id=? AND pw=?";  // 쿼리문 템플릿

        try {
            // 쿼리 실행
            psmt = con.prepareStatement(query); // 동적 쿼리문 준비
            psmt.setString(1, uid);    // 쿼리문의 첫 번째 인파라미터에 값 설정
            psmt.setString(2, upass);  // 쿼리문의 두 번째 인파라미터에 값 설정
            rs = psmt.executeQuery();  // 쿼리문 실행

            // 결과 처리
            if (rs.next()) {
                // 쿼리 결과로 얻은 회원 정보를 DTO 객체에 저장
                dto.setId(rs.getString("id"));
                dto.setPw(rs.getString("pw"));
                dto.setName(rs.getString(3));
                dto.setBirth(rs.getString(4));
                dto.setGender(rs.getString(5));
                dto.setPhone(rs.getString(6));
                dto.setAdr(rs.getString(7));
                dto.setNik(rs.getString(8));
                dto.setJdate(rs.getString(9));
                dto.setNum(rs.getInt(10));
                
                mlist.add(dto);                  
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        return mlist;  // DTO 객체 반환
    }
    public List<MemberDTO> memberInfo(String nik) {
        MemberDTO dto = new MemberDTO();  // 회원 정보 DTO 객체 생성
        List<MemberDTO> mInfolist = new ArrayList<MemberDTO>();
        
        String query = "SELECT * FROM member1 WHERE nik=?";  // 쿼리문 템플릿

        try {
            // 쿼리 실행
            psmt = con.prepareStatement(query); // 동적 쿼리문 준비
            psmt.setString(1, nik);    // 쿼리문의 첫 번째 인파라미터에 값 설정
            rs = psmt.executeQuery();  // 쿼리문 실행

            // 결과 처리
            if (rs.next()) {
                // 쿼리 결과로 얻은 회원 정보를 DTO 객체에 저장
                dto.setId(rs.getString(1));
                dto.setPw(rs.getString(2));
                dto.setName(rs.getString(3));
                dto.setBirth(rs.getString(4));
                dto.setGender(rs.getString(5));
                dto.setPhone(rs.getString(6));
                dto.setAdr(rs.getString(7));
                dto.setNik(rs.getString(8));
                dto.setJdate(rs.getString(9));
                dto.setNum(rs.getInt(10));
                
                mInfolist.add(dto);                  
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        return mInfolist;  // DTO 객체 반환
    }
	/*
	 * public String memPrice(String nik) { String query =
	 * "SELECT money FROM member1 WHERE nik=?"; // 쿼리문 템플릿 MemberDTO dto = new
	 * MemberDTO(); try { // 쿼리 실행 psmt = con.prepareStatement(query); // 동적 쿼리문 준비
	 * psmt.setString(1, nik); // 쿼리문의 첫 번째 인파라미터에 값 설정
	 * 
	 * rs = psmt.executeQuery(); // 쿼리문 실행 while (rs.next()) { // 결과셋에 포함된 레코드 갯수
	 * 카운트 dto.set }
	 * 
	 * 
	 * } catch (Exception e) { System.out.println("게시물 상세보기 중 예외 발생");
	 * e.printStackTrace(); } return recount; }
	 */
}
