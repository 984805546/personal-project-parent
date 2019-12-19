package com.fs.service.customer.impl;/**
 * @author: fs
 * @create: 2019/12/02 11:02
 */

import com.fs.dao.customer.CustomerAddrDao;
import com.fs.entity.customer.CustomerAddr;
import com.fs.service.customer.CustomerAddrService;
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
public class CustomerAddrServiceImpl implements CustomerAddrService {
    @Autowired
    private CustomerAddrDao addrDao;

    @Override
    public int insert(CustomerAddr addr) {
        return addrDao.insert(addr);
    }

    @Override
    public int delete(Integer id) {
        return addrDao.delete(id);
    }

    @Override
    public int update(CustomerAddr addr) {
        return addrDao.update(addr);
    }

    @Override
    public int updateDefault(CustomerAddr addr) {
        return addrDao.updateDefault(addr);
    }

    @Override
    public List<CustomerAddr> getPageHelper(Integer pageNum, Integer pageSize) {
        return addrDao.getPageHelper(pageNum, pageSize);
    }

    @Override
    public List<CustomerAddr> getByCustomerId(Integer customerId) {
        return addrDao.getByCustomerId(customerId);
    }

    @Override
    public CustomerAddr getDefault(Integer customerId) {
        return addrDao.getDefault(customerId);
    }
}
