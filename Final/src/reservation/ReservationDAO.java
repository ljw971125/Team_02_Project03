package reservation;

import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import common.DBConnPool;
import common.JDBConnect;
import reservation.*;
import signUp.SignUpDTO;

public class ReservationDAO extends DBConnPool {

	public ReservationDAO() {
		super();
	}

	/*
	 * public void insertReservationInfo(ReservationDTO dto) { int result = 0;
	 * 
	 * try {
	 * 
	 * // 예약 정보 저장 String query =
	 * "INSERT INTO reservation (num, nik, rtime, rnum, rdate, price) VALUES (?, ?, ?,reservation_seq.NEXTVAL, ?, ?)"
	 * ; psmt = con.prepareStatement(query); psmt.setInt(1, dto.getNum());
	 * psmt.setString(2, dto.getNik()); psmt.setString(3, dto.getRtime());
	 * psmt.setString(4, dto.getRdate()); psmt.setInt(5, dto.getPrice());
	 * psmt.executeUpdate(); } catch (Exception e) { e.printStackTrace(); } }
	 */

	public int insertReservationInfo(ReservationDTO dto) {
		int result = 0;

		try {

			// 예약 정보 저장
			String query = "INSERT INTO reservation (num, nik, rtime, rnum, rdate, price) VALUES (?, ?, ?,reservation_seq.NEXTVAL, ?, ?)";
			psmt = con.prepareStatement(query);
			psmt.setInt(1, dto.getNum());
			psmt.setString(2, dto.getNik());
			psmt.setString(3, dto.getRtime());
			psmt.setString(4, dto.getRdate());
			psmt.setInt(5, dto.getPrice());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}

	
	// 전체 데이터 출력
	/*
	 * public ArrayList<ReservationDTO> reservationList() {
	 * ArrayList<ReservationDTO> resList = null; String query =
	 * "select * from reservation"; try { psmt = con.prepareStatement(query); rs =
	 * psmt.executeQuery(); resList = new ArrayList<ReservationDTO>(); while
	 * (rs.next()) { ReservationDTO dto = new ReservationDTO();
	 * dto.setNik(rs.getString("Nik")); dto.setNum(rs.getInt("num"));
	 * dto.setPrice(rs.getInt("price")); dto.setRdate(rs.getString("rdate"));
	 * dto.setRnum(rs.getInt("rnum")); dto.setRtime(rs.getString("rtime"));
	 * 
	 * resList.add(dto); } } catch (Exception e) { e.printStackTrace(); } return
	 * resList; }
	 */
	// 전체 데이터 출력
	public ArrayList<ReservationDTO> reservationList() {
		ArrayList<ReservationDTO> resList = null;
		String query = "select * from reservation";
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			resList = new ArrayList<ReservationDTO>();
			while (rs.next()) {
				ReservationDTO dto = new ReservationDTO();
				dto.setNik(rs.getString("Nik"));
				dto.setNum(rs.getInt("num"));
				dto.setPrice(rs.getInt("price"));
				dto.setRdate(rs.getString("rdate"));
				dto.setRnum(rs.getInt("rnum"));
				dto.setRtime(rs.getString("rtime"));

				resList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return resList;
	}	


	public List<ReservationDTO> mReview(String id) {
        List<ReservationDTO> reviewList = new ArrayList<ReservationDTO>(); // DTO 객체 리스트 생성
        String query = "SELECT * FROM reservation WHERE Nik=?"; // 쿼리문 템플릿 준비
        try {
            psmt = con.prepareStatement(query); // 쿼리문 준비
            psmt.setString(1, id); // 인파라미터 설정
            
            rs = psmt.executeQuery(); // 쿼리문 실행
            //Class.forName("oracle.jdbc.driver.OracleDriver"); 
            Statement st= con.createStatement();
            

            while (rs.next()) { // 결과를 DTO 객체에 저장하여 리스트에 추가
                ReservationDTO dto = new ReservationDTO();
				/* System.out.println(rs.getTimestamp(5)); */
                dto.setNum(rs.getInt(1));
                dto.setNik(rs.getString(2));
                dto.setRtime(rs.getString(3));
                dto.setRnum(rs.getInt(4));
                dto.setRdate(rs.getString(5).replace("/", "-"));
                dto.setPrice(rs.getInt(6));
                reviewList.add(dto);
            }
 
     
        } catch (Exception e) {
            System.out.println("게시물 상세보기 중 예외 발생");
            e.printStackTrace();
        }
        System.out.println(reviewList);
        return reviewList; // 결과 반환
	}
	
	public int countReservation(String nik) {
		String query = "SELECT * FROM reservation WHERE Nik=?";
		int recordCount = 0;
		try {
		    psmt = con.prepareStatement(query); // 쿼리문 준비
		    psmt.setString(1, nik); // 인파라미터 설정
		    rs = psmt.executeQuery(); // 쿼리문 실행
		    Statement st= con.createStatement();
		    while (rs.next()) { // 결과셋에 포함된 레코드 갯수 카운트
		        recordCount++;
		    }
		 
	      
		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
            e.printStackTrace();
		}
		System.out.println(recordCount);
		return recordCount;

	}
	public void cancelReview(int rnum) {
		String query = "delete FROM reservation WHERE rnum=?";
		try {
		    psmt = con.prepareStatement(query); // 쿼리문 준비
		    psmt.setInt(1, rnum); // 인파라미터 설정
		    psmt.executeUpdate(); // 쿼리문 실행
		    
		    
		 
	      
		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
            e.printStackTrace();
		}
		
		 

	}

}