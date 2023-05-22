package reviewPage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class reviewController extends HttpServlet{

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		int room = Integer.parseInt(req.getParameter("room"));
        System.out.println(room);
        ReviewDAO dao = new ReviewDAO();
        DetailReview dto = new DetailReview();
        /* System.out.println(dto.getNik()); */
        List<DetailReview> DetailReview = dao.reviewList(room);  // 게시물 목록 받기
        dao.close(); // DB 연결 닫기

        System.out.println(DetailReview);
        req.setAttribute("DetailReview", DetailReview);
        req.getRequestDispatcher("/Detail/detail.jsp").forward(req, resp);
	}
	

}
