<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.Menu" %>
<%@ page import="com.tap.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tap.DAOimp.RestaurantDAOImplement" %>
<%@ page import="com.tap.model.Restaurant" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Menu</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            color: #333;
            line-height: 1.6;
            min-height: 100vh;
        }

        /* Header Styles - Same as Restaurant JSP */
        .main-header {
            background: linear-gradient(135deg, #4ade80, #22c55e);
            padding: 15px 0;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            position: sticky;
            border-radius: 10px;
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

        /* Minimized Restaurant Name Banner - Reduced Height */
        .restaurant-banner {
            background: white;
            padding: 15px 20px; /* Reduced from 30px to 15px */
            text-align: center;
            color: #333;
            position: relative;
            overflow: hidden;
            margin: 20px auto;
            max-width: 800px;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        }

        .restaurant-banner::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, rgba(255,255,255,0.1) 0%, transparent 50%, rgba(255,255,255,0.1) 100%);
            pointer-events: none;
        }

        .restaurant-banner-content {
            position: relative;
            z-index: 2;
            max-width: 600px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 10px; /* Reduced from 20px to 10px */
            text-align: center;
        }

        .restaurant-image-section {
            flex-shrink: 0;
        }

        .restaurant-image-circle {
            width: 80px; /* Reduced from 120px to 80px */
            height: 80px; /* Reduced from 120px to 80px */
            border-radius: 50%;
            overflow: hidden;
            border: 4px solid rgba(255, 255, 255, 0.3);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
            background: rgba(255, 255, 255, 0.1);
        }

        .restaurant-image-circle:hover {
            transform: scale(1.05);
        }

        .restaurant-image-circle img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .restaurant-image-fallback {
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(255,255,255,0.2) 0%, rgba(255,255,255,0.1) 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2em; /* Reduced from 3em to 2em */
            color: rgba(255, 255, 255, 0.8);
        }

        .restaurant-info-section {
            text-align: center;
            width: 100%;
        }

        .restaurant-name-large {
            font-size: 2rem; /* Reduced from 2.5rem to 2rem */
            font-weight: 800;
            margin-bottom: 8px; /* Reduced from 10px to 8px */
            letter-spacing: -1px;
            line-height: 1.1;
            background: linear-gradient(135deg, #4ade80, #22c55e);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .restaurant-tagline {
            font-size: 1rem; /* Reduced from 1.1rem to 1rem */
            opacity: 0.7;
            font-weight: 300;
            margin-bottom: 12px; /* Reduced from 20px to 12px */
            font-style: italic;
            color: #6b7280;
        }

        .restaurant-stats {
            display: flex;
            gap: 12px; /* Reduced from 15px to 12px */
            flex-wrap: wrap;
            justify-content: center;
        }

        .stat-item {
            display: flex;
            align-items: center;
            gap: 6px;
            background: #f8f9fa;
            color: #333;
            padding: 6px 14px; /* Reduced from 8px 16px to 6px 14px */
            border-radius: 20px;
            font-size: 0.85rem; /* Reduced from 0.9rem to 0.85rem */
            font-weight: 600;
            border: 2px solid #e2e8f0;
            transition: all 0.3s ease;
        }

        .stat-item:hover {
            background: #22c55e;
            color: white;
            border-color: #22c55e;
            transform: translateY(-2px);
        }

        .floating-elements {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            pointer-events: none;
            overflow: hidden;
            z-index: 1;
        }

        .floating-food {
            position: absolute;
            font-size: 1.5rem; /* Reduced from 2rem to 1.5rem */
            opacity: 0.1;
            color: #22c55e;
            animation: float 8s ease-in-out infinite;
        }

        .floating-food:nth-child(1) { top: 15%; left: 10%; animation-delay: 0s; }
        .floating-food:nth-child(2) { top: 25%; right: 15%; animation-delay: 2s; }
        .floating-food:nth-child(3) { bottom: 35%; left: 20%; animation-delay: 4s; }
        .floating-food:nth-child(4) { bottom: 20%; right: 10%; animation-delay: 6s; }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-15px) rotate(3deg); }
        }

        /* Content Wrapper */
        .content-wrapper {
            padding: 60px 20px 40px;
            background: #f8f9fa;
        }

        .container {
            max-width: 800px;
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

        .menu-list {
            background: white;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            overflow: hidden;
        }

        .menu-item {
            display: flex;
            align-items: center;
            padding: 20px;
            border-bottom: 1px solid #e2e8f0;
            transition: background-color 0.2s ease;
            position: relative;
        }

        .menu-item:last-child {
            border-bottom: none;
        }

        .menu-item:hover {
            background-color: #f7fafc;
        }

        .menu-item.unavailable {
            opacity: 0.6;
            background-color: #f1f5f9;
        }

        .menu-item.unavailable::after {
            content: "Unavailable";
            position: absolute;
            top: 15px;
            right: 20px;
            background: #ef4444;
            color: white;
            padding: 4px 12px;
            border-radius: 12px;
            font-size: 0.75em;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .item-image {
            width: 80px;
            height: 80px;
            border-radius: 12px;
            background-color: #e2e8f0;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            flex-shrink: 0;
            margin-right: 20px;
        }

        .item-details {
            flex: 1;
            min-width: 0;
        }

        .item-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 6px;
        }

        .item-name {
            font-size: 1.25em;
            font-weight: 600;
            color: #2d3748;
            margin-bottom: 2px;
        }

        .item-price {
            font-size: 1.25em;
            font-weight: 700;
            color: #2d3748;
            flex-shrink: 0;
        }

        .item-description {
            color: #718096;
            font-size: 0.95em;
            margin-bottom: 8px;
            line-height: 1.4;
        }

        .item-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .rating-section {
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .rating-badge {
            display: flex;
            align-items: center;
            gap: 4px;
            background-color: #22c55e;
            color: white;
            padding: 4px 8px;
            border-radius: 8px;
            font-size: 0.85em;
            font-weight: 600;
        }

        .star-icon {
            font-size: 0.8em;
        }

        .add-btn {
            background: linear-gradient(135deg, #22c55e 0%, #16a34a 100%);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 10px;
            font-weight: 600;
            font-size: 0.9em;
            cursor: pointer;
            transition: all 0.2s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            min-width: 80px;
        }

        .add-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(34, 197, 94, 0.3);
        }

        .add-btn:active {
            transform: translateY(0);
        }

        .add-btn:disabled {
            background: #cbd5e0;
            cursor: not-allowed;
            transform: none;
            box-shadow: none;
        }

        .cart-form {
            margin: 0;
        }

        .no-items {
            text-align: center;
            padding: 80px 40px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
        }

        .no-items h2 {
            color: #4ade80;
            font-size: 2rem;
            margin-bottom: 15px;
        }

        .no-items p {
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
            
            .dropdown-menu a:hover {
                background: rgba(255, 255, 255, 0.2);
                color: white;
            }
            
            .restaurant-banner {
                padding: 12px 15px; /* Further reduced for mobile */
                margin: 15px;
            }
            
            .restaurant-banner-content {
                gap: 8px; /* Further reduced for mobile */
            }
            
            .restaurant-info-section {
                text-align: center;
                width: 100%;
            }
            
            .restaurant-name-large {
                font-size: 1.8rem; /* Reduced for mobile */
            }
            
            .restaurant-tagline {
                font-size: 0.9rem; /* Reduced for mobile */
            }
            
            .restaurant-stats {
                justify-content: center;
                gap: 8px; /* Reduced for mobile */
            }
            
            .stat-item {
                padding: 4px 10px; /* Reduced for mobile */
                font-size: 0.8rem;
            }
            
            .page-header h1 {
                font-size: 2.2rem;
            }
            
            .menu-item {
                padding: 16px;
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }
            
            .item-image {
                width: 100%;
                height: 120px;
                margin-right: 0;
            }
            
            .item-header {
                width: 100%;
            }
            
            .item-footer {
                width: 100%;
            }
        }

        /* Loading animation */
        .restaurant-banner {
            animation: fadeInDown 0.8s ease forwards;
        }

        .menu-item {
            animation: fadeInUp 0.5s ease forwards;
        }

        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
            
        }
        
    </style>
    <script>
        function toggleMobileMenu() {
            const navMenu = document.querySelector('.nav-menu');
            navMenu.classList.toggle('active');
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
		<a href="GetAllRestaurantServlet" ><img src="images/logo.png" alt="Foodify Logo"  width="60" height="60" style="border-radius: 40px">
		</a>
			<a href="GetAllRestaurantServlet" class="logo">FOODIFY</a>
			<nav>
				<ul class="nav-menu">
					<li><a href="GetAllRestaurantServlet">Home</a></li>
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
<a href="GetAllRestaurantServlet" ><img src="images/logo.png" alt="Foodify Logo"  width="60" height="60" style="border-radius: 40px">
			</a>
<a href="GetAllRestaurantServlet" class="logo">FOODIFY
		</a>			
			
			<nav>
				<ul class="nav-menu">
					<li><a href="GetAllRestaurantServlet">Home</a></li>
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

    <!-- Minimized Restaurant Name Banner -->
    <section class="restaurant-banner">
        <div class="restaurant-banner-content">
            <%
              RestaurantDAOImplement imp = new RestaurantDAOImplement();
              Restaurant res = imp.getRestaurant(Integer.parseInt(request.getParameter("restaurantId")));
              
              String restaurantName = res.getName();
              String restaurantAddress = res.getAddress();
              String restaurantRating = res.getRating();
              String restaurantEta = res.getEta();
              
              // Handle null values
              if (restaurantName == null) restaurantName = "Delicious Restaurant";
              if (restaurantAddress == null) restaurantAddress = "Premium Location";
              if (restaurantRating == null) restaurantRating = "4.5";
              if (restaurantEta == null) restaurantEta = "30";
            %>     
            <div class="restaurant-info-section">
                <h1 class="restaurant-name-large"><%= restaurantName %></h1>
                <p class="restaurant-tagline">Crafting culinary excellence, one dish at a time</p>
                
                <div class="restaurant-stats">
                    <div class="stat-item">
                        <span>⭐</span>
                        <span><%= restaurantRating %> Rating</span>
                    </div>
                    <div class="stat-item">
                        <span>🕒</span>
                        <span>Open Now</span>
                    </div>
                    <div class="stat-item">
                        <span>🚚</span>
                        <span><%= restaurantEta %> min delivery</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Menu Content -->
    <div class="content-wrapper">
        <div class="container">
            <%
                List<Menu> list = (List<Menu>) request.getAttribute("menus");
                if (list != null && !list.isEmpty()) {
            %>
            
            <div class="menu-list">
                <%
                    for (Menu m : list) {
                        String imagePath = m.getImagePath();
                        String itemName = m.getItemName();
                        String description = m.getDescription();
                        double price = m.getPrice();
                        String ratingsStr = m.getRatings();
                        String isAvailableStr = m.getIsAvailable();
                        
                        // Handle null values and convert types
                        if (imagePath == null) imagePath = "";
                        if (itemName == null) itemName = "Unknown Item";
                        if (description == null) description = "No description available";
                        if (ratingsStr == null) ratingsStr = "0.0";
                        if (isAvailableStr == null) isAvailableStr = "true";
                        
                        // Convert string values to appropriate types
                        double ratings = 0.0;
                        try {
                            ratings = Double.parseDouble(ratingsStr);
                        } catch (NumberFormatException e) {
                            ratings = 0.0;
                        }
                        
                        boolean isAvailable = true;
                        try {
                            isAvailable = Boolean.parseBoolean(isAvailableStr) || 
                                         "1".equals(isAvailableStr) || 
                                         "yes".equalsIgnoreCase(isAvailableStr) ||
                                         "available".equalsIgnoreCase(isAvailableStr);
                        } catch (Exception e) {
                            isAvailable = true;
                        }
                %>
                
                <div class="menu-item <%= !isAvailable ? "unavailable" : "" %>">
                    <div class="item-image" 
                         <% if (!imagePath.isEmpty()) { %>
                         style="background-image: url('<%= imagePath %>')"
                         <% } %>>
                    </div>
                    
                    <div class="item-details">
                        <div class="item-header">
                            <div>
                                <h3 class="item-name"><%= itemName %></h3>
                                <div class="item-price">₹<%= String.format("%.0f", price) %></div>
                            </div>
                        </div>
                        
                        <p class="item-description"><%= description %></p>
                        
                        <div class="item-footer">
                            <div class="rating-section">
                                <% if (ratings > 0) { %>
                                <div class="rating-badge">
                                    <span class="star-icon">★</span>
                                    <span><%= String.format("%.1f", ratings) %></span>
                                </div>
                                <% } %>
                            </div>
                            
                            <% if (isAvailable) { %>
                            <form action="cart" class="cart-form" method="post">
                                <input type="hidden" name="menuId" value="<%=m.getMenuId() %>">
                                <input type="hidden" name="quantity" value="1">
                                <input type="hidden" name="restaurantId" value="<%= m.getRestaurantId() %>">
                                <input type="hidden" name="action" value="add">
                                <button type="submit" class="add-btn">Add</button>
                            </form>
                            <% } else { %>
                            <button class="add-btn" disabled>Add</button>
                            <% } %>
                        </div>
                    </div>
                </div>
                
                <% } %>
            </div>
            
            <% } else { %>
                <div class="no-items">
                    <h2>🔍 No menu items available</h2>
                    <p>Please check back later for our delicious offerings!</p>
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