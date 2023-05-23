/**
 * 
 */
function findID() {
  // 사용자가 입력한 정보 가져오기
  var userName = document.getElementById("uid_name").value;
  var userBirth = document.getElementById("uid_birth").value;
  var userGender = document.querySelector('input[name="user_gender"]:checked').value;

  // 서버 측 코드와 통신하여 데이터베이스에서 ID 값 가져오기
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function() {
    if (xhr.readyState == XMLHttpRequest.DONE) {
      if (xhr.status == 200) {
        // 서버 측 코드에서 반환한 JSON 데이터 파싱
        var data = JSON.parse(xhr.responseText);
		if(data.id==""){
			alert("입력하신 정보와 일치하는 아이디가 없습니다.");
		}
		else{
        // 파싱한 데이터에서 ID 값 출력
        	alert("아이디는 : "+data.id+"입니다.");
        }
      } else {
      	alert("입력하신 정보와 일치하는 아이디가 없습니다.");
      }
    }
  }
  xhr.open("POST", "/Final/LogIn/findID.jsp", true);
  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
  xhr.send("name=" + userName + "&birth=" + userBirth +"&gender=" + userGender);

  // 폼 제출 방지
  return false;
}

function findPW() {
  // 사용자가 입력한 정보 가져오기
  var userName = document.getElementById("upw_name").value;
  var userBirth = document.getElementById("upw_birth").value;
  var userGender = document.querySelector('input[name="user1_gender"]:checked').value;
  var userId = document.getElementById("upw_id").value;

  // 서버 측 코드와 통신하여 데이터베이스에서 ID 값 가져오기
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function() {
    if (xhr.readyState == XMLHttpRequest.DONE) {
      if (xhr.status == 200) {
        // 서버 측 코드에서 반환한 JSON 데이터 파싱
        var data = JSON.parse(xhr.responseText);

        if(data.pw==""){
			alert("입력하신 정보와 일치하는 아이디가 없습니다.");
		}
		else{
        // 파싱한 데이터에서 ID 값 출력
        	alert("비밀번호는 : "+data.pw+"입니다.");
        }
      } else {
      	alert(xhr.status);
      }
    }
  }
  xhr.open("POST", "/Final/LogIn/findPW.jsp", true);
  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
  xhr.send("name=" + userName + "&birth=" + userBirth +"&gender=" + userGender+ "&id=" + userId);

  // 폼 제출 방지
  return false;
}