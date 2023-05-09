package reviewPage;

public class ReviewDTO {
	private String num;
	private String nik;
	private String rnum;
	private String recomment;
	private String title;
	private String recontent;
	private java.sql.Date redate;
	private float rate;
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getNik() {
		return nik;
	}
	public void setNik(String nik) {
		this.nik = nik;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getRecomment() {
		return recomment;
	}
	public void setRecomment(String recomment) {
		this.recomment = recomment;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRecontent() {
		return recontent;
	}
	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}
	public java.sql.Date getRedate() {
		return redate;
	}
	public void setRedate(java.sql.Date redate) {
		this.redate = redate;
	}
	public float getRate() {
		return rate;
	}
	public void setRate(float rate) {
		this.rate = rate;
	}
}
