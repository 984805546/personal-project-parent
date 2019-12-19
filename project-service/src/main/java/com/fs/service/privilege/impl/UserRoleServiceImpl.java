package com.fs.service.privilege.impl;/**
 * @author: fs
 * @create: 2019/12/19 11:47
 */

import com.fs.dao.privilege.UserRoleDao;
import com.fs.service.privilege.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @program personal-project-parent 
 * @description:
 * @author: fs
 * @create: 2019/12/19 11:47 
 */
@Service
public class UserRoleServiceImpl implements UserRoleService {
    @Autowired
    private UserRoleDao urDao;

    @Override
    public int deleteByUser(Integer userId) {
        return urDao.deleteByUser(userId);
    }

    @Override
    public int insert(Integer userId, Integer roleId) {
        return urDao.insert(userId, roleId);
    }
}
