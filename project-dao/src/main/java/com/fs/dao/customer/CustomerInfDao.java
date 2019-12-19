package com.fs.dao.customer;/**
 * @author: fs
 * @create: 2019/12/02 09:58
 */

import com.fs.entity.customer.CustomerAddr;
import com.fs.entity.customer.CustomerInf;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @program personal-project-parent 
 * @description:
 * @author: fs
 * @create: 2019/12/02 09:58 
 */
public interface CustomerInfDao {

    int insert(CustomerInf inf);

    int delete(Integer customerInfId);

    int update(CustomerInf inf);

    List<CustomerInf> getPageHelper(@Param("pageNum") Integer pageNum, @Param("pageSize") Integer pageSize);

    CustomerInf getByCustomerId(Integer customerId);

    CustomerInf getById(Integer customerInfId);
}
