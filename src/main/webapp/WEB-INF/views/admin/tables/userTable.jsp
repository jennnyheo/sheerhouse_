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
							<div class="table-responsive">
								 <form method = "get" action = "userTable.mdo">
								 			<button type="button" class="btn btn-outline btn-primary pull-right" id="cancleBtn" style="float: right; margin-left: 10px;" >해제</button>
                                			<button type="button" class="btn btn-outline btn-danger pull-right" id="stopBtn" style="float: right; margin-left: 10px;">정지</button>
                               				
                               				
								<table class="table table-bordered" id="dataTable" width="100%"
									 cellspacing="0">
                                 
                                	<thead>
                                        <tr>
                                        	<th>선택</th>
                                        	 <th>no.</th>
                                            <th>email</th>
                                            <th>이름</th>
                                            <th>연락처</th>
                                            <th>호스팅 여부</th>
                                            <th>가입일자</th>
                                            <th>상태</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="user" items= "${userList}" varStatus="status">
                                    		
                                    		<tr>
                                    			<td><input type="checkbox" name="user_checkBox"></td>
                                    			<td>${status.count }</td>
                                    			<td>${user.email }</td>
                                    			<td>${user.name }</td>
                                    			<td>${user.phone }</td>
                                    			<td>
                                    				<c:choose>
                                    					<c:when test="${user.role eq 'host'}">
                                    						<p style="margin:0px; color:red">${user.role}</p>
                                    					</c:when>
                                    					<c:otherwise>
                                    						${user.role}
                                    					</c:otherwise>
                                    				</c:choose>
                                    			</td>
                                    			<td>${user.regdate }</td>
                                    			<td>
	                                    			<c:if test = "${user.status eq 1 }">
	                                    				<p style="color:blue;margin:0px"><c:out value = "정상" /></p>
	                                    			</c:if>
	                                    			<c:if test = "${user.status eq 2 }">
	                                    				<c:out value = "탈퇴" />
	                                    			</c:if>
	                                    			<c:if test = "${user.status eq 3 }">
	                                    				<p style="color:red;margin:0px"><c:out value = "정지" /></p>
	                                    			</c:if>
                                    			</td>
                                    		</tr>
                                   		 </c:forEach>
                                  	  </tbody>
                                                              		  
                              	  </table>
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
							<span>Copyright &copy; SheerHouse 2021</span>
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
		<script
			src="/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Core plugin JavaScript-->
		<script
			src="/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

		<!-- Custom scripts for all pages-->
		<script src="/resources/admin/js/sb-admin-2.min.js"></script>

		<!-- Page level plugins -->
		<script
			src="/resources/admin/vendor/datatables/jquery.dataTables.min.js"></script>
		<script
			src="/resources/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

		<!-- Page level custom scripts -->
		<script src="/resources/admin/js/demo/datatables-demo.js"></script>

		<script src="/resources/admin/js/checkbox.js"></script>
</body>

</html>