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

    <title>배너 관리</title>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

	    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	    
	    <script>
	    $(document).on("click","#coup_send_form",function()
		{
			alert("선택하신 쿠폰이 정상적으로 전송되었습니다.");
		});
	</script>
	
	<script type="text/javascript">
      $(document).ready(function(){
         $("#fileInput").on('change', function(){
            if(window.FileReader){
               var filename = $(this)[0].files[0].name;
            } else {
               var filename = $(this).val().split('/').pop().split('\\').pop();
            }
            $("#userfile").val(filename);
         });
      });
   </script>

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

                    <!-- DataTales Example -->
                  
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">배너</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            <div class="promotion-banenr">
                            	<button type="button" class="btn btn-primary" id="file_upload_btn"
			                      data-toggle="modal" data-target="fileUploadModal"
			                      style="font-size: 10px; margin-left: 10px;">
			                      	이미지 등록
				                </button>
			                	<button type="button" class="btn btn-primary" id="file_update_btn"
			                      style="font-size: 10px; margin-left: 10px;">
			                      	이미지 업데이트
				                </button>
			                
			                
				                <button type="button" class="btn btn-primary" id="file_send_btn"
				                      style="font-size: 10px; margin-left: 10px;">
				                      	배너로 공개
				                </button>
				                
				                <button type="button" class="btn btn-primary" id="file_disable_btn"
				                      style="font-size: 10px; margin-left: 10px;">
				                      	비공개 전환
				                </button>
				                
				                <!-- Modal -->
			                      <div class="modal fade" id="fileUploadModal"
			                      tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			                      	<div class="modal-dialog" role="document">
			                      		<div class="modal-content">
			                      			
			                      			<div class="modal-header">
						                      <h5 class="modal-title" id="staticBackdropLabel"> 등록할 배너 이미지 업로드 </h5>
						                      
						                    </div>
						                      
						                      <div class="modal-body">
						                      	<form action="/uploadBannerImg.mdo" method="POST" enctype="multipart/form-data">
						                      		<div class="form-group">
		
														<label for="url_banner"><span class="burl"></span>배너와 연결할 링크</label>
						                      			<input type="text" class="form-control" id="url_banner" name="url"/>
		
						                      			<!-- 이미지 업로드 시작 -->
						                      				<div class="form-group">
											                  <label for="inputSubject1"><span class="if"></span>
											                  	이미지 업로드</label>
											                  	
											                  <input type="file" multiple="multiple" name="bannerImg" id="fileInput" filestyle="" data-class-button="btn btn-default"
											                  data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" accept="image/*"
											                  class="form-contol" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">
											                     
											                     <div class="bootstrap-filestyle and input-group">
											                        <input type="text" id="userfile" class="form-control" name="userfile"
											                        disable="">
											                        <span class="group-span-filestyle input-group-btn" tabindex="0">
											                           <label for="fileInput" class="btn btn-default">
											                              <span class="glyphicon fa fa-upload"></span>
											                           </label>
											                        </span>
											                     </div>
											                     
											               </div>
		               									<!-- 이미지 업로드 끝 -->
		               									
		
						                      			<!-- 문의내용, 이메일에 같이 포함해서 보내야해서 hidden -->
						                      			<!--  <input type="text" id="reportquestion" name="question" hidden="hidden"/>
						                      			<input type="text" id="reportNum" name="reportSeq" hidden="hidden" />  -->
						                      			
						                      		</div>
						                      		
												<div class="modal-footer">
						                      
						                      <!-- 전송버튼 -->
						                      <input type="submit" class="btn btn-primary" id="sendResponse" value="전송"/>
						                      <button type="button" class="btn btn-secondary" data-dismiss="modal">
						                      	닫기
						                      </button>
						
			                      			</div>
						                     </form>				                      	
						                      </div>
			                      		</div>
		
			                      	</div>
			                      </div>
	                      <!-- modal 끝 -->
				                
				                </div>
				                
				                <div class="space"><td></td></div>
                            	
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                 
                                	<thead>
                                        <tr>
                                        	<th>체크박스</th>
                                        	<th>배너번호</th>
                                            <th>미리보기</th>
                                            <th>URI</th>
                                            <th>등록일자</th>
                                            <th>공개상태</th>
                                            
                                        </tr>
                                    </thead>
                                    
                                    
                                    <tbody>
                                    <c:forEach var="ban" items="${bannerList }">
				                    <tr>
				                      <td style="width:100px"><input type="checkbox" name="banner_check" value="banner_check" /></td>
				                      <td>${ban.bannerNum }</td>
				                      <td><a href="https://sheerhouse2.s3.ap-northeast-2.amazonaws.com/${ban.s3FileName }">${ban.originalFileName }</a></td> <!-- KEY -->
				                      <td>${ban.bannerUrl }</td>
				                      <td><fmt:formatDate value="${ban.fileRegDate}" pattern="yyyy-MM-dd" /></td>
				                      <td id="show">
				                      	<c:if test="${ban.bannerShow eq '0'}">비공개</c:if>
				                      	<c:if test="${ban.bannerShow eq '1'}">공개</c:if>
				                      </td>
				                      <!--  <td><button type="button" class="btn btn-danger"
				                      style="font-size: 10px;margin-left: 10px;" id="delete_btn">
				                      	Delete
				                      </button></td> -->
				                    </tr>
				                    </c:forEach>
                                    </tbody>
                              
                                </table>
                                
                                
                                <div style="display: block; text-align: center;">		
									
								</div> 
								
								<form id="submitForm2" method="POST" action="/applyBanner.mdo" hidden="hidden">
									<input type="hidden" id="sendBannerHidden" name="sendBannerName" >
								</form>
								       
								<form id="submitForm3" method="POST" action="/nonapplyBanner.mdo" hidden="hidden">
									<input type="hidden" id="disableBannerHidden" name="disableBannerName" >
								</form>                                     
                         </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; sheerhouse 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Bootstrap core JavaScript-->
<!--     <script src="/resources/admin/vendor/jquery/jquery.min.js"></script> -->
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
    
    <script>
  	//파일전송 시작.
    var counterFile = 0;
    var tagFile = {};
    function addTag(value) {
        tagFile[counterFile] = value;
        counterFile++; // del-btn 의 고유 id 가 된다.
    }
    
    </script>
    
    <script>
	$(document).on("click","#file_upload_btn",function()
	{
		var myModal = new bootstrap.Modal(document.getElementById('fileUploadModal'));
		myModal.show();
	});
	</script>
    
	<script>
	   $(document).on("click","#file_send_btn",function(){
		 
		    var rowData = new Array();
		    var rowNo = new Array();
		    var tdAr = new Array();
		    var checkbox = $("input[name=banner_check]:checked");
		    
		    checkbox.each(function(i)
		    	{
					var tr = checkbox.parent().parent().eq(i);
					var td = tr.children();
					rowData.push(tr.text());
					
					var no = td.eq(1).text();
					var thumb = td.eq(2).text();
					
					tdAr.push(no);
					tdAr.push(thumb);
					
					rowNo.push(no);
					
					console.log("each 문 안에서 돌려지는 쿠폰 번호= " + no)
					
		    	});

		   	console.log("체크된 배너 이름= " + tdAr[0]);
		   	console.log("체크된 배너 이름(배열)= " + rowNo);
		   	
		   	alert("선택한" + tdAr[0] + " 번 이미지가 배너로 공개되었습니다.");
		   	
		   	$("#sendBannerHidden").val(tdAr[0]); //tdAr[1]=name값을 담고 있는 배열객체
			$("#submitForm2").submit();
		    
		});
	
	</script>
	
		<script>
	   $(document).on("click","#file_disable_btn",function(){
		 
		    var rowData = new Array();
		    var rowNo = new Array();
		    var tdAr = new Array();
		    var checkbox = $("input[name=banner_check]:checked");
		    
		    checkbox.each(function(i)
		    	{
					var tr = checkbox.parent().parent().eq(i);
					var td = tr.children();
					rowData.push(tr.text());
					
					var no = td.eq(1).text();
					var thumb = td.eq(2).text();
					
					tdAr.push(no);
					tdAr.push(thumb);
					
					rowNo.push(no);
					
					console.log("each 문 안에서 돌려지는 쿠폰 번호= " + no)
					
		    	});

		   	console.log("체크된 배너 이름= " + tdAr[0]);
		   	console.log("체크된 배너 이름(배열)= " + rowNo);
		   	
		   	alert("선택한" + tdAr[0] + " 번 이미지가 비공개 처리되었습니다.");
		   	
		   	$("#disableBannerHidden").val(tdAr[0]); //tdAr[1]=name값을 담고 있는 배열객체
			$("#submitForm3").submit();
		    
		});
	
	</script>
    
</body>

</html>