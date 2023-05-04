package customerInquiryBoard;

public class InquiryDTO {
    // 멤버 변수 선언 - 필드
    private String title;
    private String icontent;
    private String nik;
    private String icomment;
    private int num;
    
    // 멤버 변수별 게터와 세터 메서드

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIcontent() {
		return icontent;
	}
	public void setIcontent(String icontent) {
		this.icontent = icontent;
	}
	public String getNik() {
		return nik;
	}
	public void setNik(String nik) {
		this.nik = nik;
	}
	public String getIcomment() {
		return icomment;
	}
	public void setIcomment(String icomment) {
		this.icomment = icomment;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}

}
