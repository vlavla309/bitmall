const regGap = /\s/g;
const regId = /^[a-zA-Z0-9_]{4,20}$/;  //아이디는 4~20글자 영소문자 숫자
const regPassword = /^[a-zA-Z0-9]{8,20}$/;  //비밀번호는 8~20글자 영대소문자 숫자
const regName = /^[a-zA-Z0-9가-힣]{2,20}$/;  //이름은 2~20글자 영대소문자한글
const regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
const regPhone = /^\d{2,3}-\d{3,4}-\d{4}$/;