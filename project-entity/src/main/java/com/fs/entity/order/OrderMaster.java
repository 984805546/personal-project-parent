package com.fs.entity.order;/**
 * @author: fs
 * @create: 2019/12/03 09:25
 */

import com.fs.entity.customer.CustomerAddr;
import com.fs.entity.customer.CustomerLogin;
import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;

/**
 * @program personal-project-parent 
 * @description:'订单主表'
 * @author: fs
 * @create: 2019/12/03 09:25 
 */
@Data
public class OrderMaster {
    //'订单ID'
    private Integer orderId;
    //'订单编号 yyyymmddnnnnnnnn'
    private String orderSn;
    //'下单人ID'
    private Integer customerId;
    //'用户地址ID'
    private Integer customerAddrId;
    //'订单金额'
    private BigDecimal orderMoney;
    //'优惠金额'
    private BigDecimal districtMoney;
    //'运费金额'
    private BigDecimal shippingMoney;
    //'支付金额'
    private BigDecimal paymentMoney;
    //'快递单号'
    private String shippingSn;
    //'下单时间'
    private String createTime;
    //'发货时间'
    private String shippingTime;
    //'支付时间'
    private String payTime;
    //'收货时间'
    private String receiveTime;
    //'订单状态'
    private Integer orderStatus;
    //'最后修改时间'
    private String modifiedTime;

    private CustomerLogin customer;

    private CustomerAddr addr;

    public OrderMaster() {
    }

    public OrderMaster(Integer orderId, String orderSn, Integer customerId, Integer customerAddrId, BigDecimal orderMoney, BigDecimal districtMoney, BigDecimal shippingMoney, BigDecimal paymentMoney, String shippingSn, String createTime, String shippingTime, String payTime, String receiveTime, Integer orderStatus, String modifiedTime) {
        this.orderId = orderId;
        this.orderSn = orderSn;
        this.customerId = customerId;
        this.customerAddrId = customerAddrId;
        this.orderMoney = orderMoney;
        this.districtMoney = districtMoney;
        this.shippingMoney = shippingMoney;
        this.paymentMoney = paymentMoney;
        this.shippingSn = shippingSn;
        this.createTime = createTime;
        this.shippingTime = shippingTime;
        this.payTime = payTime;
        this.receiveTime = receiveTime;
        this.orderStatus = orderStatus;
        this.modifiedTime = modifiedTime;
    }
}
