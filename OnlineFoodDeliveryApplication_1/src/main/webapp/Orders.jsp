<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.tap.model.Restaurant"%>
<%@ page import="com.tap.DAOimp.RestaurantDAOImplement"%>
<%@ page import="com.tap.model.Orders"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Order History</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
            line-height: 1.5;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
        }

        .page-title {
            text-align: center;
            font-size: 36px;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 40px;
            letter-spacing: -0.5px;
        }

        .order-card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.05);
            margin-bottom: 10px;
            padding: 12px;
            transition: all 0.3s ease;
            border: 1px solid #f0f0f0;
        }

        .order-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
        }

        .order-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 8px;
            flex-wrap: wrap;
            gap: 5px;
        }

        .order-status {
            display: inline-block;
            padding: 8px 16px;
            border-radius: 25px;
            font-size: 14px;
            font-weight: 600;
            text-transform: lowercase;
            letter-spacing: 0.3px;
        }

        .status-confirmed {
            background-color: #d4edda;
            color: #28a745;
        }

        .status-pending {
            background-color: #fff3cd;
            color: #ffc107;
        }

        .status-delivered {
            background-color: #d1ecf1;
            color: #17a2b8;
        }

        .status-cancelled {
            background-color: #f8d7da;
            color: #dc3545;
        }

        .order-meta {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            gap: 5px;
        }

        .order-date {
            color: #6c757d;
            font-size: 15px;
            font-weight: 500;
        }

        .order-total {
            font-size: 18px;
            font-weight: 700;
            color: #2c3e50;
        }

        .order-content {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .food-image {
            width: 50px;
            height: 50px;
            border-radius: 6px;
            object-fit: cover;
            background: linear-gradient(135deg, #ff6b35, #ff8c42);
            border: 1px solid #fff;
            box-shadow: 0 1px 4px rgba(255, 107, 53, 0.1);
            flex-shrink: 0;
        }

        .food-image-placeholder {
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 12px;
            text-align: center;
            background: linear-gradient(135deg, #ff6b35, #ff8c42);
        }

        .order-details {
            flex: 1;
            min-width: 0;
        }

        .restaurant-name {
            font-size: 24px;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 12px;
            letter-spacing: -0.3px;
        }

        .order-info {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .order-id {
            color: #6c757d;
            font-size: 15px;
            font-weight: 500;
        }

        .action-buttons {
            display: flex;
            gap: 12px;
        }

        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            transition: all 0.2s ease;
            letter-spacing: 0.3px;
        }

        .btn-primary {
            background-color: #ff6b35;
            color: white;
        }

        .btn-primary:hover {
            background-color: #e55a2b;
            transform: translateY(-1px);
        }

        .btn-secondary {
            background-color: #ff8c42;
            color: white;
        }

        .btn-secondary:hover {
            background-color: #e67a32;
            transform: translateY(-1px);
        }

        .order-btn {
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            transition: all 0.2s ease;
            letter-spacing: 0.3px;
            background-color: #ff8c42;
            color: white;
        }

        .order-btn:hover {
            background-color: #e67a32;
            transform: translateY(-1px);
        }

        .empty-state {
            text-align: center;
            padding: 80px 20px;
            color: #6c757d;
        }

        .empty-state h3 {
            font-size: 28px;
            margin-bottom: 15px;
            color: #495057;
        }

        .empty-state p {
            font-size: 16px;
            margin-bottom: 30px;
        }

        @media (max-width: 768px) {
            .container {
                padding: 0 10px;
            }

            .page-title {
                font-size: 28px;
            }

            .order-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .order-meta {
                align-items: flex-start;
            }

            .order-content {
                flex-direction: column;
                text-align: center;
                gap: 15px;
            }

            .food-image {
                width: 80px;
                height: 80px;
            }

            .restaurant-name {
                font-size: 20px;
            }

            .order-info {
                flex-direction: column;
                gap: 8px;
                align-items: center;
            }

            .action-buttons {
                justify-content: center;
                flex-wrap: wrap;
            }

            .btn {
                padding: 10px 20px;
                font-size: 13px;
            }

            .order-btn {
                padding: 10px 20px;
                font-size: 13px;
            }
        }

        @media (max-width: 480px) {
            .order-card {
                padding: 20px;
                margin-bottom: 15px;
            }

            .action-buttons {
                flex-direction: column;
                gap: 8px;
            }

            .btn {
                width: 100%;
            }

            .order-btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="page-title">Your Order History</h1>

        <%
        List<Orders> list = (List<Orders>) session.getAttribute("ordersList");
        if (list != null && !list.isEmpty()) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("MMM dd, yyyy | hh:mm a");
            
            for (Orders order : list) {
                String orderDate = dateFormat.format(order.getOrderDate());
                int orderId = order.getOrderId();
                double totalAmount = order.getTotalAmount();
                String status = order.getStatus();
                int restaurantId = order.getRestaurantId();
                
                RestaurantDAOImplement imp = new RestaurantDAOImplement();
                Restaurant res = imp.getRestaurant(restaurantId);
                String restaurantName = res.getName();
                String imagePath = res.getImagePath();
                
                // Determine status class
                String statusClass = "status-confirmed";
                if ("pending".equalsIgnoreCase(status)) {
                    statusClass = "status-pending";
                } else if ("delivered".equalsIgnoreCase(status)) {
                    statusClass = "status-delivered";
                } else if ("cancelled".equalsIgnoreCase(status)) {
                    statusClass = "status-cancelled";
                }
        %>
        
        <div class="order-card">
            <div class="order-header">
                <span class="order-status <%= statusClass %>"><%= status %></span>
                <div class="order-meta">
                    <div class="order-date"><%= orderDate %></div>
                    <div class="order-total">Total: ₹<%= String.format("%.0f", totalAmount) %></div>
                </div>
            </div>
            
            <div class="order-content">
                <% if (imagePath != null && !imagePath.trim().isEmpty()) { %>
                    <img src="<%= imagePath %>" alt="<%= restaurantName %>" class="food-image" 
                         onerror="this.className='food-image food-image-placeholder'; this.innerHTML='<div style=\'display:flex;align-items:center;justify-content:center;height:100%;font-size:11px;padding:5px;\'>FOOD</div>'; this.src='';">
                <% } else { %>
                    <div class="food-image food-image-placeholder">
                        <div style="display:flex;align-items:center;justify-content:center;height:100%;font-size:11px;padding:5px;">FOOD</div>
                    </div>
                <% } %>
                
                <div class="order-details">
                    <div class="restaurant-name"><%= restaurantName %></div>
                    
                    <div class="order-info">
                        <span class="order-id">Order ID: <%= orderId %></span>
                    </div>
                    
                    <div class="action-buttons">
                        <a href="OrderDetails.jsp?orderId=<%= orderId %>" class="btn btn-primary">View Details</a>
                        
                       <form action="ReorderServlet" style="display:inline;">
						        <input type="hidden" name="orderId" value="<%= orderId %>">
						        <button type="submit" class="order-btn">Reorder</button>
						    </form>
                    </div>
                </div>
            </div>
        </div>
        
        <%
            }
        } else {
        %>
        
        <div class="empty-state">
            <h3>No Orders Yet</h3>
            <p>You haven't placed any orders yet. Start exploring restaurants and place your first order!</p>
            <a href="GetAllRestaurantServlet" class="btn btn-primary" style="margin-top: 20px;">Browse Restaurants</a>
        </div>
        
        <%
        }
        %>
    </div>
</body>
</html>