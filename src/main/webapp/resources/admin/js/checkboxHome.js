$("#stopBtn").click(function(){
	var result = confirm("[off]선택하신 숙소의 상태를 off하시겠습니까?");
	if(!result){
		return;
	}
	//체크된 체크박스의 갯수 구함
	console.log("length: " +$("input:checkbox[name=home_checkBox]:checked").length);
	
	var homeList = new Array();
	var checkbox = $("input:checkbox[name=home_checkBox]:checked");
	
	checkbox.each(function(i){
		
		//체크박스의 부모는 td , td의 부모는 tr이다.
		var tr = checkbox.parent().parent().eq(i); //체크된 체크박스의 tr을 구함
		var td = tr.children(); //체크된 체크박스의 td를 구함
		
		var seq = td.eq(1).text(); // td의 2번째가 home_seq값
		
		homeList.push(seq);
		
	});
		$.ajax({
			
				url		: "homeCheckResult.mdo?homeList="+homeList+"&flag=stop",
				type	: "GET",
				data	: {"homeList" : homeList},
				success	: function(){
					alert("선택된 숙소들의 상태를 off로 변경했습니다.");
					location.href="homeTable.mdo";
				}
			});
	console.log(homeList);
	$("#homeList").html("체크된 row의 모든 home_seq"+ homeList);
});
//정지 해제 버튼 클릭시.
$("#cancleBtn").click(function(){
	var result = confirm("[on]선택한 숙소들의 상태를 on 하시겠습니까?");
	if(!result){
		return;
	}
	//체크된 체크박스의 갯수 구함
	console.log("length: " +$("input:checkbox[name=home_checkBox]:checked").length);
	
	var homeList = new Array();
	var checkbox = $("input:checkbox[name=home_checkBox]:checked");
	
	checkbox.each(function(i){
		
		//체크박스의 부모는 td , td의 부모는 tr이다.
		var tr = checkbox.parent().parent().eq(i); //체크된 체크박스의 tr을 구함
		var td = tr.children(); //체크된 체크박스의 td를 구함
		
		var seq = td.eq(1).text(); // td의 2번째가 home_seq값
		
		homeList.push(seq);
		
	});
		$.ajax({
			
				url		: "homeCheckResult.mdo?homeList="+homeList+"&flag=cancel",
				type	: "GET",
				data	: {"homeList" : homeList},
				success	: function(){
					alert("선택된 숙소들의 상태를 on으로 변경했습니다.");
					location.href="homeTable.mdo";
				}
			});
	console.log(homeList);
	$("#homeList").html("체크된 row의 모든 home"+ homeList);
});


$(function(){
	$("#popbutton").click(function(){
		$('div.modal').modal();
	})
})

