package com.employeemanagementsystem.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.employeemanagementsystem.demo.dto.EmployeeRequestDTO;
import com.employeemanagementsystem.demo.dto.EmployeeResponseDTO;
import com.employeemanagementsystem.demo.exception.EmployeeNotFoundException;
import com.employeemanagementsystem.demo.model.Employee;
import com.employeemanagementsystem.demo.repository.EmployeeRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

@Service
public class EmployeeService {

    private final EmployeeRepository employeeRepository;

    public EmployeeService(EmployeeRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }

    // CREATE
    public EmployeeResponseDTO createEmployee(EmployeeRequestDTO dto) {

        Employee employee = new Employee();

        employee.setName(dto.getName());
        employee.setEmail(dto.getEmail());
        employee.setDepartment(dto.getDepartment());
        employee.setSalary(dto.getSalary());
        employee.setStatus(dto.getStatus());
        employee.setJoiningDate(dto.getJoiningDate());

        Employee savedEmployee = employeeRepository.save(employee);

        return convertToResponseDTO(savedEmployee);
    }

    // GET ALL
    public List<EmployeeResponseDTO> getAllEmployees() {

        return employeeRepository.findAll()
                .stream()
                .map(this::convertToResponseDTO)
                .toList();
    }

    // GET BY ID
    public EmployeeResponseDTO getEmployeeById(Long id) {

        Employee employee = employeeRepository.findById(id)
                .orElseThrow(() ->
                    new EmployeeNotFoundException(
                        "Employee not found with id: " + id));

        return convertToResponseDTO(employee);
    }

    // UPDATE
    public EmployeeResponseDTO updateEmployee(
            Long id,
            EmployeeRequestDTO dto) {

        Employee existingEmployee =
                employeeRepository.findById(id)
                .orElseThrow(() ->
                    new EmployeeNotFoundException(
                        "Employee not found with id: " + id));

        existingEmployee.setName(dto.getName());
        existingEmployee.setEmail(dto.getEmail());
        existingEmployee.setDepartment(dto.getDepartment());
        existingEmployee.setSalary(dto.getSalary());
        existingEmployee.setStatus(dto.getStatus());
        existingEmployee.setJoiningDate(dto.getJoiningDate());

        Employee updatedEmployee =
                employeeRepository.save(existingEmployee);

        return convertToResponseDTO(updatedEmployee);
    }

    // DELETE
    public void deleteEmployee(Long id) {

        if (!employeeRepository.existsById(id)) {
            throw new EmployeeNotFoundException(
                    "Employee not found with id: " + id);
        }

        employeeRepository.deleteById(id);
    }

    // ENTITY → DTO
    private EmployeeResponseDTO convertToResponseDTO(
            Employee employee) {

        return new EmployeeResponseDTO(
                employee.getId(),
                employee.getName(),
                employee.getEmail(),
                employee.getDepartment(),
                employee.getSalary(),
                employee.getStatus(),
                employee.getJoiningDate()
        );
    }
    public List<EmployeeResponseDTO> searchEmployees(String name) {

        return employeeRepository
                .findByNameContainingIgnoreCase(name)
                .stream()
                .map(this::convertToResponseDTO)
                .toList();
    }
    public List<EmployeeResponseDTO> getEmployeesByDepartment(
            String department) {

        return employeeRepository
                .findByDepartmentIgnoreCase(department)
                .stream()
                .map(this::convertToResponseDTO)
                .toList();
    }
    public Page<EmployeeResponseDTO> getEmployeesWithPagination(
            int page,
            int size,
            String sortBy,
            String direction) {

        Sort sort;

        if (direction.equalsIgnoreCase("desc")) {
            sort = Sort.by(sortBy).descending();
        } else {
            sort = Sort.by(sortBy).ascending();
        }

        Pageable pageable = PageRequest.of(page, size, sort);

        return employeeRepository.findAll(pageable)
                .map(this::convertToResponseDTO);
    }
    public List<EmployeeResponseDTO> getRecentEmployees() {

        return employeeRepository
                .findTop5ByOrderByIdDesc()
                .stream()
                .map(this::convertToResponseDTO)
                .toList();
    }
}