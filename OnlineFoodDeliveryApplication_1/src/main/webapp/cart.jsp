<%@page import="com.tap.DAOimp.MenuDAOImplement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tap.DAOimp.Cart, com.tap.model.CartItem" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.tap.model.User"%>
<%@ page import="com.tap.model.Menu"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            background-color: #f5f7fa;
            color: #2d3748;
            line-height: 1.6;
            min-height: 100vh;
            padding: 20px 0;
        }
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
        

        .container {
            max-width: 900px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .cart-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .cart-header h1 {
            font-size: 2.5rem;
            font-weight: 600;
            color: #2d3748;
            margin-bottom: 10px;
        }

        .cart-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            padding: 30px;
        }

        .cart-item {
            display: flex;
            align-items: center;
            padding: 20px 0;
            border-bottom: 1px solid #e2e8f0;
            transition: all 0.3s ease;
        }

        .cart-item:last-child {
            border-bottom: none;
        }

        .cart-item:hover {
            background-color: #f8fafc;
            margin: 0 -30px;
            padding: 20px 30px;
            border-radius: 12px;
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
            margin-right: 20px;
        }

        .item-name {
            font-size: 1.25rem;
            font-weight: 600;
            color: #2d3748;
            margin-bottom: 8px;
        }

        .item-price-info {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .price-line {
            font-size: 0.95rem;
            color: #4a5568;
        }

        .total-line {
            font-size: 1rem;
            font-weight: 600;
            color: #2d3748;
        }

        .item-controls {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .quantity-controls {
            display: flex;
            align-items: center;
            gap: 12px;
            background: #f7fafc;
            padding: 8px 12px;
            border-radius: 12px;
            border: 1px solid #e2e8f0;
        }

        .quantity-btn {
            width: 32px;
            height: 32px;
            border: none;
            border-radius: 8px;
            background: #22c55e;
            color: white;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .quantity-btn:hover {
            background: #16a34a;
            transform: scale(1.05);
        }

        .quantity-btn:active {
            transform: scale(0.95);
        }

        .quantity-btn:disabled {
            background: #cbd5e0;
            cursor: not-allowed;
            transform: none;
        }

        .quantity-display {
            font-size: 1.1rem;
            font-weight: 600;
            color: #2d3748;
            min-width: 30px;
            text-align: center;
        }

        .remove-btn {
            background: #e53e3e;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 50%;
            width: 44px;
            height: 44px;
            font-size: 1.2rem;
            cursor: pointer;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 8px rgba(229, 62, 62, 0.2);
        }

        .remove-btn:hover {
            background: #c53030;
            transform: translateY(-1px) scale(1.05);
            box-shadow: 0 4px 12px rgba(229, 62, 62, 0.3);
        }

        .remove-btn:active {
            transform: translateY(0) scale(0.95);
        }

        .cart-summary {
            margin-top: 30px;
            padding-top: 30px;
            border-top: 2px solid #e2e8f0;
            text-align: right;
        }

        .grand-total {
            font-size: 1.5rem;
            font-weight: 700;
            color: #2d3748;
            margin-bottom: 20px;
        }

        .cart-actions {
            display: flex;
            gap: 15px;
            justify-content: flex-end;
            align-items: center;
        }

        .checkout-btn {
            background: linear-gradient(135deg, #22c55e 0%, #16a34a 100%);
            color: white;
            border: none;
            padding: 15px 40px;
            border-radius: 12px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            box-shadow: 0 4px 15px rgba(34, 197, 94, 0.3);
        }

        .checkout-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(34, 197, 94, 0.4);
        }

        .checkout-btn:active {
            transform: translateY(0);
        }

        .add-more-btn {
            background: linear-gradient(135deg, #4ade80 0%, #22c55e 100%);
            color: white;
            border: none;
            padding: 15px 30px;
            border-radius: 12px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            box-shadow: 0 4px 15px rgba(74, 222, 128, 0.3);
            text-decoration: none;
            display: inline-block;
        }

        .add-more-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(74, 222, 128, 0.4);
            text-decoration: none;
            color: white;
        }

        .add-more-btn:active {
            transform: translateY(0);
        }

        .empty-cart {
            text-align: center;
            padding: 80px 20px;
            color: #718096;
        }

        .empty-cart-icon {
            font-size: 4rem;
            margin-bottom: 20px;
            opacity: 0.5;
        }

        .empty-cart h2 {
            font-size: 1.5rem;
            margin-bottom: 10px;
            color: #4a5568;
        }

        .empty-cart p {
            font-size: 1rem;
            margin-bottom: 30px;
        }

        .continue-shopping {
            background: linear-gradient(135deg, #4ade80 0%, #22c55e 100%);
            color: white;
            text-decoration: none;
            padding: 12px 30px;
            border-radius: 10px;
            font-weight: 600;
            transition: all 0.3s ease;
            display: inline-block;
        }

        .continue-shopping:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(74, 222, 128, 0.3);
        }

        /* Mobile responsiveness */
        @media (max-width: 640px) {
            .container {
                padding: 0 15px;
            }
            
            .cart-container {
                padding: 20px;
                border-radius: 15px;
            }
            
            .cart-item {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
                padding: 20px 0;
            }
            
            .cart-item:hover {
                margin: 0 -20px;
                padding: 20px;
            }
            
            .item-image {
                width: 100%;
                height: 120px;
                margin-right: 0;
            }
            
            .item-controls {
                width: 100%;
                justify-content: space-between;
            }
            
            .cart-header h1 {
                font-size: 2rem;
            }

            .cart-actions {
                flex-direction: column;
                gap: 10px;
                align-items: stretch;
            }

            .checkout-btn,
            .add-more-btn {
                width: 100%;
                text-align: center;
            }
        }

        /* Animation for cart items */
        .cart-item {
            animation: slideIn 0.5s ease forwards;
        }

        @keyframes slideIn {
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
			<a href="GetAllRestaurantServlet" class="logo">FOODIFY
			</a>
			
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
<img src="images/logo.png" alt="Foodify Logo"  width="60" height="60" style="border-radius: 40px">
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

    <div class="container">
        <div class="cart-header">
            <h1>Your Cart</h1>
        </div>

        <%
            Cart cart = (Cart) session.getAttribute("cart");
            Integer restaurantId = (Integer) session.getAttribute("restaurantId");
            DecimalFormat df = new DecimalFormat("#.##");
            MenuDAOImplement menuImp=new MenuDAOImplement();
            
            if (cart != null && cart.getItems() != null && !cart.getItems().isEmpty()) {
                Map<Integer, CartItem> items = cart.getItems();
                double grandTotal = 0.0;
        %>
        
        <div class="cart-container">
        
            <%
                for (CartItem item : items.values()) {
                    double itemTotal = item.getPrice() * item.getQuantity();
                    grandTotal += itemTotal;
                    
                    String itemName = item.getName() != null ? item.getName() : "Unknown Item";
                    // Note: If your CartItem doesn't have getImagePath(), you might need to fetch it from Menu table
                    int menuId=item.getId();
                    Menu getMenu=menuImp.getMenu(menuId);
                    String imagePath = getMenu.getImagePath(); // You may need to add this field to CartItem or fetch from database
            %>
            
            <div class="cart-item">
                <div class="item-image" 
                     <% if (!imagePath.isEmpty()) { %>
                     style="background-image: url('<%= imagePath %>')"
                     <% } %>>
                </div>
                
                <div class="item-details">
                    <h3 class="item-name"><%= itemName %></h3>
                    <div class="item-price-info">
                        <div class="price-line">Price: ₹<%= df.format(item.getPrice()) %></div>
                        <div class="total-line">Total: ₹<%= df.format(itemTotal) %></div>
                    </div>
                </div>
                
                <div class="item-controls">
                    <div class="quantity-controls">
                        <form action="cart" method="post" style="display: inline;">
                            <input type="hidden" name="itemId" value="<%= item.getId() %>">
                            <input type="hidden" name="restaurantId" value="<%= item.getRestaurantId() %>">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="quantity" value="<%=item.getQuantity()-1 %>">
                            <button type="submit" class="quantity-btn" <%if(item.getQuantity() == 1) {%>disabled <% }%> >-</button>
                        </form>
                        
                        <span class="quantity-display"><%= item.getQuantity() %></span>
                        
                        <form action="cart" method="post" style="display: inline;">
                            <input type="hidden" name="itemId" value="<%= item.getId() %>">
                            <input type="hidden" name="restaurantId" value="<%= item.getRestaurantId() %>">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="quantity" value="<%= item.getQuantity()+1%>">
                            <button type="submit" class="quantity-btn">+</button>
                        </form>
                    </div>
                    
                    <form action="cart" method="post" style="display: inline;">
                        <input type="hidden" name="itemId" value="<%= item.getId() %>">
                            <input type="hidden" name="restaurantId" value="<%= item.getRestaurantId() %>">
                        <input type="hidden" name="action" value="remove">
                        <button type="submit" class="remove-btn">×</button>
                    </form>
                </div>
            </div>
            
            <% } %>
            
            <div class="cart-summary">
                <div class="grand-total">
                    Grand Total: ₹<%= df.format(grandTotal) %>
                </div>
                <div class="cart-actions">
                    <a href="menuServlet?restaurantId=<%= restaurantId %>" class="add-more-btn">Add More Items</a>
                    <form action="checkout.jsp" method="post" style="display: inline;">
                        <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
                        <input type="hidden" name="totalAmount" value="<%= grandTotal %>">
                        <button type="submit" class="checkout-btn">Proceed to Checkout</button>
                    </form>
                </div>
            </div>
        </div>
        
        <% } else { %>
            <div class="cart-container">
                <div class="empty-cart">
                    <div class="empty-cart-icon">🛒</div>
                    <h2>Your cart is empty</h2>
                    <p>Add some delicious items to your cart and they will appear here.</p>
                    <% if(restaurantId !=null) { %>
                    <a href="menuServlet?restaurantId=<%= restaurantId%>" class="continue-shopping">Brows Menu</a>
                   <%}  else { %>
                    <a href="GetAllRestaurantServlet" class="continue-shopping">Continue Shopping</a>
                  <%} %>
                    
                </div>
            </div>
        <% } %>
    </div>
</body>
</html>