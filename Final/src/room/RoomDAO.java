package room;

import java.util.ArrayList;

import common.JDBConnect;
import signUp.SignUpDTO;

public class RoomDAO extends JDBConnect {
    // 명시한 데이터베이스로의 연결이 완료된 MemberDAO 객체를 생성합니다.
    public RoomDAO(String drv, String url, String id, String pw) {
        super(drv, url, id, pw);
    }
    public ArrayList<RoomDTO> getList(int num){
		ArrayList<RoomDTO> roomList = null;
		String query = "SELECT num,area,capacity,airConditioner,computer,whiteboard,"
				+ " wifi, refrigerator, price"
				+ " FROM room WHERE num=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
			roomList = new ArrayList<RoomDTO>();
			while (rs.next()) {
				RoomDTO dto = new RoomDTO();
				dto.setNum(rs.getInt("num"));
				dto.setArea(rs.getInt("area"));
				dto.setCapacity(rs.getInt("capacity"));
				dto.setComputer(rs.getInt("computer"));
				dto.setWhiteboard(rs.getInt("whiteboard"));
				dto.setWifi(rs.getString("wifi"));
				dto.setRefrigerator(rs.getInt("refrigerator"));
				dto.setPrice(rs.getInt("price"));
				
				roomList.add(dto);
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return roomList;
	}

}
