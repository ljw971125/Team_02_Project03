package reservation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;



public class ReservationController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String nik = "장기헌";
		
		
		ReservationDAO dao = new ReservationDAO();
		ReservationDTO dto = new ReservationDTO();
		
		List<ReservationDTO> reviewLists = dao.mReview(nik);  // 게시물 목록 받기
		int recordCount=dao.countReview(nik);
        dao.close(); // DB 연결 닫기
        System.out.println(reviewLists);
        req.setAttribute("reviewLists", reviewLists);
        req.setAttribute("recordCount", recordCount);
        req.getRequestDispatcher("/MyPage/mypage2.jsp").forward(req, resp);
        
	}
}
