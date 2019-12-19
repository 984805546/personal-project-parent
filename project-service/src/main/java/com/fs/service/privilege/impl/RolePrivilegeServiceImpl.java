package com.fs.service.privilege.impl;/**
 * @author: fs
 * @create: 2019/12/19 11:47
 */

import com.fs.dao.privilege.RolePrivilegeDao;
import com.fs.entity.privilege.Privilege;
import com.fs.entity.privilege.Role;
import com.fs.service.privilege.RolePrivilegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @program personal-project-parent 
 * @description:
 * @author: fs
 * @create: 2019/12/19 11:47 
 */
@Service
public class RolePrivilegeServiceImpl implements RolePrivilegeService {
    @Autowired
    private RolePrivilegeDao rpDao;

    @Override
    public int deleteByRole(Integer roleId) {
        return rpDao.deleteByRole(roleId);
    }

    @Override
    public int insert(Integer roleId, List<Privilege> privileges) {
        return rpDao.insert(roleId, privileges);
    }

    @Override
    @Transactional
    public void update(Role role, List<Privilege> privileges){
        rpDao.deleteByRole(role.getId());
        rpDao.insert(role.getId(), privileges);
    }
}
