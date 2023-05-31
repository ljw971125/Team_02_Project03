package reviewPage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class reviewController extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int room = Integer.parseInt(req.getParameter("room")); // "room" 파라미터를 가져와서 정수로 변환합니다.
		ReviewDAO dao = new ReviewDAO(); // ReviewDAO 객체를 생성합니다.
		DetailReview dto = new DetailReview(); // DetailReview 객체를 생성합니다.
		/* System.out.println(dto.getNik()); */
		List<DetailReview> DetailReview = dao.reviewList(room); // 게시물 목록 받기
		dao.close(); // DB 연결 닫기

		req.setAttribute("DetailReview", DetailReview); // "DetailReview" 속성을 설정합니다.
		req.getRequestDispatcher("/Detail/detail.jsp").forward(req, resp); // "/Detail/detail.jsp" 페이지로 이동합니다.
	}

}
