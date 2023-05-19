$('#logine_button').click(function(){
  let valId = $('#username').val()
  let valPw = $('#password').val()
  if(valId == ''){
    alert('아이디를 입력해주세요');
  }else if (valPw == ''){
    alert('비밀번호를 입력해주세요')
  }
})

// 버튼기능 추가해야함