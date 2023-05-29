package reviewPage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReviewDeleteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int room = Integer.parseInt(req.getParameter("room"));
		int num = Integer.parseInt(req.getParameter("num"));
		System.out.println(room);
		System.out.println(num);
		ReviewDAO dao = new ReviewDAO();
		ReviewDTO dto = new ReviewDTO();
		dao.deletePost(num);
		List<DetailReview> DetailReview = dao.reviewList(room);  // 게시물 목록 받기
        dao.close(); // DB 연결 닫기

        System.out.println(DetailReview);
        req.setAttribute("DetailReview", DetailReview);
        req.getRequestDispatcher("/Detail/detail.jsp").forward(req, resp);
	}
	

}

