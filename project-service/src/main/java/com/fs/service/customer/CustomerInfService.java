package com.fs.service.customer;/**
 * @author: fs
 * @create: 2019/12/02 11:01
 */

import com.fs.entity.customer.CustomerInf;

import java.util.List;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/02 11:01
 */
public interface CustomerInfService {
    int insert(CustomerInf inf);

    int delete(Integer id);

    int update(CustomerInf inf);

    List<CustomerInf> getPageHelper(Integer pageNum, Integer pageSize);

    CustomerInf getByCustomerId(Integer customerId);

    CustomerInf getById(Integer id);
}
