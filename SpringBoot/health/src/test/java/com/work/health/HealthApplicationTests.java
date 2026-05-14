package com.work.health;

import com.work.health.bean.BodyNotes;
import com.work.health.dao.BodyNotesDao;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class HealthApplicationTests {

    @Test
    void contextLoads() {
    }

    @Autowired
    BodyNotesDao bodyNotesDao;

    @Test
    void test01(){
        List<BodyNotes> notes=bodyNotesDao.selectList(null);
        notes.forEach(x-> System.out.println(x));
    }

}
