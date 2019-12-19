package com.fs.service.order.impl;/**
 * @author: fs
 * @create: 2019/12/02 11:02
 */

import com.fs.dao.order.OrderMasterDao;
import com.fs.entity.order.OrderMaster;
import com.fs.service.order.OrderMasterService;
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
public class OrderMasterServiceImpl implements OrderMasterService {
    @Autowired
    private OrderMasterDao masterDao;

    @Override
    public int insert(OrderMaster master) {
        return masterDao.insert(master);
    }

    @Override
    public int delete(Integer id) {
        return masterDao.delete(id);
    }

    @Override
    public int update(OrderMaster master) {
        return masterDao.update(master);
    }

    @Override
    public List<OrderMaster> getPageHelper(Integer pageNum, Integer pageSize) {
        return masterDao.getPageHelper(pageNum, pageSize);
    }

    @Override
    public OrderMaster getById(Integer orderId) {
        return masterDao.getById(orderId);
    }

    @Override
    public List<OrderMaster> getFilter(Integer pageNum, Integer pageSize, Integer orderStatus, String loginUsername, String orderSn) {
        return masterDao.getFilter(pageNum, pageSize, orderStatus, loginUsername, orderSn);
    }
}
