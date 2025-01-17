<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<jsp:include page="../../include/header.jsp" flush="true"/>
<jsp:include page="../../include/sidebar.jsp" flush="true"/>
<script>
    window.onload=function() {
        if(${FileList.size()<1}){
            document.getElementById('file').innerText='   ';
        }
    }
    function delete_form () {
        document.getElementById('deleteform').submit();
    }
</script>
<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content">

        <jsp:include page="../../include/topbar.jsp" flush="true"/>
        <!-- Begin Page Content -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <form method="post" action="/post_delete.do" id="deleteform">
                        <input type="hidden" name="_method" value="delete" />
                        <input type="hidden" name="post_num" value="${PostList.post_num}" />
                        <input type="hidden" name="cate" value=15 />
                    <!-- Collapsable Card Example -->
                    <div class="card shadow mb-4">
                        <!-- Card Header - Accordion -->
                        <a class="d-block card-header py-3" style="text-align: center">
                            <h6 class="m-0 font-weight-bold text-primary"> ${PostList.nor_tit}
                            </h6>
                        </a>
                        <!-- Card Content - Collapse -->
                        <div class="collapse show" id="collapseCardExample">
                            <div class="card-body">
                                <form autocomplete="off" method="post" role="form">
                                    <div class="row form-group">
                                        <div class="col-3"></div>
                                        <div class="col-4 ">
                                            <small class="help-block form-text">작성자</small>
                                            ${PostList.cus_name}
                                        </div>
                                        <div class="col-4">
                                            <small class="help-block form-text">작성일</small>
                                            <fmt:formatDate value="${PostList.nor_reg}" pattern="yyyy-MM-dd"/>

                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-2"></div>
                                        <div class="col-8"
                                             style="border-top:  2px solid #808080;border-bottom: 2px solid #808080;">
                                            <textarea  style="border:0 solid whitesmoke;" name="contents" id="contents"
                                                       rows="15" class="form-control mt-3 mb-3" readonly="readonly"
                                                      disabled>${PostList.nor_cnt}</textarea>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="row form-group">
                                <div class="col-2"></div>
                                <div class="col-8" id="file" > &nbsp;&nbsp;&nbsp;첨부 파일<br>
                                    <c:forEach items="${FileList}" var="file">

                                        <a href="/download.do?file_name=${file.file_name}" id = "${file.file_name}">
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-file-arrow-down"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${file.file_name}
                                        </a>
                                        <br>
                                    </c:forEach>
                                    <br><br>
                                </div>
                            </div>
                        </div>

                        <!-- 수정/삭제/목록 버튼 -->
                        <div class="text-center d-block card-header py-3">
                            <c:if test="${login.cus_num eq PostList.cus_num}">
                            <a href="request_write.do?post_num=${PostList.post_num}&update=1" class="btn btn-info">
                                              <span class="icon text-white-50">
                                              <i class="fas fa-pen"></i>
                                              </span>
                                <span class="text"> 수정</span>
                            </a>

                            <a class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">
                                                 <span class="icon text-white-50">
                                                   <i class="fa-regular fa-trash-can"></i>
                                                 </span>
                                <span class="text" style="color:white">  삭제</span>

                                <!-- Modal -->
                                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">게시물 삭제</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                게시물을 정말 삭제하시겠습니까?
                                            </div>
                                            <div class="modal-footer">
                                                <button onclick="return delete_form()"
                                                        type="button" class="btn btn-danger">삭제하기
                                                </button>
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                                    취소하기
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            </c:if>
                            <a href="/request.do" class="btn btn-secondary">
                                             <span class="icon text-white-50">
                                              <i class="fas fa-list"></i>
                                             </span>
                                <span class="text">목록</span>
                            </a>

                        </div>  <!-- end of button list -->

                        <jsp:include page="../../include/comments.jsp" flush="true" />

                    </div>
                    </form>

                </div>

            </div>

        </div>
        <!-- /.container-fluid -->

    </div>
    <!-- End of Main Content -->

    <jsp:include page="../../include/footer.jsp" flush="true"/>

</div>
<!-- End of Page Wrapper -->

<jsp:include page="../../include/logoutModal.jsp" flush="true"/>
<!-- Bootstrap core JavaScript-->
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

<!-- Core plugin JavaScript-->
<script src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js"/>"></script>

<!-- Custom scripts for all pages-->
<script src="<c:url value="/resources/js/sb-admin-2.min.js"/>"></script>

<script src="<c:url value="/resources/vendor/datatables/dataTable.js"/>"></script>
<script type="text/javascript">
    function goSubmit() {
        var form = document.getElementById('tableswriteform').submit();
    }
</script>

