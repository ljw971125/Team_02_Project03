package mvc2InquiryBoard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class InquiryViewController extends HttpServlet {
	protected void service(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {
		
			HttpSession session = req.getSession();
			String sessionNik = (String)session.getAttribute("UserNik");
			
			
	        // 게시물 불러오기
	        InquiryDAO dao = new InquiryDAO();
	        String num = req.getParameter("num");
	        InquiryDTO dto = dao.selectView(num);
	        dao.close();
	        
	        
	        if(sessionNik.equals(dto.getNik()) || sessionNik.equals("admin")) {
	        // 줄바꿈 처리
	        dto.setIcontent(dto.getIcontent().replaceAll("\r\n", "<br/>"));

	        // 게시물(dto) 저장 후 뷰로 포워드
	        req.setAttribute("dto", dto);
	        req.getRequestDispatcher("/MVC2Inquiry/InquiryView.jsp").forward(req, resp);
	    }
	}
}
