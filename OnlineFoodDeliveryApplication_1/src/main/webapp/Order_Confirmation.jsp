<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.Orders" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation - Thank You!</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f8f9fa;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .confirmation-container {
            background: white;
            border-radius: 25px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            max-width: 600px;
            width: 100%;
            padding: 50px 40px;
            text-align: center;
            position: relative;
            transform-style: preserve-3d;
            animation: containerPopup 1s cubic-bezier(0.175, 0.885, 0.32, 1.275) both;
            border: 1px solid rgba(74, 222, 128, 0.2);
        }

        @keyframes containerPopup {
            0% {
                opacity: 0;
                transform: scale(0.3) rotateX(-40deg) translateY(100px);
                filter: blur(15px);
            }
            30% {
                opacity: 0.7;
                transform: scale(0.8) rotateX(-10deg) translateY(20px);
                filter: blur(5px);
            }
            70% {
                opacity: 0.9;
                transform: scale(1.05) rotateX(5deg) translateY(-10px);
                filter: blur(1px);
            }
            100% {
                opacity: 1;
                transform: scale(1) rotateX(0deg) translateY(0px);
                filter: blur(0px);
            }
        }

        .confirmation-container::before {
            content: '';
            position: absolute;
            top: -5px;
            left: -5px;
            right: -5px;
            bottom: -5px;
            background: linear-gradient(45deg, 
                rgba(74, 222, 128, 0.1), 
                rgba(34, 197, 94, 0.1), 
                rgba(22, 163, 74, 0.1),
                rgba(74, 222, 128, 0.1)
            );
            border-radius: 30px;
            z-index: -1;
            animation: borderGlow 3s ease-in-out infinite;
        }

        @keyframes borderGlow {
            0%, 100% {
                opacity: 0.5;
                filter: blur(8px);
            }
            50% {
                opacity: 0.8;
                filter: blur(12px);
            }
        }

        .checkmark {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background: linear-gradient(135deg, #4ade80, #22c55e, #16a34a);
            margin: 0 auto 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            box-shadow: 
                0 20px 40px rgba(34, 197, 94, 0.3),
                0 10px 20px rgba(34, 197, 94, 0.2),
                inset 0 2px 10px rgba(255, 255, 255, 0.3);
            animation: checkmark3DPop 1.2s cubic-bezier(0.68, -0.55, 0.265, 1.55) 0.3s both;
        }

        @keyframes checkmark3DPop {
            0% {
                transform: scale(0) rotateX(90deg) rotateY(90deg);
                opacity: 0;
                filter: blur(10px);
            }
            20% {
                transform: scale(0.3) rotateX(45deg) rotateY(45deg);
                opacity: 0.3;
                filter: blur(5px);
            }
            60% {
                transform: scale(1.3) rotateX(-10deg) rotateY(-10deg);
                opacity: 0.8;
                filter: blur(0px);
            }
            80% {
                transform: scale(0.9) rotateX(5deg) rotateY(5deg);
                opacity: 0.9;
            }
            100% {
                transform: scale(1) rotateX(0deg) rotateY(0deg);
                opacity: 1;
                filter: blur(0px);
            }
        }

        .checkmark::before {
            content: '';
            position: absolute;
            width: 140px;
            height: 140px;
            border-radius: 50%;
            background: radial-gradient(circle at 30% 30%, rgba(34, 197, 94, 0.15), transparent 70%);
            top: -10px;
            left: -10px;
            animation: checkmarkGlow 2s ease-in-out infinite alternate;
        }

        @keyframes checkmarkGlow {
            0% {
                transform: scale(1);
                opacity: 0.3;
            }
            100% {
                transform: scale(1.1);
                opacity: 0.6;
            }
        }

        .checkmark::after {
            content: '✓';
            color: white;
            font-size: 50px;
            font-weight: bold;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            position: relative;
            z-index: 2;
            animation: checkmarkTickAppear 0.8s ease-out 0.8s both;
        }

        @keyframes checkmarkTickAppear {
            0% {
                transform: scale(0) rotate(-45deg);
                opacity: 0;
            }
            50% {
                transform: scale(1.2) rotate(15deg);
                opacity: 0.8;
            }
            100% {
                transform: scale(1) rotate(0deg);
                opacity: 1;
            }
        }

        h1 {
            font-size: 2.5em;
            margin-bottom: 15px;
            font-weight: bold;
            background: linear-gradient(135deg, #4ade80, #22c55e);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            animation: titleSlideIn 0.8s ease-out 1.2s both;
        }

        @keyframes titleSlideIn {
            0% {
                opacity: 0;
                transform: translateY(20px) scale(0.9);
            }
            100% {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .subtitle {
            color: #6b7280;
            font-size: 1.2em;
            margin-bottom: 30px;
            line-height: 1.6;
            animation: subtitleFadeIn 0.8s ease-out 1.4s both;
        }

        @keyframes subtitleFadeIn {
            0% {
                opacity: 0;
                transform: translateY(15px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .order-details {
            background: linear-gradient(135deg, #f0fdf4 0%, #dcfce7 100%);
            border-radius: 20px;
            padding: 30px;
            margin: 35px 0;
            text-align: left;
            box-shadow: 
                0 4px 15px rgba(0, 0, 0, 0.05),
                inset 0 1px 0 rgba(255, 255, 255, 0.8);
            animation: detailsSlideUp 0.8s ease-out 1.6s both;
            transform-style: preserve-3d;
            border: 1px solid rgba(74, 222, 128, 0.15);
        }

        @keyframes detailsSlideUp {
            0% {
                opacity: 0;
                transform: translateY(30px) rotateX(-15deg);
            }
            100% {
                opacity: 1;
                transform: translateY(0) rotateX(0deg);
            }
        }

        .detail-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px solid rgba(74, 222, 128, 0.2);
        }

        .detail-row:last-child {
            border-bottom: none;
            font-weight: bold;
            color: #22c55e;
            font-size: 1.1em;
        }

        .detail-label {
            color: #374151;
            font-weight: 500;
        }

        .detail-value {
            color: #1f2937;
            font-weight: 600;
        }

        .actions {
            display: flex;
            gap: 15px;
            justify-content: center;
            flex-wrap: wrap;
            margin-top: 30px;
        }

        .actions input[type="submit"],
        .btn {
            padding: 15px 35px;
            border: none;
            border-radius: 50px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            background: linear-gradient(135deg, #4ade80, #22c55e);
            color: white;
            box-shadow: 0 4px 15px rgba(34, 197, 94, 0.3);
        }

        .actions input[type="submit"]:hover,
        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(34, 197, 94, 0.4);
            background: linear-gradient(135deg, #22c55e, #16a34a);
        }

        .btn-secondary {
            background: transparent;
            color: #22c55e;
            border: 2px solid #22c55e;
        }

        .btn-secondary:hover {
            background: #22c55e;
            color: white;
        }

        .info-box {
            background: rgba(74, 222, 128, 0.1);
            border-left: 4px solid #22c55e;
            padding: 15px;
            margin: 25px 0;
            border-radius: 5px;
            text-align: left;
        }

        .info-box h3 {
            color: #22c55e;
            margin-bottom: 8px;
            font-size: 1.1em;
        }

        .info-box p {
            color: #374151;
            line-height: 1.5;
        }

        @media (max-width: 768px) {
            .confirmation-container {
                padding: 30px 20px;
            }

            h1 {
                font-size: 2em;
            }

            .actions {
                flex-direction: column;
            }

            .actions input[type="submit"],
            .btn {
                width: 100%;
            }
        }

        .floating-elements {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            overflow: hidden;
            z-index: -1;
        }

        .floating-circle {
            position: absolute;
            border-radius: 50%;
            background: rgba(74, 222, 128, 0.1);
            animation: float 6s ease-in-out infinite;
        }

        .floating-circle:nth-child(1) {
            width: 80px;
            height: 80px;
            top: 10%;
            left: 10%;
            animation-delay: 0s;
        }

        .floating-circle:nth-child(2) {
            width: 60px;
            height: 60px;
            top: 70%;
            left: 80%;
            animation-delay: 2s;
        }

        .floating-circle:nth-child(3) {
            width: 100px;
            height: 100px;
            top: 40%;
            left: 5%;
            animation-delay: 4s;
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0px) rotate(0deg);
                opacity: 0.7;
            }
            50% {
                transform: translateY(-20px) rotate(180deg);
                opacity: 0.3;
            }
        }
    </style>
</head>
<body>
     <%Orders orders=(Orders)session.getAttribute("order"); %>
    <div class="floating-elements">
        <div class="floating-circle"></div>
        <div class="floating-circle"></div>
        <div class="floating-circle"></div>
    </div>

    <div class="confirmation-container">
        <div class="checkmark"></div>
        
        <h1>Order Confirmed!</h1>
        <p class="subtitle">Thank you for your purchase. Your order has been successfully placed and is being processed.</p>
        
        <div class="order-details">
            <div class="detail-row">
                <span class="detail-label">Order Number:</span>
                <span class="detail-value"><%=session.getAttribute("orderId") %></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Order Date:</span>
                <span class="detail-value"><%=orders.getOrderDate() %></span>
            </div>
           
            <div class="detail-row">
                <span class="detail-label">Total Amount:</span>
                <span class="detail-value">₹<%=orders.getTotalAmount() %></span>
            </div>
        </div>
        <div class="actions">
			<form action="GetAllRestaurantServlet">
			<input type="submit" value="Continue Order">
			</form>
        </div>
    </div>


</body>
</html>