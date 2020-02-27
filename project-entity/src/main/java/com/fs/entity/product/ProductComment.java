package com.fs.entity.product;/**
 * @author: fs
 * @create: 2019/12/03 09:23
 */

import com.fs.entity.customer.CustomerLogin;
import com.fs.entity.order.OrderMaster;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program personal-project-parent
 * @description:'商品评论表'
 * @author: fs
 * @create: 2019/12/03 09:23
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductComment {
    //'评论ID'
    private Integer commentId;
    //'商品ID'
    private Integer productId;
    //'订单ID'
    private Integer orderId;
    //'用户ID'
    private Integer customerId;
    //'评论内容'
    private String content;
    //'评论时间'
    private String auditTime;
    //'最后修改时间'
    private String modifiedTime;

    private ProductInfo product;

    private CustomerLogin customer;

    private OrderMaster order;

    public ProductComment(Integer commentId, Integer productId, Integer orderId, Integer customerId, String content, String auditTime, String modifiedTime) {
        this.commentId = commentId;
        this.productId = productId;
        this.orderId = orderId;
        this.customerId = customerId;
        this.content = content;
        this.auditTime = auditTime;
        this.modifiedTime = modifiedTime;
    }
}
