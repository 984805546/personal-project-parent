package com.fs.service.product;/**
 * @author: fs
 * @create: 2019/12/02 11:01
 */

import com.fs.entity.order.OrderCart;
import com.fs.entity.product.ProductInfo;

import java.util.List;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/02 11:01
 */
public interface ProductInfoService {
    int insert(ProductInfo info);

    int delete(Integer productId);

    int update(ProductInfo info);

    List<ProductInfo> getAll();

    List<ProductInfo> getPageHelper(Integer pageNum, Integer pageSize);

    List<ProductInfo> getFilter(Integer pageNum, Integer pageSize, Integer productId, String productCore, String productName, Integer categoryId, Integer brandId);
}
