package com.nnq.quanlydienthoai.Services;
import java.util.ArrayList;
import  java.util.List;
import  java.util.Collection;
import com.nnq.quanlydienthoai.DAO.GenerationRepository;

import com.nnq.quanlydienthoai.Model.Generation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.swing.*;
import java.awt.*;
import javax.servlet.http.HttpServletRequest;
import java.util.Collection;

@Service
public class GenerationService {
    @Autowired
    private GenerationRepository generationRepository;

    public Collection<Generation> GetAllGen()
    {
        List<Generation> gens= new ArrayList<Generation>();
        for(Generation e: generationRepository.findAll())
        {
            gens.add(e);
        }
        return gens;
    }
    public Generation GetOneGen(String id)
    {
        return generationRepository.findById(id).get();
    }
    public void SaveEditGen(Generation gen)
    {
        generationRepository.save(gen);

    }
    public void DeleteGen(String id)
    {
        generationRepository.deleteById(id);
    }


}
