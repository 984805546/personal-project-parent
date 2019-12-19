package com.fs.dao.product;/**
 * @author: fs
 * @create: 2019/12/02 09:58
 */

import com.fs.entity.other.Admin;
import com.fs.entity.product.ProductCategory;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @program personal-project-parent 
 * @description:
 * @author: fs
 * @create: 2019/12/02 09:58 
 */
public interface ProductCategoryDao {

    int insert(ProductCategory category);

    int delete(Integer id);

    int update(ProductCategory category);

    List<ProductCategory> getAll();

    List<ProductCategory> getPageHelper(@Param("pageNum") Integer pageNum, @Param("pageSize") Integer pageSize);

    List<ProductCategory> getByName(@Param("pageNum")Integer pageNum,@Param("pageSize")Integer pageSize,@Param("categoryName")String categoryName);
}
