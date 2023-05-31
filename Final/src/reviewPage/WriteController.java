package reviewPage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class WriteController extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String rct = req.getParameter("contentDetail"); // "contentDetail" 파라미터를 가져옵니다.
		// int star=Integer.parseInt(req.getParameter("rating"));
		// int room=Integer.parseInt(req.getParameter("room"));
		// int star=5;
		String rating = req.getParameter("rating"); // "rating" 파라미터를 가져옵니다.
		int star = 0;
		if (rating != null) {
			star = Integer.parseInt(rating); // "rating" 파라미터가 null이 아니면 정수로 변환합니다.
		} else {
		}
		// int room=101;
		String rooming = req.getParameter("room"); // "room" 파라미터를 가져옵니다.
		int room = 0;
		if (rooming != null) {
			room = Integer.parseInt(rooming); // "room" 파라미터가 null이 아니면 정수로 변환합니다.
		} else {
			// null일 경우의 처리
		}

		HttpSession session = req.getSession(); // 세션을 가져옵니다.
		String nickname = (String) session.getAttribute("UserNik"); // 세션에서 "UserNik" 속성을 가져옵니다.

		ReviewDAO dao = new ReviewDAO(); // ReviewDAO 객체를 생성합니다.
		DetailReview dto = new DetailReview(); // DetailReview 객체를 생성합니다.
		dao.reviewWrite(rct, star, room, nickname); // reviewWrite 메소드를 호출하여 게시물을 작성합니다.

		List<DetailReview> DetailReview = dao.reviewList(room); // 게시물 목록 받기
		dao.close(); // DB 연결닫기

		req.setAttribute("DetailReview", DetailReview); // "DetailReview" 속성을 설정합니다.
		req.getRequestDispatcher("/Detail/detail.jsp").forward(req, resp); // "/Detail/detail.jsp" 페이지로 이동합니다.

	}

}
