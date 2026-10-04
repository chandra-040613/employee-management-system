<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Add Employee - EMS</title>

    <!-- Bootstrap -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
        rel="stylesheet">

  
<style>
.add-employee-page {
    max-width: 1100px;
    margin: auto;
}


.page-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
}


.page-eyebrow {
    font-size: 12px;
    font-weight: 700;
    letter-spacing: 1.5px;
    color: #6c63ff;
}


.page-header h1 {
    margin: 6px 0;
    font-size: 30px;
    font-weight: 800;
}


.page-header p {
    margin: 0;
    color: #7b8190;
}


.back-btn {
    text-decoration: none;
    padding: 11px 18px;
    border: 1px solid #e4e7ec;
    border-radius: 10px;
    color: #343a40;
    background: white;
    transition: 0.2s;
}


.back-btn:hover {
    background: #f5f6ff;
    color: #5b52e8;
}


/* FORM CARD */

.employee-form-card {
    background: white;
    border-radius: 18px;
    box-shadow: 0 8px 30px rgba(30, 40, 70, 0.08);
    overflow: hidden;
}


.form-card-header {
    display: flex;
    align-items: center;
    gap: 15px;
    padding: 25px 30px;
    border-bottom: 1px solid #edf0f5;
}


.form-icon {
    width: 50px;
    height: 50px;
    border-radius: 14px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #f0efff;
    color: #5b52e8;
    font-size: 22px;
}


.form-card-header h4 {
    margin: 0;
    font-weight: 700;
}


.form-card-header span {
    font-size: 13px;
    color: #8a909d;
}


/* FORM */

.form-section {
    padding: 30px;
    border-bottom: 1px solid #edf0f5;
}


.form-section h6 {
    font-size: 15px;
    font-weight: 700;
    margin-bottom: 22px;
}


.form-section h6 i {
    margin-right: 8px;
    color: #6c63ff;
}


.form-section label {
    display: block;
    font-size: 13px;
    font-weight: 600;
    margin-bottom: 8px;
    color: #343a40;
}


.input-wrapper {
    position: relative;
}


.input-wrapper i {
    position: absolute;
    left: 14px;
    top: 50%;
    transform: translateY(-50%);
    color: #9298a5;
}


.input-wrapper input,
.input-wrapper select {
    width: 100%;
    height: 48px;
    border: 1px solid #e1e5eb;
    border-radius: 10px;
    padding: 0 15px 0 42px;
    outline: none;
    transition: 0.2s;
    background: white;
}


.input-wrapper input:focus,
.input-wrapper select:focus {
    border-color: #6c63ff;
    box-shadow: 0 0 0 3px rgba(108, 99, 255, 0.1);
}


/* BUTTONS */

.form-actions {
    display: flex;
    justify-content: flex-end;
    gap: 12px;
    padding: 25px 30px;
    background: #fafbfc;
}


.cancel-btn {
    text-decoration: none;
    padding: 12px 22px;
    border-radius: 10px;
    border: 1px solid #dfe3e8;
    color: #555;
    background: white;
}


.save-btn {
    border: none;
    padding: 12px 24px;
    border-radius: 10px;
    background: #5b52e8;
    color: white;
    font-weight: 600;
    transition: 0.2s;
}


.save-btn:hover {
    background: #4940d0;
    transform: translateY(-1px);
}
</style>

</head>

<body>


<!-- ================= SIDEBAR ================= -->

<div class="add-employee-page">

    <div class="page-header">

        <div>
            <span class="page-eyebrow">EMPLOYEE MANAGEMENT</span>

            <h1>Add New Employee</h1>

            <p>
                Create a new employee profile and add them
                to your organization.
            </p>
        </div>

        <a href="${pageContext.request.contextPath}/dashboard" class="back-btn">Back to Employees
        </a>

    </div>


    <div class="employee-form-card">

        <div class="form-card-header">

            <div class="form-icon">
                <i class="bi bi-person-plus-fill"></i>
            </div>

            <div>
                <h4>Employee Information</h4>

                <span>
                    Enter the employee's details below
                </span>
            </div>

        </div>


        <form id="employeeForm">

            <div class="form-section">

                <h6>
                    <i class="bi bi-person"></i>
                    Personal Information
                </h6>

                <div class="row g-4">

                    <div class="col-md-6">

                        <label>
                            Full Name
                        </label>

                        <div class="input-wrapper">

                            <i class="bi bi-person"></i>

                            <input
                                type="text"
                                id="name"
                                placeholder="Enter full name"
                                required>

                        </div>

                    </div>


                    <div class="col-md-6">

                        <label>
                            Email Address
                        </label>

                        <div class="input-wrapper">

                            <i class="bi bi-envelope"></i>

                            <input
                                type="email"
                                id="email"
                                placeholder="employee@company.com"
                                required>

                        </div>

                    </div>

                </div>

            </div>


            <div class="form-section">

                <h6>
                    <i class="bi bi-briefcase"></i>
                    Employment Information
                </h6>

                <div class="row g-4">

                    <div class="col-md-6">

                        <label>
                            Department
                        </label>

                        <div class="input-wrapper">

                            <i class="bi bi-building"></i>

                            <select id="department" required>

                                <option value="">
                                    Select department
                                </option>

                                <option value="IT">
                                    IT
                                </option>

                                <option value="HR">
                                    Human Resources
                                </option>

                                <option value="Finance">
                                    Finance
                                </option>

                                <option value="Development">
                                    Development
                                </option>

                                <option value="Marketing">
                                    Marketing
                                </option>

                                <option value="Sales">
                                    Sales
                                </option>

                            </select>

                        </div>

                    </div>


                    <div class="col-md-6">

                        <label>
                            Salary
                        </label>

                        <div class="input-wrapper">

                            <i class="bi bi-currency-rupee"></i>

                            <input
                                type="number"
                                id="salary"
                                placeholder="Enter salary"
                                min="1"
                                required>

                        </div>

                    </div>


                    <div class="col-md-6">

                        <label>
                            Joining Date
                        </label>

                        <div class="input-wrapper">

                            <i class="bi bi-calendar-event"></i>

                            <input
                                type="date"
                                id="joiningDate"
                                required>

                        </div>

                    </div>


                    <div class="col-md-6">

                        <label>
                            Employee Status
                        </label>

                        <div class="input-wrapper">

                            <i class="bi bi-person-check"></i>

                            <select id="status">

                                <option value="ACTIVE">
                                    Active
                                </option>

                                <option value="INACTIVE">
                                    Inactive
                                </option>

                            </select>

                        </div>

                    </div>

                </div>

            </div>


            <div class="form-actions">

               <a href="${pageContext.request.contextPath}/dashboard" class="back-btn">Cancle</a>

                <button
                    type="submit"
                    class="save-btn">

                    <i class="bi bi-person-plus-fill"></i>

                    Add Employee

                </button>

            </div>

        </form>

    </div>

</div>

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>
<script>

document.getElementById("employeeForm").addEventListener("submit", function(event) {

    event.preventDefault();

    // Get values from form
    const employee = {

        name: document.getElementById("name").value.trim(),

        email: document.getElementById("email").value.trim(),

        department: document.getElementById("department").value,

        salary: parseFloat(
            document.getElementById("salary").value
        ),

        status: document.getElementById("status").value,

        joiningDate: document.getElementById("joiningDate").value

    };

    console.log("Employee being sent:", employee);


    // Send employee to Spring Boot
    fetch("${pageContext.request.contextPath}/api/employees", {

        method: "POST",

        headers: {
            "Content-Type": "application/json"
        },

        body: JSON.stringify(employee)

    })

    .then(response => {

        if (!response.ok) {

            return response.text().then(error => {
                throw new Error(error);
            });

        }

        return response.json();

    })

    .then(data => {

        console.log("Employee added:", data);

        alert("Employee added successfully!");

        // Go back to employee page
        window.location.href =
            "${pageContext.request.contextPath}/employees";

    })

    .catch(error => {

        console.error("Error:", error);

        alert(
            "Failed to add employee.\n\n" +
            "Please check the console for details."
        );

    });

});

</script>
</html>