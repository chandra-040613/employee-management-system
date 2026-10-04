package com.employeemanagementsystem.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.employeemanagementsystem.demo.dto.EmployeeResponseDTO;
import com.employeemanagementsystem.demo.service.EmployeeService;

@Controller
public class EmployeePageController {

    private final EmployeeService employeeService;

    public EmployeePageController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    // ==========================================
    // OPEN EDIT EMPLOYEE PAGE
    // ==========================================

    @GetMapping("/employees/edit/{id}")
    public String editEmployee(
            @PathVariable Long id,
            Model model) {

        EmployeeResponseDTO employee =
                employeeService.getEmployeeById(id);

        model.addAttribute("employee", employee);

        return "edit-employee";
    }
}