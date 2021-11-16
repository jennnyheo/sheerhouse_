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
							<h6 class="m-0 font-weight-bold text-primary">숙소 정보</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								
								<button type="button" class="btn btn-outline btn-primary pull-right" id="stopBtn" style="float: right; margin-left: 10px;">off</button>
            		      			<button type="button" class="btn btn-outline btn-danger pull-right" id="cancleBtn" style="float: right; margin-left: 10px;" >on</button>
                                	

						<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">

							<thead>
							<tr>
								<th></th>
								<th>no.</th>
								<th>숙소명</th>
								<th>호스트이메일</th>
								<th>타입</th>
								<th>주소</th>
								<th>상태</th>
							</tr>
							</thead>
							<tbody>
								<c:forEach var="home" items="${homeList}" varStatus="status">

									<tr>
										<th><input type="checkbox" name="home_checkBox" value="flase"></th>
										<td>${home.home_seq }</td>
										<td>${home.title }</td>
										<td>${home.host_email }</td>
										<td>${home.type }</td>
										<td>${home.address }</td>
										<td>
											<c:choose>
												<c:when test="${home.status eq 'on'}">
													<p style="margin:0px; color:red">${home.status}</p>
												</c:when>
												<c:otherwise>
													<p style="margin:0px; color:blue">${home.status}</p>
												</c:otherwise>
											</c:choose>
										
										</td>

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
		
		<script src="/resources/admin/js/checkboxHome.js"></script>
</body>

</html>