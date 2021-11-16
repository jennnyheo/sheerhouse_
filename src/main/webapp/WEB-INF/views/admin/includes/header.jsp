<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>관리자 페이지</title>
    <!-- 글자수 줄이는 css -->
    <style>
	 .txt_line {
      width:70px;
      padding:0 5px;
      overflow:hidden;
      text-overflow:ellipsis;
      white-space:nowrap;
  	  }
  	  </style>
    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

	

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
                    <i class="fas fa-fw fa-table"></i>
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
                    <span>결제 정산내역</span>
                </a>
            </li>
            
             <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="chart.mdo">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>차트</span>
                </a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="notice.mdo">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>공지사항</span>
                </a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="bannerControl.mdo">
                    <i class="fas fa-fw fa-chart-area"></i>
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