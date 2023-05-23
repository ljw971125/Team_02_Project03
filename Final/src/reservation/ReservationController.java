package reservation;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReservationController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ReservationDAO dao = new ReservationDAO();
		ReservationDTO dto = new ReservationDTO();
		
		ArrayList<ReservationDTO> reservations = dao.reservationList();
		
		req.setAttribute("reservations", reservations);
		
		System.out.println(reservations);
		
		
		req.getRequestDispatcher("/Reservation/MUFReservation.jsp").forward(req, resp);	
	}
}
