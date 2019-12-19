package com.fs.service.order;/**
 * @author: fs
 * @create: 2019/12/02 11:01
 */

import com.fs.entity.order.OrderMaster;

import java.util.List;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/02 11:01
 */
public interface OrderMasterService {
    int insert(OrderMaster master);

    int delete(Integer orderId);

    int update(OrderMaster master);

    List<OrderMaster> getPageHelper(Integer pageNum, Integer pageSize);

    OrderMaster getById(Integer orderId);

    List<OrderMaster> getFilter(Integer pageNum, Integer pageSize,
                                Integer orderStatus, String loginUsername,
                                String orderSn);
}
