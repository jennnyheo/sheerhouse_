<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>관리자 페이지</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> 
    <!-- 차트 링크 --> 
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>


</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
     
            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="index.mdo">
                    <i class="fas fa-fw fa-desktop-alt"></i>
                    <span>SheerHouse</span></a>
            </li>
          
                               
            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="homeTable.mdo">
                    
                    <span>숙소 정보</span>
                </a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="userTable.mdo">
                    
                    <span>회원 정보</span>
                </a>
            </li>
            
            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="payAndSetTable.mdo">
                    
                    <span>결제/정산내역</span>
                </a>
            </li>
            
             <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="chart.mdo">
                   
                    <span>차트</span>
                </a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="notice.mdo">
                   
                    <span>공지사항</span>
                </a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="bannerControl.mdo">
                   
                    <span>배너 수정</span>
                </a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="terms.mdo">
                    
                    <span>약관 수정</span>
                </a>
            </li>
			
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                   
                    </div>
					<div class = "container">
						<!-- 1*1 -->
                   		<div class="row">
              				<div class="col-lg-6">
                				<div class="card mb-4">
                  					<div class="card-header">
                  					방문자 수
           							</div>
									<div class="card-body" id="chart_div">
                    					<canvas id="barChart" width="100%" height="50"></canvas>
                  					</div>
		            			</div>
        					</div>
        					<!-- 1*2 -->
              				<div class="col-lg-6">
		               			<div class="card mb-4">
		                        	<div class="card-header">
                		   			공지사항
                		   				
                		   				<a href="notice.mdo" style="float : right;">more...</a>
                		   				
                  		  			</div>
	                				<div class="card-body" style="height:289px;">
	                					<div class="container">
	                						<table class="table table-condensed table-hover">
	                							
            		        					<thead>
            		        						<tr>
            		        							<th>번호</th>
            		        							<th>제목</th>
            		        							<th>작성일자</th>
            		        						</tr>
            		        					</thead>
            		        					<c:forEach var="notice" items="${noticeList }">
            		        						<tbody>
            		        							<td>${notice.notice_num }</td>
            		        							<td>${notice.title }</td>
            		        							<td>${notice.regist_date }</td>
            		        						</tbody>
            		        					</c:forEach>
            		        				</table>
            		        				
            		        			</div>
                  		  			</div>
                  				</div>
                		    </div>
        		    	</div>
            		
            
                   		<div class="row">
                   			<!-- 2*1 -->
              				<div class="col-lg-6">
                				<div class="card mb-4">
                  					<div class="card-header">
                  					등록된 숙소 수
           							</div>
									<div class="card-body" id="chart_div">
                    					<canvas id="myChart" width="100%" height="50"></canvas>
                  					</div>
		            			</div>
        					</div>
        					<!-- 2*2 -->
              				<div class="col-lg-6">
		               			<div class="card mb-4">
		                        	<div class="card-header">
                		   			사용자 비율
                  		  			</div>
	                				<div class="card-body" id="piechart">
            		        			<canvas id="PieChart" width="100%" height="50"></canvas>
                  		  			</div>
                  				</div>
                		    </div>
        		    	</div>     
        		    	            
                 <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; SheerHouse 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer --> 
            </div>
            <!-- End of Main Content -->
           	
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->

    
    <!-- Bootstrap core JavaScript-->
    <script src="/resources/admin/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/admin/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/resources/admin/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/resources/admin/js/demo/chart-area-demo.js"></script>
    <script src="/resources/admin/js/demo/chart-pie-demo.js"></script>
    
    <!-- 부트스트랩 --> 
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


    
    <!-- 차트 --> 
    <script> 
  //  var labelName = new Array();
  //  var firstData = new Array();
    
    //foreach문으로 값 세팅
   // 	<c:forEach items="${list1}" var="first">
   // 		firstData.push('${first.count}');
   // 		labelName.push('${first.inputMonth}');
   // 	</c:forEach>
    	
   // 	console.log(firstData);
   // 	console.log(labelName);
    
    var ctx = document.getElementById('myChart').getContext('2d');
    var chart = new Chart(ctx, {
    // 챠트 종류를 선택
    type: 'line',
    // 챠트를 그릴 데이타
    data: {
    	labels: ['01월', '02월', '03월', '04월', '05월', '06월', '07월', '08월', '09월', '10월', '11월', '12월'],
    	datasets: [{
    		label: '등록된 숙소 수',
    		backgroundColor: 'transparent',
    		borderColor: 'red', data: [74, 62, 83, 128, 41, 83, 172, 174, 103, 181]
    		}]
    	},
    	// 옵션
    	options: {}
    	}); 
    </script>
	
	 <script>
    const colors = ['red','yellow','blue','#c3e6cb','#dc3545','#6c757d'];
    var chBar = document.getElementById("barChart");
    var chartData = {
    	labels:['01월', '02월', '03월', '04월', '05월', '06월', '07월', '08월', '09월', '10월', '11월', '12월'],
    	datasets: [{
    		label:'비회원',
    		data: [394, 561, 94, 594, 637, 186, 495, 252, 198, 682],
    		backgroundColor: colors[0]
    		},
    		{ 
    		label:'회원',	
    		data: [522, 814, 244, 604, 294, 607, 634, 471, 975, 484],
    		backgroundColor: colors[2]
    		}]
    	};
    var barChart = new Chart(chBar, { 
    	// 챠트 종류를 선택
    	type: 'bar',
    	// 챠트를 그릴 데이타
    	data: chartData,
    	// 옵션
    	options: {
    		legend: {
    			display: false
    			}
    		}
    	});
    </script>
    
    <script>
    data = {
    		datasets: [{
    			backgroundColor: ['red','yellow','blue'],
    			data: [24,  54, 22] }],
    			// 라벨의 이름이 툴팁처럼 마우스가 근처에 오면 나타남 
    			labels: ['비회원','회원','호스트']
    };
   
    // 도넛형 차트 
    var ctx2 = document.getElementById("PieChart");
    var myDoughnutChart = new Chart(ctx2, {
    	type: 'doughnut',
    	data: data,
    	options: {}
    });
    </script>

</body>

</html>