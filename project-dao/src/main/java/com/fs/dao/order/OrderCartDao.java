package com.fs.dao.order;/**
 * @author: fs
 * @create: 2019/12/02 09:58
 */

import com.fs.entity.customer.CustomerLogin;
import com.fs.entity.order.OrderCart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @program personal-project-parent 
 * @description:
 * @author: fs
 * @create: 2019/12/02 09:58 
 */
public interface OrderCartDao {

    int insert(OrderCart cart);

    int delete(Integer id);

    int update(OrderCart cart);

    List<OrderCart> getAll(@Param("pageNum") Integer pageNum, @Param("pageSize") Integer pageSize);

    OrderCart getById(Integer id);
}
