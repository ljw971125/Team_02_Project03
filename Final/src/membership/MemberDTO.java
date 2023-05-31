package membership;

import java.lang.*;

public class MemberDTO {
	// 멤버 변수 선언 - 필드
	private String id;
	private String pw;
	private String name;
	private String birth;
	private String gender;
	private String phone;
	private String adr;
	private String nik;
	private String jdate;
	private int num;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth.substring(0, 10);
	}

	public String getGender(String gender) {
		return gender;
	}

	public void setGender(String gender) {
		// TODO Auto-generated method stub
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAdr() {
		return adr;
	}

	public void setAdr(String adr) {
		this.adr = adr;
	}

	public String getNik() {
		return nik;
	}

	public void setNik(String nik) {
		this.nik = nik;
	}

	public String getJdate() {
		return jdate;
	}

	public void setJdate(String jdate) {
		this.jdate = jdate.substring(0, 10);
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

}