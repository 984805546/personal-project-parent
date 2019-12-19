package com.fs.service.privilege.impl;/**
 * @author: fs
 * @create: 2019/12/19 11:47
 */

import com.fs.dao.privilege.PrivilegeDao;
import com.fs.entity.privilege.Privilege;
import com.fs.service.privilege.PrivilegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program personal-project-parent 
 * @description:
 * @author: fs
 * @create: 2019/12/19 11:47 
 */
@Service
public class PrivilegeServiceImpl implements PrivilegeService {
    @Autowired
    private PrivilegeDao privilegeDao;

    @Override
    public Privilege findPrivilege(String id) {
        return privilegeDao.findPrivilege(id);
    }

    @Override
    public List<Privilege> getAll() {
        return privilegeDao.getAll();
    }

    @Override
    public List<Privilege> getPrivileges(Integer roleId) {
        return privilegeDao.getPrivileges(roleId);
    }
}
