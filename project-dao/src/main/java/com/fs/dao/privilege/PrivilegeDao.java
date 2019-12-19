package com.fs.dao.privilege;

import com.fs.entity.privilege.Privilege;

import java.util.List;

/**
 * @author: fs
 * @create: 2019/12/19 10:57
 */
public interface PrivilegeDao {

    Privilege findPrivilege(String id);

    List<Privilege> getAll();

    List<Privilege> getPrivileges(Integer roleId);

}
