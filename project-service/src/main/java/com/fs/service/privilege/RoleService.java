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

    int delete(Integer id);

    int update(Role role);

    Role findRole(Integer roleId);

    List<Role> getAll();

    List<Role> getRoles(Integer userId);

    List<Role> getPageHelper(Integer pageNum, Integer pageSize);

    List<Role> getFilter(Integer pageNum,Integer pageSize,String name);
}
