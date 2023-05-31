package membership;

import java.io.IOException;
import java.util.*;
import membership.*;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class JoinController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO mDAO = new MemberDAO();

		String uid = req.getParameter("user_id");
		String upass = req.getParameter("user_pw");

		// 세션 객체를 얻음
		HttpSession session = req.getSession();

		List<MemberDTO> mlist = mDAO.getMemberDTO(uid, upass);
		mDAO.close();


		// 로그인 성공 여부에 따른 처리
		if (mlist.size() > 0) {
			// 로그인 성공
			MemberDTO memberDTO = mlist.get(0);
			session.setAttribute("UserId", memberDTO.getId());
			session.setAttribute("UserNik", memberDTO.getNik());
			req.setAttribute("mlist", mlist);
			req.getRequestDispatcher("../index.jsp").forward(req, resp);
		} else {
			// 로그인 실패
			req.setAttribute("LoginErrMsg", "로그인 오류입니다.");
			req.getRequestDispatcher("/LogIn/LoginForm.jsp").forward(req, resp);
		}
	}
}
