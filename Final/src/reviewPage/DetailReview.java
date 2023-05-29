package reviewPage;

public class DetailReview {
	private int num;
	private String nik;
	private String recontent;
	private String rate;
	private String Redate;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getRedate() {
		return Redate;
	}
	public void setRedate(String redate) {
		Redate = redate.substring(0,10);
	}
	public String getNik() {
		return nik;
	}
	public void setNik(String nik) {
		this.nik = nik;
	}
	public String getRecontent() {
		return recontent;
	}
	public String getRate() {
		return rate;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}

}
