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
    public int insert(Privilege privilege) {
        return privilegeDao.insert(privilege);
    }

    @Override
    public int delete(Integer id) {
        return privilegeDao.delete(id);
    }

    @Override
    public int update(Privilege privilege) {
        return privilegeDao.update(privilege);
    }

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

    @Override
    public List<Privilege> getPageHelper(Integer pageNum, Integer pageSize) {
        return privilegeDao.getPageHelper(pageNum, pageSize);
    }

    @Override
    public List<Privilege> getFilter(Integer pageNum, Integer pageSize, String name) {
        return privilegeDao.getFilter(pageNum, pageSize,name);
    }
}
