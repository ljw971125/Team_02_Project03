package reviewPage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReviewDeleteController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int room = Integer.parseInt(req.getParameter("room")); // "room" 파라미터를 가져와서 정수로 변환합니다.
		int num = Integer.parseInt(req.getParameter("num")); // "num" 파라미터를 가져와서 정수로 변환합니다.
		ReviewDAO dao = new ReviewDAO(); // ReviewDAO 객체를 생성합니다.
		ReviewDTO dto = new ReviewDTO(); // ReviewDTO 객체를 생성합니다.
		dao.deletePost(num); // deletePost 메소드를 호출하여 게시물을 삭제합니다.
		List<DetailReview> DetailReview = dao.reviewList(room); // 게시물 목록 받기
		dao.close(); // DB 연결 닫기

		req.setAttribute("DetailReview", DetailReview); // "DetailReview" 속성을 설정합니다.
		req.getRequestDispatcher("/Detail/detail.jsp").forward(req, resp); // "/Detail/detail.jsp" 페이지로 이동합니다.
	}

}
