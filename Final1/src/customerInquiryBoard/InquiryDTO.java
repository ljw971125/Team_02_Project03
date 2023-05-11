package customerInquiryBoard;

public class InquiryDTO {
    // 멤버 변수 선언 - 필드
    private String title;    //글제목
    private String icontent; //글내용
    private String nik;		 //회원닉네임
    private String icomment; //관리자댓글
    private String num;		 //글번호
    private String id;
    
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
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

}
