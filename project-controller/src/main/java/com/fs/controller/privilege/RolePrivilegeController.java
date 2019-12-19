package com.fs.controller.privilege;/**
 * @author: fs
 * @create: 2019/12/19 15:38
 */

import com.fs.entity.privilege.Privilege;
import com.fs.entity.privilege.Role;
import com.fs.service.privilege.PrivilegeService;
import com.fs.service.privilege.RolePrivilegeService;
import com.fs.service.privilege.RoleService;
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
@RequestMapping("/rp")
public class RolePrivilegeController {
    @Autowired
    private RolePrivilegeService rpService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private PrivilegeService privilegeService;

    @RequestMapping("/update")
    protected Object service(String[] privilegeId,Integer roleId) {

        Role role = roleService.findRole(roleId);

        List<Privilege> list = new ArrayList<Privilege>();
        for(String pid:privilegeId) {
            Privilege privilege = privilegeService.findPrivilege(pid);
            list.add(privilege);
        }

        rpService.update(role,list);
        return true;
    }

    @RequestMapping("/query")
    protected List<Privilege> service(Integer id) throws ServletException, IOException {

        List<Role> roles = roleService.getRoles(id);
        Set<Privilege> privileges = new HashSet<>();
        for (Role role : roles) {
            for (Privilege privilege : privilegeService.getPrivileges(role.getId())) {
                privileges.add(privilege);
            }
        }

        return new ArrayList<Privilege>(privileges);
    }
}
