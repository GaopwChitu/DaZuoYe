package com.work.health.controller;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.work.health.DataUnification.Unification;
import com.work.health.bean.*;
import com.work.health.dao.UserDao;
import com.work.health.service.BodyNotesService;
import com.work.health.service.BodyService;
import com.work.health.service.UserService;
import jakarta.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class UserController {

    @Resource
    protected UserDao userdao;

    @Resource
    protected BodyService bodyService;

    @Resource
    protected UserService userService;

    @Resource
    protected BodyNotesService bodyNotesService;

    @PostMapping("/register")
    public Unification<Map<String, Object>> register(@RequestBody User register) {
        register.setState(true);
        Map<String, Object> data = userService.register(register);
        if (data.get("success") != null) {
            return Unification.success("注册成功");
        } else {
            return Unification.fail(20004, "注册失败，用户名已存在");
        }
    }

    @RequestMapping("/login")
    public String login(@RequestBody User user) {
        String flag = "error";
        User us = userdao.getUserByMessage(user.getUsername(), user.getPassword());
        HashMap<String, Object> res = new HashMap<>();
        if (us != null) {
            flag = "ok";
        }
        res.put("flag", flag);
        res.put("user", us);
        return JSON.toJSONString(res);
    }

    @GetMapping("/alluser")
    public Map<String, Object> getUserList(
            @RequestParam(required = false) String username,
            @RequestParam Integer pageNum,
            @RequestParam Integer pageSize
    ) {
        Map<String, Object> result = new HashMap<>();
        int pageStart = (pageNum - 1) * pageSize;

        // 封装查询条件
        User user = new User();
        user.setUsername(username);

        // 查询当前页数据
        List<User> userList = userdao.getAllUser(user, pageStart, pageSize);

        // 查询总条数（从第一条数据里拿 total）
        int total = 0;
        if (!userList.isEmpty()) {
            total = userList.get(0).getTotal();
        }

        result.put("rows", userList);
        result.put("total", total);
        return result;
    }

    @RequestMapping("/userstate")
    public String updateUserState(@RequestParam("id") Integer id,
                                  @RequestParam("state") Boolean state) {
        int i = userdao.updateState(id, state);
        return i > 0 ? "success" : "error";
    }

    @GetMapping("/address")
    public Result selectAddress() {
        List<Community> communities = userService.selectAddress();
        return Result.ok(communities, communities.size());
    }

    @RequestMapping("/adduser")
    public String addUser(@RequestBody User user) {
        user.setRole("普通用户");
        user.setState(false);
        int i = userdao.addUser(user);
        return i > 0 ? "success" : "error";
    }

    @RequestMapping("/deleteuser")
    public String deleteUser(int id) {
        int i = userdao.deleteUser(id);
        return i > 0 ? "success" : "error";
    }

    @RequestMapping("/getedituser")
    public String getEditUser(int id) {
        User user = userdao.getEditUser(id);
        return JSON.toJSONString(user);
    }

    @RequestMapping("/edituser")
    public String editUser(@RequestBody User user) {
        int i = userdao.editUser(user);
        return i > 0 ? "success" : "error";
    }

    @RequestMapping("/changeRights")
    public String changeRights(@RequestBody User user) {
        int i = userdao.changeRights(user);
        return i > 0 ? "success" : "error";
    }

    @RequestMapping("/bodyinfo")
    public Unification<Map<String, Object>> getBodyInfo(Integer id) {
        Map<String, Object> data = userService.getBodyInfo(id);
        if (data != null) {
            return Unification.success(data);
        } else {
            return Unification.fail(20002);
        }
    }

    @RequestMapping("/bodynotes")
    public Unification<List<BodyNotes>> getBodyNotes(Integer id) {
        List<BodyNotes> bodyNotesList = bodyNotesService.getBodyNotes(id);
        if (bodyNotesList == null || bodyNotesList.isEmpty()) { // 判断列表是否为空
            return Unification.fail("没有找到多余的记录");
        }
        return Unification.success(bodyNotesList);
    }

    @RequestMapping("/updateBody")
    public Unification<?> updateBody(@RequestBody Body body) {
        bodyService.updateBody(body);
        return Unification.success("修改成功");
    }

    @PostMapping("/BodyInformation")
    public Unification<?> BodyInformationUp(@RequestBody Body body) {
        boolean result = bodyService.insert(body);
        if (result) {
            return Unification.success("上传成功");
        } else {
            return Unification.success("更新成功");
        }
    }

    @PostMapping("/BodyInformationNotes")
    public Unification<?> BodyInformationNotes(@RequestBody BodyNotes bodyNotes) {
        bodyNotesService.insert(bodyNotes);
        return Unification.success();
    }

    @GetMapping("/getBodyList")
    public Unification<Map<String, Object>> getBodyList(@RequestParam(value = "name", required = false) String name,
                                                        @RequestParam(value = "id", required = false) String id,
                                                        @RequestParam("pageNo") Long pageNo,
                                                        @RequestParam("pageSize") Long pageSize) {

        LambdaQueryWrapper<Body> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(StringUtils.hasLength(name), Body::getName, name);
        wrapper.eq(StringUtils.hasLength(id), Body::getId, id);
        Page<Body> page = new Page<>(pageNo, pageSize); // 构建分页对象，指定页码和每页大小

        bodyService.page(page, wrapper); // 调用userService的分页查询方法，查询指定页码、每页大小和查询条件的用户列表
        Map<String, Object> data = new HashMap<>();

        data.put("total", page.getTotal()); // 将查询到的用户总数放入响应数据中
        data.put("rows", page.getRecords()); // 将查询到的用户列表放入响应数据中
        return Unification.success(data);
    }

    @GetMapping("/getBodyById/{id}")
    public Unification<Body> getBodyById(@PathVariable("id") Integer id) {
        // 通过用户id调用userService的getUserById方法获取用户信息
        Body body = bodyService.getBodyById(id);
        // 将获取到的用户信息封装成Unification类型并返回
        return Unification.success(body);
    }

    @DeleteMapping("/deleteBodyById/{id}")
    public Unification<SportInfo> deleteBodyById(@PathVariable("id") Integer id) {
        bodyService.deleteBodyById(id);
        bodyNotesService.delete(id);
        return Unification.success("删除成功");
    }

    @GetMapping("/getUserBodyList")
    public Unification<Map<String, Object>> getUserBodyList(
            @RequestParam("userId") Integer userId,
            @RequestParam("pageNo") Long pageNo,
            @RequestParam("pageSize") Long pageSize) {

        LambdaQueryWrapper<BodyNotes> wrapper = new LambdaQueryWrapper<>();

        if (userId != null) {
            wrapper.eq(BodyNotes::getId, userId);
        } else {
            // 如果userid.get("id")为null，则返回一个空的查询条件
            wrapper.isNull(BodyNotes::getId);
        }

        Page<BodyNotes> page = new Page<>(pageNo, pageSize); // 构建分页对象，指定页码和每页大小
        bodyNotesService.page(page, wrapper); // 调用userService的分页查询方法，查询指定页码、每页大小和查询条件的用户列表

        Map<String, Object> data = new HashMap<>();
        data.put("total", page.getTotal()); // 将查询到的用户总数放入响应数据中
        data.put("rows", page.getRecords()); // 将查询到的用户列表放入响应数据中
        return Unification.success(data);
    }

    @GetMapping("/getUserBodyById/{notesid}")
    public Unification<BodyNotes> getUserBodyById(@PathVariable("notesid") Integer notesid) {
        BodyNotes bodyNotes = bodyNotesService.getUserBodyById(notesid);
        return Unification.success(bodyNotes);
    }

    @RequestMapping("/updateUserBody")
    public Unification<?> updateUserBody(@RequestBody BodyNotes bodyNotes) {
        bodyNotesService.updateUserBody(bodyNotes);
        return Unification.success("修改成功");
    }

    @DeleteMapping("/deleteUserBodyById/{notesid}")
    public Unification<SportInfo> deleteUserBodyById(@PathVariable("notesid") Integer notesid,
                                                     @Param("userId") Integer userId) {
        List<BodyNotes> bodyNotesList = bodyNotesService.getBodyNotes(userId);
        int bodyNotesListSize = bodyNotesList.size();
        if (notesid.equals(bodyNotesList.get(bodyNotesListSize - 1).getNotesid()) && bodyNotesListSize - 2 >= 0) {
            Body body = new Body(bodyNotesList.get(bodyNotesListSize - 2));
            bodyService.insert(body);
        }
        bodyNotesService.deleteUserBodyById(notesid);
        return Unification.success("删除成功");
    }
}
