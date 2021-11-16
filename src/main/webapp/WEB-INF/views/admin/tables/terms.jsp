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
                            <h6 class="m-0 font-weight-bold text-primary">약관</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                	<button type = "button" class = "btn btn-info float-right" onclick="location.href ='termsInsert.mdo'">새로 작성</button> 
                                	<thead>
                                        <tr>
                                        	<th>no.</th>
                                            <th>분류</th>
                                            <th>조항</th>
                                            <th>내용</th>
                                            <th>날짜</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                    <c:forEach var="terms" items= "${termsList}">
                                    
                                    <tr>
                                    	<td>${terms.term_num }</td>
                                    	<td>${terms.title }</td>
                                    	<td>${terms.sub_title}</td>
                                    	<td>
                                    	<a href="termsDetails.mdo?term_num=${terms.term_num }">${terms.content }</a>
                                    	</td>
                                    	<td>${terms.regist_date }</td>
                                   </tr>
                                   </c:forEach>
                                    </tbody>
                                    
                                </table>                                    
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