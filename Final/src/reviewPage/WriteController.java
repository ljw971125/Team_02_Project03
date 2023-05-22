package reviewPage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteController extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		
		  String rct = req.getParameter("contentDetail"); 
		  //int star=Integer.parseInt(req.getParameter("rating")); 
		  //int room=Integer.parseInt(req.getParameter("room"));
		  //int star=5;
		  String rating = req.getParameter("rating");
		  int star=0;
		  if (rating != null) {
		      star = Integer.parseInt(rating);
		  } else {
		      System.out.print("어쩔");
		  }
		  //int room=101;
		  String rooming = req.getParameter("room");
		  int room=0;
		  if (rooming != null) {
		      room = Integer.parseInt(rooming);
		  } else {
		      // null일 경우의 처리
			  System.out.print("저쩔");
		  }
		  
	/*	  String rct ="안녕하세요"; int star = 5; int room = 101;*/
		  
		  String nik = "장기헌"; //System.out.println(room);
		  ReviewDAO dao = new ReviewDAO(); 
		  DetailReview dto = new DetailReview();
		  dao.reviewWrite(rct,star, room, nik);
		  
		  List<DetailReview>DetailReview = dao.reviewList(room); 
		  dao.close(); // DB 연결닫기
		  
		  System.out.println(DetailReview);
		  req.setAttribute("DetailReview",DetailReview); 
		  req.getRequestDispatcher("/Detail/detail.jsp").forward(req, resp);
		 
		
		
		
	}

}
