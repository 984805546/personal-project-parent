package com.fs.service.order;/**
 * @author: fs
 * @create: 2019/12/02 11:01
 */


import com.fs.entity.order.OrderDetail;

import java.util.List;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/02 11:01
 */
public interface OrderDetailService {
    int insert(OrderDetail detail);

    int delete(Integer orderDetailId);

    int update(OrderDetail detail);

    List<OrderDetail> getPageHelper(Integer pageNum, Integer pageSize);

    OrderDetail getById(Integer orderDetailId);

    List<OrderDetail> getFilter(Integer pageNum, Integer pageSize,
                                Integer orderId);
}
