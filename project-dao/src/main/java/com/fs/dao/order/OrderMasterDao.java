package com.fs.dao.order;/**
 * @author: fs
 * @create: 2019/12/02 09:58
 */

import com.fs.entity.order.OrderCart;
import com.fs.entity.order.OrderMaster;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @program personal-project-parent 
 * @description:
 * @author: fs
 * @create: 2019/12/02 09:58 
 */
public interface OrderMasterDao {

    int insert(OrderMaster master);

    int delete(Integer orderId);

    int update(OrderMaster master);

    List<OrderMaster> getPageHelper(@Param("pageNum") Integer pageNum, @Param("pageSize") Integer pageSize);

    OrderMaster getById(Integer orderId);

    List<OrderMaster> getFilter(@Param("pageNum") Integer pageNum, @Param("pageSize") Integer pageSize,
                                @Param("orderStatus")Integer orderStatus, @Param("loginUsername")String loginUsername,
                                @Param("orderSn")String orderSn);
}
