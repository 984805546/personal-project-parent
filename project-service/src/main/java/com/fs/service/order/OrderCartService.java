package com.fs.service.order;/**
 * @author: fs
 * @create: 2019/12/02 11:01
 */

import com.fs.entity.customer.CustomerInf;
import com.fs.entity.order.OrderCart;

import java.util.List;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/02 11:01
 */
public interface OrderCartService {


    int insert(OrderCart cart);

    int delete(Integer cartId);

    int update(OrderCart cart);

    OrderCart getById(Integer cartId);

    OrderCart getByProductId(Integer customerId,Integer productId);

    List<OrderCart> getByCustomer(Integer customerId);
}
