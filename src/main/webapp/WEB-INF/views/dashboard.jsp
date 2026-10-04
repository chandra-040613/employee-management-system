<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>EMS | Dashboard</title>


    <!-- =================================================
         BOOTSTRAP
    ================================================== -->

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">


    <!-- =================================================
         BOOTSTRAP ICONS
    ================================================== -->

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
        rel="stylesheet">


    <!-- =================================================
         GOOGLE FONT
    ================================================== -->

    <link
        href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
        rel="stylesheet">


    <!-- =================================================
         CHART JS
    ================================================== -->

    <script
        src="https://cdn.jsdelivr.net/npm/chart.js">
    </script>


    <!-- =================================================
         DASHBOARD CSS
    ================================================== -->

    <link
        rel="stylesheet"
        href="${pageContext.request.contextPath}/css/dashboard.css">

</head>


<body>


<!-- =====================================================
                     SIDEBAR
===================================================== -->

<aside class="sidebar">


    <!-- BRAND -->

    <div class="brand">

        <div class="brand-icon">

            <i class="bi bi-buildings-fill"></i>

        </div>

        <div>

            <h4>EMS</h4>

            <span>Employee Hub</span>

        </div>

    </div>


    <!-- MAIN MENU -->

    <div class="menu-label">
        MAIN MENU
    </div>


    <nav>


        <!-- DASHBOARD -->

        <a
            href="${pageContext.request.contextPath}/dashboard"
            class="nav-item active">

            <span class="nav-icon">

                <i class="bi bi-grid-1x2-fill"></i>

            </span>

            <span class="nav-text">
                Dashboard
            </span>

        </a>


        <!-- EMPLOYEES -->

        <a
            href="${pageContext.request.contextPath}/employees"
            class="nav-item employees-nav">

            <span class="nav-icon">

                <i class="bi bi-people-fill"></i>

            </span>

            <span class="nav-text">
                Employees
            </span>

            <span class="nav-arrow">

                <i class="bi bi-chevron-right"></i>

            </span>

        </a>


        <!-- DEPARTMENTS -->

        <a
            href="#"
            class="nav-item">

            <span class="nav-icon">

                <i class="bi bi-building"></i>

            </span>

            <span class="nav-text">
                Departments
            </span>

        </a>


        <!-- ATTENDANCE -->

        <a
            href="#"
            class="nav-item">

            <span class="nav-icon">

                <i class="bi bi-calendar3"></i>

            </span>

            <span class="nav-text">
                Attendance
            </span>

        </a>


        <!-- ANALYTICS -->

        <a
            href="#"
            class="nav-item">

            <span class="nav-icon">

                <i class="bi bi-bar-chart-line-fill"></i>

            </span>

            <span class="nav-text">
                Analytics
            </span>

        </a>

    </nav>


    <!-- MANAGEMENT -->

    <div class="menu-label second">
        MANAGEMENT
    </div>


    <nav>


        <!-- REPORTS -->

        <a
            href="#"
            class="nav-item">

            <span class="nav-icon">

                <i class="bi bi-file-earmark-text"></i>

            </span>

            <span class="nav-text">
                Reports
            </span>

        </a>


        <!-- SETTINGS -->

        <a
            href="#"
            class="nav-item">

            <span class="nav-icon">

                <i class="bi bi-gear-fill"></i>

            </span>

            <span class="nav-text">
                Settings
            </span>

        </a>

    </nav>


    <!-- SIDEBAR BOTTOM -->

    <div class="sidebar-bottom">


        <div class="upgrade-card">

            <div class="upgrade-icon">

                <i class="bi bi-stars"></i>

            </div>

            <strong>
                Employee Hub
            </strong>

            <p>
                Manage your team efficiently.
            </p>

        </div>


        <a
            href="#"
            class="nav-item logout">

            <span class="nav-icon">

                <i class="bi bi-box-arrow-left"></i>

            </span>

            <span class="nav-text">
                Logout
            </span>

        </a>

    </div>

</aside>



<!-- =====================================================
                     MAIN CONTENT
===================================================== -->

<main class="main-content">


    <!-- =================================================
                         TOPBAR
    ================================================== -->

    <header class="topbar">


        <!-- MOBILE MENU -->

        <button
            class="mobile-menu"
            type="button">

            <i class="bi bi-list"></i>

        </button>


        <!-- SEARCH -->

        <div class="search-box">

            <i class="bi bi-search"></i>

            <input
                id="dashboardSearch"
                type="text"
                placeholder="Search employees...">

            <span class="shortcut">
                Ctrl K
            </span>

        </div>


        <!-- TOP ACTIONS -->

        <div class="top-actions">


            <!-- NOTIFICATION -->

            <button
                class="icon-button"
                type="button">

                <i class="bi bi-bell"></i>

                <span class="notification-dot"></span>

            </button>


            <!-- PROFILE -->

            <div class="profile">

                <div class="profile-image">
                    A
                </div>

                <div class="profile-info">

                    <strong>
                        Admin
                    </strong>

                    <span>
                        Administrator
                    </span>

                </div>

                <i class="bi bi-chevron-down"></i>

            </div>

        </div>

    </header>



    <!-- =================================================
                     DASHBOARD CONTENT
    ================================================== -->

    <section class="dashboard-content">


        <!-- =================================================
                         WELCOME
        ================================================== -->

        <div class="welcome-section">


            <div>

                <span class="welcome-label">
                    OVERVIEW
                </span>

                <h1>
                    Good morning, Admin 👋
                </h1>

                <p>
                    Here's what's happening with your team today.
                </p>

            </div>


            <!-- ADD EMPLOYEE -->

            <a
                href="${pageContext.request.contextPath}/employees/add"
                class="add-employee-btn">

                <i class="bi bi-person-plus-fill"></i>

                Add Employee

            </a>

        </div>



        <!-- =================================================
                         STATISTICS
        ================================================== -->

        <div class="stats-grid">


            <!-- TOTAL -->

            <div class="stat-card">

                <div class="stat-top">

                    <div class="stat-icon purple">

                        <i class="bi bi-people-fill"></i>

                    </div>

                    <span class="stat-growth">

                        <i class="bi bi-database-check"></i>

                        Live

                    </span>

                </div>

                <span class="stat-label">
                    Total Employees
                </span>

                <h2 id="totalEmployees">
                    0
                </h2>

            </div>


            <!-- ACTIVE -->

            <div class="stat-card">

                <div class="stat-top">

                    <div class="stat-icon green">

                        <i class="bi bi-person-check-fill"></i>

                    </div>

                </div>

                <span class="stat-label">
                    Active Employees
                </span>

                <h2 id="activeEmployees">
                    0
                </h2>

            </div>


            <!-- DEPARTMENTS -->

            <div class="stat-card">

                <div class="stat-top">

                    <div class="stat-icon orange">

                        <i class="bi bi-building"></i>

                    </div>

                </div>

                <span class="stat-label">
                    Departments
                </span>

                <h2 id="totalDepartments">
                    0
                </h2>

            </div>


            <!-- NEW JOINERS -->

            <div class="stat-card">

                <div class="stat-top">

                    <div class="stat-icon blue">

                        <i class="bi bi-person-plus-fill"></i>

                    </div>

                </div>

                <span class="stat-label">
                    New Joiners
                </span>

                <h2 id="newJoiners">
                    0
                </h2>

            </div>

        </div>



        <!-- =================================================
                         CHARTS
        ================================================== -->

        <div class="charts-grid">


            <!-- DEPARTMENT CHART -->

            <div class="dashboard-card chart-card">

                <div class="card-header">

                    <div>

                        <h3>
                            Employees by Department
                        </h3>

                        <p>
                            Team distribution
                        </p>

                    </div>

                </div>

                <div class="chart-container">

                    <canvas id="departmentChart"></canvas>

                </div>

            </div>


            <!-- GROWTH CHART -->

            <div class="dashboard-card chart-card">

                <div class="card-header">

                    <div>

                        <h3>
                            Employee Growth
                        </h3>

                        <p>
                            Employee joining trend
                        </p>

                    </div>

                </div>

                <div class="chart-container">

                    <canvas id="employeeGrowthChart"></canvas>

                </div>

            </div>

        </div>



        <!-- =================================================
                     RECENT EMPLOYEES
        ================================================== -->

        <div class="dashboard-card recent-employees-card">


            <!-- HEADER -->

            <div class="recent-header">

                <div>

                    <div class="recent-title">

                        <div class="recent-title-icon">

                            <i class="bi bi-people-fill"></i>

                        </div>

                        <div>

                            <h2>
                                Recent Employees
                            </h2>

                            <p>
                                Recently added team members
                            </p>

                        </div>

                    </div>

                </div>


                <a
                    href="${pageContext.request.contextPath}/employees"
                    class="view-all-btn">

                    View all

                    <i class="bi bi-arrow-right"></i>

                </a>

            </div>



            <!-- TABLE -->

            <div class="employees-table-container">

                <table class="modern-employee-table">


                    <thead>

                        <tr>

                            <th>
                                EMPLOYEE
                            </th>

                            <th>
                                DEPARTMENT
                            </th>

                            <th>
                                SALARY
                            </th>

                            <th>
                                JOINED
                            </th>

                            <th>
                                STATUS
                            </th>

                            <th>
                                ACTION
                            </th>

                        </tr>

                    </thead>


                    <tbody id="recentEmployees">

                        <tr>

                            <td colspan="6">

                                <div class="loading-state">

                                    <div class="spinner"></div>

                                    <span>
                                        Loading employees...
                                    </span>

                                </div>

                            </td>

                        </tr>

                    </tbody>

                </table>

            </div>

        </div>



        <!-- =================================================
                     QUICK ACTIONS
        ================================================== -->

        <div class="quick-actions">


            <a
                href="${pageContext.request.contextPath}/employees/add"
                class="quick-action">

                <div class="quick-icon purple">

                    <i class="bi bi-person-plus-fill"></i>

                </div>

                <div>

                    <strong>
                        Add Employee
                    </strong>

                    <span>
                        Create a new employee
                    </span>

                </div>

                <i class="bi bi-arrow-up-right"></i>

            </a>


            <a
                href="${pageContext.request.contextPath}/employees"
                class="quick-action">

                <div class="quick-icon green">

                    <i class="bi bi-people-fill"></i>

                </div>

                <div>

                    <strong>
                        Manage Employees
                    </strong>

                    <span>
                        View all employees
                    </span>

                </div>

                <i class="bi bi-arrow-up-right"></i>

            </a>


            <a
                href="#"
                class="quick-action">

                <div class="quick-icon orange">

                    <i class="bi bi-file-earmark-bar-graph"></i>

                </div>

                <div>

                    <strong>
                        Reports
                    </strong>

                    <span>
                        View team reports
                    </span>

                </div>

                <i class="bi bi-arrow-up-right"></i>

            </a>

        </div>


    </section>

</main>



<!-- =====================================================
                     JAVASCRIPT
===================================================== -->

<script
    src="${pageContext.request.contextPath}/js/dashboard.js">
</script>


</body>

</html>