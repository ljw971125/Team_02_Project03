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
        HttpSession session = req.getSession(); // HttpSession 객체 생성
        String nik = (String) session.getAttribute("UserNik"); // 현재 로그인 한 유저의 닉네임 저장
        String rdate = req.getParameter("rdate"); // 선택한 예약 날짜 저장
        String rtime = req.getParameter("rtime"); // 선택한 예약 시간 저장
        int price = Integer.parseInt(req.getParameter("price")); // 예약 시간에 따라 계산된 가격 저장 
        int room = Integer.parseInt(req.getParameter("room")); // 예약한 호실 저장
        
        String db_firstTime = ""; // 데이터 베이스에서 불러온 00:00~00:00 형태의 데이터에서 앞 시간만 저장하는 변수
        String db_lastTime = ""; // 데이터 베이스에서 불러온 00:00~00:00 형태의 데이터에서 뒤 시간만 저장하는 변수

        String my_firstTime = ""; // 사용자가 선택한 00:00~00:00 형태의 데이터에서 앞 시간만 저장하는 변수
        String my_lastTime = ""; // 사용자가 선택한 00:00~00:00 형태의 데이터에서 뒤 시간만 저장하는 변수

        int[] timeList = new int[100]; // DB에 저장된 시간 데이터 저장 배열
        int[] timeList2 = new int[100]; // 예약 페이지에서 선택한 시간 데이터 저장 배열
        int cnt = 0; // 증가 변수
        String resTime = ""; // db에서 불러온 시간 데이터 저장 변수

        my_firstTime = rtime.substring(0, 2).replace(":", ""); // 사용자가 선택한 데이터의 처음으로 선택한 시간을 2자리수로 추출하여 저장
        my_lastTime = rtime.substring(6, 8).replace(":", ""); // 사용자가 선택한 데이터의 마지막으로 선택한 시간을 2자리수로 추출하여 저장

        int roomCheck = 0; // 현재 예약 하려고 하는 회의실과 같은 호실을 예약하는지 판별하기 위한 변수
        String nikCheck = ""; // 현재 로그인된 사용자와 같은 닉네임인지 판별하기 위한 변수
        boolean isCheck = false; // 예약 성공인지 실패인지 판별하기 위한 변수

        ReservationDTO dto = new ReservationDTO(); // ReservatoinDTO 객체 생성
        ReservationDAO dao = new ReservationDAO(); // ReservatoinDAO 객체 생성

        ArrayList<ReservationDTO> time = dao.reservationCheck(rdate); // rdate에 해당하는 예약 정보를 데이터베이스에서 조회하여 ArrayList<ReservationDTO> 객체에 저장

        // DB에 저장된 시간 데이터 구하기
        
        // time변수에 저장된 ReservationDTO 객체를 reservation에 순차적으로 할당하여 반복
        for (ReservationDTO reservation : time) {
            resTime = reservation.getRtime(); // reservation에 저장된 ReservationDTO 객체의 예약 시간 데이터 저장 
            db_firstTime = resTime.substring(0, 2).replace(":", ""); // db에 저장된 00:00~00:00 형태의 데이터에서 처음으로 선택한 시간을 2자리수로 추출하여 저장
            db_lastTime = resTime.substring(6, 8).replace(":", ""); // db에 저장된 00:00~00:00 형태의 데이터에서 마지막으로 선택한 시간을 2자리수로 추출하여 저장

            // db에 저장된 시간에서 처음으로 선택한 시간을 초기값으로 설정하여 처음으로 선택한 시간부터 마지막으로 선택한 시간까지 반복
            for (int i = Integer.parseInt(db_firstTime); i <= Integer.parseInt(db_lastTime); i++) { 
            	// 처음 선택한 값과 마지막으로 선택한 값이 같을 때 예외처리 되는것을 방지하기 위한 조건(마지막과 처음선택한 값이 같을 때도 동일) ex) my: 11:00~13:00, db: 13:00~16:00 | my: 13:00~16:00, db: 11:00~13:00
                if (!db_lastTime.equals(my_firstTime) && !db_firstTime.equals(my_lastTime)) {
                    timeList[cnt] = i; // 조건을 만족할 때 i값을 db 시간 저장 배열에 저장(index:cnt)
                    cnt++; // cnt값 1 증가
                }
            }
            roomCheck = reservation.getNum(); //ReservationDTO객체에 저장된 호실 정보를 저장
            nikCheck = reservation.getNik(); //ReservationDTO객체에 저장된 닉네임 정보를 저장 
        }

        // 내가 선택한 시간 데이터 구하기
        cnt = 0; // cnt 값 초기화 
        
        // 사용자가 선택한 시간에서 처음으로 선택한 시간을 초기값으로 설정하여 처음으로 선택한 시간부터 마지마긍로 선택한 시간까지 반복
        for (int i = Integer.parseInt(my_firstTime); i <= Integer.parseInt(my_lastTime); i++) {
            timeList2[cnt] = i; // i값을 사용자 시간 저장 배열에 저장
            cnt++; // cnt값 1 증가
        }

        
        // 시간 중복 체크
        // db 시간 저장 배열만큼 반복
        for (int i = 0; i < timeList.length; i++) {
            if (timeList[i] > 0) { // 만약 배열의 값이 0보다 클 때 
                for (int j = 0; j < timeList2.length; j++) { // 사용자 시간 저장 배열만큼 반복
                    if (timeList2[j] > 0) {
                        if ((timeList[i] == timeList2[j] && roomCheck == room) || !nikCheck.equals(nik)) { // 만약 db 시간 저장 배열값과 사용자 시간 저장 배열값이 같고 db에 저장된 호실과 사용자가 예약한 호실이 같을 때 또는 db에 저장된 닉네임과 사용자 닉네임이 같지 않을 때 
                            isCheck = true; // 조건이 만족할 때 true값 저장
                            break; // 반복문을 빠져나가기 위함
                        }
                    }
                }
            }
            if (isCheck) { // isCheck가 true일 때
                break; // 반복문 빠져나가기
            }
        }

        if (!isCheck) { // 만약 isCheck가 false일 때
        	// dto에 사용자가 선택한 예약 정보를 db에 삽입
            dto.setNik(nik);
            dto.setRdate(rdate);
            dto.setPrice(price);
            dto.setRtime(rtime);
            dto.setNum(room);

            dao.insertReservationInfo(dto); // dto정보를 insertReservationInfo()함수를 호출하여 db에 데이터 삽입
            session.setAttribute("reservationComplete", 1); // 예약 완료 여부를 세션에 저장
        } else {
            session.setAttribute("reservationError", 0); // 예약 실패 여부를 세션에 저장
        }

        dao.close(); // 데이터베이스 연결을 종료
        req.getRequestDispatcher("/Reservation/saveReservationInfo.jsp").forward(req, resp); // 현재 요청(request)과 응답(response) 객체를 "/Reservation/saveReservationInfo.jsp"로 전달하여 페이지 이동
    }
}