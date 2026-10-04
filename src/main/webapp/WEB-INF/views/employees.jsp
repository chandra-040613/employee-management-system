<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Employees | EMS</title>


    <!-- Bootstrap -->

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">


    <!-- Bootstrap Icons -->

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
        rel="stylesheet">


    <style>

        * {
            box-sizing: border-box;
        }

        body {

            margin: 0;

            background: #f6f7fb;

            font-family:
                -apple-system,
                BlinkMacSystemFont,
                "Segoe UI",
                Roboto,
                Arial,
                sans-serif;

            color: #1f2937;
        }


        /* =================================
           MAIN CONTAINER
           ================================= */

        .employees-page {

            padding: 32px;

            max-width: 1600px;

            margin: auto;
        }


        /* =================================
           HEADER
           ================================= */

        .page-header {

            display: flex;

            justify-content: space-between;

            align-items: center;

            margin-bottom: 28px;
        }


        .header-left h1 {

            margin: 0;

            font-size: 30px;

            font-weight: 750;

            letter-spacing: -0.5px;

            color: #111827;
        }


        .header-left p {

            margin: 6px 0 0;

            color: #6b7280;

            font-size: 14px;
        }


        .add-employee-btn {

            display: inline-flex;

            align-items: center;

            gap: 8px;

            background: #4f46e5;

            color: white;

            padding: 11px 18px;

            border-radius: 10px;

            text-decoration: none;

            font-size: 14px;

            font-weight: 600;

            transition: all 0.2s ease;

            box-shadow:
                0 4px 12px rgba(79, 70, 229, 0.20);
        }


        .add-employee-btn:hover {

            background: #4338ca;

            color: white;

            transform: translateY(-1px);

            box-shadow:
                0 7px 18px rgba(79, 70, 229, 0.25);
        }


        /* =================================
           STAT CARDS
           ================================= */

        .stats-grid {

            display: grid;

            grid-template-columns:
                repeat(3, 1fr);

            gap: 18px;

            margin-bottom: 24px;
        }


        .stat-card {

            background: white;

            border: 1px solid #eef0f5;

            border-radius: 14px;

            padding: 20px;

            display: flex;

            align-items: center;

            gap: 15px;

            box-shadow:
                0 3px 12px rgba(0,0,0,0.035);
        }


        .stat-icon {

            width: 48px;

            height: 48px;

            border-radius: 12px;

            display: flex;

            align-items: center;

            justify-content: center;

            background: #eef2ff;

            color: #4f46e5;

            font-size: 21px;
        }


        .stat-info span {

            display: block;

            color: #6b7280;

            font-size: 13px;

            margin-bottom: 3px;
        }


        .stat-info strong {

            font-size: 22px;

            color: #111827;
        }


        /* =================================
           MAIN CARD
           ================================= */

        .employees-card {

            background: white;

            border: 1px solid #eef0f5;

            border-radius: 16px;

            box-shadow:
                0 5px 25px rgba(0,0,0,0.045);

            overflow: hidden;
        }


        /* =================================
           TOOLBAR
           ================================= */

        .toolbar {

            display: flex;

            justify-content: space-between;

            align-items: center;

            padding: 20px 22px;

            border-bottom: 1px solid #edf0f4;

            gap: 15px;
        }


        .toolbar-title {

            font-size: 17px;

            font-weight: 700;

            color: #111827;
        }


        .toolbar-subtitle {

            font-size: 12px;

            color: #9ca3af;

            margin-top: 3px;
        }


        .toolbar-right {

            display: flex;

            gap: 10px;

            align-items: center;
        }


        /* =================================
           SEARCH
           ================================= */

        .search-box {

            position: relative;
        }


        .search-box i {

            position: absolute;

            left: 13px;

            top: 50%;

            transform: translateY(-50%);

            color: #9ca3af;
        }


        .search-box input {

            width: 230px;

            height: 40px;

            border: 1px solid #e1e5eb;

            border-radius: 9px;

            padding:
                0 13px 0 38px;

            font-size: 13px;

            outline: none;

            transition: 0.2s;
        }


        .search-box input:focus {

            border-color: #6366f1;

            box-shadow:
                0 0 0 3px rgba(99,102,241,0.10);
        }


        /* =================================
           FILTER
           ================================= */

        .department-filter {

            height: 40px;

            border: 1px solid #e1e5eb;

            border-radius: 9px;

            padding: 0 12px;

            color: #4b5563;

            font-size: 13px;

            outline: none;

            background: white;
        }


        /* =================================
           TABLE
           ================================= */

        .table-container {

            overflow-x: auto;
        }


        .employee-table {

            width: 100%;

            border-collapse: collapse;

            min-width: 900px;
        }


        .employee-table thead {

            background: #fafbfc;
        }


        .employee-table th {

            padding:
                13px 22px;

            text-align: left;

            font-size: 11px;

            text-transform: uppercase;

            letter-spacing: 0.5px;

            color: #8b93a1;

            font-weight: 700;

            border-bottom: 1px solid #edf0f4;
        }


        .employee-table td {

            padding:
                16px 22px;

            border-bottom:
                1px solid #f0f2f5;

            font-size: 14px;

            color: #374151;

            vertical-align: middle;
        }


        .employee-table tbody tr {

            transition: background 0.15s ease;
        }


        .employee-table tbody tr:hover {

            background: #fafbff;
        }


        .employee-table tbody tr:last-child td {

            border-bottom: none;
        }


        /* =================================
           EMPLOYEE PROFILE
           ================================= */

        .employee-profile {

            display: flex;

            align-items: center;

            gap: 12px;
        }


        .avatar {

            width: 42px;

            height: 42px;

            border-radius: 50%;

            display: flex;

            align-items: center;

            justify-content: center;

            background: #eef2ff;

            color: #4f46e5;

            font-size: 14px;

            font-weight: 700;

            flex-shrink: 0;
        }


        .employee-details {

            min-width: 0;
        }


        .employee-name {

            font-weight: 650;

            color: #1f2937;

            margin-bottom: 3px;
        }


        .employee-email {

            color: #8a919d;

            font-size: 12px;

            white-space: nowrap;
        }


        /* =================================
           ID
           ================================= */

        .employee-id {

            color: #9ca3af;

            font-weight: 600;

            font-size: 12px;
        }


        /* =================================
           DEPARTMENT
           ================================= */

        .department-badge {

            display: inline-block;

            background: #f3f4f6;

            color: #4b5563;

            padding:
                6px 10px;

            border-radius: 7px;

            font-size: 12px;

            font-weight: 600;
        }


        /* =================================
           SALARY
           ================================= */

        .salary {

            font-weight: 650;

            color: #111827;
        }


        /* =================================
           STATUS
           ================================= */

        .status {

            display: inline-flex;

            align-items: center;

            gap: 6px;

            padding:
                6px 10px;

            border-radius: 20px;

            font-size: 11px;

            font-weight: 700;
        }


        .status::before {

            content: "";

            width: 6px;

            height: 6px;

            border-radius: 50%;

            background: currentColor;
        }


        .status-active {

            color: #15803d;

            background: #ecfdf3;
        }


        .status-inactive {

            color: #dc2626;

            background: #fef2f2;
        }


        /* =================================
           ACTION BUTTONS
           ================================= */

        .actions {

            display: flex;

            gap: 7px;
        }


        .action-btn {

            width: 35px;

            height: 35px;

            border: none;

            border-radius: 8px;

            display: flex;

            align-items: center;

            justify-content: center;

            cursor: pointer;

            transition: all 0.18s ease;
        }


        .edit-btn {

            background: #eef2ff;

            color: #4f46e5;
        }


        .edit-btn:hover {

            background: #e0e7ff;

            transform: translateY(-1px);
        }


        .delete-btn {

            background: #fff1f2;

            color: #e11d48;
        }


        .delete-btn:hover {

            background: #ffe4e6;

            transform: translateY(-1px);
        }


        /* =================================
           EMPTY STATE
           ================================= */

        .empty-state {

            text-align: center;

            padding: 70px 20px;

            color: #9ca3af;
        }


        .empty-state i {

            font-size: 45px;

            display: block;

            margin-bottom: 12px;

            color: #c7cbd3;
        }


        .empty-state h4 {

            color: #4b5563;

            font-size: 16px;

            margin-bottom: 5px;
        }


        .empty-state p {

            font-size: 13px;

            margin: 0;
        }


        /* =================================
           MOBILE
           ================================= */

        @media (max-width: 900px) {

            .employees-page {

                padding: 20px;
            }


            .stats-grid {

                grid-template-columns: 1fr;
            }


            .page-header {

                align-items: flex-start;

                gap: 15px;

                flex-direction: column;
            }


            .toolbar {

                align-items: flex-start;

                flex-direction: column;
            }


            .toolbar-right {

                width: 100%;

                flex-direction: column;

                align-items: stretch;
            }


            .search-box input {

                width: 100%;
            }


            .department-filter {

                width: 100%;
            }

        }


    </style>

</head>


<body>


<div class="employees-page">


    <!-- =================================
         HEADER
         ================================= -->

    <div class="page-header">

        <div class="header-left">

            <h1>Employees</h1>

            <p>
                Manage your organization's employees
                and their information.
            </p>

        </div>


        <a
            href="${pageContext.request.contextPath}/employees/add"
            class="add-employee-btn">

            <i class="bi bi-plus-lg"></i>

            Add Employee

        </a>

    </div>



    <!-- =================================
         STATISTICS
         ================================= -->

    <div class="stats-grid">


        <div class="stat-card">

            <div class="stat-icon">

                <i class="bi bi-people"></i>

            </div>

            <div class="stat-info">

                <span>Total Employees</span>

                <strong>${employees.size()}</strong>

            </div>

        </div>


        <div class="stat-card">

            <div class="stat-icon">

                <i class="bi bi-person-check"></i>

            </div>

            <div class="stat-info">

                <span>Active Employees</span>

                <strong id="activeCount">0</strong>

            </div>

        </div>


        <div class="stat-card">

            <div class="stat-icon">

                <i class="bi bi-building"></i>

            </div>

            <div class="stat-info">

                <span>Departments</span>

                <strong id="departmentCount">0</strong>

            </div>

        </div>


    </div>



    <!-- =================================
         EMPLOYEE TABLE CARD
         ================================= -->

    <div class="employees-card">


        <!-- TOOLBAR -->

        <div class="toolbar">


            <div>

                <div class="toolbar-title">
                    All Employees
                </div>

                <div class="toolbar-subtitle">
                    Employee directory
                </div>

            </div>


            <div class="toolbar-right">


                <!-- SEARCH -->

                <div class="search-box">

                    <i class="bi bi-search"></i>

                    <input
                        type="text"
                        id="searchInput"
                        placeholder="Search employees...">

                </div>


                <!-- DEPARTMENT -->

                <select
                    id="departmentFilter"
                    class="department-filter">

                    <option value="">
                        All Departments
                    </option>

                </select>


            </div>


        </div>



        <!-- TABLE -->

        <div class="table-container">

            <table class="employee-table">


                <thead>

                    <tr>

                        <th>ID</th>

                        <th>Employee</th>

                        <th>Department</th>

                        <th>Salary</th>

                        <th>Status</th>

                        <th>Joining Date</th>

                        <th>Actions</th>

                    </tr>

                </thead>


                <tbody id="employeeTable">


                    <c:forEach
                        var="employee"
                        items="${employees}">


                        <tr
                            data-name="${employee.name}"
                            data-email="${employee.email}"
                            data-department="${employee.department}">


                            <td>

                                <span class="employee-id">

                                    #${employee.id}

                                </span>

                            </td>


                            <td>

                                <div class="employee-profile">


                                    <div class="avatar">

                                        ${employee.name.substring(0,1).toUpperCase()}

                                    </div>


                                    <div class="employee-details">

                                        <a
  										  href="${pageContext.request.contextPath}/employees/view/${employee.id}"
  											  class="employee-name employee-link">

												${employee.name}

												</a>

                                        <div class="employee-email">

                                            ${employee.email}

                                        </div>

                                    </div>


                                </div>

                            </td>


                            <td>

                                <span class="department-badge">

                                    ${employee.department}

                                </span>

                            </td>


                            <td>

                                <span class="salary">

                                    ₹${employee.salary}

                                </span>

                            </td>


                            <td>


                                <c:choose>


                                    <c:when
                                        test="${employee.status == 'ACTIVE'}">

                                        <span
                                            class="status status-active">

                                            ACTIVE

                                        </span>

                                    </c:when>


                                    <c:otherwise>

                                        <span
                                            class="status status-inactive">

                                            ${employee.status}

                                        </span>

                                    </c:otherwise>


                                </c:choose>


                            </td>


                            <td>

                                ${employee.joiningDate}

                            </td>


                            <td>

                                <div class="actions">


                                    <button
                                        class="action-btn edit-btn"
                                        title="Edit Employee"
                                        onclick="editEmployee(${employee.id})">

                                        <i class="bi bi-pencil"></i>

                                    </button>


                                    <button
                                        class="action-btn delete-btn"
                                        title="Delete Employee"
                                        onclick="deleteEmployee(${employee.id})">

                                        <i class="bi bi-trash"></i>

                                    </button>


                                </div>

                            </td>


                        </tr>


                    </c:forEach>


                    <c:if test="${empty employees}">

                        <tr>

                            <td colspan="7">

                                <div class="empty-state">

                                    <i class="bi bi-people"></i>

                                    <h4>
                                        No employees found
                                    </h4>

                                    <p>
                                        Add your first employee
                                        to get started.
                                    </p>

                                </div>

                            </td>

                        </tr>

                    </c:if>


                </tbody>


            </table>

        </div>


    </div>


</div>



<script>


const contextPath =
    "${pageContext.request.contextPath}";


/* =================================
   EMPLOYEE DATA
   ================================= */

const rows =
    document.querySelectorAll(
        "#employeeTable tr[data-name]"
    );


/* =================================
   ACTIVE COUNT
   ================================= */

let activeCount = 0;

const departments = new Set();


rows.forEach(row => {

    const status =
        row.querySelector(".status");

    if (
        status &&
        status.textContent.trim()
            .toUpperCase() === "ACTIVE"
    ) {

        activeCount++;

    }


    const department =
        row.dataset.department;

    if (department) {

        departments.add(department);

    }

});


document.getElementById("activeCount")
    .textContent = activeCount;


document.getElementById("departmentCount")
    .textContent = departments.size;



/* =================================
   DEPARTMENT FILTER
   ================================= */

const departmentFilter =
    document.getElementById(
        "departmentFilter"
    );


[...departments]
    .sort()
    .forEach(department => {

        const option =
            document.createElement("option");

        option.value = department;

        option.textContent = department;

        departmentFilter.appendChild(option);

    });



/* =================================
   SEARCH + FILTER
   ================================= */

const searchInput =
    document.getElementById(
        "searchInput"
    );


function filterEmployees() {

    const search =
        searchInput.value
            .toLowerCase()
            .trim();


    const department =
        departmentFilter.value
            .toLowerCase();


    rows.forEach(row => {

        const name =
            row.dataset.name
                .toLowerCase();


        const email =
            row.dataset.email
                .toLowerCase();


        const rowDepartment =
            row.dataset.department
                .toLowerCase();


        const matchesSearch =
            name.includes(search) ||
            email.includes(search);


        const matchesDepartment =
            department === "" ||
            rowDepartment === department;


        if (
            matchesSearch &&
            matchesDepartment
        ) {

            row.style.display = "";

        } else {

            row.style.display = "none";

        }

    });

}


searchInput.addEventListener(
    "input",
    filterEmployees
);


departmentFilter.addEventListener(
    "change",
    filterEmployees
);



/* =================================
   EDIT
   ================================= */

function editEmployee(id) {

    window.location.href =
        contextPath +
        "/employees/edit/" +
        id;

}



/* =================================
   DELETE
   ================================= */

function deleteEmployee(id) {

    const confirmed =
        confirm(
            "Are you sure you want to delete this employee?"
        );


    if (!confirmed) {

        return;

    }


    fetch(
        contextPath +
        "/api/employees/" +
        id,
        {

            method: "DELETE"

        }
    )

    .then(response => {

        if (!response.ok) {

            throw new Error(
                "Delete failed"
            );

        }

        return response.text();

    })

    .then(() => {

        alert(
            "Employee deleted successfully!"
        );

        window.location.reload();

    })

    .catch(error => {

        console.error(error);

        alert(
            "Unable to delete employee."
        );

    });

}


</script>


</body>

</html>