package com.fs.entity.order;/**
 * @author: fs
 * @create: 2019/12/03 09:31
 */

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;

/**
 * @program personal-project-parent
 * @description:'购物⻋表'
 * @author: fs
 * @create: 2019/12/03 09:31
 */
@Data
public class OrderCart {
    //'购物⻋ID'
    private Integer cartId;
    //'用户ID'
    private Integer customerId;
    //'商品ID'
    private Integer productId;
    //'加入购物⻋商品数量'
    private Integer productAmount;
    //'商品价格'
    private BigDecimal price;
    //'加入购物⻋时间'
    private String addTime;
    //'最后修改时间'
    private String modifiedTime;

    public OrderCart() {
    }

    public OrderCart(Integer cartId, Integer customerId, Integer productId, Integer productAmount, BigDecimal price, String addTime, String modifiedTime) {
        this.cartId = cartId;
        this.customerId = customerId;
        this.productId = productId;
        this.productAmount = productAmount;
        this.price = price;
        this.addTime = addTime;
        this.modifiedTime = modifiedTime;
    }
}
