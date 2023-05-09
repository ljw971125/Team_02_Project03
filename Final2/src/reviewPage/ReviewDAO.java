package reviewPage;

import java.util.List;
import java.util.Map;
import java.util.Vector;
import javax.servlet.ServletContext;
import common.JDBConnect;

public class ReviewDAO extends JDBConnect {
	
	public ReviewDAO(ServletContext application) {
        super(application);
    }
	
	// 검색 조건에 맞는 게시물의 개수를 반환합니다.
    public int selectCount(Map<String, Object> map) {
        int totalCount = 0; // 결과(게시물 수)를 담을 변수

        // 게시물 수를 얻어오는 쿼리문 작성
        String query = "SELECT COUNT(*) FROM review";
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%'";
        }

        try {
            stmt = con.createStatement();   // 쿼리문 생성
            rs = stmt.executeQuery(query);  // 쿼리 실행
            rs.next();  // 커서를 첫 번째 행으로 이동
            totalCount = rs.getInt(1);  // 첫 번째 칼럼 값을 가져옴
        }
        catch (Exception e) {
            System.out.println("게시물 수를 구하는 중 예외 발생");
            e.printStackTrace();
        }

        return totalCount; 
    }
    
 // 검색 조건에 맞는 게시물 목록을 반환합니다.
    public List<ReviewDTO> selectList(Map<String, Object> map) { 
        List<ReviewDTO> bbs = new Vector<ReviewDTO>();  // 결과(게시물 목록)를 담을 변수

        String query = "SELECT * FROM review "; 
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%' ";
        }
        query += " ORDER BY num DESC "; 

        try {
            stmt = con.createStatement();   // 쿼리문 생성
            rs = stmt.executeQuery(query);  // 쿼리 실행

            while (rs.next()) {  // 결과를 순화하며...
                // 한 행(게시물 하나)의 내용을 DTO에 저장
            	ReviewDTO dto = new ReviewDTO(); 

                dto.setNum(rs.getString("num"));          // 리뷰글 번호
                dto.setNik(rs.getString("nik"));      // 닉네임
                dto.setRnum(rs.getString("rnum"));  // 방번호
                dto.setRecomment(rs.getString("recomment"));  // 관리자 댓글
                dto.setTitle(rs.getString("title"));            // 제목
                dto.setRecontent(rs.getString("recontent"));  // 내용
                dto.setRedate(rs.getDate("redate")); //오류 발생 가능
                dto.setRate(rs.getFloat("rate")); // 평점
                
                bbs.add(dto);  // 결과 목록에 저장
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }

        return bbs;
    }
    
 // 검색 조건에 맞는 게시물 목록을 반환합니다(페이징 기능 지원).
    public List<ReviewDTO> selectListPage(Map<String, Object> map) {
        List<ReviewDTO> bbs = new Vector<ReviewDTO>();  // 결과(게시물 목록)를 담을 변수
        
        // 쿼리문 템플릿  
        String query = " SELECT * FROM ( "
                     + "    SELECT Tb.*, ROWNUM rNum FROM ( "
                     + "        SELECT * FROM reivew ";

        // 검색 조건 추가 
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField")
                   + " LIKE '%" + map.get("searchWord") + "%' ";
        }
        
        query += "      ORDER BY num DESC "
               + "     ) Tb "
               + " ) "
               + " WHERE rNum BETWEEN ? AND ?"; 

        try {
            // 쿼리문 완성 
            psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());
            
            // 쿼리문 실행 
            rs = psmt.executeQuery();
            
            while (rs.next()) {
                // 한 행(게시물 하나)의 데이터를 DTO에 저장
                ReviewDTO dto = new ReviewDTO();
                dto.setNum(rs.getString("num"));          // 리뷰글 번호
                dto.setNik(rs.getString("nik"));      // 닉네임
                dto.setRnum(rs.getString("rnum"));  // 방번호
                dto.setRecomment(rs.getString("recomment"));  // 관리자 댓글
                dto.setTitle(rs.getString("title"));            // 제목
                dto.setRecontent(rs.getString("recontent"));  // 내용
                dto.setRedate(rs.getDate("redate")); //오류 발생 가능
                dto.setRate(rs.getFloat("rate")); // 평점

                // 반환할 결과 목록에 게시물 추가
                bbs.add(dto);
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }
        
        // 목록 반환
        return bbs;
    }
	
 // 게시글 데이터를 받아 DB에 추가합니다. 
    public int insertWrite(ReviewDTO dto) {
        int result = 0;
        
        try {
            // INSERT 쿼리문 작성 
            String query = "INSERT INTO review ( "
                         + " num,title,recontent,nik,rnum,redate,rate) "
                         + " VALUES ( "
                         + " seq_review_num.NEXTVAL, ?, ?, ?, ?, sysdate, ?)";  

            psmt = con.prepareStatement(query);  // 동적 쿼리 
            psmt.setString(1, dto.getTitle());  
            psmt.setString(2, dto.getRecontent());
            psmt.setString(3, dto.getNik()); 
            psmt.setString(4, dto.getRnum());
            psmt.setFloat(5, dto.getRate());
            
            result = psmt.executeUpdate(); 
        }
        catch (Exception e) {
            System.out.println("게시물 입력 중 예외 발생");
            e.printStackTrace();
        }
        
        return result;
    }


    // 지정한 게시물을 찾아 내용을 반환합니다.
    public ReviewDTO selectView(String num) { 
        ReviewDTO dto = new ReviewDTO();
        
        // 쿼리문 준비
        String query = "SELECT R.*, M.nik " 
                     + " FROM member1 M INNER JOIN review R " 
                     + " ON M.nik=R.nik "
                     + " WHERE num=?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, num);    // 인파라미터를 일련번호로 설정 
            rs = psmt.executeQuery();  // 쿼리 실행 

            // 결과 처리
            if (rs.next()) {
                dto.setNum(rs.getString("num"));          // 리뷰글 번호
                dto.setNik(rs.getString("nik"));      // 닉네임
                dto.setRnum(rs.getString("rnum"));  // 방번호
                dto.setRecomment(rs.getString("recomment"));  // 관리자 댓글
                dto.setTitle(rs.getString("title"));            // 제목
                dto.setRecontent(rs.getString("recontent"));  // 내용
                dto.setRedate(rs.getDate("redate")); //오류 발생 가능
                dto.setRate(rs.getFloat("rate")); // 평점
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 상세보기 중 예외 발생");
            e.printStackTrace();
        }
        
        return dto; 
    }

    // 지정한 게시물의 조회수를 1 증가시킵니다.
    public void updateVisitCount(String num) { 
        // 쿼리문 준비 
        String query = "UPDATE review SET "
                     + " visitcount=visitcount+1 "
                     + " WHERE num=?";
        
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, num);  // 인파라미터를 일련번호로 설정 
            psmt.executeQuery();     // 쿼리 실행 
        } 
        catch (Exception e) {
            System.out.println("게시물 조회수 증가 중 예외 발생");
            e.printStackTrace();
        }
    }
    
    // 지정한 게시물을 수정합니다.
    public int updateEdit(ReviewDTO dto) { 
        int result = 0;
        
        try {
            // 쿼리문 템플릿 
            String query = "UPDATE board SET "
                         + " title=?, content=? "
                         + " WHERE num=?";
            
            // 쿼리문 완성
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getRecontent());
            psmt.setString(3, dto.getNum());
            
            // 쿼리문 실행 
            result = psmt.executeUpdate();
        } 
        catch (Exception e) {
            System.out.println("게시물 수정 중 예외 발생");
            e.printStackTrace();
        }
        
        return result; // 결과 반환 
    }

    // 지정한 게시물을 삭제합니다.
    public int deletePost(ReviewDTO dto) { 
        int result = 0;

        try {
            // 쿼리문 템플릿
            String query = "DELETE FROM review WHERE num=?"; 

            // 쿼리문 완성
            psmt = con.prepareStatement(query); 
            psmt.setString(1, dto.getNum()); 

            // 쿼리문 실행
            result = psmt.executeUpdate(); 
        } 
        catch (Exception e) {
            System.out.println("게시물 삭제 중 예외 발생");
            e.printStackTrace();
        }
        
        return result; // 결과 반환
    }
	
}
