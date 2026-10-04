package com.employeemanagementsystem.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.employeemanagementsystem.demo.dto.EmployeeRequestDTO;
import com.employeemanagementsystem.demo.dto.EmployeeResponseDTO;
import com.employeemanagementsystem.demo.service.EmployeeService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class EmployeeViewController {

    private final EmployeeService employeeService;

    public EmployeeViewController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @GetMapping("/employees")
    public String employeesPage(Model model) {

        List<EmployeeResponseDTO> employees =
                employeeService.getAllEmployees();

        model.addAttribute("employees", employees);

        return "employees";
    }
    @GetMapping("/employees/add")
    public String addEmployeePage() {

        return "add-employee";
    }
    @PostMapping("/employees/save")
    public String saveEmployee(
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam String department,
            @RequestParam double salary) {

        EmployeeRequestDTO dto = new EmployeeRequestDTO();

        dto.setName(name);
        dto.setEmail(email);
        dto.setDepartment(department);
        dto.setSalary(salary);

        employeeService.createEmployee(dto);

        return "redirect:/employees";
    }
    @GetMapping("/employees/view/{id}")
    public String employeeDetails(
            @PathVariable Long id,
            Model model) {

        EmployeeResponseDTO employee =
                employeeService.getEmployeeById(id);

        model.addAttribute("employee", employee);

        return "employee-details";
    }
}