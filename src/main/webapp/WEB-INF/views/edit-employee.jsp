<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Edit Employee | EMS</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
        rel="stylesheet">

    <style>

        body {
            background: #f5f7fb;
            font-family: Arial, sans-serif;
        }

        .page-container {
            max-width: 850px;
            margin: 50px auto;
            padding: 20px;
        }

        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        .card-header {
            background: white;
            border-bottom: 1px solid #eee;
            padding: 25px;
            border-radius: 15px 15px 0 0;
        }

        .card-body {
            padding: 30px;
        }

        .form-label {
            font-weight: 600;
        }

        .btn-save {
            padding: 12px 25px;
        }

    </style>

</head>


<body>

<div class="page-container">

    <div class="card">

        <!-- HEADER -->

        <div class="card-header">

            <div class="d-flex align-items-center">

                <div class="me-3">

                    <i class="bi bi-pencil-square fs-2 text-primary"></i>

                </div>

                <div>

                    <h3 class="mb-1">
                        Edit Employee
                    </h3>

                    <small class="text-muted">
                        Update employee information
                    </small>

                </div>

            </div>

        </div>


        <!-- FORM -->

        <div class="card-body">

            <form id="editEmployeeForm">

                <!-- Employee ID -->

                <input
                    type="hidden"
                    id="employeeId"
                    value="${employee.id}">


                <div class="row g-4">

                    <!-- NAME -->

                    <div class="col-md-6">

                        <label class="form-label">
                            Full Name
                        </label>

                        <input
                            type="text"
                            class="form-control"
                            id="name"
                            value="${employee.name}"
                            required>

                    </div>


                    <!-- EMAIL -->

                    <div class="col-md-6">

                        <label class="form-label">
                            Email
                        </label>

                        <input
                            type="email"
                            class="form-control"
                            id="email"
                            value="${employee.email}"
                            required>

                    </div>


                    <!-- DEPARTMENT -->

                    <div class="col-md-6">

                        <label class="form-label">
                            Department
                        </label>

                        <select
                            class="form-select"
                            id="department"
                            required>

                            <option value="">
                                Select Department
                            </option>

                            <option value="IT"
                                ${employee.department == 'IT' ? 'selected' : ''}>
                                IT
                            </option>

                            <option value="HR"
                                ${employee.department == 'HR' ? 'selected' : ''}>
                                HR
                            </option>

                            <option value="Finance"
                                ${employee.department == 'Finance' ? 'selected' : ''}>
                                Finance
                            </option>

                            <option value="Development"
                                ${employee.department == 'Development' ? 'selected' : ''}>
                                Development
                            </option>

                            <option value="Marketing"
                                ${employee.department == 'Marketing' ? 'selected' : ''}>
                                Marketing
                            </option>

                            <option value="Sales"
                                ${employee.department == 'Sales' ? 'selected' : ''}>
                                Sales
                            </option>

                        </select>

                    </div>


                    <!-- SALARY -->

                    <div class="col-md-6">

                        <label class="form-label">
                            Salary
                        </label>

                        <input
                            type="number"
                            class="form-control"
                            id="salary"
                            value="${employee.salary}"
                            min="1"
                            required>

                    </div>


                    <!-- STATUS -->

                    <div class="col-md-6">

                        <label class="form-label">
                            Status
                        </label>

                        <select
                            class="form-select"
                            id="status">

                            <option value="ACTIVE"
                                ${employee.status == 'ACTIVE' ? 'selected' : ''}>
                                Active
                            </option>

                            <option value="INACTIVE"
                                ${employee.status == 'INACTIVE' ? 'selected' : ''}>
                                Inactive
                            </option>

                        </select>

                    </div>


                    <!-- JOINING DATE -->

                    <div class="col-md-6">

                        <label class="form-label">
                            Joining Date
                        </label>

                        <input
                            type="date"
                            class="form-control"
                            id="joiningDate"
                            value="${employee.joiningDate}">

                    </div>

                </div>


                <!-- BUTTONS -->

                <div class="mt-5 d-flex justify-content-end gap-2">

                    <a
                        href="/dashboard"
                        class="btn btn-outline-secondary">

                        <i class="bi bi-arrow-left"></i>

                        Cancel

                    </a>


                    <button
                        type="submit"
                        class="btn btn-primary btn-save">

                        <i class="bi bi-check-lg"></i>

                        Save Changes

                    </button>

                </div>

            </form>

        </div>

    </div>

</div>


<script>

document.getElementById("editEmployeeForm")
.addEventListener("submit", function(event) {

    event.preventDefault();


    const id =
        document.getElementById("employeeId").value;


    const employee = {

        name:
            document.getElementById("name").value,

        email:
            document.getElementById("email").value,

        department:
            document.getElementById("department").value,

        salary:
            Number(
                document.getElementById("salary").value
            ),

        status:
            document.getElementById("status").value,

        joiningDate:
            document.getElementById("joiningDate").value

    };


    fetch("/api/employees/" + id, {

        method: "PUT",

        headers: {
            "Content-Type": "application/json"
        },

        body: JSON.stringify(employee)

    })

    .then(response => {

        if (!response.ok) {

            return response.json()
                .then(error => {

                    throw new Error(
                        error.message ||
                        "Failed to update employee"
                    );

                });

        }

        return response.json();

    })

    .then(data => {

        alert(
            "Employee updated successfully!"
        );

        window.location.href =
            "/dashboard";

    })

    .catch(error => {

        console.error(
            "Update error:",
            error
        );

        alert(
            "Failed to update employee: " +
            error.message
        );

    });

});

</script>


</body>

</html>