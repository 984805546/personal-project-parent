package com.fs.dao.order;/**
 * @author: fs
 * @create: 2019/12/02 09:58
 */

import com.fs.entity.order.OrderDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @program personal-project-parent 
 * @description:
 * @author: fs
 * @create: 2019/12/02 09:58 
 */
public interface OrderDetailDao {

    int insert(OrderDetail detail);

    int delete(Integer orderDetailId);

    int update(OrderDetail detail);

    List<OrderDetail> getPageHelper(@Param("pageNum") Integer pageNum, @Param("pageSize") Integer pageSize);

    OrderDetail getById(Integer orderDetailId);

    List<OrderDetail> getFilter(@Param("pageNum") Integer pageNum, @Param("pageSize") Integer pageSize,
                                @Param("orderId") Integer orderId);
}
