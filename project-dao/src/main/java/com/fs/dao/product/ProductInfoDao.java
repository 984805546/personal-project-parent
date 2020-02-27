package com.fs.dao.product;/**
 * @author: fs
 * @create: 2019/12/02 09:58
 */

import com.fs.entity.product.ProductComment;
import com.fs.entity.product.ProductInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @program personal-project-parent 
 * @description:
 * @author: fs
 * @create: 2019/12/02 09:58 
 */
public interface ProductInfoDao {

    int insert(ProductInfo info);

    int delete(Integer productId);

    int update(ProductInfo info);

    List<ProductInfo> getAll();

    List<ProductInfo> getPageHelper(@Param("pageNum") Integer pageNum, @Param("pageSize") Integer pageSize);

    List<ProductInfo> getFilter(@Param("pageNum") Integer pageNum, @Param("pageSize") Integer pageSize,
                                @Param("productId")Integer productId, @Param("productCore") String productCore,
                                @Param("productName")String productName, @Param("categoryId")Integer categoryId,
                                @Param("brandId")Integer brandId);
}
