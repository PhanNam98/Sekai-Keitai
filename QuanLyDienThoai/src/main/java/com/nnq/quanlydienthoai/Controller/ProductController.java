package com.nnq.quanlydienthoai.Controller;
import com.nnq.quanlydienthoai.Model.Developer;
import com.nnq.quanlydienthoai.Model.Product;
import com.nnq.quanlydienthoai.Model.ProductDetail;
import com.nnq.quanlydienthoai.Services.DeveloperService;
import com.nnq.quanlydienthoai.Services.GenerationService;
import com.nnq.quanlydienthoai.Services.ProductService;
import com.nnq.quanlydienthoai.Services.ColorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Collection;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class ProductController {

    @Autowired
    private ProductService productService;
    @Autowired
    private DeveloperService developerService;
    @Autowired
    private GenerationService generationService;
    @Autowired
    private ColorService colorService;


    @GetMapping("/ListProduct")
    public String listProduct(HttpServletRequest req)
    {
        req.setAttribute("prodlist",productService.GetAllProduct());
        req.setAttribute("mode","Prod_view");
        return "Product";
    }

    @RequestMapping(value = "/SeachProduct", method = RequestMethod.POST)
    public String SeachProduct(HttpServletRequest req)
    {
        req.setAttribute("prodlist",productService.SearchProduct(req.getParameter("searchprod")));
        req.setAttribute("mode","Prod_view");
        return "Product";
    }
    @GetMapping("/EditProduct")
    public String EditProcduct(HttpServletRequest req,@RequestParam String id)
    {
        req.setAttribute("prod",productService.GetOneProduct(id));
        req.setAttribute("mode","Prod_Edit");
        return "Product";
    }
    @GetMapping("/DeleteProduct")
    public String DeleteProduct(HttpServletRequest req,@RequestParam String id, HttpServletResponse resp) throws IOException
    {
        productService.DeleteProduct(id);
        req.setAttribute("prodlist",productService.GetAllProduct());
        req.setAttribute("mode","Prod_view");
        resp.sendRedirect("/ListProduct");
        return "Product";
    }
    @RequestMapping(value = "/SaveEditProduct", method = RequestMethod.POST)

    public String SaveEditProduct(@ModelAttribute(value = "prod") Product prod, HttpServletRequest req, HttpServletResponse resp) throws IOException
    {
        prod.setProductid(req.getParameter("ProdID"));
        prod.setProductname( req.getParameter("ProdName"));
        prod.setCpu( req.getParameter("ProdCpu"));
        prod.setRam( req.getParameter("ProdRam"));
        prod.setStorage( req.getParameter("ProdStorage"));
        prod.setScreen( req.getParameter("ProdScreen"));
        prod.setBattery( req.getParameter("ProdBattery"));
        prod.setGenid( req.getParameter("GenId"));

        productService.SaveEditProduct(prod);

        req.setAttribute("prodlist", productService.GetAllProduct());
        req.setAttribute("mode","Prod_view");
        resp.sendRedirect("/ListProduct");
        return "Product";
    }
    @RequestMapping(value = "/SaveNewProduct", method = RequestMethod.POST)

    public String SaveNewProduct( HttpServletRequest req, HttpServletResponse resp) throws IOException
    {
        Product p = new Product();
        p.setProductid(req.getParameter("ProdID"));
        p.setProductname( req.getParameter("ProdName"));
        p.setCpu( req.getParameter("ProdCpu"));
        p.setRam( req.getParameter("ProdRam"));
        p.setStorage( req.getParameter("ProdStorage"));
        p.setScreen( req.getParameter("ProdScreen"));
        p.setBattery( req.getParameter("ProdBattery"));
        p.setGenid( req.getParameter("SelectGen"));


        productService.SaveEditProduct(p);

        req.setAttribute("prodlist", productService.GetAllProduct());
        req.setAttribute("mode","Prod_view");
        resp.sendRedirect("/ListProduct");
        return "Product";
    }
    @GetMapping("/CreateProduct")
    public String CreateProduct(HttpServletRequest req)
    {

        req.setAttribute("mode","Product_Create");

        req.setAttribute("devlist",developerService.GetAllDevloper());

        return "Product";

    }
    @RequestMapping(value = "/ChoiceDevloper", method = RequestMethod.POST)
    public String ChoiceDevloper( HttpServletRequest req, HttpServletResponse resp) throws IOException
    {
        String prodid = req.getParameter("SelectDev");
        req.setAttribute("mode","Product_Create");
        req.setAttribute("devlist",developerService.GetAllDevloper());
        req.setAttribute("genlist",generationService.GetAllGenByDevID(prodid));
        req.setAttribute("devselect",prodid);
        return "Product";
    }

//ProductDetail
@GetMapping("/ListProductDetail")
public String listProductDetail(HttpServletRequest req)
{
    req.setAttribute("proddetaillist",productService.GetAllProductDetail());
    req.setAttribute("mode","ProdDetail_view");
    return "ProductDetail";
}
    @GetMapping("/ListProductDetailBy")
    public String ListProductDetailBy(HttpServletRequest req,@RequestParam String id)
    {
        req.setAttribute("proddetaillist",productService.GetAllProductDetailByProductID(id));
        req.setAttribute("mode","ProdDetail_view");
        req.setAttribute("ProdDetailID",id);
        return "ProductDetail";
    }
    @GetMapping("/EditProductDetail")
    public String EditProcductDetail(HttpServletRequest req,@RequestParam String id)
    {

        req.setAttribute("prodDetail",productService.GetOneProductDetail(id));
        req.setAttribute("mode","ProdDetail_Edit");
        req.setAttribute("listcolor",colorService.GetAllColor());
        req.setAttribute("colorselect",productService.GetOneProductDetail(id).getColorid());
        return "ProductDetail";
    }
    @GetMapping("/DeleteProductDetail")
    public String DeleteProductDetail(HttpServletRequest req,@RequestParam String id,@RequestParam String idproduct, HttpServletResponse resp) throws IOException
    {
        productService.DeleteProductDetail(id);
        req.setAttribute("proddetaillist",productService.GetAllProductDetailByProductID(idproduct));
        req.setAttribute("mode","ProdDetail_view");
        resp.sendRedirect("/ListProductDetailBy?id="+idproduct);
        return "ProductDetail";
    }
    @RequestMapping(value = "/SaveEditProductDetail", method = RequestMethod.POST)

    public String SaveEditProductDetail(@ModelAttribute(value = "prodDetail") ProductDetail prodDetail, HttpServletRequest req, HttpServletResponse resp) throws IOException
    {
        prodDetail.setProductid(req.getParameter("ProdID"));
        prodDetail.setModelid( req.getParameter("ModelID"));
        prodDetail.setColorid( req.getParameter("SelectColor"));
        prodDetail.setPrice(Float.parseFloat( req.getParameter("Price")));
        prodDetail.setQuantity(Integer.parseInt(req.getParameter("Quantity")));


        productService.SaveEditProductDetail(prodDetail);

        req.setAttribute("proddetaillist", productService.GetAllProductDetail());
        req.setAttribute("ProdDetailID",req.getParameter("ProdID"));
        req.setAttribute("mode","ProdDetail_view");

        resp.sendRedirect("ListProductDetailBy?id="+req.getParameter("ProdID"));

        return "ProductDetail";
    }
    @RequestMapping(value = "/SaveNewProductDetail", method = RequestMethod.POST)

    public String SaveNewProductDetail( HttpServletRequest req, HttpServletResponse resp) throws IOException
    {

        ProductDetail p = new ProductDetail();
        p.setProductid(req.getParameter("ProdID"));
        p.setModelid( req.getParameter("ModelID"));
        p.setColorid( req.getParameter("SelectColor"));
        p.setPrice(Float.parseFloat( req.getParameter("Price")));
        p.setQuantity(Integer.parseInt(req.getParameter("Quantity")));


        productService.SaveEditProductDetail(p);

        req.setAttribute("proddetaillist", productService.GetAllProductDetail());
        req.setAttribute("mode","ProdDetail_view");
        resp.sendRedirect("ListProductDetailBy?id="+req.getParameter("ProdID"));
        req.setAttribute("ProdDetailID",req.getParameter("ProdID"));
        return "ProductDetail";
    }

    @GetMapping("/CreateProductDetail")
    public String CreateProductDetail(HttpServletRequest req,@RequestParam String id)
    {

        req.setAttribute("mode","ProductDetail_Create");
        req.setAttribute("ProdDetailID",id);
        req.setAttribute("listcolor",colorService.GetAllColor());
        return "ProductDetail";

    }

}
