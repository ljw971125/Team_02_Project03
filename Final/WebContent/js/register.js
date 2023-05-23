/**
 * 
 */
var isDuplicateChecked = false;
var isDuplicateChecked1 = false;

// id 중복체크 기능
function checkDuplicate() {
  var id = document.getElementById('id').value;
  if (!id) {
    alert('아이디를 입력해주세요');
    return;
  }
  var xhr = new XMLHttpRequest();
  xhr.open('GET', '/Final/LogIn/check-duplicate.jsp?id=' + id, true);
  xhr.onload = function() {
    if (this.status === 200) {
      var data = JSON.parse(this.responseText);
      if (data.exists) {
        alert('중복입니다');
        document.getElementById('id').value = '';
      } else {
        alert('사용가능합니다');
        isDuplicateChecked = true;
      }
    }
  };
  xhr.send();
}

// 닉네임 중복체크 기능
function checkDuplicate1() {
  // 입력 필드의 값을 가져옵니다.
  var nik = document.getElementById('nik').value;
  // XMLHttpRequest 객체를 생성합니다.
  if (!nik) {
    alert('닉네임을 입력해주세요');
    return;
  }
  var xhr = new XMLHttpRequest();
  // 새 연결을 엽니다. URL 엔드포인트에서 GET 요청을 사용합니다.
  xhr.open('GET', '/Final/LogIn/check-duplicate1.jsp?nik=' + nik, true);
  // 응답을 처리하는 함수를 설정합니다.
  xhr.onload = function() {
    if (this.status === 200) {
      // JSON 응답을 구문 분석합니다.
      var data = JSON.parse(this.responseText);
      // 이름이 데이터베이스에 있는지 확인합니다.
      if (data.exists) {
        // 메시지를 표시하고 입력 필드를 지웁니다.
        alert('중복입니다');
        document.getElementById('nik').value = '';
      } else {
        // 메시지를 표시합니다.
        alert('사용가능합니다');
        isDuplicateChecked1 = true;
      }
    }
  };
  // 요청을 전송합니다.
  xhr.send();
}

// 입력칸이 비어있거나 중복체크를 실행하지 않았을 경우 알림
function validateForm() {
	  // 입력 필드의 값을 가져옵니다.
	  var name = document.getElementById('name').value;
	  var id = document.getElementById('id').value;
	  var pw = document.getElementById('pw').value;
	  var nik = document.getElementById('nik').value;
	  var birth = document.getElementById('birth').value;
	  var phone = document.getElementById('phone').value;
	  var adr = document.getElementById('adr').value;

	  // 입력 필드의 값이 비어 있는지 확인합니다.
	  if (!name) {
	    // 메시지를 표시합니다.
	    alert('이름 입력칸이 비어있습니다');
	    // memberJoin.jsp로 이동하지 않습니다.
	    return false;
	  }
	  else if(!id){
		// 메시지를 표시합니다.
		    alert('아이디 입력칸이 비어있습니다');
		    // memberJoin.jsp로 이동하지 않습니다.
		    return false;
	  }
 	  else if(!isDuplicateChecked){
		// 메시지를 표시합니다.
		    alert('아이디 중복체크 해주세요');
		    // memberJoin.jsp로 이동하지 않습니다.
		    return false;
	  }
	  else if(!pw){
		// 메시지를 표시합니다.
		    alert('패스워드 입력칸이 비어있습니다');
		    // memberJoin.jsp로 이동하지 않습니다.
		    return false;
	  }
	  else if(!nik){
		// 메시지를 표시합니다.
		    alert('닉네임 입력칸이 비어있습니다');
		    // memberJoin.jsp로 이동하지 않습니다.
		    return false;
	  }
	  else if(!isDuplicateChecked1){
		  alert('닉네임 중복체크 해주세요');
		    // memberJoin.jsp로 이동하지 않습니다.
		    return false;
	  }
	  else if(!birth){
		// 메시지를 표시합니다.
		    alert('생년월일 입력칸이 비어있습니다');
		    // memberJoin.jsp로 이동하지 않습니다.
		    return false;
	  }
	  else if(!phone){
		// 메시지를 표시합니다.
		    alert('핸드폰번호 입력칸이 비어있습니다');
		    // memberJoin.jsp로 이동하지 않습니다.
		    return false;
	  }
	  else if(!adr){
		// 메시지를 표시합니다.
		    alert('주소 입력칸이 비어있습니다');
		    // memberJoin.jsp로 이동하지 않습니다.
		    return false;
	  }

	  // memberJoin.jsp로 이동합니다.
	  return true;
}