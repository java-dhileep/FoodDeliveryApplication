<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FoodHub - Sign Up</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url("images/signup.jpg");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow-x: hidden;
            padding: 20px 0;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(10deg); }
        }

        .signup-container {
            background-image: url("images/logincart.jpg");
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            width: 100%;
            max-width: 500px;
            position: relative;
            z-index: 10;
            border: 1px solid rgba(74, 222, 128, 0.2);
            margin: 20px;
            margin-left: 350px;
        }

        .logo {
            text-align: center;
            margin-bottom: 30px;
        }

        .logo h1 {
            font-size: 2.5rem;
            font-weight: bold;
            background: linear-gradient(135deg, #4ade80, #22c55e);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 5px;
        }

        .logo p {
            color: #6b7280;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #1f2937;
            font-weight: 500;
            font-size: 14px;
        }

        .input-container {
            position: relative;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 15px 20px;
            border: 2px solid #e5e7eb;
            border-radius: 25px;
            font-size: 16px;
            transition: all 0.3s ease;
            background: #f9fafb;
            font-family: inherit;
            color: #1f2937;
        }

        .form-group textarea {
            border-radius: 15px;
            resize: vertical;
            min-height: 80px;
        }

        .form-group select {
            cursor: pointer;
        }

        /* Enhanced hover effects for all inputs */
        .form-group input:hover,
        .form-group select:hover,
        .form-group textarea:hover {
            border-color: #4ade80;
            background: white;
            transform: translateY(-1px);
            box-shadow: 0 3px 12px rgba(74, 222, 128, 0.15);
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #22c55e;
            background: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(34, 197, 94, 0.15);
        }

        /* Special hover effect for select dropdown */
        .form-group select:hover {
            cursor: pointer;
            background: linear-gradient(135deg, #ffffff, #f0fdf4);
        }

        /* Enhanced focus state that overrides hover */
        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            border-color: #22c55e !important;
            background: white !important;
            transform: translateY(-2px) !important;
            box-shadow: 0 4px 15px rgba(34, 197, 94, 0.25) !important;
        }

        .form-group input::placeholder,
        .form-group textarea::placeholder {
            color: #9ca3af;
            transition: color 0.3s ease;
        }

        /* Placeholder hover effect */
        .form-group input:hover::placeholder,
        .form-group textarea:hover::placeholder {
            color: #6b7280;
        }

        .signup-btn {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #4ade80, #22c55e);
            color: white;
            border: none;
            border-radius: 50px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px;
            box-shadow: 0 4px 15px rgba(34, 197, 94, 0.3);
        }

        .signup-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(34, 197, 94, 0.4);
            background: linear-gradient(135deg, #22c55e, #16a34a);
        }

        .signup-btn:active {
            transform: translateY(0);
        }

        .signin-link {
            text-align: center;
            margin-top: 25px;
            padding-top: 25px;
            border-top: 1px solid #e5e7eb;
            color: #6b7280;
            font-size: 14px;
        }

        .signin-link a {
            color: #22c55e;
            text-decoration: none;
            font-weight: bold;
            margin-left: 5px;
            transition: color 0.3s ease;
        }

        .signin-link a:hover {
            color: #16a34a;
            text-decoration: underline;
        }

        .required {
            color: #ef4444;
        }

        /* Header style matching restaurant page */
        .form-header {
            text-align: center;
            margin-bottom: 10px;
        }

        .form-header .food-icon {
            font-size: 3rem;
            margin-bottom: 10px;
        }

        /* Additional hover effect for input containers */
        .input-container:hover {
            transform: scale(1.01);
            transition: transform 0.2s ease;
        }

        .input-container:focus-within {
            transform: scale(1.02);
        }

        @media (max-width: 768px) {
            .signup-container {
                margin: 10px;
                padding: 30px 25px;
            }
            
            .bg-decoration {
                width: 40px;
                height: 40px;
                font-size: 20px;
            }

            .logo h1 {
                font-size: 2rem;
            }
        }

        @media (max-width: 480px) {
            .signup-container {
                padding: 25px 20px;
            }
            
            .logo h1 {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body>
    <div class="signup-container">
        <div class="logo">
            <div class="form-header">
                <div class="food-icon">🍽️</div>
            </div>
            <h1>FoodHub Register</h1>
            <p>Join us and enjoy delicious food delivery</p>
        </div>

        <form action="signIn" method="post">
            <div class="form-group">
                <label for="fullName">Full Name <span class="required">*</span></label>
                <div class="input-container">
                    <input type="text" id="fullName" name="fullName" placeholder="Enter your full name" required>
                </div>
            </div>

            <div class="form-group">
                <label for="email">Email Address <span class="required">*</span></label>
                <div class="input-container">
                    <input type="email" id="email" name="email" placeholder="Enter your email" required>
                </div>
            </div>

            <div class="form-group">
                <label for="userName">Username <span class="required">*</span></label>
                <div class="input-container">
                    <input type="text" id="userName" name="userName" placeholder="Choose a username" required>
                </div>
            </div>

            <div class="form-group">
                <label for="password">Password <span class="required">*</span></label>
                <div class="input-container">
                    <input type="password" id="password" name="password" placeholder="Create a password" required>
                </div>
            </div>

            <div class="form-group">
                <label for="phoneNumber">Phone Number <span class="required">*</span></label>
                <div class="input-container">
                    <input type="tel" id="phoneNumber" name="phoneNumber" placeholder="Enter phone number" required>
                </div>
            </div>

            <div class="form-group">
                <label for="address">Address <span class="required">*</span></label>
                <div class="input-container">
                    <textarea id="address" name="address" placeholder="Enter your complete address" required></textarea>
                </div>
            </div>

            <div class="form-group">
                <label for="role">Role <span class="required">*</span></label>
                <div class="input-container">
                    <select id="role" name="role" required>
                        <option value="">----Select your role----</option>
                        <option value="customer">Customer</option>
                        <option value="restaurant_admin">Restaurant Admin</option>
                        <option value="delivery_agent">Delivery Agent</option>
                        <option value="super_admin">Super Admin</option>
                    </select>
                </div>
            </div>

            <button type="submit" class="signup-btn">Create Account & Join FoodHub!</button>
        </form>

        <div class="signin-link">
            Already have an account?
            <a href="SignIn.jsp">Sign in here</a>
        </div>
    </div>
</body>
</html>