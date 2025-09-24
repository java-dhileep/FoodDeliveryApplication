<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.tap.model.Restaurant"%>
<%@ page import="com.tap.model.User"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>All Restaurant List</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f8f9fa;
	min-height: 100vh;
}

/* Header Styles */
.main-header {
	background: linear-gradient(135deg, #4ade80, #22c55e);
	padding: 15px 0;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	position: sticky;
	border-radius:10px;
	top: 0;
	z-index: 1000;
}

.header-container {
	max-width: 1200px;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 20px;
}

.logo {
	font-size: 1.8rem;
	font-weight: bold;
	color: white;
	text-decoration: none;
	display: flex;
	align-items: center;
	gap: 10px;
}

.logo:hover {
	color: #f0fdf4;
}

.nav-menu {
	display: flex;
	list-style: none;
	gap: 30px;
	align-items: center;
}

.nav-menu li {
	position: relative;
}

.nav-menu a {
	color: white;
	text-decoration: none;
	font-weight: 500;
	font-size: 1rem;
	padding: 10px 20px;
	border-radius: 25px;
	transition: all 0.3s ease;
	display: flex;
	align-items: center;
	gap: 8px;
}

.nav-menu a:hover {
	background: rgba(255, 255, 255, 0.2);
	transform: translateY(-2px);
}

.nav-menu .login-btn {
	background: rgba(255, 255, 255, 0.15);
	border: 2px solid rgba(255, 255, 255, 0.3);
}

.nav-menu .signup-btn {
	background: white;
	color: #22c55e;
	border: 2px solid white;
}

.nav-menu .signup-btn:hover {
	background: #f0fdf4;
	color: #16a34a;
}

.mobile-menu-btn {
	display: none;
	background: none;
	border: none;
	color: white;
	font-size: 1.5rem;
	cursor: pointer;
	padding: 5px;
}

/* Profile Dropdown Styles */
.profile-dropdown {
	position: relative;
}

.profile-link {
	cursor: pointer;
}

.dropdown-menu {
	display: none;
	position: absolute;
	top: 100%;
	right: 0;
	background: white;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 4px 15px rgba(0,0,0,0.15);
	min-width: 150px;
	z-index: 2000;
	overflow: hidden;
}

.dropdown-menu li {
	list-style: none;
}

.dropdown-menu a {
	display: block;
	padding: 12px 16px;
	text-decoration: none;
	color: #333;
	font-size: 0.9rem;
	transition: background-color 0.2s ease;
	border-radius: 0;
}

.dropdown-menu a:hover {
	background-color: #f8f9fa;
	transform: none;
}

.profile-dropdown:hover .dropdown-menu {
	display: block;
}

/* Hero Section Styles */
.hero-section {
	background: white;
	min-height: 90vh;
	display: flex;
	align-items: center;
	position: relative;
	overflow: hidden;
}

.hero-container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 0 20px;
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 60px;
	align-items: center;
}

.hero-content {
	z-index: 2;
}

.hero-title {
	font-size: 3.5rem;
	font-weight: bold;
	color: #22c55e;
	margin-bottom: 20px;
	line-height: 1.2;
}

.hero-subtitle {
	font-size: 1.3rem;
	color: #6b7280;
	margin-bottom: 30px;
	line-height: 1.6;
}

.hero-cta {
	display: flex;
	gap: 20px;
	flex-wrap: wrap;
}

.cta-button {
	padding: 15px 35px;
	border: none;
	border-radius: 50px;
	font-size: 1.1rem;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.3s ease;
	text-decoration: none;
	display: inline-flex;
	align-items: center;
	gap: 10px;
}

.cta-primary {
	background: #22c55e;
	color: white;
	box-shadow: 0 4px 15px rgba(34, 197, 94, 0.3);
}

.cta-primary:hover {
	transform: translateY(-3px);
	box-shadow: 0 6px 20px rgba(34, 197, 94, 0.4);
	background: #16a34a;
}

.cta-secondary {
	background: transparent;
	color: #22c55e;
	border: 2px solid #22c55e;
}

.cta-secondary:hover {
	background: #22c55e;
	color: white;
}

.hero-image-container {
	display: flex;
	justify-content: center;
	position: relative;
}

.hero-image {
	border-radius: 20px;
	overflow: hidden;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
	transition: transform 0.3s ease;
	background: white;
	position: relative;
	max-width: 400px;
	width: 100%;
}

.hero-image:hover {
	transform: translateY(-10px);
}

.hero-image img {
	width: 100%;
	height: 300px;
	object-fit: cover;
	transition: transform 0.3s ease;
}

.hero-image:hover img {
	transform: scale(1.05);
}

.hero-image .image-overlay {
	position: absolute;
	bottom: 0;
	left: 0;
	right: 0;
	background: linear-gradient(transparent, rgba(0, 0, 0, 0.7));
	color: white;
	padding: 20px;
	transform: translateY(100%);
	transition: transform 0.3s ease;
}

.hero-image:hover .image-overlay {
	transform: translateY(0);
}

.floating-elements {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	pointer-events: none;
	overflow: hidden;
}

.floating-food {
	position: absolute;
	font-size: 2rem;
	opacity: 0.1;
	color: #22c55e;
	animation: float 6s ease-in-out infinite;
}

.floating-food:nth-child(1) { top: 10%; left: 10%; animation-delay: 0s; }
.floating-food:nth-child(2) { top: 20%; right: 15%; animation-delay: 1s; }
.floating-food:nth-child(3) { bottom: 30%; left: 20%; animation-delay: 2s; }
.floating-food:nth-child(4) { bottom: 10%; right: 10%; animation-delay: 3s; }

@keyframes float {
	0%, 100% { transform: translateY(0px) rotate(0deg); }
	50% { transform: translateY(-20px) rotate(5deg); }
}

/* Content Styles */
.content-wrapper {
	padding: 60px 20px 40px;
	background: #f8f9fa;
}

.container {
	max-width: 1200px;
	margin: 0 auto;
}

.page-header {
	text-align: center;
	margin-bottom: 50px;
}

.page-header h1 {
	font-size: 3rem;
	font-weight: bold;
	background: linear-gradient(135deg, #4ade80, #22c55e);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	background-clip: text;
	margin-bottom: 20px;
}

.restaurants-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
	gap: 20px;
	padding: 20px 0;
}

.restaurant-card {
	background: white;
	border-radius: 16px;
	overflow: hidden;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease;
	cursor: pointer;
	position: relative;
	height: 300px;
}

.restaurant-card:hover {
	transform: translateY(-4px);
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
}

.restaurant-image {
	width: 100%;
	height: 180px;
	position: relative;
	overflow: hidden;
}

.restaurant-image img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform 0.3s ease;
}

.restaurant-card:hover .restaurant-image img {
	transform: scale(1.05);
}

.placeholder-bg {
	width: 100%;
	height: 100%;
	background: linear-gradient(135deg, #4ade80, #22c55e);
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 3rem;
	color: white;
}

.promo-badge {
	position: absolute;
	top: 12px;
	left: 12px;
	background: rgba(0, 0, 0, 0.8);
	color: white;
	padding: 6px 12px;
	border-radius: 6px;
	font-size: 0.85rem;
	font-weight: bold;
	backdrop-filter: blur(10px);
}

.restaurant-info {
	padding: 16px;
	height: 120px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.restaurant-header {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	margin-bottom: 8px;
}

.restaurant-name {
	font-size: 1.3rem;
	font-weight: bold;
	color: #1f2937;
	margin: 0;
	line-height: 1.2;
}

.restaurant-rating {
	background: #22c55e;
	color: white;
	padding: 2px 6px;
	border-radius: 4px;
	font-size: 0.8rem;
	font-weight: bold;
	display: flex;
	align-items: center;
	gap: 2px;
	min-width: fit-content;
	margin-left: 10px;
}

.restaurant-details {
	display: flex;
	justify-content: space-between;
	align-items: center;
	color: #6b7280;
	font-size: 0.9rem;
}

.cuisine-type {
	font-weight: 500;
}

.delivery-time {
	font-weight: 500;
}

.restaurant-location {
	color: #6b7280;
	font-size: 0.9rem;
	margin-bottom: 8px;
	line-height: 1.4;
	display: block;
	max-height: none;
	overflow: visible;
}

.no-restaurants {
	text-align: center;
	padding: 80px 40px;
	background: white;
	border-radius: 20px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
}

.no-restaurants h2 {
	color: #4ade80;
	font-size: 2rem;
	margin-bottom: 15px;
}

.no-restaurants p {
	color: #6b7280;
	font-size: 1.1rem;
}

a {
	text-decoration: none;
	color: inherit;
}

/* Footer Styles */
.main-footer {
	background: linear-gradient(135deg, #1f2937, #111827);
	color: white;
	padding: 50px 0 20px;
	margin-top: 50px;
}

.footer-container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 0 20px;
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	flex-wrap: wrap;
	gap: 40px;
}

.footer-logo-section {
	flex: 1;
	min-width: 250px;
}

.footer-logo {
	display: flex;
	align-items: center;
	gap: 10px;
	margin-bottom: 20px;
}

.footer-logo img {
	width: 50px;
	height: 50px;
}

.footer-logo h3 {
	font-size: 1.5rem;
	font-weight: bold;
	color: #ef4444;
	margin: 0;
}

.footer-tagline {
	color: #9ca3af;
	font-size: 1rem;
	line-height: 1.6;
	margin: 0;
}

.footer-section {
	flex: 1;
	min-width: 150px;
}

.footer-section h4 {
	color: white;
	font-size: 1.1rem;
	font-weight: bold;
	margin-bottom: 20px;
}

.footer-section ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.footer-section ul li {
	margin-bottom: 12px;
}

.footer-section ul li a {
	color: #9ca3af;
	text-decoration: none;
	font-size: 0.95rem;
	transition: color 0.3s ease;
}

.footer-section ul li a:hover {
	color: #ef4444;
}

.footer-bottom {
	border-top: 1px solid rgba(255, 255, 255, 0.1);
	padding-top: 30px;
	margin-top: 40px;
	text-align: center;
	color: #9ca3af;
	font-size: 0.9rem;
}

/* Mobile Responsive */
@media (max-width: 768px) {
	.header-container {
		padding: 0 15px;
	}
	
	.nav-menu {
		display: none;
		position: absolute;
		top: 100%;
		left: 0;
		right: 0;
		background: linear-gradient(135deg, #4ade80, #22c55e);
		flex-direction: column;
		gap: 0;
		box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	}
	
	.nav-menu.active {
		display: flex;
	}
	
	.nav-menu li {
		width: 100%;
	}
	
	.nav-menu a {
		padding: 15px 20px;
		border-radius: 0;
		justify-content: center;
	}
	
	.mobile-menu-btn {
		display: block;
	}
	
	.dropdown-menu {
		position: static;
		display: block;
		background: rgba(255, 255, 255, 0.1);
		box-shadow: none;
		border: none;
		border-radius: 0;
		width: 100%;
	}
	
	.profile-dropdown:hover .dropdown-menu {
		display: block;
	}
	
	.dropdown-menu a {
		color: white;
		padding: 10px 20px;
		text-align: center;
	}
	
	.hero-section {
		min-height: 60vh;
	}
	
	.hero-container {
		grid-template-columns: 1fr;
		gap: 40px;
		text-align: center;
	}
	
	.hero-title {
		font-size: 2.5rem;
	}
	
	.hero-subtitle {
		font-size: 1.1rem;
	}
	
	.hero-cta {
		justify-content: center;
	}
	
	.cta-button {
		padding: 12px 25px;
		font-size: 1rem;
	}
	
	.hero-image-container {
		order: -1;
		max-width: 300px;
		margin: 0 auto;
	}
	
	.hero-image {
		height: 200px;
	}
	
	.hero-image img {
		height: 200px;
	}
	
	.page-header h1 {
		font-size: 2.2rem;
	}
	
	.restaurants-grid {
		grid-template-columns: 1fr;
		gap: 16px;
	}
	
	.restaurant-card {
		height: 280px;
	}
	
	.restaurant-image {
		height: 160px;
	}
	
	.footer-container {
		flex-direction: column;
		text-align: center;
	}
	
	.footer-section {
		min-width: 100%;
	}
}
</style>
<script>
function toggleMobileMenu() {
	const navMenu = document.querySelector('.nav-menu');
	navMenu.classList.toggle('active');
}

// Sample promotional offers
const promoOffers = [
	"ITEMS AT ₹98",
	"ITEMS AT ₹119", 
	"₹125 OFF ABOVE ₹499",
	"ITEMS AT ₹89",
	"50% OFF",
	"BUY 1 GET 1 FREE",
	"FLAT 30% OFF",
	"FREE DELIVERY"
];

function getRandomPromo() {
	return promoOffers[Math.floor(Math.random() * promoOffers.length)];
}
</script>
</head>
<body>
	<% 
         User user = (User) session.getAttribute("user");
	     if(user != null) {
	        %>
	<!-- Header Section - Logged In User -->
	<header class="main-header">
		<div class="header-container">
<img src="images/logo.png" alt="Foodify Logo"  width="60" height="60" style="border-radius: 40px">
		<a href="GetAllRestaurantServlet" class="logo" >FOODIFY</a>
	
			
			
			<nav>
				<ul class="nav-menu">
					<li><a href="#restaurants">Home</a></li>
					<li><a href="cart.jsp">🛒 Cart</a></li>
					<li><a href="orders">📋 Orders</a></li>
					<li class="profile-dropdown">
						<a href="#" class="profile-link">👤 <%=user.getName()%> </a>
						<ul class="dropdown-menu">
							<li><a href="logout">Logout</a></li>
						</ul>
					</li>
				</ul>
				<button class="mobile-menu-btn" onclick="toggleMobileMenu()">
					☰
				</button>
			</nav>
		</div>
	</header>
<%} else {%>
<!-- Header Section - Guest User -->
	<header class="main-header">
		<div class="header-container">
		
<img src="images/logo.png" alt="Foodify Logo"  width="50" height="50" style="border-radius: 40px">
		
		<a href="GetAllRestaurantServlet" class="logo">FOODIFY</a>
		
			
			<nav>
				<ul class="nav-menu">
					<li><a href="#restaurants">Home</a></li>
					<li><a href="cart.jsp">🛒 Cart</a></li>
					<li><a href="SignIn.jsp">Login</a></li>
					<li><a href="Signup.jsp">Sign Up</a></li>
				</ul>
				<button class="mobile-menu-btn" onclick="toggleMobileMenu()">
					☰
				</button>
			</nav>
		</div>
	</header>
	<%} %>

	<!-- Hero Section -->
	<section class="hero-section">
		<div class="hero-container">
			<div class="hero-image-container">
				<div class="hero-image">
					<img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=400&h=300&fit=crop&crop=center&auto=format&q=80" alt="Delicious 3D Food" onerror="this.src='https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=400&h=300&fit=crop&crop=center&auto=format&q=80">
					<div class="image-overlay">
						<h4>Fresh & Delicious</h4>
						<p>Quality food delivered to you</p>
					</div>
				</div>
			</div>
			
			<div class="hero-content">
				<h1 class="hero-title">
					Craving Something Delicious?
				</h1>
				<p class="hero-subtitle">
					Discover amazing restaurants near you and get your favorite meals delivered fresh to your doorstep. From local gems to popular chains, satisfy every craving with just a few clicks.
				</p>
				<div class="hero-cta">
					<a href="#restaurants" class="cta-button cta-primary">
						🍽️ Explore Restaurants
					</a>
				</div>
			</div>
		</div>
	</section>

	<!-- Main Content -->
	<div class="content-wrapper">
		<div class="container">
			<div class="page-header" id="restaurants">
				<h1>Explore Restaurants</h1>
			</div>

			<% 
	            List<Restaurant> list = (List<Restaurant>) request.getAttribute("restaurants");
	            if (list != null && !list.isEmpty()) {
	        %>
			<div class="restaurants-grid">
				<% for (Restaurant restaurant : list) { %>
				<a href="menuServlet?restaurantId=<%= restaurant.getRestaurantId()%>">
					<div class="restaurant-card">
						<div class="restaurant-image">
							<% if (restaurant.getImagePath() != null && !restaurant.getImagePath().isEmpty()) { %>
							<img src="<%= restaurant.getImagePath() %>" alt="<%= restaurant.getName() %>">
							<% } else { %>
							<div class="placeholder-bg">🍽️</div>
							<% } %>
							<div class="promo-badge">
								<script>document.write(getRandomPromo());</script>
							</div>
						</div>

						<div class="restaurant-info">
							<div class="restaurant-header">
								<h3 class="restaurant-name">
									<%= restaurant.getName() != null ? restaurant.getName() : "Delicious Restaurant" %>
								</h3>
								<div class="restaurant-rating">
									⭐ <%= restaurant.getRating() != null ? restaurant.getRating() : "4.5" %>
								</div>
							</div>

							<div class="restaurant-location">
								📍 <%= restaurant.getAddress() != null ? restaurant.getAddress() : "Premium location" %>
							</div>

							<div class="restaurant-details">
								<span class="cuisine-type">
									<%= restaurant.getCusineType() != null ? restaurant.getCusineType() : "Multi-cuisine" %>
								</span>
								<span class="delivery-time">
									<%= restaurant.getEta() != null ? restaurant.getEta() + " mins" : "25-30 mins" %>
								</span>
							</div>
						</div>
					</div>
				</a>
				<% } %>
			</div>
			<% } else { %>
			<div class="no-restaurants">
				<h2>🔍 No restaurants found</h2>
				<p>Please check if the restaurant data is being loaded properly from your servlet.</p>
			</div>
			<% } %>
		</div>
	</div>

	<!-- Footer Section -->
	<footer class="main-footer">
		<div class="footer-container">
			<div class="footer-logo-section">
				<div class="footer-logo">
<img src="images/logo.png" alt="Foodify Logo"  width="500" height="500" style="border-radius: 40px">
<h3>FOODIFY</h3>
				</div>
				<p class="footer-tagline">Delivering deliciousness to your doorstep.</p>
			</div>
			
			
			
			<div class="footer-section">
				<h4>Support</h4>
				<ul>
					<li><a href="#">Help Center</a></li>
					<li><a href="#">Terms</a></li>
					<li><a href="#">Privacy</a></li>
				</ul>
			</div>
			
			<div class="footer-section">
				<h4>Follow Us</h4>
				<ul>
					<li><a href="https://www.instagram.com/admdhileep/">Instagram</a></li>
					<li><a href="https://www.linkedin.com/in/dhileep-t-776151308/">LinkedIn</a></li>
					<li><a href="https://github.com/java-dhileep">GitHub</a></li>
				</ul>
			</div>
		</div>
		
		<div class="footer-bottom">
			<p>&copy; 2025 Foodify. All rights reserved.</p>
		</div>
	</footer>

</body>
</html>