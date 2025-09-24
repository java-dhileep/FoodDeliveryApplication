<%@page import="com.tap.DAOimp.MenuDAOImplement"%>
<%@page import="com.tap.DAOimp.OrdersDAOImplement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.tap.DAOimp.OrderItemDAOImplement"%>
<%@ page import="com.tap.DAOimp.RestaurantDAOImplement" %>
<%@ page import="com.tap.model.Restaurant"%>
<%@page import="java.util.List"%>
<%@ page import="com.tap.model.OrderItem"%>
<%@ page import="com.tap.model.Orders"%>
<%@ page import="com.tap.model.Menu"%>
<%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            text-align: center;
        }

        .restaurant-name {
            font-size: 2.2rem;
            font-weight: 700;
            margin-bottom: 10px;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
        }

        .order-info {
            background: rgba(255, 255, 255, 0.2);
            padding: 15px;
            border-radius: 15px;
            margin-top: 15px;
            backdrop-filter: blur(10px);
        }

        .order-info-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 8px;
            font-size: 0.95rem;
        }

        .order-info-row:last-child {
            margin-bottom: 0;
        }

        .status {
            display: inline-block;
            padding: 6px 16px;
            background: #4CAF50;
            color: white;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 600;
            text-transform: capitalize;
        }

        .content {
            padding: 30px;
        }

        .order-items {
            margin-bottom: 30px;
        }

        .item {
            display: flex;
            align-items: center;
            padding: 20px 0;
            border-bottom: 1px solid #f0f0f0;
            transition: all 0.3s ease;
        }

        .item:last-child {
            border-bottom: none;
        }

        .item:hover {
            transform: translateX(5px);
            background: rgba(102, 126, 234, 0.05);
            margin: 0 -15px;
            padding: 20px 15px;
            border-radius: 15px;
        }

        .item-image {
            width: 80px;
            height: 80px;
            border-radius: 15px;
            object-fit: cover;
            margin-right: 20px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
        }

        .item-details {
            flex: 1;
        }

        .item-name {
            font-size: 1.1rem;
            font-weight: 600;
            color: #333;
            margin-bottom: 5px;
        }

        .item-quantity {
            color: #666;
            font-size: 0.9rem;
            margin-bottom: 8px;
        }

        .item-price {
            font-size: 1.2rem;
            font-weight: 700;
            color: #667eea;
        }

        .summary {
            background: linear-gradient(135deg, #f8f9ff 0%, #f0f2ff 100%);
            padding: 25px;
            border-radius: 20px;
            margin-bottom: 30px;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
            font-size: 1.1rem;
        }

        .summary-row:last-child {
            margin-bottom: 0;
            padding-top: 15px;
            border-top: 2px solid #667eea;
            font-weight: 700;
            font-size: 1.3rem;
            color: #667eea;
        }

        .delivery-info {
            background: #fff;
            border: 2px solid #f0f0f0;
            border-radius: 20px;
            padding: 25px;
            margin-bottom: 30px;
        }

        .delivery-title {
            font-size: 1.2rem;
            font-weight: 700;
            color: #333;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }

        .delivery-title::before {
            content: "📍";
            margin-right: 10px;
            font-size: 1.4rem;
        }

        .delivery-address {
            color: #666;
            line-height: 1.6;
            font-size: 1rem;
        }

        .payment-method {
            background: linear-gradient(135deg, #ff9a56 0%, #ff6b6b 100%);
            color: white;
            padding: 15px 25px;
            border-radius: 25px;
            font-weight: 600;
            text-align: center;
            margin-bottom: 25px;
        }

        .back-button {
            background: linear-gradient(135deg, #ff6b6b 0%, #ee5a52 100%);
            color: white;
            padding: 15px 40px;
            border: none;
            border-radius: 50px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            width: 100%;
        }

        .back-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(238, 90, 82, 0.3);
        }

        .back-button::before {
            content: "← ";
            margin-right: 8px;
        }

        @media (max-width: 480px) {
            .container {
                margin: 10px;
                border-radius: 15px;
            }
            
            .content {
                padding: 20px;
            }
            
            .restaurant-name {
                font-size: 1.8rem;
            }
            
            .item-image {
                width: 60px;
                height: 60px;
            }
        }

        .loading {
            text-align: center;
            padding: 50px;
            color: #666;
        }
    </style>
</head>
<body>
    <%
    try {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        
        OrderItemDAOImplement imp = new OrderItemDAOImplement();
        List<OrderItem> list = imp.getAllOrderItemSpecificOrderId(orderId);
        
        OrdersDAOImplement orderImp = new OrdersDAOImplement();
        Orders order = orderImp.getOrder(orderId);
        
        RestaurantDAOImplement restaurantImp = new RestaurantDAOImplement();
        Restaurant res = restaurantImp.getRestaurant(order.getRestaurantId());
        String restaurantName = res.getName();
        
        SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, yyyy | hh:mm a");
        String formattedDate = sdf.format(order.getOrderDate());
        
        double totalAmount = 0;
    %>

    <div class="container">
        <div class="header">
            <h1 class="restaurant-name"><%= restaurantName %></h1>
            <div class="order-info">
                <div class="order-info-row">
                    <span>Order ID: <%= order.getOrderId() %></span>
                    <span><%= formattedDate %></span>
                </div>
                <div class="order-info-row">
                    <span>Status:</span>
                    <span class="status"><%= order.getStatus() %></span>
                </div>
            </div>
        </div>

        <div class="content">
            <div class="order-items">
                <%
                for (OrderItem item : list) {
                    int menuId = item.getMenuId();
                    MenuDAOImplement menuImp = new MenuDAOImplement();
                    Menu menu = menuImp.getMenu(menuId);
                    totalAmount += item.getTotalPrize();
                %>
                <div class="item">
                    <img src="<%= menu.getImagePath() %>" alt="<%= menu.getItemName() %>" class="item-image" onerror="this.src='https://via.placeholder.com/80x80?text=Food'">
                    <div class="item-details">
                        <div class="item-quantity"><%= item.getQuantity() %>x <%= menu.getItemName() %></div>
                        <div class="item-price">₹<%= item.getTotalPrize() %></div>
                    </div>
                </div>
                <% } %>
            </div>

            <div class="summary">
                <div class="summary-row">
                    <span>Item Total:</span>
                    <span>₹<%= String.format("%.0f", totalAmount) %></span>
                </div>
                <div class="summary-row">
                    <span>Paid via:</span>
                    <span>Cash On Delivery</span>
                </div>
            </div>

            <div class="delivery-info">
                <div class="delivery-title">Delivery To:</div>
                <div class="delivery-address">
                    <%= order.getDeliveryAddress() %>
                </div>
            </div>

            <button class="back-button" onclick="window.history.back()">
                Back to Orders
            </button>
        </div>
    </div>

    <%
    } catch (Exception e) {
    %>
    <div class="container">
        <div class="loading">
            <h2>Error loading order details</h2>
            <p>Please try again or contact support.</p>
            <button class="back-button" onclick="window.history.back()" style="margin-top: 20px; width: auto; display: inline-block;">
                Go Back
            </button>
        </div>
    </div>
    <%
    }
    %>
</body>
</html>