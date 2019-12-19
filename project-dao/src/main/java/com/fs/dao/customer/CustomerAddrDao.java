package com.fs.dao.customer;/**
 * @author: fs
 * @create: 2019/12/02 09:58
 */

import com.fs.entity.customer.CustomerAddr;
import com.fs.entity.other.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @program personal-project-parent 
 * @description:
 * @author: fs
 * @create: 2019/12/02 09:58 
 */
public interface CustomerAddrDao {

    int insert(CustomerAddr addr);

    int delete(Integer customerAddrId);

    int update(CustomerAddr addr);

    int updateDefault(CustomerAddr addr);

    List<CustomerAddr> getPageHelper(@Param("pageNum") Integer pageNum, @Param("pageSize") Integer pageSize);

    List<CustomerAddr> getByCustomerId(Integer customerId);

    CustomerAddr getDefault(Integer customerId);
}
