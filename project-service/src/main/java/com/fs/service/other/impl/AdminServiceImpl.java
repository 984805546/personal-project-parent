package com.fs.service.other.impl;/**
 * @author: fs
 * @create: 2019/12/02 11:02
 */

import com.fs.dao.other.AdminDao;
import com.fs.entity.other.Admin;
import com.fs.service.other.AdminService;
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
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao adminDao;

    @Override
    public int insert(Admin admin) {
        return adminDao.insert(admin);
    }

    @Override
    public int delete(Integer id) {
        return adminDao.delete(id);
    }

    @Override
    public int update(Admin admin) {
        return adminDao.update(admin);
    }

    @Override
    public List<Admin> getAll(Integer pageNum, Integer pageSize) {
        return adminDao.getAll(pageNum, pageSize);
    }

    @Override
    public Admin getById(Integer id) {
        return adminDao.getById(id);
    }
}
