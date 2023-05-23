
$('#allAgreeCheckbox').click(function () { //선택시 모두 체크
  if ($('#allAgreeCheckbox').prop('checked')) {
    $('.chk').prop('checked', true);
    $('#btnAgree').prop('disabled',false);
  } else { //전체 선택 해제
    $('.chk').prop('checked', false);
    $('#btnAgree').prop('disabled',true);
  }
});
$('.chk').click(function () { //하나라도 체크 안되있을시 전체선택 체크 해제
  if ($("input[name='Checkbox']:checked").length == 3) {
    $('#allAgreeCheckbox').prop('checked', true);
  } else {
    $('#allAgreeCheckbox').prop('checked', false);
  }
});


$('#agreementCheckbox1,#agreementCheckbox2').on('change',function(){
  var $agreementCheckbox1 = $('#agreementCheckbox1').prop('checked');
  var $agreementCheckbox2 = $('#agreementCheckbox2').prop('checked');

  if ($agreementCheckbox1 && $agreementCheckbox2){
    $('#btnAgree').prop('disabled',false); //체크되어 있으면 활성화
  }else{
    $('#btnAgree').prop('disabled',true); //체크되지 않으면 비활성화
  }
});
