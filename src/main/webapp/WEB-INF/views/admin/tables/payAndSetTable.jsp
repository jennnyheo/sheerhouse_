<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/includes/header.jsp" %>

<link href="https://cdn.datatables.net/datetime/1.1.1/css/dataTables.dateTime.min.css" rel="stylesheet" type="text/css"/>
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
  
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- DataTales Example -->
                  
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">결제 및 정산내역 조회</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            		<form action="payAndSetTable.mdo" name="searchForm" method="post" style="display:inline">
                               				<span>시작일: <input id="startDate" class="dt-datetime" name="startDate" readonly style="width: 100px;"></span>
                               				&nbsp;&nbsp;<span>종료일: <input id="endDate" class="dt-datetime" name="endDate" readonly style="width: 100px;"></span>
                               				&nbsp;&nbsp;<span>상태: </span>
                               		
                               				<select id="status" style="width:100px; height: 30px;">
   												<option value="all" selected="selected">전체</option>
   												<option value="paid">결제완료</option>
   												<option value="stay">환불대기</option>
   												<option value="failed">결제취소</option>
   												<option value="true">정산완료</option>
   												<option value="false">정산대기</option>
											</select>
											
											<input type="hidden" id="start" value="${search.startDate }" />
											<input type="hidden" id="end" value="${search.endDate }" />
											<input type="hidden" id="keyword" value="${search.search_keyword }" />
											
											<input type="hidden" id="search_keyword" name="search_keyword" value="all" />
											<input type = "button" value="조회" onclick="selectKeyword()"/>
                               				<button type="button" class="btn btn-outline btn-primary pull-right" id="setBtn" style="height: 30px; margin-bottom: 3px; padding: 3px;" onclick="setApply()">정산처리</button>	
                               	            <button type="button" class="btn btn-outline btn-primary pull-right" id="refundBtn" style="height: 30px; margin-bottom: 3px; padding: 3px; background-color: red;" onclick="refundApply()">환불처리</button>	
                               		</form>
                               		<form name="excelForm" action="excelSave.mdo" method="get" style="display:inline;margin-left: 20px;">
                               				<input type="text" id="excelFileName" name="fileName" placeholder="파일명"/>
                               				<input type="hidden" id="sd" name="startDate"/>
                               				<input type="hidden" id="ed" name="endDate"/>
                               				<button type="button" class="btn btn-outline btn-primary pull-right" id="excelBtn" name="excelBtn" style="height: 30px; margin-bottom: 3px; padding: 3px; background-color: green;" onclick="excelSave()" >Excel 저장</button>	
                               		</form>
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">

                                	<thead>
                                        <tr>
                                        	<th>선택</th>
                                        	<th>주문번호</th>
                                            <th>결제상태</th>
                                            <th>결제금액</th>
                                            <th>정산상태</th>
                                            <th>정산금액</th>
                                            <th>게스트 이메일</th>
                                            <th>호스트 이메일</th>
                                            <th>결제일시</th>
                                            <th>정산일시</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="info" items="${list }">
                              
                                    <tr>
                                    	<c:choose>
                                    		<c:when test="${info.set_status == 'true' }">
                                    			<td><input type="checkbox" name="set_checkBox" disabled></td>
                                    		</c:when>
                                    		<c:when test="${info.pay_status == 'failed' }">
                                    			<td><input type="checkbox" name="set_checkBox" disabled></td>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<td><input type="checkbox" name="set_checkBox"></td>
                                    		</c:otherwise>
                                    	</c:choose>
                                    	<td>${info.apply_num }</td>
                                    	<c:choose>
                                    		<c:when test="${info.pay_status == 'paid' }">
												<td>결제완료</td>
                                    		</c:when>
                                    		<c:when test="${info.pay_status == 'failed' }">
                                    			<td>결제취소</td>
                                    		</c:when>
                                    		<c:when test="${info.pay_status == 'stay' }">
                                    			<td>환불대기</td>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<td>-</td>
                                    		</c:otherwise>
                                    	</c:choose>
                                    	<td>${info.total_price }원</td>
                                    	<c:choose>
                                    		<c:when test="${info.set_status == 'true' }">
												<td><p style="color:blue;margin:0px">정산완료</p></td>
                                    		</c:when>
                                    		<c:when test="${info.set_status == 'false' }">
												<td><p style="color:red;margin:0px">정산대기</p></td>
                                    		</c:when>
                                    		<c:otherwise>
												<td>-</td>
                                    		</c:otherwise>
                                    	</c:choose>
                                       	<td>${info.set_price }원</td>
                                    	<td>${info.user_email }</td>
                                    	<td>${info.host_email }</td>
                                    	<td>${info.pay_date }</td>
                                    	<td>${info.set_date }</td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                 
                                </table>
                                    <div style="display: block; text-align: center;">
									<c:if test="${paging.startPage != 1 }">
										<a
											href="/homeTable.mdo?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
									</c:if>
									<c:forEach begin="${paging.startPage }"
										end="${paging.endPage }" var="p">
										<c:choose>
											<c:when test="${p == paging.nowPage }">
												<b>${p}</b>
											</c:when>
											<c:when test="${p != paging.nowPage }">
												<a
													href="/homeTable.mdo?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p}</a>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:if test="${paging.endPage != paging.lastPage}">
										<a
											href="/homeTable.mdo?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
									</c:if>
								</div>
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
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.js"></script>
    
    <!-- <script src="/resources/admin/js/checkbox.js"></script> -->
    <script src="https://cdn.datatables.net/datetime/1.1.1/js/dataTables.dateTime.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/exceljs/4.2.1/exceljs.min.js"></script>		
	<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
<script type="text/javascript">
	function excelSave(){
		var fileName = document.getElementById("excelFileName").value;
		var startDate = document.getElementById("startDate").value;
		var endDate = document.getElementById("endDate").value;
		
		if(fileName == ""){
			alert("파일명을 입력해주세요.");
			return;
		}else if(startDate == "" && endDate == ""){
		}else if(startDate == "" || endDate == ""){
			alert("저장할 기간을 올바르게 지정해주세요.");
			return;
		}
		document.getElementById("sd").setAttribute("value", startDate);
		document.getElementById("ed").setAttribute("value", endDate);
		
		document.excelForm.submit();
		
		
	}

</script>
<script type="text/javascript">
    
    function setApply(){
    	var cnt = $("input:checkbox[name='set_checkBox']:checked").length;
    	if(cnt ==0){
    		alert("선택된 내역이 없습니다.");
    		return;
    	}
    	
    	var result = confirm("선택하신 내역을 정산처리 하시겠습니까?");
    	if(!result){
    		return;
    	}
    	
        console.log("갯수: " + cnt);
        
        var applyNum_list = new Array();
    	var checkbox = $("input:checkbox[name=set_checkBox]:checked");
    	
		checkbox.each(function(i){
    		
    		//체크박스의 부모는 td , td의 부모는 tr이다.
    		var tr = checkbox.parent().parent().eq(i); //체크된 체크박스의 tr을 구함
    		var td = tr.children(); //체크된 체크박스의 td를 구함
    		
    		var apply_num = td.eq(1).text(); 		
    		applyNum_list.push(apply_num);

    	});
    	
		console.log(applyNum_list);
		
		$.ajax({
			url		: "setCheckboxApply.mdo?applyNum_list="+applyNum_list,
			type	: "POST",
			data	: {"applyNum_list" : applyNum_list},
			success	: function(){
				alert("선택된 정산내역을 정산처리 했습니다.");
				location.href="payAndSetTable.mdo";
			}
		});
    	
    }
    function refundApply(){
    	var cnt = $("input:checkbox[name='set_checkBox']:checked").length;
    	if(cnt ==0){
    		alert("선택된 내역이 없습니다.");
    		return;
    	}
    	
    	var result = confirm("선택하신 결제내역을 환불처리 하시겠습니까?");
    	if(!result){
    		return;
    	}
    	
        console.log("갯수: " + cnt);
        
        var status_list = new Array();
    	var checkbox = $("input:checkbox[name=set_checkBox]:checked");
    	
		checkbox.each(function(i){
    		
    		//체크박스의 부모는 td , td의 부모는 tr이다.
    		var tr = checkbox.parent().parent().eq(i); //체크된 체크박스의 tr을 구함
    		var td = tr.children(); //체크된 체크박스의 td를 구함
    		
    		var status = td.eq(1).text(); 		
    		status_list.push(status);
    	});
    	
		console.log(status_list);
		
		$.ajax({
			url		: "resCheckboxApply.mdo?status_list="+status_list,
			type	: "POST",
			data	: {"status_list" : status_list},
			success	: function(){
				alert("선택된 결제내역을 환불처리 했습니다.");
				location.href="payAndSetTable.mdo";
			}
		});
    }    
    
    </script>
    <script type="text/javascript">
    $(document).ready(function() {
        new DateTime(document.getElementById('startDate'), {
            format: 'YYYY-MM-DD'
        });
        new DateTime(document.getElementById('endDate'), {
            format: 'YYYY-MM-DD'
        });
        
        
        var start = document.getElementById("start").value;
        var end = document.getElementById("end").value;
        var keyword = document.getElementById("keyword").value;
        
        document.getElementById("startDate").setAttribute("value", start);
        document.getElementById("endDate").setAttribute("value", end);
        if(!keyword == ""){
        	$('#status').val(keyword).prop("selected",true);
        }
        
    });
    </script>
    <script type="text/javascript">
    	function selectKeyword(){
    		var val = document.getElementById("status").value;
    		var status = document.getElementById("search_keyword").setAttribute("value", val);  		
        	var start = document.getElementById("startDate").value;
        	var end = document.getElementById("endDate").value;
        	
        	if(start == "" && end ==""){
        		document.searchForm.submit();
        		return;
    		}else if(start == "" || end ==""){
        			alert("조회 날짜를 모두 지정해주세요.");
        			return;
        	}
        	
        	var s = new Date(start);
        	var e = new Date(end);
        	
        		if(s > e){
        			alert("조회 날짜를 다시 선택해주세요.");
        			return;
        		}else{
            		document.searchForm.submit();
        		}

    		
    	}
    </script>
</body>

</html>