<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="resources/sb-admin/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
	<body class="sb-nav-fixed">
	<!-- header attribute -->
	<tiles:insertAttribute name="header"></tiles:insertAttribute>
		<div id="layoutSidenav">
			<!-- menu attribute -->
			<tiles:insertAttribute name="menu"></tiles:insertAttribute>

			<div id="layoutSidenav_content">
		
				<main>
					<!-- body attribute -->
					<div class="container-fluid px-4">
						<tiles:insertAttribute name="body"></tiles:insertAttribute>
					</div>
				</main>
			
				<!-- footer attribute -->
				<tiles:insertAttribute name="footer"></tiles:insertAttribute>
			
			</div>
		</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="resources/sb-admin/js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="admin/assets/demo/chart-area-demo.js"></script>
	<script src="admin/assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
	<script src="admin/js/datatables-simple-demo.js"></script>
</body>
</html>


