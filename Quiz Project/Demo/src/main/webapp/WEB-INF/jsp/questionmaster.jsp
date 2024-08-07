<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Dashboard</title>

<!-- Custom fonts for this template-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="index.html">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-smile"></i>
				</div>
				<div class="sidebar-brand-text mx-3">Admin</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item "><a class="nav-link" href="secondpage">
					<i class="fas fa-fw fa-list"></i> <span>Subject</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="questionmaster.html"> <i class="fas fa-fw fa-folder"></i>
					<span>Question Master</span></a></li>
			<li class="nav-item"><a class="nav-link" href="quizsetting.html">
					<i class="fas fa-fw fa-cog"></i> <span>Quiz Setting</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#"
				data-toggle="modal" data-target="#logoutModal"> <i
					class="fas fa-sign-out-alt fa-fw"></i> <span>Logout</span></a></li>



		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link  rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Question Master</h1>
						<a href="addques"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-plus fa-sm text-white-50"></i> Add Question</a>
					</div>


					<!-- Content Row -->

					<div class="row">

						<!-- Area Chart -->
						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">Question
										List</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="table-responsive">
										<table class="table border">
											<thead>
												<tr>
													<th>Question Statement</th>
													<th>Subject Name</th>
													<th>Correct Answer</th>
													<th>Status</th>
													<th class="text-center" style="width: 80px;">Action</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${queslist}" var="que">
													<tr>
														<td>${que.quesname}</td>
														<td>${que.subjectName}</td>
														<td>${que.correctAnswer}</td>
														<c:if test="${que.quesstatus eq 0}">
															<td class="text-danger">InActive</td>
														</c:if>
														<c:if test="${que.quesstatus eq 1}">
															<td class="text-success">Active</td>
														</c:if>
														<td class="text-center"><a
															href="editques/${que.quesid} "><i
																class="fas fa-pencil-alt"></i></a> <span class="text-light">|</span>
															<form action="deletequestion" method="post"
																style="display: inline;">
																<input type="hidden" name="subjectId"
																	value="${que.quesid}"> <a
																	href="deleteques/${que.quesid}"
																	data-question-id="${que.quesid}"><i
																	class="fa fa-trash"></i></a>
															</form>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<div class="mt-3">
										<nav aria-label="Page navigation">
											<ul class="pagination justify-content-center">
												<li class="page-item"><a class="page-link" href="#">Previous</a></li>
												<li class="page-item"><a class="page-link" href="#">1</a></li>
												<li class="page-item"><a class="page-link" href="#">2</a></li>
												<li class="page-item"><a class="page-link" href="#">3</a></li>
												<li class="page-item"><a class="page-link" href="#">Next</a></li>
											</ul>
										</nav>
									</div>
								</div>
							</div>
						</div>

					</div>



				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->

			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="resources/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="resources/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="resources/js/demo/chart-area-demo.js"></script>
	<script src="resources/js/demo/chart-pie-demo.js"></script>

</body>

</html>