package com.fs.controller.privilege;/**
 * @author: fs
 * @create: 2019/12/19 15:38
 */

import com.fs.entity.privilege.Role;
import com.fs.service.privilege.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

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

    @RequestMapping("/list")
    protected List<Role> service() {
        List<Role> role = roleService.getAll();
        return role;
    }
}
