package reservation;

public class ReservationDTO {
	
	private int num;        // 회의실 호수
	private String nik;     // 회원 닉네임
	private String rtime;   // 예약 시간
	private int rnum;       // 예약 번호
	private String rdate;   // 예약 날짜
	private int price;     // �삁�빟湲덉븸
	
	
	
	
	public ReservationDTO() {

	}
	
	
	
	public ReservationDTO(int num, String nik, String rtime, int rnum, String rdate, int price) {
		super();
		this.num = num;
		this.nik = nik;
		this.rtime = rtime;
		this.rnum = rnum;
		this.rdate = rdate;
		this.price = price;
	}



	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getNik() {
		return nik;
	}
	public void setNik(String nik) {
		this.nik = nik;
	}
	public String getRtime() {
		return rtime;
	}
	public void setRtime(String rtime) {
		this.rtime = rtime;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate.substring(0, 10);
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
	

}
