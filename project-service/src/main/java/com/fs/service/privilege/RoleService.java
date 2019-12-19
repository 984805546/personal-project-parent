package com.fs.service.privilege;/**
 * @author: fs
 * @create: 2019/12/19 11:47
 */

import com.fs.entity.privilege.Role;

import java.util.List;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/19 11:47
 */
public interface RoleService {

    int insert(Role role);

    Role findRole(Integer roleId);

    List<Role> getAll();

    List<Role> getRoles(Integer userId);
}
