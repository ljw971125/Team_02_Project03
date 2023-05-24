package customerInquiryBoard;

import java.util.List;
import java.util.Map;
import java.util.Vector;
import javax.servlet.ServletContext;

import common.JDBConnect;

public class InquiryDAO extends JDBConnect {
    public InquiryDAO(ServletContext application) {
        super(application);
    }
    
 // 검색 조건에 맞는 게시물의 개수를 반환합니다.
    public int selectCount(Map<String, Object> map, String sessionNik, String viewValue) {
        int totalCount = 0; // 결과(게시물 수)를 담을 변수
        String query = "SELECT COUNT(*) FROM inquiry";  // 게시물 수를 얻어오는 쿼리문 작성
        
        if (!"admin".equals(sessionNik)) {
            query += " WHERE nik = '" + sessionNik + "'";
        }
        
        
        if (map.get("searchWord") != null) {
            if (!"admin".equals(sessionNik)) {
                query += " AND " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%'";
            } else {
                query += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%'";
            }
        }
        
        if(viewValue != null && !viewValue.equals("viewAll")) { // 전체보기가 아닐경우 미답변한 게시글만 출력
    	  query += " AND icomment is null ";
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
    
    // 검색조건에 맞는 리스트를 반환합니다.
    public List<InquiryDTO> selectList(Map<String, Object> map, String sessionNik, String viewValue) { 
        List<InquiryDTO> bbs = new Vector<InquiryDTO>();  // 결과(게시물 목록)를 담을 변수
        
        String query = "SELECT * FROM inquiry";
        if ("admin".equals(sessionNik)) {  // 현재 로그인한 사용자가 관리자일 경우 모든 문의사항(inquiry) 데이터를 가져옴
        	query += " WHERE nik is not null ";
        }
        else {  // 현재 로그인한 사용자가 관리자가 아닐 경우 해당 사용자가 작성한 문의사항 데이터만 가져옴
            query += " WHERE nik='" + sessionNik + "'";
        }
        
        if(viewValue != null && !viewValue.equals("viewAll")) { // 전체보기가 아닐경우 미답변한 게시글만 출력
    	  query += " AND icomment is null ";
        }
        
        if (map.get("searchWord") != null) {
            query += " AND " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%' ";
        }

        query += " ORDER BY num DESC "; 
        
        try {
            stmt = con.createStatement();   // 쿼리문 생성
            rs = stmt.executeQuery(query);  // 쿼리 실행

            while (rs.next()) {  // 결과를 순회하며...
                // 한 행(게시물 하나)의 내용을 DTO에 저장
                InquiryDTO dto = new InquiryDTO(); 

                dto.setNum(rs.getString("num"));          // 글번호
                dto.setTitle(rs.getString("title"));      // 글제목
                dto.setIcontent(rs.getString("icontent"));  // 글내용
                dto.setNik(rs.getString("nik"));            // 작성자 아이디
                dto.setIcomment(rs.getString("icomment"));  // 조회수

                bbs.add(dto);  // 결과 목록에 저장
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }

        return bbs;
    }



    // 게시글 데이터를 받아 DB에 추가합니다. 
    public int insertWrite(InquiryDTO dto) {
        int result = 0;
        
        try {
            // INSERT 쿼리문 작성 
            String query = "INSERT INTO inquiry ( "
                         + " num,title,icontent,nik) "
                         + " VALUES ( "
                         + " seq_inquiry_num.NEXTVAL, ?, ?, ?)";  

            psmt = con.prepareStatement(query);  // 동적 쿼리 
            psmt.setString(1, dto.getTitle());  
            psmt.setString(2, dto.getIcontent());
            psmt.setString(3, dto.getNik());
            
            result = psmt.executeUpdate(); 
        }
        catch (Exception e) {
            System.out.println("게시물 입력 중 예외 발생");
            e.printStackTrace();
        }
        
        return result;
    }

 // 댓글 데이터를 받아 DB에 추가합니다. 
    public int insertIcomment(InquiryDTO dto) {
        int result = 0;
        
        try {
            // INSERT 쿼리문 작성 
            String query = "UPDATE inquiry SET "
                         + " icomment = ? "
                         + " WHERE num=?";
            
            psmt = con.prepareStatement(query);  // 동적 쿼리 
            psmt.setString(1, dto.getIcomment()); 
            psmt.setString(2, dto.getNum());
            
            result = psmt.executeUpdate(); 
        }
        catch (Exception e) {
            System.out.println("댓글 입력 중 예외 발생");
            e.printStackTrace();
        }
        
        return result;
    }
    

    // 지정한 게시물을 찾아 내용을 반환합니다.
    public InquiryDTO selectView(String num) { 
        InquiryDTO dto = new InquiryDTO();
        
        // 쿼리문 준비
        String query = "SELECT I.*, M.nik " 
                     + " FROM member1 M INNER JOIN inquiry I " 
                     + " ON M.nik=I.nik "
                     + " WHERE num=?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, num);    // 인파라미터를 일련번호로 설정 
            rs = psmt.executeQuery();  // 쿼리 실행 

            // 결과 처리
            if (rs.next()) {
                dto.setTitle(rs.getString("title")); 
                dto.setIcontent(rs.getString("icontent"));
                dto.setNik(rs.getString("nik"));
                dto.setIcomment(rs.getString("icomment"));
                dto.setNum(rs.getString("num")); 
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 상세보기 중 예외 발생");
            e.printStackTrace();
        }
        
        return dto; 
    }

    
    // 지정한 게시물을 수정합니다.
    public int updateEdit(InquiryDTO dto) { 
        int result = 0;
        
        try {
            // 쿼리문 템플릿 
            String query = "UPDATE inquiry SET "
                         + " title=?, icontent=? "
                         + " WHERE num=?";
            
            // 쿼리문 완성
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getIcontent());
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
    public int deletePost(InquiryDTO dto) { 
        int result = 0;

        try {
            // 쿼리문 템플릿
            String query = "DELETE FROM inquiry WHERE num=?"; 

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
