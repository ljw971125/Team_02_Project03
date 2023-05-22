package signUp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import signUp.*;
public class RegisterController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    // 사용자가 입력한 정보를 가져옴
	    String id = req.getParameter("id");
	    String pw = req.getParameter("pw");
	    String name = req.getParameter("name");
	    String birth = req.getParameter("birth");
	    String gender = req.getParameter("gender");
	    String phone = req.getParameter("phone");
	    String adr = req.getParameter("adr");
	    String nik = req.getParameter("nik");
	    

	    // SignUpDAO 객체 생성
	    SignUpDAO dao = new SignUpDAO();

	    // 아이디와 닉네임 중복 확인
	    boolean idExists = dao.checkIdExists(id);
	    boolean nikExists = dao.checkNikExists(nik);

	    if (!idExists && !nikExists) {
	        // 아이디와 닉네임 중복 없음

	        // SignUpDTO 객체 생성
	        SignUpDTO dto = new SignUpDTO();
	        dto.setId(id);
	        dto.setPw(pw);
	        dto.setName(name);
	        dto.setBirth(birth);
	        dto.setGender(gender);
	        dto.setPhone(phone);
	        dto.setAdr(adr);
	        dto.setNik(nik);
	        
	        // 데이터베이스에 정보 저장
	        int result = dao.insert_member(dto);

	        // 결과 처리
	        if (result > 0) {
	            // 회원가입 성공
	            req.getRequestDispatcher("../index.jsp").forward(req, resp);
	        }
	        else {
	            // 회원가입 실패
	        	req.setAttribute("registerErrMsg", "회원가입 오류입니다."); 
	            req.getRequestDispatcher("/LogIn/register.jsp").forward(req, resp);
	        }
	    }
	    else {
	        // 아이디나 닉네임 중복 있음
	        req.setAttribute("duplicateErrMsg", "아이디나 닉네임 중복입니다.");
	    }
	}

}
