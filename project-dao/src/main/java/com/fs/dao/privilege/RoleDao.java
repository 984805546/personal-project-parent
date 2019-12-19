package com.fs.dao.privilege;

import com.fs.entity.privilege.Role;

import java.util.List;

/**
 * @author: fs
 * @create: 2019/12/19 10:57
 */
public interface RoleDao {

    int insert(Role role);

    Role findRole(Integer roleId);

    List<Role> getAll();

    List<Role> getRoles(Integer userId);
}
