package com.fs.dao.product;/**
 * @author: fs
 * @create: 2019/12/02 09:58
 */

import com.fs.entity.product.WarehouseProduct;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @program personal-project-parent 
 * @description:
 * @author: fs
 * @create: 2019/12/02 09:58 
 */
public interface WarehouseProductDao {

    int insert(WarehouseProduct product);

    int delete(Integer wpId,Integer productId);

    int update(WarehouseProduct product);

    List<WarehouseProduct> getPageHelper(@Param("pageNum") Integer pageNum, @Param("pageSize") Integer pageSize);

    WarehouseProduct getById(Integer wpId,Integer productId);

    List<WarehouseProduct> getFilter(@Param("pageNum") Integer pageNum, @Param("pageSize") Integer pageSize,
                                @Param("productName")String productName, @Param("productCore")String productCore);
}
