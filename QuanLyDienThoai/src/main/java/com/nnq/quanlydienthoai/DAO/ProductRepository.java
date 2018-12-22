package com.nnq.quanlydienthoai.DAO;
import com.nnq.quanlydienthoai.Model.Product;
import org.springframework.data.repository.CrudRepository;
public interface ProductRepository extends CrudRepository<Product,String> {
}
