<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Tables</title>

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css1/sb-admin-2.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css1/sb-admin-2.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">

</head>

<body id="page-top">
			<header class="header_inner">
				<div class="logo-banner-container">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/images/member_images/rogo.png" 
							width="350" height="200">
					</div>
					<div class="baner">
						<img src="${pageContext.request.contextPath}/resources/images/member_images/baner.png"
							width="1000" height="300">
					</div>
				</div>
							<div class="header_util">
								<div class="header_util_inner">
									<div class="header_util_right">
										<ul class="header_util_list">
											<li class="header_util_item"><a href="j#" id="loginBtn"
												class="header_util_link" style="display: block;">로그인</a></li>
											<li class="header_util_item"><a href="#" id="joinBtn"
												class="header_ut il_link" style="display: block;">회원가입</a> <a
												href="#" id="LogoutBtn" class="header_util_link"
												style="display: none;">로그아웃</a></li>
										</ul>
									</div>
								</div>
							</div>
			</header>

    <!-- Page Wrapper -->
    <div id="wrapper">
		
        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">



            <!-- Nav Item - Charts -->
			<li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/adminViewsJspFile/index.do" id="index" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <span>Charts</span>
                    
                </a>
            </li>



            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="${pageContext.request.contextPath}/adminViewsJspFile/userAdmin.do" id="userAdmin" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <span>회원 관리</span>
                    
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed" href="${pageContext.request.contextPath}/adminViewsJspFile/ticket.do" id="ticket" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <span>경기 및 티켓 관리</span>
                </a>
            </li>
            
			<li class="nav-item">
                <a class="nav-link collapsed" href="${pageContext.request.contextPath}/adminViewsJspFile/ticketRegister.do" id="ticketRegister" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <span>경기 및 티켓 등록</span>
                </a>
            </li>
           
            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="${pageContext.request.contextPath}/adminViewsJspFile/athleteManagement.do" id="athleteManagement" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <span>선수 관리</span>
                </a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link collapsed" href="${pageContext.request.contextPath}/adminViewsJspFile/athleteRegister.do" id="athleteRegister" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <span>선수 등록</span>
                </a>
            </li>
            
			<li class="nav-item">
                <a class="nav-link collapsed" href="${pageContext.request.contextPath}/adminViewsJspFile/clubManagement.do" id="clubManagement" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <span>구단 관리</span>
                </a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link collapsed" href="${pageContext.request.contextPath}/adminViewsJspFile/clubRegister.do" id="clubRegister" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <span>구단 등록</span>
                </a>
            </li>
        </ul>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->

                    <!-- Sidebar Toggle (Topbar) -->
                    <form class="form-inline">
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </form>


                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">

                                </form>
                            </div>
                        </li>

                    

                    </ul>

                </nav>
</body>
</html>