<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("MMMM MM yyyy", new Locale("en", "US"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/Host/hostSettingPage.css" />
</head>
<body>
 <div class="main">
    <div class="content-wrap">
      
      <div class="content-right">
        <table id="calendar" align="center">
          <thead>
            <tr class="btn-wrap clearfix">
              <td>
                <label id="prev">
                    &#60;
                </label>
              </td>
              
              <td align="center" id="current-year-month" colspan="5"><%= sf.format(nowTime) %></td>
              <td>
                <label id="next">
                    &#62;
                </label>
              </td>
            </tr>
            <tr>
                <td class = "sun" align="center">Sun</td>
                <td align="center">Mon</td>
                <td align="center">Tue</td>
                <td align="center">Wed</td>
                <td align="center">Thu</td>
                <td align="center">Fri</td>
                <td class= "sat" align="center">Sat</td>
              </tr>
          </thead>
          <tbody id="calendar-body" class="calendar-body"></tbody>
        </table>
      </div>
      <div div class="content-left">
      
      	 <h2 class="left-header">예약불가 날짜를 선택해 주세요</h2>
      	<form>
      		<div class="form-container">
      			<div class="form-content">
      			</div>
      		</div>
      		<input class="unusedDateBtn" type="submit" value="설정하기" />
      	</form>
      </div>
    </div>
  </div>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
		var currentTitle = document.getElementById('current-year-month');
		var calendarBody = document.getElementById('calendar-body');
		var today = new Date();
		var first = new Date(today.getFullYear(), today.getMonth(),1);
		var dayList = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
		var monthList = ['January 01','February 02','March 03','April 04','May 05','June 06','July 07','August 08','September 09','October 10','November 11','December 12'];
		var leapYear=[31,29,31,30,31,30,31,31,30,31,30,31];
		var notLeapYear=[31,28,31,30,31,30,31,31,30,31,30,31];
		var pageFirst = first;
		var pageYear;
		if(first.getFullYear() % 4 === 0){
		    pageYear = leapYear;
		}else{
		    pageYear = notLeapYear;
		}
		
		function showCalendar(){
		    let monthCnt = 100;
		    let cnt = 1;
		    for(var i = 0; i < 6; i++){
		        var $tr = document.createElement('tr');
		        $tr.setAttribute('id', monthCnt);   
		        for(var j = 0; j < 7; j++){
		            if((i === 0 && j < first.getDay()) || cnt > pageYear[first.getMonth()]){
		                var $td = document.createElement('td');
		                $tr.appendChild($td);     
		            }else{
		                var $td = document.createElement('td');
		                $td.textContent = cnt;
		                $td.setAttribute('id', cnt);  
		                $td.setAttribute('class', 'dateValue');   
		                $tr.appendChild($td);
		                cnt++;
		            }
		        }
		        monthCnt++;
		        calendarBody.appendChild($tr);
		    }
		}
		showCalendar();
		
		function removeCalendar(){
		    let catchTr = 100;
		    for(var i = 100; i< 106; i++){
		        var $tr = document.getElementById(catchTr);
		        $tr.remove();
		        catchTr++;
		    }
		}
		
		function prev(){
		    /* inputBox.value = ""; */
		    const $divs = document.querySelectorAll('#input-list > div');
		    $divs.forEach(function(e){
		      e.remove();
		    });
		    const $btns = document.querySelectorAll('#input-list > button');
		    $btns.forEach(function(e1){
		      e1.remove();
		    });
		    if(pageFirst.getMonth() === 1){
		        pageFirst = new Date(first.getFullYear()-1, 12, 1);
		        first = pageFirst;
		        if(first.getFullYear() % 4 === 0){
		            pageYear = leapYear;
		        }else{
		            pageYear = notLeapYear;
		        }
		    }else{
		        pageFirst = new Date(first.getFullYear(), first.getMonth()-1, 1);
		        first = pageFirst;
		    }
		    today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
		    currentTitle.innerHTML = monthList[first.getMonth()] + " " + first.getFullYear();
		    removeCalendar();
		    showCalendar();
		    showMain();
		    clickedDate1 = document.getElementById(today.getDate());
		    clickedDate1.classList.add('active');
		    clickStart();
		    reshowingList();
		}

		function next(){
		    /* inputBox.value = ""; */
		    const $divs = document.querySelectorAll('#input-list > div');
		    $divs.forEach(function(e){
		      e.remove();
		    });
		    const $btns = document.querySelectorAll('#input-list > button');
		    $btns.forEach(function(e1){
		      e1.remove();
		    });
		    if(pageFirst.getMonth() === 12){
		        pageFirst = new Date(first.getFullYear()+1, 1, 1);
		        first = pageFirst;
		        if(first.getFullYear() % 4 === 0){
		            pageYear = leapYear;
		        }else{
		            pageYear = notLeapYear;
		        }
		    }else{
		        pageFirst = new Date(first.getFullYear(), first.getMonth()+1, 1);
		        first = pageFirst;
		    }
		    today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
		    currentTitle.innerHTML = monthList[first.getMonth()] + " " + first.getFullYear();
		    removeCalendar();
		    showCalendar(); 
		    showMain();
		    clickedDate1 = document.getElementById(today.getDate());
		    clickedDate1.classList.add('active');  
		    clickStart();
		    reshowingList();
		}
		
		function showMain(){
/* 		    mainTodayDay.innerHTML = dayList[today.getDay()];
		    mainTodayDate.innerHTML = today.getDate(); */
		}
		var clickedDate1 = document.getElementById(today.getDate());
		clickedDate1.classList.add('active');
		var prevBtn = document.getElementById('prev');
		var nextBtn = document.getElementById('next');
		prevBtn.addEventListener('click',prev);
		nextBtn.addEventListener('click',next);
		var tdGroup = [];
		function clickStart(){
		    for(let i = 1; i <= pageYear[first.getMonth()]; i++){
		        tdGroup[i] = document.getElementById(i);
		        tdGroup[i].addEventListener('click',changeToday);
		    }
		}
		function changeToday(e){
		    for(let i = 1; i <= pageYear[first.getMonth()]; i++){
		        if(tdGroup[i].classList.contains('active')){
		            tdGroup[i].classList.remove('active');
		        }
		    }
		    clickedDate1 = e.currentTarget;
		    clickedDate1.classList.add('active');
		    today = new Date(today.getFullYear(), today.getMonth(), clickedDate1.id);
		    showMain();
		    keyValue = today.getFullYear() + '' + today.getMonth()+ '' + today.getDate();
		    reshowingList();
		}
		
		
		function reshowingList(){
		    keyValue = today.getFullYear() + '' + today.getMonth()+ '' + today.getDate();
		    if(todoList[keyValue] === undefined){
		       /*  inputList.textContent = ''; */
		        todoList[keyValue] = [];
		        const $divs = document.querySelectorAll('#input-list > div');
		        $divs.forEach(function(e){
		          e.remove();
		        });
		        const $btns = document.querySelectorAll('#input-list > button');
		        $btns.forEach(function(e1){
		          e1.remove();
		        });
		    }else if(todoList[keyValue].length ===0){
		       /*  inputList.textContent = ""; */
		        const $divs = document.querySelectorAll('#input-list > div');
		        $divs.forEach(function(e){
		          e.remove();
		        });
		        const $btns = document.querySelectorAll('#input-list > button');
		        $btns.forEach(function(e1){
		          e1.remove();
		        });
		    }else{
		        const $divs = document.querySelectorAll('#input-list > div');
		        $divs.forEach(function(e){
		          e.remove();
		        });
		        const $btns = document.querySelectorAll('#input-list > button');
		        $btns.forEach(function(e1){
		          e1.remove();
		        });
		        var $div = document.createElement('div');
		        for(var i = 0; i < todoList[keyValue].length; i++){
		            var $div = document.createElement('div');
		            $div.textContent = '-' + todoList[keyValue][i];
		            var $btn = document.createElement('button');
		            $btn.setAttribute('type', 'button'); 
		            $btn.setAttribute('id', 'del-ata');
		            $btn.setAttribute('id', dataCnt+keyValue);
		            $btn.setAttribute('class', 'del-data');
		            $btn.textContent = delText;
		            inputList.appendChild($div);
		            inputList.appendChild($btn);
		            $div.addEventListener('click',checkList);
		            $btn.addEventListener('click',deleteTodo);
		            inputBox.value = '';
		            function deleteTodo(){
		                $div.remove();
		                $btn.remove();
		            }
		        }
		    }

		}
		var inputBox = document.getElementById('input-box');
		var inputDate = document.getElementById('input-data');
		var inputList = document.getElementById('input-list');
		var delText = 'X';
/* 		inputDate.addEventListener('click',addTodoList); */
		var dataCnt = 1;
		var keyValue = today.getFullYear() + '' + today.getMonth()+ '' + today.getDate();
		let todoList = [];
		todoList[keyValue] = [];
		function addTodoList(){
		    var $div = document.createElement('div');
		    $div.textContent = '-' + inputBox.value;
		    var $btn = document.createElement('button');
		    $btn.setAttribute('type', 'button'); 
		    $btn.setAttribute('id', 'del-ata');
		    $btn.setAttribute('id', dataCnt+keyValue);
		    $btn.setAttribute('class', "del-data");
		    $btn.textContent = delText;
		    inputList.appendChild($div);
		    inputList.appendChild($btn);
		    todoList[keyValue].push(inputBox.value);
		    dataCnt++;
		    inputBox.value = '';
		    $div.addEventListener('click',checkList);
		    $btn.addEventListener('click',deleteTodo);
		    function deleteTodo(){
		        $div.remove();
		        $btn.remove();
		    }
		}
		console.log(keyValue);
		function checkList(e){
		    e.currentTarget.classList.add('checked');
		}
		
		//////////////////////
		
		
				$(document).on("click", ".dateValue", function(){
					
					
					var yearValue = $("#current-year-month").text();
					var date = $(this).attr("id");
					
					yearArr = yearValue.split(" ");
					console.log(date);	
					console.log(yearValue);	
					console.log(yearArr);	
					var data = yearArr[2] +'-'+yearArr[1] +'-'+ date
					console.log(data);	
					
					var html = '<div class="form-content"><input type="text" value="'+ data +'"/><span class="deleteDate">X</span></div>';
					$(".form-container").append(html);
				});
		
		$(document).on("click", ".deleteDate", function(e){
			$(e.target).closest('div').remove();
		})
		
		

		
		
</script>
</html>