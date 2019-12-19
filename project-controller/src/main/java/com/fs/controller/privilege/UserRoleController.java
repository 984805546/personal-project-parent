package com.fs.controller.privilege;/**
 * @author: fs
 * @create: 2019/12/19 15:38
 */

import com.fs.service.privilege.RoleService;
import com.fs.service.privilege.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
