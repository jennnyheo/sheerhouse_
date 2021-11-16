<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/includes/header.jsp" %>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
  
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- DataTales Example -->
                  
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">회원 정보</h6>
                        </div>
                        <div class="card-body">
                        <button type = "button" class = "btn btn-info float-right" onclick="location.href ='terms.mdo' ">돌아가기</button>
						
						<form action="termsDetails.mdo" method="get">
						
						<input type="hidden" name="term_num" value="${terms[0].term_num }"/>
						<p>no.${terms[0].term_num }</p>
						<input type="text" name="title" class="form-control mt-4 mb-2" value="${terms[0].title }" readonly="readonly"/>
						<input type="text" name="sub_title" class="form-control mt-4 mb-2" value="${terms[0].sub_title }" readonly="readonly"/>
						<div class="form-group">
						<textarea class="form-control" rows="10" name="content" readonly="readonly">${terms[0].content }</textarea>
						</div>
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
    
</body>

</html>