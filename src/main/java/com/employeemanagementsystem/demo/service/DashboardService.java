package com.employeemanagementsystem.demo.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import com.employeemanagementsystem.demo.dto.EmployeeResponseDTO;
import com.employeemanagementsystem.demo.repository.EmployeeRepository;

@Service
public class DashboardService {

    private final EmployeeRepository employeeRepository;

    public DashboardService(EmployeeRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }


    // Total employees
    public long getTotalEmployees() {

        return employeeRepository.count();
    }


    // Active employees
    public long getActiveEmployees() {

        return employeeRepository.countByStatusIgnoreCase("ACTIVE");
    }


    // Number of departments
    public long getDepartmentCount() {

        return employeeRepository
                .getEmployeeCountByDepartment()
                .size();
    }


    // Employees joined this month
    public long getNewJoinersThisMonth() {

        LocalDate today = LocalDate.now();

        LocalDate firstDay =
                today.withDayOfMonth(1);

        LocalDate lastDay =
                today.withDayOfMonth(
                        today.lengthOfMonth()
                );

        return employeeRepository.countByJoiningDateBetween(
                firstDay,
                lastDay
        );
    }


    // Department-wise employee count
    public List<Object[]> getDepartmentData() {

        return employeeRepository
                .getEmployeeCountByDepartment();
    }


    public List<EmployeeResponseDTO> getRecentEmployees() {

        return employeeRepository
                .findTop5ByOrderByIdDesc()
                .stream()
                .map(employee -> new EmployeeResponseDTO(
                        employee.getId(),
                        employee.getName(),
                        employee.getEmail(),
                        employee.getDepartment(),
                        employee.getSalary(),
                        employee.getStatus(),
                        employee.getJoiningDate()
                ))
                .toList();
    }
    public List<Object[]> getMonthlyEmployeeGrowth(int year) {

        List<Object[]> monthlyData =
                employeeRepository.getMonthlyEmployeeGrowth(year);

        List<Object[]> cumulativeData = new java.util.ArrayList<>();

        long total = 0;

        for (Object[] row : monthlyData) {

            int month = ((Number) row[0]).intValue();

            long count = ((Number) row[1]).longValue();

            total += count;

            cumulativeData.add(
                    new Object[] {
                            month,
                            total
                    }
            );
        }

        return cumulativeData;
    }

    
	
}