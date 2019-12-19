package com.fs.dao.customer;/**
 * @author: fs
 * @create: 2019/12/02 09:58
 */

import com.fs.entity.customer.CustomerAddr;
import com.fs.entity.customer.CustomerLogin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @program personal-project-parent 
 * @description:
 * @author: fs
 * @create: 2019/12/02 09:58 
 */
public interface CustomerLoginDao {

    int insert(CustomerLogin login);

    int delete(Integer customerId);

    int update(CustomerLogin login);

    List<CustomerLogin> getAll();

    List<CustomerLogin> getPageHelper(@Param("pageNum") Integer pageNum, @Param("pageSize") Integer pageSize);

    List<CustomerLogin> getByName(@Param("pageNum")Integer pageNum,@Param("pageSize")Integer pageSize,@Param("loginUsername")String loginUsername);

    CustomerLogin getById(Integer customerId);
}
