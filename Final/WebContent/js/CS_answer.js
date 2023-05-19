/**
 * 
 */

function validateForm(form) {  // 폼 내용 검증 
    if (form.icomment.value == "") {
        alert("답변을 입력하세요.");
        form.icontent.focus();
        return false;
    }
}