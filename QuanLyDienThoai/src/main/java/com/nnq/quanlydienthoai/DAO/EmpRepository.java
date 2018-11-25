package com.nnq.quanlydienthoai.DAO;
import com.nnq.quanlydienthoai.Model.Employee;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmpRepository extends CrudRepository<Employee,Long> {
}

