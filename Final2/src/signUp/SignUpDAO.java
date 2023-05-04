package signUp;

import java.util.ArrayList;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class SignUpDAO extends JDBConnect{
	
	public SignUpDAO (ServletContext application) {
		super(application);
	}
	//전체 데이터 출력
		public ArrayList<SignUpDTO> getList(){
			ArrayList<SignUpDTO> testList = null;
			String query = "select * from member1";
			try {
				psmt = con.prepareStatement(query);
				rs = psmt.executeQuery();
				testList = new ArrayList<SignUpDTO>();
				while (rs.next()) {
					SignUpDTO dto = new SignUpDTO();
					dto.setId(rs.getString("id"));
					dto.setPw(rs.getString("pw"));
					dto.setName(rs.getString("name"));
					dto.setBirth(rs.getString("birth"));
					dto.setPhone(rs.getString("phone"));
					dto.setAdr(rs.getString("adr"));
					dto.setNik(rs.getString("nik"));
					dto.setJdate(rs.getString("jdate"));
					
					testList.add(dto);
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
			return testList;
		}
		
	public int insert_member(SignUpDTO dto) {
		int result = 0;
		
		try {
			
			String query = "insert into member1 "
						 + " values ( "
						 + "?,?,?,?,?,?,?,?,?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getBirth());
			psmt.setString(5, dto.getPhone());
			psmt.setString(6, dto.getAdr());
			psmt.setString(7, dto.getNik());
			psmt.setString(8, dto.getJdate());
			psmt.setInt(9, dto.getMoney());
			result = psmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}	
		return result;
	}
	
	// 이름 중복체크하기 위한 메서드
	public boolean checkIdExists(String id) {
		  boolean exists = false;

		  try {
		    String query = "SELECT * FROM member1 WHERE id=?";
		    psmt = con.prepareStatement(query);
		    psmt.setString(1, id);
		    rs = psmt.executeQuery();

		    if (rs.next()) {
		      exists = true;
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

		  return exists;
	}
	// 닉네임 중복체크하기 위한 메서드
	public boolean checkNikExists(String nik) {
		  boolean exists = false;

		  try {
		    String query = "SELECT * FROM member1 WHERE nik=?";
		    psmt = con.prepareStatement(query);
		    psmt.setString(1, nik);
		    rs = psmt.executeQuery();

		    if (rs.next()) {
		      exists = true;
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

		  return exists;
	}
}
