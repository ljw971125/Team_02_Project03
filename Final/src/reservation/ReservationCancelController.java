package reservation;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import membership.MemberDAO;
import membership.MemberDTO;
import reviewPage.ReviewDAO;

public class ReservationCancelController extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int rnum = Integer.parseInt(req.getParameter("rnum"));
		HttpSession session = req.getSession();
		String nickname = (String) session.getAttribute("UserNik");
		ReservationDAO dao = new ReservationDAO();
		dao.cancelReview(rnum);

		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = new MemberDTO();
		ReservationDTO dto = new ReservationDTO();
		List<ReservationDTO> reviewLists = dao.mReview(nickname); // 게시물 목록 받기
		ReviewDAO rdao = new ReviewDAO();
		List<MemberDTO> memInfo = mdao.memberInfo(nickname);
		int recount = rdao.countReview(nickname);
		int reservationCount = dao.countReservation(nickname);
		dao.close(); // DB 연결 닫기
		req.setAttribute("memInfo", memInfo);
		req.setAttribute("recount", recount);
		req.setAttribute("reviewLists", reviewLists);
		req.setAttribute("reservationCount", reservationCount);
		req.getRequestDispatcher("/MyPage/mypage2.jsp").forward(req, resp);

	}
}