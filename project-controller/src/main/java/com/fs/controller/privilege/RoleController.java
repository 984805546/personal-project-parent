package com.fs.controller.privilege;/**
 * @author: fs
 * @create: 2019/12/19 15:38
 */

import com.fs.entity.privilege.Role;
import com.fs.service.privilege.RoleService;
import com.fs.vo.ResponseVO;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.validation.Valid;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program personal-project-parent 
 * @description:
 * @author: fs
 * @create: 2019/12/19 15:38 
 */
@RestController
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService roleService;

    @RequestMapping("/query")
    protected List<Role> query(Integer userId) throws ServletException, IOException {
        List<Role> roles = roleService.getRoles(userId);
        return roles;
    }

    @RequestMapping("/check")
    protected List<Map<String,Object>> check(Integer userId)  {

        List<Map<String,Object>> jsonArray = new ArrayList<Map<String,Object>>();

        List<Role> list = roleService.getAll();

        List<Role> roles = roleService.getRoles(userId);

        for(Role r:list) {
            Map<String, Object> jsonObject = new HashMap<String, Object>();
            jsonObject.put("id", r.getId());
            jsonObject.put("name", r.getName());
            jsonObject.put("description", r.getDescription());
            jsonObject.put("open","true");
            for (Role rr : roles) {
                if (r.getId().equals(rr.getId())) {
                    jsonObject.put("checked", "true");
                }
            }
            jsonArray.add(jsonObject);
        }
        return jsonArray;
    }

    @RequestMapping("/all")
    public ResponseVO all() {
        List<Role> roles = roleService.getAll();
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(roles).build();
        return responseVO;
    }

    @RequestMapping("/list")
    public ResponseVO list(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                           @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        List<Role> roles = roleService.getPageHelper(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(roles,5);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
        return responseVO;
    }

    @PostMapping("/insert")
    public ResponseVO insert(@Valid Role role,
                             BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("请按要求填写").data(false).build();
        } else {
            if (roleService.insert(role) > 0) {
                return ResponseVO.builder().code("200").msg("添加成功").data(true).build();
            }
            return ResponseVO.builder().code("500").msg("添加失败").data(false).build();
        }
    }

    @GetMapping("/delete")
    public Boolean delete(int roleId){
        return roleService.delete(roleId) > 0 ? true : false;
    }

    @PostMapping("/update")
    public ResponseVO update(@Valid Role role,
                             BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("请按要求填写").data(false).build();
        } else {
            if (roleService.update(role) > 0) {
                return ResponseVO.builder().code("200").msg("修改成功").data(true).build();
            }
            return ResponseVO.builder().code("500").msg("修改失败").data(false).build();
        }
    }

    @GetMapping("/search")
    public ResponseVO search(@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum,
                             @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize,
                             @RequestParam(value = "name", required = false) String name) {
        List<Role> roles = roleService.getFilter(pageNum,pageSize,name);
        PageInfo pageInfo = new PageInfo(roles,5);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
        return responseVO;
    }
}
