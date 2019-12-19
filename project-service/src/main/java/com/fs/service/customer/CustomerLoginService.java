package com.fs.service.customer;/**
 * @author: fs
 * @create: 2019/12/02 11:01
 */

import com.fs.entity.customer.CustomerAddr;
import com.fs.entity.customer.CustomerLogin;

import java.util.List;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/02 11:01
 */
public interface CustomerLoginService {
    int insert(CustomerLogin login);

    int delete(Integer id);

    int update(CustomerLogin login);

    List<CustomerLogin> getAll();

    List<CustomerLogin> getPageHelper(Integer pageNum, Integer pageSize);

    List<CustomerLogin> getByName(Integer pageNum,Integer pageSize,String loginUsername);

    CustomerLogin getById(Integer id);
}
