<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Secure Checkout - Complete Your Order</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #ffffff;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .checkout-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 100%;
            max-width: 500px;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .checkout-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .checkout-header h1 {
            color: #333;
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 5px;
            background: linear-gradient(135deg, #4ade80, #22c55e);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .checkout-header p {
            color: #666;
            font-size: 1.1rem;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            color: #333;
            font-weight: 600;
            margin-bottom: 10px;
            font-size: 1.1rem;
        }

        .form-group label .required {
            color: #e74c3c;
            margin-left: 3px;
        }

        .form-input {
            width: 100%;
            padding: 15px 20px;
            border: 2px solid #e1e8ed;
            border-radius: 12px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: #fff;
        }

        .form-input:focus {
            outline: none;
            border-color: #4ade80;
            box-shadow: 0 0 0 3px rgba(74, 222, 128, 0.1);
            transform: translateY(-2px);
        }

        textarea.form-input {
            resize: vertical;
            min-height: 80px;
            font-family: inherit;
        }

        select.form-input {
            cursor: pointer;
        }

        .payment-options {
            display: grid;
            gap: 10px;
        }

        .payment-option {
            position: relative;
        }

        .payment-option input[type="radio"] {
            display: none;
        }

        .payment-option label {
            display: block;
            padding: 15px;
            border: 2px solid #e1e8ed;
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.3s ease;
            background: #fff;
            position: relative;
        }

        .payment-option label:hover {
            border-color: #4ade80;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(74, 222, 128, 0.1);
        }

        .payment-option input[type="radio"]:checked + label {
            border-color: #4ade80;
            background: linear-gradient(135deg, rgba(74, 222, 128, 0.1), rgba(34, 197, 94, 0.1));
            box-shadow: 0 5px 15px rgba(74, 222, 128, 0.2);
        }

        .payment-option input[type="radio"]:checked + label::before {
            content: '✓';
            position: absolute;
            top: 15px;
            right: 15px;
            background: #22c55e;
            color: white;
            width: 25px;
            height: 25px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            font-weight: bold;
        }

        .payment-title {
            font-weight: 600;
            color: #333;
            font-size: 1.1rem;
            margin-bottom: 5px;
        }

        .payment-desc {
            color: #666;
            font-size: 0.9rem;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .submit-btn {
            width: 100%;
            background: linear-gradient(135deg, #4ade80 0%, #22c55e 100%);
            color: white;
            border: none;
            padding: 10px 25px;
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 10px 30px rgba(34, 197, 94, 0.3);
            position: relative;
            overflow: hidden;
            margin-top: 10px;
        }

        .submit-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 35px rgba(34, 197, 94, 0.4);
        }

        .submit-btn:active {
            transform: translateY(-1px);
        }

        .submit-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s;
        }

        .submit-btn:hover::before {
            left: 100%;
        }

        @media (max-width: 600px) {
            .form-row {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="checkout-container">
        <div class="checkout-header">
            <h1>Checkout</h1>
        </div>

        <form action="checkout" method="post">
            <div class="form-group">
                <label for="address">Delivery Address <span class="required">*</span></label>
                <textarea id="address" name="address" class="form-input" required placeholder="Enter your complete delivery address including street, city, state, and ZIP code"></textarea>
            </div>

            <div class="form-group">
                <label>Payment Method <span class="required">*</span></label>
                <div class="payment-options">
                    <div class="payment-option">
                        <input type="radio" id="creditCard" name="paymentMethod" value="Credit Card" required>
                        <label for="creditCard">
                            <div class="payment-title">💳 Credit Card</div>
                            <div class="payment-desc">Visa, MasterCard, American Express</div>
                        </label>
                    </div>
                    <div class="payment-option">
                        <input type="radio" id="debitCard" name="paymentMethod" value="Debit Card">
                        <label for="debitCard">
                            <div class="payment-title">💳 Debit Card</div>
                            <div class="payment-desc">Direct payment from your bank account</div>
                        </label>
                    </div>
                    <div class="payment-option">
                        <input type="radio" id="cashOnDelivery" name="paymentMethod" value="Cash on Delivery">
                        <label for="cashOnDelivery">
                            <div class="payment-title">💵 Cash on Delivery</div>
                            <div class="payment-desc">Pay when your order arrives</div>
                        </label>
                    </div>
                </div>
            </div>
            <button type="submit" class="submit-btn">
                🛒 Place Order
            </button>
        </form>
    </div>
</body>
</html>