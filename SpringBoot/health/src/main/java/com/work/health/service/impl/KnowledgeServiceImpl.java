package com.work.health.service.impl;

import com.work.health.bean.Knowledge;
import com.work.health.dao.KnowledgeDao;
import com.work.health.service.KnowledgeService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KnowledgeServiceImpl implements KnowledgeService {
    @Resource
    private KnowledgeDao knowledgeDao;

    /**
     * 列表
     * @param knowledge
     * @return
     */
    @Override
    public List<Knowledge> getKnowledgeList(Knowledge knowledge) {
        int pageStart = (knowledge.getPageNum() - 1) * knowledge.getPageSize();//分页
        knowledge.setPageStart(pageStart);
        return knowledgeDao.getKnowledgeList(knowledge);
    }

    /**
     * 详情
     * @param id
     * @param style
     * @return
     */
    @Override
    public Knowledge getKnowledgeInfo(int id,String style) {
        if(style.equals("1")){
            knowledgeDao.updateNumber(id,style);
        }
        return knowledgeDao.getKnowledgeInfo(id,style);
    }

    /**
     * 删除
     * @param knowledge
     * @return
     */
    @Override
    public String deleteKnowledgeById(Knowledge knowledge) {
        int i = knowledgeDao.deleteKnowledgeById(knowledge);
        return i > 0 ? "success" : "error";
    }

    /**
     * 修改
     * @param knowledge
     * @return
     */
    @Override
    public String updateKnowledge(Knowledge knowledge) {
        int i = knowledgeDao.updateKnowledge(knowledge);
        return i > 0 ? "success" : "error";
    }

    /**
     * 添加
     * @param knowledge
     * @return
     */
    @Override
    public String insertKnowledge(Knowledge knowledge) {
        int i = knowledgeDao.insertKnowledge(knowledge);
        return i > 0 ? "success" : "error";
    }
}
