package com.work.health.service.impl;

import com.work.health.bean.Community;
import com.work.health.dao.CommunityDao;
import com.work.health.service.CommunityService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommunityServiceImpl implements CommunityService {

    @Resource
    private CommunityDao communityDao;

    /**
     * 查询社区列表
     * @param community
     * @return
     */
    @Override
    public List<Community> selectCommunity(Community community) {
        int pageStart = (community.getPageNum() - 1) * community.getPageSize();//分页
        community.setPageStart(pageStart);
        return communityDao.selectCommunity(community);
    }

    /**
     * 社区详情
     * @param id
     * @return
     */
    @Override
    public Community getCommunityById(int id) {
        return communityDao.getCommunityById(id);
    }

    /**
     * 删除
     * @param community
     * @return
     */
    @Override
    public String deleteCommunity(Community community) {
        int i = communityDao.deleteCommunity(community);
        return i > 0 ? "success" : "error";
    }


    /**
     * 添加
     * @param community
     * @return
     */
    @Override
    public String insertCommunity(Community community) {
        int i = communityDao.insertCommunity(community);
        return i > 0 ? "success" : "error";
    }

    /**
     * 修改
     * @param community
     * @return
     */
    @Override
    public String updateCommunity(Community community) {
        int i = communityDao.updateCommunity(community);
        return i > 0 ? "success" : "error";
    }

    /**
     * 修改状态
     * @param community
     * @return
     */
    @Override
    public String updateState(Community community) {
        int i = communityDao.updateState(community);
        return i > 0 ? "success" : "error";
    }
}
