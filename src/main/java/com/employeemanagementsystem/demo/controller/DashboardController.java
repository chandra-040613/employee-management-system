package com.employeemanagementsystem.demo.controller;

import java.time.Year;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.employeemanagementsystem.demo.dto.EmployeeResponseDTO;
import com.employeemanagementsystem.demo.service.DashboardService;

@Controller
public class DashboardController {

    private final DashboardService dashboardService;

    public DashboardController(DashboardService dashboardService) {
        this.dashboardService = dashboardService;
    }


    // ==========================================
    // OPEN DASHBOARD JSP
    // ==========================================

    @GetMapping("/dashboard")
    public String dashboard() {

        return "dashboard";
    }


    // ==========================================
    // DASHBOARD STATISTICS
    // ==========================================

    @ResponseBody
    @GetMapping("/api/dashboard/stats")
    public Map<String, Long> getStats() {

        return Map.of(

                "totalEmployees",
                dashboardService.getTotalEmployees(),

                "activeEmployees",
                dashboardService.getActiveEmployees(),

                "departments",
                dashboardService.getDepartmentCount(),

                "newJoiners",
                dashboardService.getNewJoinersThisMonth()

        );
    }


    // ==========================================
    // DEPARTMENT-WISE EMPLOYEE DATA
    // ==========================================

    @ResponseBody
    @GetMapping("/api/dashboard/departments")
    public List<Object[]> getDepartmentData() {

        return dashboardService.getDepartmentData();
    }


    // ==========================================
    // RECENT 5 EMPLOYEES
    // ==========================================

    @ResponseBody
    @GetMapping("/api/dashboard/recent-employees")
    public List<EmployeeResponseDTO> getRecentEmployees() {

        return dashboardService.getRecentEmployees();
    }
    @ResponseBody
    @GetMapping("/api/dashboard/growth")
    public List<Object[]> getEmployeeGrowth() {

        int currentYear = Year.now().getValue();

        return dashboardService
                .getMonthlyEmployeeGrowth(currentYear);
    }
//    @GetMapping("/employees")
//    public String employeesPage() {
//        return "employees";
//    }

}