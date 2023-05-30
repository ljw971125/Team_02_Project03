package reservation;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReservationProcessController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String nik = (String) session.getAttribute("UserNik");
		String rdate = req.getParameter("rdate");
		String rtime = req.getParameter("rtime");
		int price = Integer.parseInt(req.getParameter("price"));
		int room = Integer.parseInt(req.getParameter("room"));
		String db_firstTime = "";// 00:00~00:00 형태의 데이터에서 앞 시간만 저장하는 배열
		String db_lastTime = "";// 00:00~00:00 형태의 데이터에서 뒤 시간만 저장하는 배열

		String my_firstTime = "";// 00:00~00:00 형태의 데이터에서 앞 시간만 저장하는 배열
		String my_lastTime = "";// 00:00~00:00 형태의 데이터에서 뒤 시간만 저장하는 배열

		int[] timeList = new int[100]; // DB에 저장된 시간 데이터 저장 배열
		int[] timeList2 = new int[100]; // 예약페이지에서 선택한 시간 데이터 저장 배열
		int cnt = 0;
		String resTime = "";

		my_firstTime = rtime.substring(0, 2).replace(":", "");
		my_lastTime = rtime.substring(6, 8).replace(":", "");

		int roomCheck = 0;
		
		// for(int i = 0; i < timeList2.length; i++) { System.out.println(timeList2[i]
		// +" " + i); }
//        System.out.println(rdate);
		//System.out.println(rtime);
//        System.out.println(price);
		boolean isCheck = false;

		ReservationDTO dto = new ReservationDTO();
		ReservationDAO dao = new ReservationDAO();

		ArrayList<ReservationDTO> time = dao.reservationCheck(rdate);

		// db에 저장된 시간데이터 구하기
		for (ReservationDTO reservation : time) {
			resTime = reservation.getRtime();
			// firstTime = resTime.substring(2, 3);
			db_firstTime = resTime.substring(0, 2).replace(":", "");
			db_lastTime = resTime.substring(6, 8).replace(":", "");
			// System.out.println(firstTime);
			// System.out.println(lastTime);

			for (int i = Integer.parseInt(db_firstTime); i <= Integer.parseInt(db_lastTime); i++) {
				if (!db_lastTime.equals(my_firstTime) && !db_firstTime.equals(my_lastTime)) {
					timeList[cnt] = i; // 앞 시간을 초기값으로 잡고 끝 시간까지 1씩 증가하도록 반복하여 앞 시간과 끝 시간 사이의 시간을 구하여 저장
					//System.out.println("db시간리스트 : " + timeList[cnt]);
					cnt++;
				}
			}
			roomCheck = reservation.getNum();

		}

		// 내가 선택한 시간 데이터 구하기

		// System.out.println(Integer.parseInt(firstTime));
		// System.out.println(lastTime);

		cnt = 0;
		for (int i = Integer.parseInt(my_firstTime); i <= Integer.parseInt(my_lastTime); i++) {
				timeList2[cnt] = i; // 앞 시간을 초기값으로 잡고 끝 시간까지 1씩 증가하도록 반복하여 앞 시간과 끝 시간 사이의 시간을 구하여 저장
				//System.out.println("my시간리스트 : " + timeList2[cnt]);
				//System.out.println("cnt: " + cnt);
				cnt++;
			
		}

		for (int i = 0; i < timeList.length; i++) {
			if (timeList[i] > 0) {
				//System.out.println("db시간리스트 : " + timeList[i]);
				for (int j = 0; j < timeList2.length; j++) {
					if (timeList2[j] > 0) {
						if (timeList[i] == timeList2[j] && roomCheck == room) {
							//System.out.println("my시간리스트 : " + timeList2[j]);
							isCheck = true;
							break;
						}
					}
				}
			}
			if (isCheck) {
				break;
			}
		}

//        ArrayList<ReservationDTO> list = dao.reservationList();
//        for (int i = 0; i < list.size(); i++) {
//            String rdateCheck = list.get(i).getRdate();
//            int roomcheck = list.get(i).getNum();
//            if (rdateCheck.equals(rdate) && roomcheck == room) {
//                isCheck = true;
//                break;
//            } 
//            else {
//              isCheck = true;
//            }
//        }
//        
		if (!isCheck) {
			dto.setNik(nik);
			dto.setRdate(rdate);
			dto.setPrice(price);
			dto.setRtime(rtime);
			dto.setNum(room);

			dao.insertReservationInfo(dto);
			session.setAttribute("reservationComplete", 1);
			// req.setAttribute("reservationTime", );
			// resp.sendRedirect("../index.jsp");
			// req.getRequestDispatcher("/MyPage/mypage2.jsp").forward(req, resp);
		} else {
			session.setAttribute("reservationError", 0);
			// resp.sendRedirect("../reservation.jsp");
			// req.getRequestDispatcher("/MyPage/mypage2.jsp").forward(req, resp);
		}

		/*
		 * for(int i = 0; i < timeList2.length; i++) { timeList2[i] = 0; }
		 */
		dao.close();
		req.getRequestDispatcher("/Reservation/saveReservationInfo.jsp").forward(req, resp);

	}

}
