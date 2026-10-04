package com.employeemanagementsystem.demo.repository;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.employeemanagementsystem.demo.model.Employee;

public interface EmployeeRepository
        extends JpaRepository<Employee, Long> {

    List<Employee> findByNameContainingIgnoreCase(String name);

    List<Employee> findByDepartmentIgnoreCase(String department);


    long countByStatusIgnoreCase(String status);


    long countByJoiningDateBetween(
            LocalDate startDate,
            LocalDate endDate
    );


    @Query("""
        SELECT e.department, COUNT(e)
        FROM Employee e
        GROUP BY e.department
        ORDER BY COUNT(e) DESC
    """)
    List<Object[]> getEmployeeCountByDepartment();
    List<Employee> findTop5ByOrderByIdDesc();
    @Query("""
    	    SELECT FUNCTION('MONTH', e.joiningDate),
    	           COUNT(e)
    	    FROM Employee e
    	    WHERE FUNCTION('YEAR', e.joiningDate) = :year
    	    GROUP BY FUNCTION('MONTH', e.joiningDate)
    	    ORDER BY FUNCTION('MONTH', e.joiningDate)
    	""")
    	List<Object[]> getMonthlyEmployeeGrowth(
    	        @Param("year") int year
    	);
}