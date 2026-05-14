package com.work.health.dao;


import com.work.health.bean.MainMenu;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuDao {
    List<MainMenu> getMenus(@Param("id") Integer id);
}
