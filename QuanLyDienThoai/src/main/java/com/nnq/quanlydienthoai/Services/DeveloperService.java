package com.nnq.quanlydienthoai.Services;

import com.nnq.quanlydienthoai.DAO.DeveloperRepository;
import com.nnq.quanlydienthoai.Model.Developer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
@Service
public class DeveloperService {

    @Autowired
    private DeveloperRepository developerRepository;



    public Collection<Developer> GetAllDevloper()
    {
        List<Developer> devs= new ArrayList<Developer>();
        for(Developer e: developerRepository.findAll())
        {
            devs.add(e);
        }
        return devs;
    }

    public Developer GetOneDev(String id)
    {
        return developerRepository.findById(id).get();
    }
    public void SaveEditDev(Developer dev)
    {
        developerRepository.save(dev);

    }
    public void DeleteDev(String id)
    {
        developerRepository.deleteById(id);
    }

}
