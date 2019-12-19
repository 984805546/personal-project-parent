package com.fs.dao.product;/**
 * @author: fs
 * @create: 2019/12/02 09:58
 */

import com.fs.entity.product.ProductCategory;
import com.fs.entity.product.ProductComment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @program personal-project-parent 
 * @description:
 * @author: fs
 * @create: 2019/12/02 09:58 
 */
public interface ProductCommentDao {

    int insert(ProductComment comment);

    int delete(Integer commentId);

    int update(ProductComment comment);

    List<ProductComment> getPageHelper(@Param("pageNum") Integer pageNum, @Param("pageSize") Integer pageSize);

    List<ProductComment> getFilter(@Param("pageNum") Integer pageNum, @Param("pageSize") Integer pageSize,
                                   @Param("productName") String productName,@Param("orderSn") String orderSn,
                                   @Param("loginUsername") String loginUsername);
}
