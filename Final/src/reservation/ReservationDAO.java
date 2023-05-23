package reservation;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletContext;

import common.JDBConnect;
import reservation.*;
import signUp.SignUpDTO;

public class ReservationDAO extends JDBConnect {

	public ReservationDAO(ServletContext application) {
		super(application);
	}

	public ReservationDAO() {
		// TODO Auto-generated constructor stub
	}

	public void insertReservationInfo(ReservationDTO dto) {
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
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

	// 이름 중복체크하기 위한 메서드
	public boolean checkResExists(String rdate) {
		boolean exists = false;

		try {
			String query = "SELECT * FROM reservation WHERE rdate=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, rdate);
			rs = psmt.executeQuery();

			if (rs.next()) {
				exists = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return exists;
	}

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
	
	// 시간 정보
		public String timeCheck(String date) {
			String query = "select rtime from reservation where rdate = ?";
			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1, date);
				rs = psmt.executeQuery();
				ReservationDTO dto = new ReservationDTO();
				dto.setRtime(rs.getString("rtime"));
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return date;
		}

}