package mvc2InquiryBoard;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.JSFunction;

public class InquiryDeleteController extends HttpServlet{
	protected void service(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {
	        // 게시물 불러오기
			
		HttpSession session = req.getSession();
        String sessionNik = (String)session.getAttribute("UserNik");
		
        	String num = req.getParameter("num");
        	InquiryDAO dao = new InquiryDAO();
	        InquiryDTO dto = dao.selectView(num);
	        
	        if(sessionNik.equals(dto.getNik()) && dto.getIcomment() == null ) {
	        int result = dao.deletePost(num);
	        dao.close();
	        
	        
	        if (result == 1) {  // 게시물 삭제 성공 시 첨부파일도 삭제
            
            JSFunction.alertLocation(resp, "삭제되었습니다.", "../mvc2/inquirylist.do"); }
	        }
	        
	        if(sessionNik.equals("admin")) {
		        int result = dao.deletePost(num);
		        dao.close();
		        
		        if (result == 1) {  // 게시물 삭제 성공 시 첨부파일도 삭제
	            
	            JSFunction.alertLocation(resp, "삭제되었습니다.", "../mvc2/inquirylist.do"); }
		        }
    
    else {  // 비밀번호 불일치
        JSFunction.alertBack(resp, "삭제에 실패했습니다."); }

}
}