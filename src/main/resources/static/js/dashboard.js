/* =====================================================
   EMPLOYEE MANAGEMENT SYSTEM
   DASHBOARD JAVASCRIPT
===================================================== */


/* =====================================================
   PAGE LOAD
===================================================== */

document.addEventListener("DOMContentLoaded", function () {

    loadDashboard();

    setupSearch();

    setupMobileMenu();

    setupKeyboardShortcut();

});


/* =====================================================
   LOAD DASHBOARD
===================================================== */

async function loadDashboard() {

    try {

        const response =
            await fetch("/api/employees");

        if (!response.ok) {

            throw new Error(
                "Unable to load employees"
            );

        }


        const employees =
            await response.json();


        console.log(
            "Employees loaded:",
            employees
        );


        updateStatistics(
            employees
        );


        displayRecentEmployees(
            employees
        );


        createDepartmentChart(
            employees
        );


        createEmployeeGrowthChart(
            employees
        );


    } catch (error) {

        console.error(
            "Dashboard error:",
            error
        );


        showDashboardError();

    }

}


/* =====================================================
   STATISTICS
===================================================== */

function updateStatistics(employees) {


    /* TOTAL */

    const totalEmployees =
        employees.length;


    /* ACTIVE */

    const activeEmployees =
        employees.filter(
            employee =>
                employee.status &&
                employee.status
                    .toLowerCase() === "active"
        ).length;


    /* DEPARTMENTS */

    const departments =
        new Set(

            employees

                .map(
                    employee =>
                        employee.department
                )

                .filter(
                    department =>
                        department
                )

        );


    const totalDepartments =
        departments.size;


    /* NEW JOINERS */

    const currentDate =
        new Date();


    const currentMonth =
        currentDate.getMonth();


    const currentYear =
        currentDate.getFullYear();


    const newJoiners =
        employees.filter(employee => {

            if (!employee.joiningDate) {

                return false;

            }


            const joiningDate =
                new Date(
                    employee.joiningDate
                );


            return (

                joiningDate.getMonth()
                    === currentMonth

                &&

                joiningDate.getFullYear()
                    === currentYear

            );

        }).length;


    /* UPDATE */

    setElementText(
        "totalEmployees",
        totalEmployees
    );


    setElementText(
        "activeEmployees",
        activeEmployees
    );


    setElementText(
        "totalDepartments",
        totalDepartments
    );


    setElementText(
        "newJoiners",
        newJoiners
    );

}


/* =====================================================
   RECENT EMPLOYEES
===================================================== */

function displayRecentEmployees(
    employees
) {


    const container =
        document.getElementById(
            "recentEmployees"
        );


    if (!container) {

        return;

    }


    /* EMPTY */

    if (
        !employees ||
        employees.length === 0
    ) {

        container.innerHTML = `

            <tr>

                <td colspan="6">

                    <div class="empty-state">

                        <div class="empty-state-icon">

                            <i class="bi bi-people"></i>

                        </div>

                        <h4>
                            No employees yet
                        </h4>

                        <p>
                            Add your first employee
                            to see them here.
                        </p>

                    </div>

                </td>

            </tr>

        `;

        return;

    }


    /* SORT BY ID */

    const recentEmployees =

        [...employees]

            .sort(
                (a, b) =>
                    Number(b.id) -
                    Number(a.id)
            )

            .slice(0, 5);


    let html = "";


    recentEmployees.forEach(
        employee => {


            const id =
                employee.id;


            const name =
                employee.name ||
                "Unknown";


            const email =
                employee.email ||
                "-";


            const department =
                employee.department ||
                "-";


            const salary =
                employee.salary ||
                0;


            const status =
                employee.status ||
                "Active";


            const joiningDate =
                employee.joiningDate ||
                "-";


            const initials =
                getInitials(name);


            const statusClass =

                status.toLowerCase()
                    === "active"

                    ? "status-active"

                    : "status-inactive";


            html += `

                <tr>


                    <!-- EMPLOYEE -->

                    <td>

                        <div class="employee-info">


                            <div class="employee-avatar">

                                ${initials}

                            </div>


                            <div>

                                <div class="employee-name">

                                    ${escapeHtml(
                                        name
                                    )}

                                </div>


                                <div class="employee-email">

                                    ${escapeHtml(
                                        email
                                    )}

                                </div>

                            </div>


                        </div>

                    </td>


                    <!-- DEPARTMENT -->

                    <td>

                        <span
                            class="employee-department">

                            ${escapeHtml(
                                department
                            )}

                        </span>

                    </td>


                    <!-- SALARY -->

                    <td>

                        <div
                            class="employee-salary">

                            ₹${formatSalary(
                                salary
                            )}

                        </div>

                    </td>


                    <!-- JOINED -->

                    <td>

                        <div
                            class="employee-date">

                            ${formatDate(
                                joiningDate
                            )}

                        </div>

                    </td>


                    <!-- STATUS -->

                    <td>

                        <span
                            class="
                                status-badge
                                ${statusClass}
                            ">

                            <i
                                class="
                                    bi
                                    bi-circle-fill
                                ">
                            </i>

                            ${escapeHtml(
                                status
                            )}

                        </span>

                    </td>


                    <!-- ACTION -->

                    <td>

                        <div
                            class="employee-actions">


                            <!-- EDIT -->

                            <a
                                href="/employees/edit/${id}"
                                class="
                                    employee-action
                                    edit
                                "
                                title="Edit Employee">

                                <i
                                    class="
                                        bi
                                        bi-pencil
                                    ">
                                </i>

                            </a>


                            <!-- DELETE -->

                            <button
                                type="button"
                                class="
                                    employee-action
                                    delete
                                "
                                title="Delete Employee"
                                onclick="
                                    deleteEmployee(
                                        ${id},
                                        '${escapeForAttribute(
                                            name
                                        )}'
                                    )
                                ">

                                <i
                                    class="
                                        bi
                                        bi-trash
                                    ">
                                </i>

                            </button>


                        </div>

                    </td>


                </tr>

            `;

        }
    );


    container.innerHTML =
        html;

}


/* =====================================================
   DELETE EMPLOYEE
===================================================== */

async function deleteEmployee(
    id,
    name
) {


    const confirmed =
        confirm(
            `Are you sure you want to delete ${name}?`
        );


    if (!confirmed) {

        return;

    }


    try {


        const response =
            await fetch(
                `/api/employees/${id}`,
                {
                    method: "DELETE"
                }
            );


        if (!response.ok) {

            throw new Error(
                "Failed to delete employee"
            );

        }


        alert(
            "Employee deleted successfully!"
        );


        await loadDashboard();


    } catch (error) {

        console.error(
            error
        );


        alert(
            "Unable to delete employee."
        );

    }

}


/* =====================================================
   DEPARTMENT CHART
===================================================== */

function createDepartmentChart(
    employees
) {


    const canvas =
        document.getElementById(
            "departmentChart"
        );


    if (!canvas) {

        return;

    }


    const departmentCount = {};


    employees.forEach(
        employee => {

            const department =
                employee.department ||
                "Unknown";


            departmentCount[
                department
            ] =

                (
                    departmentCount[
                        department
                    ] || 0
                ) + 1;

        }
    );


    const labels =
        Object.keys(
            departmentCount
        );


    const values =
        Object.values(
            departmentCount
        );


    if (
        window.departmentChartInstance
    ) {

        window.departmentChartInstance
            .destroy();

    }


    window.departmentChartInstance =

        new Chart(
            canvas,
            {

                type: "doughnut",

                data: {

                    labels: labels,

                    datasets: [{

                        data: values,

                        borderWidth: 0

                    }]

                },


                options: {

                    responsive: true,

                    maintainAspectRatio: false,

                    cutout: "68%",

                    plugins: {

                        legend: {

                            position: "bottom",

                            labels: {

                                usePointStyle: true,

                                padding: 18,

                                font: {

                                    size: 10

                                }

                            }

                        }

                    }

                }

            }
        );

}


/* =====================================================
   EMPLOYEE GROWTH CHART
===================================================== */

function createEmployeeGrowthChart(
    employees
) {


    const canvas =
        document.getElementById(
            "employeeGrowthChart"
        );


    if (!canvas) {

        return;

    }


    const monthNames = [

        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sep",
        "Oct",
        "Nov",
        "Dec"

    ];


    const currentYear =
        new Date().getFullYear();


    const monthlyCount =
        new Array(12).fill(0);


    employees.forEach(
        employee => {


            if (
                !employee.joiningDate
            ) {

                return;

            }


            const date =
                new Date(
                    employee.joiningDate
                );


            if (
                date.getFullYear()
                    === currentYear
            ) {

                monthlyCount[
                    date.getMonth()
                ]++;

            }

        }
    );


    let total = 0;


    const cumulativeCount =
        monthlyCount.map(
            count => {

                total += count;

                return total;

            }
        );


    if (
        window.employeeGrowthChartInstance
    ) {

        window.employeeGrowthChartInstance
            .destroy();

    }


    window.employeeGrowthChartInstance =

        new Chart(
            canvas,
            {

                type: "line",

                data: {

                    labels: monthNames,

                    datasets: [{

                        label: "Employees",

                        data:
                            cumulativeCount,

                        tension: 0.4,

                        fill: true,

                        pointRadius: 3,

                        pointHoverRadius: 6

                    }]

                },


                options: {

                    responsive: true,

                    maintainAspectRatio: false,

                    interaction: {

                        intersect: false,

                        mode: "index"

                    },

                    plugins: {

                        legend: {

                            display: false

                        }

                    },

                    scales: {

                        y: {

                            beginAtZero: true,

                            ticks: {

                                precision: 0

                            }

                        },

                        x: {

                            grid: {

                                display: false

                            }

                        }

                    }

                }

            }
        );

}


/* =====================================================
   SEARCH
===================================================== */

function setupSearch() {


    const searchInput =
        document.getElementById(
            "dashboardSearch"
        );


    if (!searchInput) {

        return;

    }


    let searchTimer;


    searchInput.addEventListener(
        "input",
        function () {


            const keyword =
                this.value.trim();


            clearTimeout(
                searchTimer
            );


            searchTimer = setTimeout(
                async function () {


                    if (
                        keyword === ""
                    ) {

                        loadDashboard();

                        return;

                    }


                    try {


                        const response =
                            await fetch(
                                `/api/employees/search?name=${encodeURIComponent(
                                    keyword
                                )}`
                            );


                        if (!response.ok) {

                            throw new Error(
                                "Search failed"
                            );

                        }


                        const employees =
                            await response.json();


                        displayRecentEmployees(
                            employees
                        );


                    } catch (error) {

                        console.error(
                            "Search error:",
                            error
                        );

                    }


                },
                300
            );

        }
    );

}


/* =====================================================
   KEYBOARD SEARCH
===================================================== */

function setupKeyboardShortcut() {


    document.addEventListener(
        "keydown",
        function (event) {


            if (
                (event.ctrlKey ||
                    event.metaKey)
                &&
                event.key.toLowerCase()
                    === "k"
            ) {

                event.preventDefault();


                const searchInput =
                    document.getElementById(
                        "dashboardSearch"
                    );


                if (searchInput) {

                    searchInput.focus();

                }

            }

        }
    );

}


/* =====================================================
   MOBILE MENU
===================================================== */

function setupMobileMenu() {


    const button =
        document.querySelector(
            ".mobile-menu"
        );


    const sidebar =
        document.querySelector(
            ".sidebar"
        );


    if (
        !button ||
        !sidebar
    ) {

        return;

    }


    button.addEventListener(
        "click",
        function () {

            sidebar.classList.toggle(
                "mobile-open"
            );

        }
    );

}


/* =====================================================
   SET ELEMENT TEXT
===================================================== */

function setElementText(
    id,
    value
) {


    const element =
        document.getElementById(id);


    if (element) {

        element.textContent =
            value;

    }

}


/* =====================================================
   INITIALS
===================================================== */

function getInitials(
    name
) {


    if (!name) {

        return "?";

    }


    const parts =
        name.trim()
            .split(/\s+/);


    if (
        parts.length === 1
    ) {

        return parts[0]
            .substring(0, 2)
            .toUpperCase();

    }


    return (

        parts[0].charAt(0)

        +

        parts[
            parts.length - 1
        ].charAt(0)

    ).toUpperCase();

}


/* =====================================================
   SALARY
===================================================== */

function formatSalary(
    salary
) {


    return Number(
        salary || 0
    ).toLocaleString(
        "en-IN"
    );

}


/* =====================================================
   DATE
===================================================== */

function formatDate(
    date
) {


    if (
        !date ||
        date === "-"
    ) {

        return "-";

    }


    const parsedDate =
        new Date(date);


    if (
        isNaN(
            parsedDate.getTime()
        )
    ) {

        return date;

    }


    return parsedDate.toLocaleDateString(
        "en-IN",
        {

            day: "2-digit",

            month: "short",

            year: "numeric"

        }
    );

}


/* =====================================================
   ESCAPE HTML
===================================================== */

function escapeHtml(
    value
) {


    return String(value)

        .replace(
            /&/g,
            "&amp;"
        )

        .replace(
            /</g,
            "&lt;"
        )

        .replace(
            />/g,
            "&gt;"
        )

        .replace(
            /"/g,
            "&quot;"
        )

        .replace(
            /'/g,
            "&#039;"
        );

}


/* =====================================================
   ESCAPE ATTRIBUTE
===================================================== */

function escapeForAttribute(
    value
) {


    return String(value)

        .replace(
            /\\/g,
            "\\\\"
        )

        .replace(
            /'/g,
            "\\'"
        );

}


/* =====================================================
   DASHBOARD ERROR
===================================================== */

function showDashboardError() {


    const container =
        document.getElementById(
            "recentEmployees"
        );


    if (!container) {

        return;

    }


    container.innerHTML = `

        <tr>

            <td colspan="6">

                <div class="empty-state">

                    <div class="empty-state-icon">

                        <i class="bi bi-exclamation-triangle"></i>

                    </div>

                    <h4>
                        Unable to load employees
                    </h4>

                    <p>
                        Please check that the
                        Spring Boot application
                        is running.
                    </p>

                </div>

            </td>

        </tr>

    `;

}