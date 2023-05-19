package reservation;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReservationCancelController extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int rnum=Integer.parseInt(req.getParameter("rnum"));
		ReservationDAO dao = new ReservationDAO();
		dao.cancelReview(rnum);
		String nik = "장기헌";
		ReservationDTO dto = new ReservationDTO();
		List<ReservationDTO> reviewLists = dao.mReview(nik);  // 게시물 목록 받기
		int recordCount=dao.countReview(nik);
        dao.close(); // DB 연결 닫기
        
        req.setAttribute("reviewLists", reviewLists);
        req.setAttribute("recordCount", recordCount);
        req.getRequestDispatcher("/MyPage/mypage2.jsp").forward(req, resp);
		
	}
}