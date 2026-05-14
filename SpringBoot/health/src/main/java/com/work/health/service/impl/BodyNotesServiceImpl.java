package com.work.health.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.work.health.bean.BodyNotes;
import com.work.health.dao.BodyNotesDao;
import com.work.health.service.BodyNotesService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BodyNotesServiceImpl extends ServiceImpl<BodyNotesDao, BodyNotes> implements BodyNotesService {

    @Override
    public boolean insert(BodyNotes bodyNotes) {
        this.baseMapper.insert(bodyNotes);
        return true;
    }

    @Override
    public List<BodyNotes> getBodyNotes(Integer id) {
        LambdaQueryWrapper<BodyNotes> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(BodyNotes::getId, id);
        return baseMapper.selectList(queryWrapper);
    }

    @Override
    public void delete(Integer id) {
        QueryWrapper<BodyNotes> wrapper = new QueryWrapper<>();
        wrapper.eq("id", id);
        baseMapper.delete(wrapper);
    }

    @Override
    public BodyNotes getUserBodyById(Integer notesid) {
        return this.baseMapper.selectById(notesid);
    }

    @Override
    public void updateUserBody(BodyNotes bodyNotes) {
        bodyNotes.setDate(null);
        this.baseMapper.updateById(bodyNotes);
    }

    @Override
    public void deleteUserBodyById(Integer notesid) {
        this.baseMapper.deleteById(notesid);
    }
}
