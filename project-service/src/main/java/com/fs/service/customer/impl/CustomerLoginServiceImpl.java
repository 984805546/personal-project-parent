package com.fs.service.customer.impl;/**
 * @author: fs
 * @create: 2019/12/02 11:02
 */

import com.fs.dao.customer.CustomerLoginDao;
import com.fs.entity.customer.CustomerLogin;
import com.fs.service.customer.CustomerLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/02 11:02
 */
@Service
public class CustomerLoginServiceImpl implements CustomerLoginService {
    @Autowired
    private CustomerLoginDao loginDao;

    @Override
    public int insert(CustomerLogin login) {
        return loginDao.insert(login);
    }

    @Override
    public int delete(Integer id) {
        return loginDao.delete(id);
    }

    @Override
    public int update(CustomerLogin login) {
        return loginDao.update(login);
    }

    @Override
    public List<CustomerLogin> getAll() {
        return loginDao.getAll();
    }

    @Override
    public List<CustomerLogin> getPageHelper(Integer pageNum, Integer pageSize) {
        return loginDao.getPageHelper(pageNum, pageSize);
    }

    @Override
    public List<CustomerLogin> getByName(Integer pageNum, Integer pageSize, String loginUsername) {
        return loginDao.getByName(pageNum, pageSize, loginUsername);
    }

    @Override
    public CustomerLogin getById(Integer id) {
        return loginDao.getById(id);
    }
}
