function CheckAddMember() {
    var id = document.getElementById("id");
    var name = document.getElementById("name");
    var password = document.getElementById("password");
    var email = document.getElementById("mail");
    var tel1 = document.getElementById("phone1");
    var tel2 = document.getElementById("phone2");
    var tel3 = document.getElementById("phone3");

    // 아이디 체크
    if (!check(/^\w{4,10}$/, id, "[아이디]\n4~10자의 영문자, 숫자, 언더스코어(_)만 사용하세요")) {
        return false;
    }

    // 이름 체크
    var nameRegExp = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,}$/;
    if (!check(nameRegExp, name, "한글 2글자 이상 입력하세요.")) {
        return false;
    }

    // 비밀번호 확인 검사
    var pwd = password.value;
    var passwordRegExpArr = [
        /^.{8,15}$/, // 전체길이검사
        /\d/, // 숫자하나 반드시 포함
        /[a-zA-Z]/, // 영문자 반드시 포함
        /[\*!&]/ // 특수문자 반드시 포함
    ];

    for (var i = 0; i < passwordRegExpArr.length; i++) {
        if (!passwordRegExpArr[i].test(pwd)) {
            alert("비밀번호는 8~15자리 숫자/문자/특수문자를 포함해야합니다.");
            password.focus();
            return false;
        }
    }

    // 비밀번호 일치 여부 확인
    if (!isEqualPwd()) {
        return false;
    }

    // 이메일 검사
    var emailRegExp = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;
    if (!check(emailRegExp, email, "올바른 이메일 주소를 입력하세요.")) {
        return false;
    }

    // 전화번호 검사
    if (!check(/^\d{2,3}$/, tel1, "번호 2~3자리를 입력하세요.")) {
        return false;
    }

    if (!check(/^\d{3,4}$/, tel2, "번호 3~4자리를 입력하세요.")) {
        return false;
    }

    if (!check(/^\d{4}$/, tel3, "4자리 번호를 입력하세요.")) {
        return false;
    }

    return true;

    function check(regExp, elem, msg) {
        if (regExp.test(elem.value)) {
            return true;
        }
        alert(msg);
        elem.focus();
        return false;
    }
}
