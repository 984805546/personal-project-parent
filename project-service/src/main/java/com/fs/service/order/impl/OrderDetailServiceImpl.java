package com.fs.service.order.impl;/**
 * @author: fs
 * @create: 2019/12/18 08:42
 */

import com.fs.dao.order.OrderDetailDao;
import com.fs.entity.order.OrderDetail;
import com.fs.service.order.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program personal-project-parent 
 * @description:
 * @author: fs
 * @create: 2019/12/18 08:42 
 */
@Service
public class OrderDetailServiceImpl implements OrderDetailService {
    @Autowired
    private OrderDetailDao detailDao;

    @Override
    public int insert(OrderDetail detail) {
        return detailDao.insert(detail);
    }

    @Override
    public int delete(Integer orderDetailId) {
        return detailDao.delete(orderDetailId);
    }

    @Override
    public int update(OrderDetail detail) {
        return detailDao.update(detail);
    }

    @Override
    public List<OrderDetail> getPageHelper(Integer pageNum, Integer pageSize) {
        return detailDao.getPageHelper(pageNum, pageSize);
    }

    @Override
    public OrderDetail getById(Integer orderDetailId) {
        return detailDao.getById(orderDetailId);
    }

    @Override
    public List<OrderDetail> getFilter(Integer pageNum, Integer pageSize, Integer orderId) {
        return detailDao.getFilter(pageNum, pageSize, orderId);
    }
}
