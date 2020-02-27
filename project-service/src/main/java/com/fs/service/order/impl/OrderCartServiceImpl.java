package com.fs.service.order.impl;/**
 * @author: fs
 * @create: 2019/12/02 11:02
 */

import com.fs.dao.order.OrderCartDao;
import com.fs.entity.order.OrderCart;
import com.fs.service.order.OrderCartService;
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
public class OrderCartServiceImpl implements OrderCartService {
    @Autowired
    private OrderCartDao cartDao;


    @Override
    public int insert(OrderCart cart) {
        return cartDao.insert(cart);
    }

    @Override
    public int delete(Integer id) {
        return cartDao.delete(id);
    }

    @Override
    public int update(OrderCart cart) {
        return cartDao.update(cart);
    }

    @Override
    public OrderCart getById(Integer id) {
        return cartDao.getById(id);
    }

    @Override
    public OrderCart getByProductId(Integer customerId, Integer productId) {
        return cartDao.getByProductId(customerId, productId);
    }

    @Override
    public List<OrderCart> getByCustomer(Integer customerId) {
        return cartDao.getByCustomer(customerId);
    }
}
