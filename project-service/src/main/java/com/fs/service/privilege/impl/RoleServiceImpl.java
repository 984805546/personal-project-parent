package com.fs.service.privilege.impl;/**
 * @author: fs
 * @create: 2019/12/19 11:47
 */

import com.fs.dao.privilege.RoleDao;
import com.fs.entity.privilege.Role;
import com.fs.service.privilege.RoleService;
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
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleDao roleDao;

    @Override
    public int insert(Role role) {
        return roleDao.insert(role);
    }

    @Override
    public int delete(Integer id) {
        return roleDao.delete(id);
    }

    @Override
    public int update(Role role) {
        return roleDao.update(role);
    }

    @Override
    public Role findRole(Integer roleId) {
        return roleDao.findRole(roleId);
    }

    @Override
    public List<Role> getAll() {
        return roleDao.getAll();
    }

    @Override
    public List<Role> getRoles(Integer userId) {
        return roleDao.getRoles(userId);
    }

    @Override
    public List<Role> getPageHelper(Integer pageNum, Integer pageSize) {
        return roleDao.getPageHelper(pageNum, pageSize);
    }

    @Override
    public List<Role> getFilter(Integer pageNum, Integer pageSize, String name) {
        return roleDao.getFilter(pageNum, pageSize,name);
    }
}
