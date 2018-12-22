package com.nnq.quanlydienthoai.Services;

import com.nnq.quanlydienthoai.DAO.ColorRepository;
import com.nnq.quanlydienthoai.Model.Color;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
@Service
public class ColorService {

    @Autowired
    private ColorRepository colorRepository;



    public Collection<Color> GetAllColor()
    {
        List<Color> colors= new ArrayList<Color>();
        for(Color e: colorRepository.findAll())
        {
            colors.add(e);
        }
        return colors;
    }

    public Color GetOneColor(String id)
    {
        return colorRepository.findById(id).get();
    }
    public void SaveEditColor(Color c)
    {
        colorRepository.save(c);

    }
    public void DeleteColor(String id)
    {
        colorRepository.deleteById(id);
    }

}
