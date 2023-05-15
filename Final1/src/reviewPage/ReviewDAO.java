package reviewPage;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import javax.servlet.ServletContext;
import common.JDBConnect;
import room.RoomDTO;


public class ReviewDAO extends JDBConnect {
	
	public ReviewDAO(ServletContext application) {
        super(application);
    }
	
	// 검색 조건에 맞는 게시물의 개수를 반환합니다.
	public int selectCount(Map<String, Object> map, String room) {
	    int totalCount = 0;
	    String query = "SELECT COUNT(*) FROM review WHERE rnum = ?";
	    if (map.get("searchWord") != null) {
	        query += " AND " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%' ";
	    }
	    try {
	        psmt = con.prepareStatement(query);
	        psmt.setString(1, room);
	        rs = psmt.executeQuery();
	        rs.next();
	        totalCount = rs.getInt(1);
	    } catch (Exception e) {
	        System.out.println("게시물 수 조회 중 예외 발생");
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
    public List<ReviewDTO> selectListPage(Map<String, Object> map, String room) {
        List<ReviewDTO> bbs = new Vector<ReviewDTO>();
        String query = " SELECT * FROM ( "
                     + "    SELECT Tb.*, ROWNUM RowN FROM ( "
                     + "        SELECT * FROM review ";
        if (map.get("searchWord") != null) {
            query += " WHERE rnum = ? AND " + map.get("searchField")
                   + " LIKE '%" + map.get("searchWord") + "%' ";
        } else {
            query += " WHERE rnum = ? ";
        }
        query += "      ORDER BY num DESC "
               + "     ) Tb "
               + " ) "
               + " WHERE RowN BETWEEN ? AND ?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, room);
            psmt.setString(2, map.get("start").toString());
            psmt.setString(3, map.get("end").toString());
            rs = psmt.executeQuery();
            while (rs.next()) {
                ReviewDTO rto = new ReviewDTO();
                rto.setNum(rs.getString("num"));
                rto.setNik(rs.getString("nik"));
                rto.setRnum(rs.getString("rnum"));
                rto.setRecomment(rs.getString("recomment"));
                rto.setTitle(rs.getString("title"));
                rto.setRecontent(rs.getString("recontent"));
                rto.setRedate(rs.getDate("redate"));
                rto.setRate(rs.getFloat("rate"));
                bbs.add(rto);
            }
        } catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }
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

    
    // 지정한 게시물을 수정합니다.
    public int updateEdit(ReviewDTO dto) { 
        int result = 0;
        
        try {
            // 쿼리문 템플릿 
            String query = "UPDATE review SET "
                         + " title=?, recontent=? "
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
    
    public float getRate(int rnum) {
        float rateAvg = 0;
        String query = "SELECT AVG(rate) FROM review WHERE rnum=?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setInt(1, rnum);
            rs = psmt.executeQuery();
            if (rs.next()) {
                rateAvg = rs.getFloat(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (psmt != null) psmt.close();
                if (con != null) con.close();
            } catch (Exception e) {

            }
        }
        return rateAvg;
    }

}
