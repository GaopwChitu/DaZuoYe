package com.work.health.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.work.health.bean.BodyNotes;

import java.util.List;

public interface BodyNotesService extends IService<BodyNotes> {

    boolean insert(BodyNotes bodyNotes);

    List<BodyNotes> getBodyNotes(Integer id);


    void delete(Integer id);

    BodyNotes getUserBodyById(Integer notesid);

    void updateUserBody(BodyNotes bodyNotes);

    void deleteUserBodyById(Integer id);
}
