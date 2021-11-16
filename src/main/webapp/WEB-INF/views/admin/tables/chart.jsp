<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>차트</title>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	<!-- 차트 링크 -->
<!-- 	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> -->

    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>

	<script
      src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <%@ include file="navigation.jsp" %>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Begin Page Content -->
                <div class="container-fluid">

      <!-- 차트1 시작 -->
            <div class="card mb-4">

              <!-- 차트 감싸는 표의 header -->
              <div class="card-header">
                <i class="fas fa-chart-area me-1"></i>
                   월별 매출
              </div>

              <!-- flow chart canvers -->
              <div class="card-body" id="barChart" >
                <canvas id="myBarChart" width="800px" height="300"></canvas>
              </div>

              <!-- 카드 밑에 footer -->
              <div class="card-footer small text-muted">
                Updated yesterday at 11:59 PM
              </div>

            </div>
            <!-- 차트1 끝 -->
            
       <!-- 가로로 1개 만들어서 -->
            <div class="row">
              <!-- 2개로 쪼갬 -->
              <div class="col-lg-6">

                <!-- 차트2 시작 -->
                <!-- 왼쪽 -->
                <div class="card mb-4">

                  <!-- 차트2 헤더 -->
                  <div class="card-header">
                    <i class="fas fa-chart-bar me-1"></i>
                    	신규회원가입 현황
                  </div>

                  <!-- 차트2 바디, 바차트-->
                  <div class="card-body" id="chart_div">
                    <canvas id="myLineChart" width="100%" height="50"></canvas>
                  </div>

                  <!-- 차트2 푸터 -->
                  <div class="card-footer small text-muted">
                    Updated yesterday at 11:59 PM
                  </div>
                </div>
                <!-- 차트2 끝 -->

              </div>
              <!-- 쪼갠거 끝 -->

              <!-- 나머지 쪼갬2 -->
              <div class="col-lg-6">

                <!-- 차트3 시작 -->
                <!-- 오른쪽 -->
                <div class="card mb-4">

                  <!-- 차트3 헤더 -->
                  <div class="card-header">
                    <i class="fas fa-chart-pie me-1"></i>
                    	예약 성공률
                  </div>

                  <!-- 차트3 바디 -->
                  <div class="card-body" id="piechart">
                    <canvas id="myPieChart" width="100%" height="50"></canvas>
                  </div>

                  <!-- 차트3 푸터 -->
                  <div class="card-footer small text-muted">
                    Updated yesterday at 11:59 PM
                  </div>
                </div>
                <!-- 차트3 끝 -->

              </div>
              <!-- 쪼갬2 끝 -->
            </div>
            <!-- 가로 끝 -->

			

        </main>

        <footer class="py-4 bg-light mt-auto">
          <div class="container-fluid px-4">
            <div
              class="d-flex align-items-center justify-content-between small"
            >
              <div class="text-muted">Copyright &copy; sheerhouse 2021</div>
              
            </div>
          </div>
        </footer>
      </div>
    </div>
      
    <!-- Bootstrap core JavaScript-->
    <script src="/resources/admin/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/admin/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/resources/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/resources/admin/js/demo/datatables-demo.js"></script>
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
    
    <script src="/resources/admin/js/checkbox.js"></script>
    
     <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="/resources/css/admin/js/scripts.js"></script>
    <!-- 부트스트랩 -->
<!--     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    
    <!-- 차트 -->
    
        <script type="text/javascript">

//            var labelName = new Array();
//            var firstData = new Array();
// 			var secondData = new Array();
            
            //foreach 문으로 값 세팅
//                <c:forEach items="${list3}" var="first">
//                	firstData.push('${first.total_price}');
//                	labelName.push('${first.inputMonth}');
//                </c:forEach>

//                 <c:forEach items="${list6}" var="second">
//                		secondData.push('${second.total_price}');
//             	</c:forEach>
            
//            console.log(firstData);
//             console.log(secondData);
//            console.log(labelName);
            
                
            var context = document
                .getElementById('myBarChart')
                .getContext('2d');
            
            var myChart = new Chart(context, {
                type: 'bar', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: ['01월', '02월', '03월', '04월', '05월', '06월', '07월', '08월', '09월', '10월', '11월', '12월'],
                    
                    datasets: [
                        { //데이터
                            label: "Sales",
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            
                            //y축
                            data: [66848600, 95714200, 63090800, 82014600, 23386000, 92420000, 96971400, 75775100, 66992800, 105852000],
                            backgroundColor: 'rgba(255, 99, 132, 0.2)',
                            borderColor: 'rgba(255, 99, 132, 1)',
                            borderWidth: 1
                        }
                        
//                         ,
//                         {
//                             label: "Revenues",
//                             fill: false,
//                             data: secondData,
//                             backgroundColor: 'rgba(54, 162, 235, 0.2)',
//                             borderColor: 'rgba(54, 162, 235, 1)',
//                             borderWidth: 1
//                         }
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
        </script>
    
    
    <script>
    
    var labelName = new Array();
    var firstData = new Array();
    
    //foreach 문으로 값 세팅
        <c:forEach items="${list1}" var="first">
        	firstData.push('${first.cnt}');
        	labelName.push('${first.inputMonth}');
        </c:forEach>  	
    
    console.log(firstData);    
    console.log(labelName);
        
    var context = document
        .getElementById('myLineChart')
        .getContext('2d');
    
    var myChart = new Chart(context, {
        type: 'line', // 차트의 형태
        data: { // 차트에 들어갈 데이터
            labels: labelName,
            
            datasets: [
                { //데이터
                    label: 2021,
                    fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                    
                    //y축
                    data: firstData,
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1
                }
            ]
        },
        options: {
            scales: {
                yAxes: [
                    {
                        ticks: {
                            beginAtZero: true
                        }
                    }
                ]
            }
        }
    });
    </script>
    
    <!-- Pie Chart -->
    <script type="text/javascript">

    		//var Year = [2020, 2021];
            var labelName = ["positive", "negative"];
            var Data = new Array();
            
            var backgroundcolor =
            	[
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 99, 132, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(120, 110, 220, 0.2)',
                'rgba(110, 90, 90, 0.2)'];
            
            var borderColor =
            	[
                'rgba(54, 162, 235, 1)',
                'rgba(255, 99, 132, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
                'rgba(120, 110, 220, 1)',
                'rgba(110, 90, 90, 1)'];
            
            //foreach 문으로 값 세팅
                <c:forEach items="${list5}" var="list5">
                	Data.push('${list5}');
                </c:forEach>
            
            console.log(labelName);
            console.log(Data);
            
                
            var context = document
                .getElementById('myPieChart')
                .getContext('2d');
            
            var myChart = new Chart(context, {
                type: 'doughnut', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: labelName,
                    
                    datasets: [
                        
                        {
                            fill: false,
                            data: Data,
                            backgroundColor: backgroundcolor,
                            borderColor: borderColor,
                            borderWidth: 1
                        }
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
        </script>
    
    
</body>

</html>