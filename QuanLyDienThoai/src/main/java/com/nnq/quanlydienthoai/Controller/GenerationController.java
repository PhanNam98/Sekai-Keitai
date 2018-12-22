package com.nnq.quanlydienthoai.Controller;


import com.nnq.quanlydienthoai.Model.Generation;
import com.nnq.quanlydienthoai.Services.DeveloperService;
import com.nnq.quanlydienthoai.Services.GenerationService;
import com.nnq.quanlydienthoai.Services.LoginService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Collection;
import org.springframework.web.servlet.ModelAndView;
@Controller

public class GenerationController {

    @Autowired
    private GenerationService generationService;
    @Autowired
    private DeveloperService developerService;


    //Developer
    @GetMapping("/ListGeneration")
    public String listGen(HttpServletRequest req)
    {
        req.setAttribute("genlist",generationService.GetAllGen());
        req.setAttribute("mode","Gen_view");
        return "Generation";
    }
    @GetMapping("/EditGeneration")
    public String EditGen(HttpServletRequest req,@RequestParam String id)
    {
        req.setAttribute("gen",generationService.GetOneGen(id));

        req.setAttribute("mode","Gen_Edit");
        return "Generation";
    }
    @GetMapping("/DeleteGeneration")
    public String DeleteGen(HttpServletRequest req,@RequestParam String id, HttpServletResponse resp) throws IOException
    {
        generationService.DeleteGen(id);
        req.setAttribute("genlist", generationService.GetAllGen());
        req.setAttribute("mode", "Gen_view");
        resp.sendRedirect("/ListGeneration");
        return "Generation";
    }
    @RequestMapping(value = "/SaveEditGen", method = RequestMethod.POST)

    public String SaveEditGen(@ModelAttribute(value = "gen") Generation gen, HttpServletRequest req, HttpServletResponse resp) throws IOException
    {
        gen.setGenid(req.getParameter("GenID"));
        gen.setGenname( req.getParameter("GenName"));
        gen.setDevid( req.getParameter("DevID"));
        generationService.SaveEditGen(gen);

        req.setAttribute("genlist", generationService.GetAllGen());
        req.setAttribute("mode", "Gen_view");
        resp.sendRedirect("/ListGeneration");
        return "Generation";
    }
    @RequestMapping(value = "/SaveNewGen", method = RequestMethod.POST)

    public String SaveNewGen( HttpServletRequest req, HttpServletResponse resp) throws IOException
    {
        Generation g = new Generation();
        g.setGenid(req.getParameter("GenID"));
        g.setGenname( req.getParameter("GenName"));
        g.setDevid( req.getParameter("SelectDevID"));

        generationService.SaveEditGen(g);

        req.setAttribute("genlist", generationService.GetAllGen());
        req.setAttribute("mode", "Gen_view");
        resp.sendRedirect("/ListGeneration");
        return "Generation";
    }
    @GetMapping("/CreateGeneration")
    public String CreateGeneration(HttpServletRequest req)
    {
        req.setAttribute("mode","Gen_Create");
        req.setAttribute("devlist",developerService.GetAllDevloper());
        return "Generation";

    }

}
