package com.nnq.quanlydienthoai.DAO;
import com.nnq.quanlydienthoai.Model.EmployeeType;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
@Repository
public interface EmpTypeRepository extends CrudRepository<EmployeeType,Long> {
}
