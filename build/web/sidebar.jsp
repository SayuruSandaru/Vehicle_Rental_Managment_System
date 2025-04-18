<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">

<%
    String role = (String) session.getAttribute("role");
%>

<style>
    :root {
        --sidebar-bg: #1e2a3a;
        --sidebar-hover: #2c3e50;
        --text-color: #e0e0e0;
        --accent-color: #3498db;
    }
    .sidebar {
        background-color: var(--sidebar-bg);
        min-height: 100vh;
        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
    }
    .sidebar .nav-link {
        color: var(--text-color);
        padding: 0.8rem 1.5rem;
        border-radius: 0.3rem;
        transition: all 0.3s ease;
        margin-bottom: 0.5rem;
    }
    .sidebar .nav-link:hover,
    .sidebar .nav-link.active {
        background-color: var(--sidebar-hover);
        color: #ffffff;
    }
    .sidebar .nav-link .bi {
        margin-right: 10px;
        font-size: 1.1rem;
    }
  
</style>

<nav class="col-md-3 col-lg-2 d-md-block sidebar collapse">
    <div class="position-sticky pt-3">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link ${currentPage == 'home' ? 'active' : ''}" href="home.jsp">
                    <i class="bi bi-speedometer2"></i> Dashboard
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${currentPage == 'vehicles' ? 'active' : ''}" href="vehicles.jsp">
                    <i class="bi bi-truck"></i> Vehicles
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${currentPage == 'rentals' ? 'active' : ''}" href="rentals.jsp">
                    <i class="bi bi-calendar-check"></i> Rentals
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${currentPage == 'customers' ? 'active' : ''}" href="customers.jsp">
                    <i class="bi bi-people-fill"></i> Customers
                </a>
            </li>
            <% if ("admin".equals(role)) { %>
            <li class="nav-item">
                <a class="nav-link ${currentPage == 'employees' ? 'active' : ''}" href="employees.jsp">
                    <i class="bi bi-person-badge"></i> Employees
                </a>
            </li>
            <% } %>
        </ul>
    </div>
</nav>