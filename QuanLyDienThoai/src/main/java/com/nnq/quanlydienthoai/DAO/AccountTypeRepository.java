package com.nnq.quanlydienthoai.DAO;
import com.nnq.quanlydienthoai.Model.AccountType;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
@Repository
public interface AccountTypeRepository extends CrudRepository<AccountType,String> {
}
