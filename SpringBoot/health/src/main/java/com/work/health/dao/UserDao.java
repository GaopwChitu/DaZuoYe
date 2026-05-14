package com.work.health.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.work.health.bean.Community;
import com.work.health.bean.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao extends BaseMapper<User> {

    User getUserByMessage(@Param("username") String username, @Param("password") String password);
    List<User> getAllUser(
            @Param("user") User user,
            @Param("pageStart") int pageStart,
            @Param("pageSize") int pageSize
    );
    int updateState(Integer id,Boolean state);
    int addUser(User user);
    int deleteUser(int id);
    User getEditUser(int id);
    int editUser(User user);
    int changeRights(User user);
    List<Community> selectAddress();
}
