package com.fs.service.product;/**
 * @author: fs
 * @create: 2019/12/02 11:01
 */

import com.fs.entity.order.OrderCart;
import com.fs.entity.product.WarehouseProduct;

import java.util.List;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/02 11:01
 */
public interface WarehouseProductService {
    int insert(WarehouseProduct warehouse);

    int delete(Integer wpId, Integer productId);

    int update(WarehouseProduct warehouse);

    List<WarehouseProduct> getPageHelper(Integer pageNum, Integer pageSize);

    List<WarehouseProduct> getFilter(Integer pageNum, Integer pageSize, String productName, String productCore);

    WarehouseProduct getById(Integer wpId, Integer productId);
}
