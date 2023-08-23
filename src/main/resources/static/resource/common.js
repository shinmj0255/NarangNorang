$('select[data-value]').each(function(index, item){
	
	const items = $(item);
	
	const defaultValue = items.attr('data-value').trim();
	
	if (defaultValue.length > 0) {
		items.val(defaultValue);
	}
})

$('#goBtn').on('click', function (){

    let date = $('#startDate').val()
    let date2 = $('#endDate').val()
    let city = $('#city').val()
    let state = $('#state').val()
    
    let f1, f2, f3, f4 = false;

    f1 = date != ''? true : false
    f2 = date2 != ''? true : false
    f3 = city != ''? true : false
    f4 = state != '군/구 선택'? true : false

    if ($('loginId').val() != ''){
        if (f1 && f2 && f3 && f4){
            $('#goBtn').attr('type', 'submit')
        }else{
            alert('빈항목이 있습니다.')
        }
    }else{
        alert('로그인 후 사용하세요')
        location.replace('/login')
    }

})