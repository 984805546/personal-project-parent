package com.fs.service.customer;/**
 * @author: fs
 * @create: 2019/12/02 11:01
 */

import com.fs.entity.customer.CustomerAddr;

import java.util.List;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/02 11:01
 */
public interface CustomerAddrService {
    int insert(CustomerAddr addr);

    int delete(Integer id);

    int update(CustomerAddr addr);

    int updateDefault(CustomerAddr addr);

    List<CustomerAddr> getPageHelper(Integer pageNum, Integer pageSize);

    List<CustomerAddr> getByCustomerId(Integer customerId);

    CustomerAddr getDefault(Integer customerId);
}
