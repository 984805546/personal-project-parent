package com.fs.entity.order;/**
 * @author: fs
 * @create: 2019/12/17 20:17
 */

import lombok.Data;

import java.math.BigDecimal;

/**
 * @program personal-project-parent 
 * @description:
 * @author: fs
 * @create: 2019/12/17 20:17 
 */
//'订单详情表'
@Data
public class OrderDetail {
    //订单详情表ID
    private Integer orderDetailId;
    //订单表ID
    private Integer orderId;
    //订单商品ID
    private Integer productId;
    //商品名称
    private String productName;
    //购买商品数量
    private Integer productCnt;
    //购买商品单价
    private BigDecimal productPrice;
    //仓库ID
    private Integer wId;
    //最后修改时间
    private String modifiedTime;

    public OrderDetail() {
    }

    public OrderDetail(Integer orderDetailId, Integer orderId, Integer productId, String productName, Integer productCnt, BigDecimal productPrice, Integer wId, String modifiedTime) {
        this.orderDetailId = orderDetailId;
        this.orderId = orderId;
        this.productId = productId;
        this.productName = productName;
        this.productCnt = productCnt;
        this.productPrice = productPrice;
        this.wId = wId;
        this.modifiedTime = modifiedTime;
    }
}
