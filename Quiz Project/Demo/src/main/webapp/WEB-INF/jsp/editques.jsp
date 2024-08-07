<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dashboard</title>

    <!-- Custom fonts for this template -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="subject">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-smile"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Admin</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item ">
                <a class="nav-link" href="subject">
                    <i class="fas fa-fw fa-list"></i>
                    <span>Subject</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="questionmaster">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Question Master</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="quizsetting.html">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Quiz Setting</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#logoutModal">
                    <i class="fas fa-sign-out-alt fa-fw"></i>
                    <span>Logout</span></a>
            </li>


        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link  rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>


                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Edit Question</h1>
                    </div>


                    <!-- Content Row -->
					<form:form modelAttribute="questionBean" action="updatequestion/${questionId}">
                    <div class="row">
                    <form:hidden path="quesid" />

<!-- Area Chart -->
                        <div class="col-xl-12">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3">
                                    <div class="row">
                                        <div class="col-md-3 mb-md-0 mb-2">
                                            <form:select path="subjectid" class="form-control" >
                                                <option value="">Subject</option>
                                                 <c:forEach var="sub" items="${subjectlist}">
        											<form:option value="${sub.subjectid}">${sub.subjectname}</form:option>
    											</c:forEach>
                                            </form:select>
                                        </div>
                                        <div class="col-md-9"> 
                                        <div class="row">
                                        <div class="col-md-3">
                                        	<form:select path="quesstatus" class="form-control" >
                                                <option value="">SELECT</option>
        											<form:option value="0">Inactive</form:option>
        											<form:option value="1">Active</form:option>
                                            </form:select>
                                        </div>
                                        
                                        <div class="col-md-9">
                                        <form:input path="quesname" type="text" placeholder="Type Question Statement here..." class="form-control border-success" /> 
                                        </div>
                                        	</div>	
                                        
                                        </div>
                                    
                                    </div>


                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table border">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th>Answer Label</th>
                                                    <th class="text-center">Select correct answer</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<%-- <c:out value="${questionBean.correctAnswer}"></c:out> --%>
                                            	<form:hidden path="correctAnswer"/>
                                                <tr>
                                                    <td>Answer 1</td>
                                                    <td><form:hidden path="answers[0].answerId" /></td>	
                                                    <td><form:input type="text" class="form-control" path="answers[0].answer" /> </td>
                                                    <td class="text-center">
                                                    	<c:if test="${questionBean.answers[0].answerId == questionBean.correctAnswer }">
                                                        	<input type="radio" id="one" name="my_answer" value="${ questionBean.answers[0].answerId}" onclick="putValue(${ questionBean.answers[0].answerId})" checked>
                                                        </c:if>
                                                        <c:if test="${questionBean.answers[0].answerId != questionBean.correctAnswer }">
                                                        	<input type="radio" id="one" name="my_answer" value="${ questionBean.answers[0].answerId}" onclick="putValue(${ questionBean.answers[0].answerId})" >
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Answer 2</td>
                                                    <td><form:hidden path="answers[1].answerId" /></td>
                                                    <td>
                                                    <form:input type="text" class="form-control" path="answers[1].answer" /> </td>
                                                    <td class="text-center">
                                                    	   <c:if test="${questionBean.answers[1].answerId == questionBean.correctAnswer }">
                                                        	<input type="radio" id="two" name="my_answer" value="${ questionBean.answers[1].answerId}" onclick="putValue(${ questionBean.answers[1].answerId})"  checked>
                                                        </c:if>
                                                        <c:if test="${questionBean.answers[1].answerId != questionBean.correctAnswer }">
                                                        	<input type="radio" id="two" name="my_answer" value="${ questionBean.answers[1].answerId}" onclick="putValue(${ questionBean.answers[1].answerId})">
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Answer 3</td>
                                                    <td><form:hidden path="answers[2].answerId" /></td>
                                                    <td><form:input type="text" class="form-control" path="answers[2].answer" /> </td>
                                                    <td class="text-center">
                                                        <c:if test="${questionBean.answers[2].answerId == questionBean.correctAnswer }">
                                                        	<input type="radio" id="three" name="my_answer" value="${ questionBean.answers[2].answerId}" onclick="putValue(${ questionBean.answers[2].answerId})" checked>
                                                        </c:if>
                                                        <c:if test="${questionBean.answers[2].answerId != questionBean.correctAnswer }">
                                                        	<input type="radio" id="three" name="my_answer" value="${ questionBean.answers[2].answerId}" onclick="putValue(${ questionBean.answers[2].answerId})" >
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Answer 4</td>
                                                    <td><form:hidden path="answers[3].answerId" /></td>
                                                    <td><form:input type="text" class="form-control" path="answers[3].answer" /> </td>
                                                    <td class="text-center">
                                                        <c:if test="${questionBean.answers[3].answerId == questionBean.correctAnswer }">
                                                        	<input type="radio" id="four"  name="my_answer" value="${ questionBean.answers[3].answerId}" onclick="putValue(${ questionBean.answers[3].answerId})"  checked>
                                                        </c:if>
                                                        <c:if test="${questionBean.answers[3].answerId != questionBean.correctAnswer }">
                                                        	<input type="radio" id="four" name="my_answer" value="${ questionBean.answers[3].answerId}" onclick="putValue(${ questionBean.answers[3].answerId})" >
                                                        </c:if>
                                                    </td>
                                                </tr>

                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="col-12 mt-3 text-center">
                                        <button type="submit" class="btn btn-primary px-5">Save</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
					</form:form>


                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->



        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">�</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login">Logout</a>
                </div>
            </div>
        </div>
    </div>
	
	
	
    <!-- Bootstrap core JavaScript-->
    <script src="<c:url value="/resources/js/jquerymin.js" />"></script>
    <script src="<c:url value="/resources/js/boot.js"/>"></script>

    <!-- Core plugin JavaScript-->
    <script src="<c:url value="/resources/js/easy.js"/>"></script>

    <!-- Custom scripts for all pages-->
    <script src="<c:url value="/resources/js/style.js"/>"></script>

    <!-- Page level plugins -->
    <script src="<c:url value="/resources/js/ok.js"/>"></script>

    <!-- Page level custom scripts -->
    <script src="<c:url value="/resources/js/chart-area-demo.js"/>"></script>
    <script src="<c:url value="/resources/js/chart-pie-demo.js"/>"></script>
    
    <script>
    function putValue(value){
    	
    	$('#correctAnswer').val(value);
    	
    	
    }
    </script>

</body>

</html>