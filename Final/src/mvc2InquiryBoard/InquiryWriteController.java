package mvc2InquiryBoard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class InquiryWriteController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/MVC2Inquiry/InquiryWrite.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. 파일 업로드 처리 =============================

		// 2. 파일 업로드 외 처리 =============================
		// 폼값을 DTO에 저장
		InquiryDTO dto = new InquiryDTO();
		HttpSession session = req.getSession();
		String sessionNik = (String) session.getAttribute("UserNik");

		dto.setNik(sessionNik);
		dto.setTitle(req.getParameter("title"));
		dto.setIcontent(req.getParameter("icontent"));

		// DAO를 통해 DB에 게시 내용 저장
		InquiryDAO dao = new InquiryDAO();
		int result = dao.insertWrite(dto);
		dao.close();

		// 성공 or 실패?
		if (result == 1) { // 글쓰기 성공
			resp.sendRedirect("../mvc2/inquirylist.do");
		} else { // 글쓰기 실패
			resp.sendRedirect("../mvc2/write.do");
		}
	}
}
