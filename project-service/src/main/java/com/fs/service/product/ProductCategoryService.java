package com.fs.service.product;/**
 * @author: fs
 * @create: 2019/12/02 11:01
 */

import com.fs.entity.order.OrderCart;
import com.fs.entity.product.ProductCategory;

import java.util.List;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/02 11:01
 */
public interface ProductCategoryService {
    int insert(ProductCategory category);

    int delete(Integer id);

    int update(ProductCategory category);

    List<ProductCategory> getAll();

    List<ProductCategory> getPageHelper(Integer pageNum, Integer pageSize);

    List<ProductCategory> getByName(Integer pageNum, Integer pageSize,String categoryName);
}
