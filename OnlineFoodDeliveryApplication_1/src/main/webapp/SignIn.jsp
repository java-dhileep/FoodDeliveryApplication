<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FoodieExpress - Sign In</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url("images/login.jpg");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding-left: 15%;
            position: relative;
            overflow: hidden;
        }

        /* Add overlay for better text readability */
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.4);
            z-index: 1;
        }
        .signin-container {
            background-image: url("images/logincart.jpg");
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 35px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 380px;
            position: relative;
            z-index: 10;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .logo {
            text-align: center;
            margin-bottom: 30px;
        }

        .logo h1 {
            background: linear-gradient(135deg, #4ade80, #22c55e);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .logo p {
            color: #666;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 500;
            font-size: 14px;
        }
        
        .input-container {
            position: relative;
        }

        .form-group input {
            width: 100%;
            padding: 15px 20px;
            border: 2px solid #e1e8ed;
            border-radius: 25px;
            font-size: 16px;
            transition: all 0.3s ease;
            background: rgba(248, 249, 250, 0.9);
        }

        .form-group input:hover {
            border-color: #22c55e;
            background: rgba(255, 255, 255, 0.8);
            transform: translateY(-1px);
            box-shadow: 0 2px 10px rgba(34, 197, 94, 0.1);
        }

        .form-group input:focus {
            outline: none;
            border-color: #22c55e;
            background: rgba(255, 255, 255, 0.95);
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(34, 197, 94, 0.15);
        }

        .signin-btn {
            width: 100%;
            padding: 15px;
            background: #22c55e;
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px;
            box-shadow: 0 4px 15px rgba(34, 197, 94, 0.3);
        }

        .signin-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(34, 197, 94, 0.4);
            background: #16a34a;
        }

        .signin-btn:active {
            transform: translateY(0);
        }

        .signup-link {
            text-align: center;
            margin-top: 25px;
            padding-top: 25px;
            border-top: 1px solid #e1e8ed;
            color: #666;
            font-size: 14px;
        }

        .signup-link a {
            color: #22c55e;
            text-decoration: none;
            font-weight: bold;
            margin-left: 5px;
        }

        .signup-link a:hover {
            text-decoration: underline;
            color: #16a34a;
        }

        @media (max-width: 480px) {
            body {
                justify-content: center;
                padding-left: 0;
            }
            
            .signin-container {
                margin: 20px;
                padding: 30px 25px;
            }
            
            .bg-decoration {
                width: 40px;
                height: 40px;
                font-size: 20px;
            }
        }
    </style>
</head>
<body> 
    <div class="signin-container">
        <div class="logo">
           <h1>Login</h1>
        </div>

        <form action="LoginCheck" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <div class="input-container">
                    <input type="text" id="username" name="username" placeholder="Enter your username" required>
                </div>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <div class="input-container">
                    <input type="password" id="password" name="password" placeholder="Enter your password" required>
                </div>
            </div>

            <button type="submit" class="signin-btn">Sign In & Start Ordering!</button>
        </form>

        <div class="signup-link">
            Don't have an account?
            <a href="Signup.jsp">Sign up now</a>
        </div>
    </div>
</body>
</html>