package com.employeemanagementsystem.demo.controller;

import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestParam;

import com.employeemanagementsystem.demo.dto.EmployeeRequestDTO;
import com.employeemanagementsystem.demo.dto.EmployeeResponseDTO;
import com.employeemanagementsystem.demo.service.EmployeeService;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/employees")
public class EmployeeController {

    private final EmployeeService employeeService;

    public EmployeeController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @PostMapping
    public EmployeeResponseDTO createEmployee(
            @Valid @RequestBody EmployeeRequestDTO dto) {

        return employeeService.createEmployee(dto);
    }

    @GetMapping
    public List<EmployeeResponseDTO> getAllEmployees() {

        return employeeService.getAllEmployees();
    }
    @GetMapping("/search")
    public List<EmployeeResponseDTO> searchEmployees(
            @RequestParam String name) {

        return employeeService.searchEmployees(name);
    }
    @GetMapping("/department/{department}")
    public List<EmployeeResponseDTO> getEmployeesByDepartment(
            @PathVariable String department) {

        return employeeService.getEmployeesByDepartment(department);
    }

    @GetMapping("/{id}")
    public EmployeeResponseDTO getEmployeeById(
            @PathVariable Long id) {

        return employeeService.getEmployeeById(id);
    }
    
    @PutMapping("/{id}")
    public EmployeeResponseDTO updateEmployee(
            @PathVariable Long id,
            @Valid @RequestBody EmployeeRequestDTO dto) {

        return employeeService.updateEmployee(id, dto);
    }

    @DeleteMapping("/{id}")
    public String deleteEmployee(@PathVariable Long id) {

        employeeService.deleteEmployee(id);

        return "Employee deleted successfully";
    }
    @GetMapping("/page")
    public Page<EmployeeResponseDTO> getEmployeesWithPagination(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size,
            @RequestParam(defaultValue = "id") String sortBy,
            @RequestParam(defaultValue = "asc") String direction) {

        return employeeService.getEmployeesWithPagination(
                page,
                size,
                sortBy,
                direction
        );
    }
   
    
}