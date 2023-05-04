<%@ page import="java.util.*" %>
<%@ page import="signUp.*" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h1>대우직업능력개발원</h1> 


<%
String name = request.getParameter("name");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String nik = request.getParameter("nik");
String birth = request.getParameter("birth");
String phone = request.getParameter("phone");
String adr = request.getParameter("adr");
String jdate = request.getParameter("jdate");

SignUpDTO dto = new SignUpDTO();

dto.setId(id);
dto.setPw(pw);
dto.setNik(nik);
dto.setName(name);
dto.setBirth(birth);
dto.setAdr(adr);
dto.setPhone(phone);
dto.setJdate(jdate);
dto.setMoney(0);

SignUpDAO dao = new SignUpDAO(application);
int isResult = dao.insert_member(dto);


%>

<table border=1>
<tr>
<td>이름</td><td>ID</td>
<td>비번</td><td>닉네임</td>
<td>생년월일</td><td>핸드폰</td>
<td>주소</td><td>가입날짜</td>
<td>보유금액</td>
</tr>


dto에서 데이터 불러오기
<tr>
<td><%=dto.getName() %></td><td><%=dto.getId() %></td>
<td><%=dto.getPw() %></td><td><%=dto.getNik() %></td>
<td><%=dto.getBirth() %></td><td><%=dto.getPhone() %></td>
<td><%=dto.getAdr() %></td><td><%=dto.getJdate() %></td>
<td><%=dto.getMoney() %>

</tr>
</table>






<table border=1>
<tr>
<td>이름</td><td>ID</td>
<td>비번</td><td>닉네임</td>
<td>생년월일</td><td>핸드폰</td>
<td>주소</td><td>가입날짜</td>
<td>보유금액</td>
</tr>


db에서 데이터 불러오기
<%
ArrayList<SignUpDTO> list = dao.getList();
for(int i = 0; i < list.size(); i++){ %>
<tr>
<td><%= list.get(i).getName() %></td>
<td><%= list.get(i).getId() %></td>
<td><%= list.get(i).getPw() %></td>
<td><%= list.get(i).getNik() %></td>
<td><%= list.get(i).getBirth() %></td>
<td><%= list.get(i).getPhone() %></td>
<td><%= list.get(i).getAdr() %></td>
<td><%= list.get(i).getJdate() %></td>
<td><%= list.get(i).getMoney() %></td>
</tr>

<% }%>	

</table>


</body>
</html>