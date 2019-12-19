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
    Privilege findPrivilege(String id);

    List<Privilege> getAll();

    List<Privilege> getPrivileges(Integer roleId);
}
