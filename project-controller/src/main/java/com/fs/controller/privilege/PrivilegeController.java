package com.fs.controller.privilege;/**
 * @author: fs
 * @create: 2019/12/19 15:38
 */

import com.fs.entity.privilege.Privilege;
import com.fs.service.privilege.PrivilegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
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

    @RequestMapping("/list")
    protected List<Map<String,Object>> list(Integer roleId)  {

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
}
