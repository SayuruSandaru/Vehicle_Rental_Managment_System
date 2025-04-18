<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login Page</title>
    <!-- Include Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: 'Poppins', sans-serif;
        }

        .login-container {
            display: flex;
            height: 100vh;
            align-items: center;
            justify-content: center;
        }

        .login-form {
            padding: 20px;
            border-radius: 8px;
            background: white;
            margin-left: 100px;
            margin-right: 100px;
        }

        .side-image {
            background: url("images/login_i.jpg") no-repeat center center;
            background-size: cover;
            height: 100%;
            position: relative;
        }

        .company-info {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            text-align: center;
        }

        .company-info h1 {
            margin: 0;
            font-size: 3.3rem;
        }

        .company-info p {
            margin: 0;
            font-size: 1rem;
            color: gray;
        }

        @media (max-width: 767.98px) {
            .side-image {
                display: none;
            }

            .login-form {
                width: 100%;
                max-width: 400px;
                margin: auto;
            }
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row login-container">
            <div class="col-md-6 d-none d-md-block side-image">
                <div class="company-info">
                    <h1>Rent Easy</h1>
                    <p>Your comfort, our priority</p>
                </div>
            </div>
            <div class="col-md-6">
                <div class="login-form">
                    <%
                        String message = request.getParameter("message");
                        if (message != null) {
                            String type = request.getParameter("type");
                            String alertClass = "danger".equals(type) ? "alert-danger" : "alert-success";
                    %>
                    <div class="alert <%= alertClass %> alert-dismissible fade show mt-3" role="alert">
                        <%= message %>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <%
                        }
                    %>

                    <h2 class="mb-4">Welcome Back!</h2>
                    <p>Please enter your details</p>
                    <form action="login.jsp" method="POST">
                        <div class="form-group">
                            <label for="email">Email Address</label>
                            <input type="email" class="form-control" id="email" name="email" required />
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" name="password" required />
                        </div>
                        <button type="submit" class="btn btn-dark btn-block mt-3 p-2">Sign In</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
