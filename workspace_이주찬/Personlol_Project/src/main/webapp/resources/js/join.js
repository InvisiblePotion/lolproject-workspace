// 인풋 값 입력 이벤트 리스너 등록
$('#userid, #userpw, #userpw_chk, #lol-account').on('input', function () {
  // 모든 인풋 값이 채워져 있는지 확인
  if ($('#userid').val() && $('#userpw').val() && $('#userpw_chk').val() && $('#lol-account').val()) {
    // 모든 인풋 값이 채워져 있으면 버튼 활성화
    $('#btnAgree').prop('disabled', false);
  } else {
    // 하나라도 인풋 값이 비어있으면 버튼 비활성화
    $('#btnAgree').prop('disabled', true);
  }
});

$('#userid').blur(function () {
  let $id = $('#userid').val()
  if ($id == '') {
    $('#id_err').html('필수 정보입니다.').css('color', 'red');
  } else if ($id.length < 4 || $id.length >= 10) {
    $('#id_err').html('4~10자만 가능합니다').css('color', 'red');
  } else if ($id.search(/[0-9]/g) < 0 || $id.search(/[a-z]/ig) < 0) {
    $('#id_err').html('영문 숫자만 가능합니다').css('color', 'red');
  } else {
    $('#id_err').html('멋진아이디네요!!').css('color', 'green');
  }
})
$('#userpw').blur(function () {
  let $pw = $('#userpw').val();
  let num = $pw.search(/[0-9]/g);
  let eng = $pw.search(/[a-z]/ig);
  let spe = $pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

  if ($pw == '') {
    $('#pw_err').html('필수 정보입니다.').css('color', 'red')
  } else if ($pw.length < 4 || $pw.length >= 10) {
    $('#id_err').html('');
    $('#pw_err').html('4~10자만 가능합니다').css('color', 'red');
  } else if (num < 0 || eng < 0 || spe < 0) {
    $('#pw_err').html('영문,숫자,특수문자를 혼합하여 사용해주세요').css('color', 'red');
  } else {
    $('#pw_err').html('안전한 비밀번호 입니다!').css('color', 'green');
  }
})
$('#userpw_chk').blur(function () {
  let $pw = $('#userpw').val();
  let $pw_chk = $('#userpw_chk').val();

  if ($pw_chk == '') {
    $('#pwchk_err').html('필수 정보입니다.').css('color', 'red');
  } else if ($pw != $pw_chk) {
    $('#pwchk_err').html('비밀번호가 일치하지 않습니다').css('color', 'red')
  } else {
    $('#pwchk_err').html('일치합니다!').css('color', 'green');
  }
})
$('#lol-account').blur(function () {
  let $account = $('#lol-account').val();
  if($account == ''){
    $('#lol_err').html('필수 정보입니다.').css('color','red')
  }else{
    $('#lol_err').html('입력 되었습니다.').css('color','green')
  }
})

// 버튼클릭시 가입되는 코드 추가
//취소,가입하기 