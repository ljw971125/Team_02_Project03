package signUp;

import java.util.ArrayList;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class SignUpDAO extends JDBConnect{
	public SignUpDAO() {}
	
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
					dto.setGender(rs.getString("gender"));
					dto.setPhone(rs.getString("phone"));
					dto.setAdr(rs.getString("adr"));
					dto.setNik(rs.getString("nik"));
					
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
						 + "?,?,?,?,?,?,?,?,sysdate,0)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getBirth());
			psmt.setString(5, dto.getGender());
			psmt.setString(6, dto.getPhone());
			psmt.setString(7, dto.getAdr());
			psmt.setString(8, dto.getNik());
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
		  } 
		  return exists;
	}

	  public String findID(String name, String birth, String gender) {
		    String id = "";
		    try {
		      String query = "SELECT id FROM member1 WHERE name=? AND birth=? AND gender=?";
		      this.psmt = this.con.prepareStatement(query);
		      this.psmt.setString(1, name);
		      this.psmt.setString(2, birth);
		      this.psmt.setString(3, gender);
		      this.rs = this.psmt.executeQuery();
		      if (this.rs.next())
		        id = this.rs.getString("id"); 
		    } catch (Exception e) {
		      e.printStackTrace();
		    } finally {
		      try {
		        if (this.rs != null)
		          this.rs.close(); 
		        if (this.psmt != null)
		          this.psmt.close(); 
		        if (this.con != null)
		          this.con.close(); 
		      } catch (Exception exception) {}
		    } 
		    return id;
		  }
		  
		  public String findPW(String name, String birth, String gender ,String id) {
		    String pw = "";
		    try {
		      String query = "SELECT pw FROM member1 WHERE name=? AND birth=? AND gender=? AND id=?";
		      this.psmt = this.con.prepareStatement(query);
		      this.psmt.setString(1, name);
		      this.psmt.setString(2, birth);
		      this.psmt.setString(3, gender);
		      this.psmt.setString(4, id);
		      this.rs = this.psmt.executeQuery();
		      if (this.rs.next())
		        pw = this.rs.getString("pw"); 
		    } catch (Exception e) {
		      e.printStackTrace();
		    } finally {
		      try {
		        if (this.rs != null)
		          this.rs.close(); 
		        if (this.psmt != null)
		          this.psmt.close(); 
		        if (this.con != null)
		          this.con.close(); 
		      } catch (Exception exception) {}
		    } 
		    return pw;
		  }
}
