package com.nnq.quanlydienthoai.Services;

import java.util.ArrayList;
import  java.util.List;
import  java.util.Collection;
import com.nnq.quanlydienthoai.DAO.ProductRepository;
import com.nnq.quanlydienthoai.DAO.ProductDetailRepository;
import com.nnq.quanlydienthoai.DAO.ProductDetailJpaRepository;
import com.nnq.quanlydienthoai.Model.ProductDetail;
import com.nnq.quanlydienthoai.Model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.swing.*;
import java.awt.*;
import javax.servlet.http.HttpServletRequest;
import java.util.Collection;
import java.util.stream.Collectors;


@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private ProductDetailRepository productDetailRepository;
    @Autowired
    private ProductDetailJpaRepository productDetailJpaRepository;

    public Collection<Product> GetAllProduct()
    {
        List<Product> prods= new ArrayList<Product>();
        for(Product e: productRepository.findAll())
        {
            prods.add(e);
        }
        return prods;
    }

    public Product GetOneProduct(String id)
    {
        return productRepository.findById(id).get();
    }
    public void SaveEditProduct(Product prod)
    {
        productRepository.save(prod);

    }
    public void DeleteProduct(String id)
    {
        productRepository.deleteById(id);
    }


    //Product Detail
    public Collection<ProductDetail> GetAllProductDetail()
    {
        List<ProductDetail> prods= new ArrayList<ProductDetail>();
        for(ProductDetail e: productDetailRepository.findAll())
        {
            prods.add(e);
        }
        return prods;
    }
    public Collection<ProductDetail> GetAllProductDetailByProductID(String id)
    {
      return productDetailJpaRepository.findAll().stream().filter(p->p.getProductid().equals(id)).collect(Collectors.toList());
    }
    public ProductDetail GetOneProductDetail(String id)
    {
        return productDetailRepository.findById(id).get();
    }
    public void SaveEditProductDetail(ProductDetail prod)
    {
        productDetailRepository.save(prod);

    }
    public void DeleteProductDetail(String id)
    {
        productDetailRepository.deleteById(id);
    }


}