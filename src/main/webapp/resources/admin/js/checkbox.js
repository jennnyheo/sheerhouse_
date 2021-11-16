$("#stopBtn").click(function(){
	var result = confirm("[정지]선택하신 회원을 정지시키시겠습니까?");
	if(!result){
		return;
	}
	//체크된 체크박스의 갯수 구함
	console.log("length: " +$("input:checkbox[name=user_checkBox]:checked").length);
	
	var emailList = new Array();
	var checkbox = $("input:checkbox[name=user_checkBox]:checked");
	
	checkbox.each(function(i){
		
		//체크박스의 부모는 td , td의 부모는 tr이다.
		var tr = checkbox.parent().parent().eq(i); //체크된 체크박스의 tr을 구함
		var td = tr.children(); //체크된 체크박스의 td를 구함
		
		var email = td.eq(2).text(); // td의 3번째가 email값
		
		emailList.push(email);
		
	});
		$.ajax({
			
				url		: "userCheckResult.mdo?emailList="+emailList+"&flag=stop",
				type	: "GET",
				data	: {"emailList" : emailList},
				success	: function(){
					alert("선택된 사용자들을 정지했습니다.");
					location.href="userTable.mdo";
				}
			});
	console.log(emailList);
	$("#emailList").html("체크된 row의 모든 email"+ emailList);
});
//정지 해제 버튼 클릭시.
$("#cancleBtn").click(function(){
	var result = confirm("[해지]선택한 회원들의 정지를 해지하시겠습니까?");
	if(!result){
		return;
	}
	//체크된 체크박스의 갯수 구함
	console.log("length: " +$("input:checkbox[name=user_checkBox]:checked").length);
	
	var emailList = new Array();
	var checkbox = $("input:checkbox[name=user_checkBox]:checked");
	
	checkbox.each(function(i){
		
		//체크박스의 부모는 td , td의 부모는 tr이다.
		var tr = checkbox.parent().parent().eq(i); //체크된 체크박스의 tr을 구함
		var td = tr.children(); //체크된 체크박스의 td를 구함
		
		var email = td.eq(2).text(); // td의 3번째가 email값
		
		emailList.push(email);
		
	});
		$.ajax({
			
				url		: "userCheckResult.mdo?emailList="+emailList+"&flag=cancel",
				type	: "GET",
				data	: {"emailList" : emailList},
				success	: function(){
					alert("해당하는 사용자들을 해지하였습니다.");
					location.href="userTable.mdo";
				}
			});
	console.log(emailList);
	$("#emailList").html("체크된 row의 모든 email"+ emailList);
});


$(function(){
	$("#popbutton").click(function(){
		$('div.modal').modal();
	})
})

