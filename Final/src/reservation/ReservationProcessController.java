package reservation;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReservationProcessController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
        String nik = (String) session.getAttribute("UserNik");
        String rdate = req.getParameter("rdate");
        String rtime = req.getParameter("rtime");
        int price = Integer.parseInt(req.getParameter("price"));
        int room = Integer.parseInt(req.getParameter("room"));
        
        
        System.out.println(rdate);
        System.out.println(rtime);
        System.out.println(price);
        boolean isCheck = true;

        ReservationDTO dto = new ReservationDTO();
        ReservationDAO dao = new ReservationDAO();

        ArrayList<ReservationDTO> list = dao.reservationList();
        for (int i = 0; i < list.size(); i++) {
            String rdateCheck = list.get(i).getRdate();
            int roomcheck = list.get(i).getNum();
            if (rdateCheck.equals(rdate) && roomcheck == room) {
                isCheck = false;
                break;
            } else {
                isCheck = true;
            }
        }

        if (isCheck) {
            dto.setNik(nik);
            dto.setRdate(rdate);
            dto.setPrice(price);
            dto.setRtime(rtime);
            dto.setNum(room);

            dao.insertReservationInfo(dto);
            session.setAttribute("reservationComplete", 1);
            //resp.sendRedirect("../index.jsp");
            //req.getRequestDispatcher("/MyPage/mypage2.jsp").forward(req, resp);
        } else {
            session.setAttribute("reservationError", 0);
            //resp.sendRedirect("../reservation.jsp");
            //req.getRequestDispatcher("/MyPage/mypage2.jsp").forward(req, resp);
        }
        
        dao.close();
        req.getRequestDispatcher("/Reservation/saveReservationInfo.jsp").forward(req, resp);
        
    }

}
