package com.nnq.quanlydienthoai.Controller;


import com.nnq.quanlydienthoai.Model.Color;
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

public class ColorController {

    @Autowired
    private ColorService colorService;

    @GetMapping("/ListColor")
    public String listColor(HttpServletRequest req)
    {
        req.setAttribute("colorlist",colorService.GetAllColor());
        req.setAttribute("mode","Color_view");
        return "Color";
    }
    @GetMapping("/EditColor")
    public String EditColor(HttpServletRequest req,@RequestParam String id)
    {
        req.setAttribute("color",colorService.GetOneColor(id));

        req.setAttribute("mode","Color_Edit");
        return "Color";
    }
    @GetMapping("/DeleteColor")
    public String DeleteColor(HttpServletRequest req,@RequestParam String id, HttpServletResponse resp) throws IOException
    {
        colorService.DeleteColor(id);
        req.setAttribute("colorlist", colorService.GetAllColor());
        req.setAttribute("mode", "Color_view");
        resp.sendRedirect("/ListColor");
        return "Color";
    }
    @RequestMapping(value = "/SaveEditColor", method = RequestMethod.POST)

    public String SaveEditColor(@ModelAttribute(value = "color") Color color, HttpServletRequest req, HttpServletResponse resp) throws IOException
    {
        color.setColorid(req.getParameter("ColorID"));
        color.setColorname( req.getParameter("ColorName"));

        colorService.SaveEditColor(color);

        req.setAttribute("colorlist", colorService.GetAllColor());
        req.setAttribute("mode", "Color_view");
        resp.sendRedirect("/ListColor");
        return "Color";
    }
    @RequestMapping(value = "/SaveNewColor", method = RequestMethod.POST)

    public String SaveNewColor( HttpServletRequest req, HttpServletResponse resp) throws IOException
    {
        Color g = new Color();
        g.setColorid(req.getParameter("ColorID"));
        g.setColorname( req.getParameter("ColorName"));


        colorService.SaveEditColor(g);

        req.setAttribute("colorlist", colorService.GetAllColor());
        req.setAttribute("mode", "Color_view");
        resp.sendRedirect("/ListColor");
        return "Color";
    }
    @GetMapping("/CreateColor")
    public String CreateColor(HttpServletRequest req)
    {
        req.setAttribute("mode","Color_Create");
        return "Color";

    }

}
