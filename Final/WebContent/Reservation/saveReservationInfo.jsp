<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="reservation.ReservationDAO"%>
<%@ page import="reservation.ReservationDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회의실 예약</title>
</head>
<body>

	<%
	String nik = (String) session.getAttribute("Nik");
	String id = (String) session.getAttribute("UserId");
	String rdate = request.getParameter("rdate");
	String rtime = request.getParameter("rtime");
	int price = Integer.parseInt(request.getParameter("price"));
	int room = Integer.parseInt(request.getParameter("room"));

	boolean isCheck = false;

	ReservationDTO dto = new ReservationDTO();
	ReservationDAO dao = new ReservationDAO();

	ArrayList<ReservationDTO> list = dao.reservationList();
	for (int i = 0; i < list.size(); i++) {
		String rdateCheck = list.get(i).getRdate();
		if (rdateCheck.equals(rdate)) {
			isCheck = false;
			break;
		} else {
			isCheck = true;
		}
	}

	//out.println(isCheck);

	if (isCheck == true) {
		dto.setNik(nik) ;
		dto.setRdate(rdate);
		dto.setPrice(price);
		dto.setRtime(rtime);
		dto.setNum(room);
		
		
		
		dao.insertReservationInfo(dto);
	%>
	<script type="text/javascript">
	alert("예약이 완료되었습니다.");
	location.href = "../index.jsp";
	</script>
	<%	
		
	} else {
	%>
		<script type="text/javascript">
		alert("이미 예약된 날짜입니다.");
		history.back();
		</script>
	<%	
	}
	%>
dao.close();
%>
</body>
</html>