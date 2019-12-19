package com.fs.service.product;/**
 * @author: fs
 * @create: 2019/12/02 11:01
 */

import com.fs.entity.order.OrderCart;
import com.fs.entity.product.ProductComment;

import java.util.List;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/02 11:01
 */
public interface ProductCommentService {
    int insert(ProductComment comment);

    int delete(Integer commentId);

    int update(ProductComment comment);

    List<ProductComment> getPageHelper(Integer pageNum, Integer pageSize);

    List<ProductComment> getFilter(Integer pageNum, Integer pageSize, String productName,
                                   String orderSn,String loginUsername);
}