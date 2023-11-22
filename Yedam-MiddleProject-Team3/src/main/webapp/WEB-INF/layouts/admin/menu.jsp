<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="layoutSidenav_nav">
	<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
		<div class="sb-sidenav-menu">
			<div class="nav">
				<div class="sb-sidenav-menu-heading">view</div>
				<a class="nav-link" href="adMain.do">
					<div class="sb-nav-link-icon">
						<i class="fas fa-tachometer-alt"></i>
					</div> Dashboard
				</a>

				<div class="sb-sidenav-menu-heading">menu</div>

				<a class="nav-link" href="adRestaurantList.do">
					<div class="sb-nav-link-icon">
						<i class="fas fa-table"></i>
					</div> Restaurant
				</a> 
				<a class="nav-link" href="adMemberList.do">
					<div class="sb-nav-link-icon">
						<i class="fas fa-table"></i>
					</div> Member
				</a>
				<a class="nav-link" href="chartForm.do">
					<div class="sb-nav-link-icon">
						<i class="fas fa-chart-area"></i>
					</div> Charts <a class="nav-link collapsed" href="#"
					data-bs-toggle="collapse" data-bs-target="#collapseLayouts"
					aria-expanded="false" aria-controls="collapseLayouts">
						<div class="sb-nav-link-icon">
							<i style='font-size: 14px;' class='fas'>&#xf53d;</i>
						</div> Coupon
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
				</a>
				<div class="collapse" id="collapseLayouts"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="adCouponList.do">Coupon Get Member</a>
						<a class="nav-link" href="adCouponListA.do">Give
							Coupon</a>
					</nav>
				</div>
				<a class="nav-link" href="boardListPage.do">
					<div class="sb-nav-link-icon">
						<i class="fas fa-table"></i>
					</div> Board
				</a> 
			</div>
		</div>
		<div class="sb-sidenav-footer">
			<div class="small">Logged in as:</div>
			관리자
		</div>
	</nav>
</div>