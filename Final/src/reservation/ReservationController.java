package reservation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import membership.MemberDAO;
import membership.MemberDTO;
import reviewPage.ReviewDAO;

import java.util.List;



public class ReservationController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		HttpSession session = req.getSession();
        String nickname = (String) session.getAttribute("UserNik");
		
        MemberDAO mdao = new MemberDAO();               
		ReservationDAO dao = new ReservationDAO();
		ReservationDTO dto = new ReservationDTO();
		ReviewDAO rdao = new ReviewDAO();
		
		List<MemberDTO> memInfo=mdao.memberInfo(nickname);
		int recount=rdao.countReview(nickname);
		List<ReservationDTO> reviewLists = dao.mReview(nickname);  // 게시물 목록 받기
		int reservationCount=dao.countReservation(nickname);
        dao.close(); // DB 연결 닫기
        System.out.println(reviewLists);
        System.out.println(memInfo);
        req.setAttribute("memInfo", memInfo);
        req.setAttribute("reviewLists", reviewLists);
        req.setAttribute("reservationCount", reservationCount);
        req.setAttribute("recount", recount);
        req.getRequestDispatcher("/MyPage/mypage2.jsp").forward(req, resp);
        
	}
}