package com.fs.service.customer.impl;/**
 * @author: fs
 * @create: 2019/12/02 11:02
 */

import com.fs.dao.customer.CustomerInfDao;
import com.fs.entity.customer.CustomerInf;
import com.fs.service.customer.CustomerInfService;
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
public class CustomerInfServiceImpl implements CustomerInfService {
    @Autowired
    private CustomerInfDao infDao;

    @Override
    public int insert(CustomerInf inf) {
        return infDao.insert(inf);
    }

    @Override
    public int delete(Integer id) {
        return infDao.delete(id);
    }

    @Override
    public int update(CustomerInf inf) {
        return infDao.update(inf);
    }

    @Override
    public List<CustomerInf> getPageHelper(Integer pageNum, Integer pageSize) {
        return infDao.getPageHelper(pageNum, pageSize);
    }

    @Override
    public CustomerInf getByCustomerId(Integer customerId) {
        return infDao.getByCustomerId(customerId);
    }

    @Override
    public CustomerInf getById(Integer id) {
        return infDao.getById(id);
    }
}
