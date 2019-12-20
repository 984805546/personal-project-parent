package com.fs.controller.privilege;/**
 * @author: fs
 * @create: 2019/12/19 15:38
 */

import com.fs.entity.privilege.Privilege;
import com.fs.service.privilege.PrivilegeService;
import com.fs.vo.ResponseVO;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.validation.Valid;
import java.io.IOException;
import java.util.*;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/19 15:38
 */

@RestController
@RequestMapping("/privilege")
public class PrivilegeController {

    @Autowired
    private PrivilegeService privilegeService;

    @RequestMapping("/check")
    protected List<Map<String,Object>> check(Integer roleId)  {

        List<Map<String,Object>> jsonArray = new ArrayList<Map<String,Object>>();

        List<Privilege> list = privilegeService.getAll();

        List<Privilege> rolePrivilege = privilegeService.getPrivileges(roleId);


        for(Privilege p:list) {
            Map<String, Object> jsonObject = new HashMap<String, Object>();
            jsonObject.put("id", p.getId());
            jsonObject.put("pId", p.getPid());
            jsonObject.put("name", p.getName());
            jsonObject.put("open","true");
            for (Privilege r : rolePrivilege) {
                if (p.getId().equals(r.getId())) {
                    jsonObject.put("checked", "true");
                }
            }
            jsonArray.add(jsonObject);
        }
        return jsonArray;
    }

    @RequestMapping("/all")
    public ResponseVO all() {
        List<Privilege> privileges = privilegeService.getAll();
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(privileges).build();
        return responseVO;
    }

    @RequestMapping("/list")
    public ResponseVO list(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                           @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        List<Privilege> privileges = privilegeService.getPageHelper(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(privileges,5);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
        return responseVO;
    }

    @PostMapping("/insert")
    public ResponseVO insert(@Valid Privilege privilege,
                             BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("请按要求填写").data(false).build();
        } else {
            if (privilegeService.insert(privilege) > 0) {
                return ResponseVO.builder().code("200").msg("添加成功").data(true).build();
            }
            return ResponseVO.builder().code("500").msg("添加失败").data(false).build();
        }
    }

    @GetMapping("/delete")
    public Boolean delete(int privilegeId){
        return privilegeService.delete(privilegeId) > 0 ? true : false;
    }

    @PostMapping("/update")
    public ResponseVO update(@Valid Privilege privilege,
                             BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("请按要求填写").data(false).build();
        } else {
            if (privilegeService.update(privilege) > 0) {
                return ResponseVO.builder().code("200").msg("修改成功").data(true).build();
            }
            return ResponseVO.builder().code("500").msg("修改失败").data(false).build();
        }
    }

    @GetMapping("/search")
    public ResponseVO search(@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum,
                             @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize,
                             @RequestParam(value = "name", required = false) String name) {
        List<Privilege> privileges = privilegeService.getFilter(pageNum,pageSize,name);
        PageInfo pageInfo = new PageInfo(privileges,5);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
        return responseVO;
    }
}
