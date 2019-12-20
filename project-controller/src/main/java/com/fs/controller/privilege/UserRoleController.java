package com.fs.controller.privilege;/**
 * @author: fs
 * @create: 2019/12/19 15:38
 */

import com.fs.entity.privilege.Privilege;
import com.fs.entity.privilege.Role;
import com.fs.entity.privilege.User;
import com.fs.service.privilege.RoleService;
import com.fs.service.privilege.UserRoleService;
import com.fs.service.privilege.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/19 15:38
 */
@RestController
@RequestMapping("/ur")
public class UserRoleController {
    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private UserRoleService urService;

    @RequestMapping("/update")
    protected Object update(Integer[] roleId,Integer userId) {

        User user = new User();
        user.setId(userId);

        List<Role> list = new ArrayList<Role>();
        for(Integer rId:roleId) {
            Role role = roleService.findRole(rId);
            list.add(role);
        }

        urService.update(user,list);
        return true;
    }
}
