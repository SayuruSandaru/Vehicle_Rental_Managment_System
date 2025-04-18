<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">

<%
    String firstname = (String) session.getAttribute("firstName");
    String lastname = (String) session.getAttribute("lastName");
%>

<style>
    :root {
         --sidebar-bg: #1e2a3a;
        --navbar-bg: #1e2a3a;
        --text-color: #333333;
        --accent-color: #3498db;
    }
    .navbar {
        background-color: var(--navbar-bg);
        padding: 0.5rem 2rem;
    }
    .navbar-brand {
        font-size: 1.5rem;
        font-weight: bold;
        color: var(--accent-color);
    }
    .navbar .nav-link {
        color: var(--text-color);
    }
    .user-info {
        display: flex;
        align-items: center;
    }
    .user-avatar {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background-color: var(--accent-color);
        color: #ffffff;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 10px;
    }
    .logout-btn {
        background-color: var(--accent-color);
        border: none;
        transition: all 0.3s ease;
    }
    .logout-btn:hover {
        background-color: #2980b9;
    }
    .nav-icon {
        color: var(--accent-color);
        font-size: 1.2rem;
        margin-right: 1rem;
    }
      .logo {
        font-size: 1.5rem;
        font-weight: bold;
        color: var(--accent-color);
        text-align: center;
    }
</style>

<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
                <div class="logo">Rent Easy</div>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav align-items-center">
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="bi bi-bell nav-icon"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="bi bi-gear nav-icon"></i></a>
                </li>
                <li class="nav-item user-info">
                    <div class="user-avatar">
                        <i class="bi bi-person"></i>
                    </div>
                    <span class="nav-link"><%= firstname %> <%= lastname %></span>
                </li>
                <li class="nav-item">
                    <form action="logout.jsp" method="post">
                        <button type="submit" class="btn btn-primary btn-sm logout-btn">
                            <i class="bi bi-box-arrow-right"></i> Logout
                        </button>
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>