package com.fs.service.privilege;/**
 * @author: fs
 * @create: 2019/12/19 11:47
 */

import com.fs.entity.privilege.Privilege;

import java.util.List;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/19 11:47
 */
public interface PrivilegeService {
    int insert(Privilege privilege);

    int delete(Integer id);

    int update(Privilege privilege);

    Privilege findPrivilege(String id);

    List<Privilege> getAll();

    List<Privilege> getPrivileges(Integer roleId);

    List<Privilege> getPageHelper(Integer pageNum, Integer pageSize);

    List<Privilege> getFilter(Integer pageNum,Integer pageSize,String name);
}
