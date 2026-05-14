package com.work.health.service.impl;

import com.work.health.bean.Assess;
import com.work.health.dao.AssessDao;
import com.work.health.service.AssessService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

@Service
public class AssessServiceImpl implements AssessService {

    @Resource
    private AssessDao assessDao;
    /**
     * 添加评价
     * @param assess
     * @return
     */
    public String insertAssess(Assess assess){
        if(assess.getRoleId().equals("4")){
            assessDao.updateUserAssess(assess.getWorkId());
        }
        assessDao.updateWorkerAssess(assess.getWorkId());
        int i = assessDao.insertAssess(assess);
        return i > 0 ? "success" : "error";
    }

    /**
     * 获取数量
     * @return
     */
    @Override
    public Assess getCount() {
        return assessDao.getCount();
    }
}
