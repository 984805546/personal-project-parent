package com.fs.service.privilege.impl;/**
 * @author: fs
 * @create: 2019/12/19 11:47
 */

import com.fs.dao.privilege.UserDao;
import com.fs.entity.privilege.User;
import com.fs.service.privilege.UserService;
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
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public int insert(User user) {
        return userDao.insert(user);
    }

    @Override
    public int delete(Integer id) {
        return userDao.delete(id);
    }

    @Override
    public int update(User user) {
        return userDao.update(user);
    }

    @Override
    public User findUser(User user) {
        return userDao.findUser(user);
    }

    @Override
    public List<User> getAll() {
        return userDao.getAll();
    }
}
