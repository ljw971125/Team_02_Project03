package mvc2InquiryBoard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.JSFunction;

public class InquiryEditController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		String sessionNik = (String) session.getAttribute("UserNik");
		String num = req.getParameter("num");
		String virtualnum = req.getParameter("virtualnum");
		InquiryDAO dao = new InquiryDAO();
		InquiryDTO dto = dao.selectView(num);
		// System.out.println(virtualnum); // 값 들어옴

		if (sessionNik.equals("admin") || sessionNik.equals(dto.getNik())) {
			req.setAttribute("dto", dto);
			req.setAttribute("virtualnum", virtualnum);
			req.getRequestDispatcher("/MVC2Inquiry/InquiryEdit.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 수정 내용을 매개변수에서 얻어옴
		String num = req.getParameter("num");
		String virtualnum = req.getParameter("virtualnum");
		String title = req.getParameter("title");
		String icontent = req.getParameter("icontent");

		// 닉네임은 session에서 가져옴
		HttpSession session = req.getSession();
		String sessionNik = (String) session.getAttribute("UserNik");

		// DTO에 저장
		InquiryDAO dao = new InquiryDAO();
		InquiryDTO dto = dao.selectView(num);
		dto.setTitle(title);
		dto.setIcontent(icontent);

		if (sessionNik.equals(dto.getNik())) {
			// DB에 수정 내용 반영

			int result = dao.updateEdit(dto);
			dao.close();

			// 성공 or 실패?
			if (result == 1) { // 수정 성공
				resp.sendRedirect("../mvc2/inquiryview.do?num=" + num + "&virtualnum=" + virtualnum);
			}
		} else { // 수정 실패
			JSFunction.alertLocation(resp, "오류가 발생하였습니다.", "../mvc2/inquiryview.do?num=" + num);
		}
	}
}
