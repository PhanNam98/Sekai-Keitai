package com.nnq.quanlydienthoai.DAO;

import com.nnq.quanlydienthoai.Model.LoginBean;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
@Repository
//public interface LoginRepository extends CrudRepository<LoginBean,String> {
//}
public interface LoginRepository extends JpaRepository<LoginBean,String> {
}



