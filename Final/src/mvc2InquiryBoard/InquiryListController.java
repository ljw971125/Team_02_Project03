package mvc2InquiryBoard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class InquiryListController extends HttpServlet {

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
       // DAO 생성
       InquiryDAO dao = new InquiryDAO();

        // 뷰에 전달할 매개변수 저장용 맵 생성
        Map<String, Object> map = new HashMap<String, Object>();

        String searchField = req.getParameter("searchField");
        String searchWord = req.getParameter("searchWord");
        String viewValue = req.getParameter("viewValue");
        HttpSession session = req.getSession();
        String sessionNik = (String)session.getAttribute("UserNik");

        System.out.println(sessionNik);
        System.out.println(searchField);
        System.out.println(viewValue);
        System.out.println(searchWord);

        if (searchWord != null) {
            // 쿼리스트링으로 전달받은 매개변수 중 검색어가 있다면 map에 저장
            map.put("searchField", searchField);
            map.put("searchWord", searchWord);
        }


        // 뷰에 전달할 매개변수 추가
            map.put("viewValue", viewValue);
            map.put("sessionNik", sessionNik);
            int totalCount = dao.selectCount(map);  // 게시물 개수
            map.put("totalCount", totalCount);
            System.out.println(totalCount);
            
        List<InquiryDTO> boardLists = dao.selectList(map);  // 게시물 목록 받기
        dao.close(); // DB 연결 닫기

        // 전달할 데이터를 request 영역에 저장 후 List.jsp로 포워드
        req.setAttribute("boardLists", boardLists);
        req.setAttribute("map", map);
        req.getRequestDispatcher("/MVC2Inquiry/InquiryList.jsp").forward(req, resp);
    }

}
