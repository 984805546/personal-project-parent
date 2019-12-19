package com.fs.entity.customer;/**
 * @author: fs
 * @create: 2019/12/03 09:45
 */

import lombok.Builder;
import lombok.Data;

/**
 * @program personal-project-parent
 * @description:'用户地址表'
 * @author: fs
 * @create: 2019/12/03 09:45
 */
@Data
public class CustomerAddr {
    //'自增主键ID'
    private Integer customerAddrId;
    //'customer_login表的自增ID'
    private Integer customerId;
    //'收货人姓名'
    private String consignee;
    //'收货人手机号'
    private String consigneePhone;
    //'地区表中的省份'
    private String province;
    //'地区表中的城市'
    private String city;
    //'地区表中的区'
    private String district;
    //'具体的地址⻔牌号'
    private String address;
    //'是否默认'
    private Integer isDefault;
    //'最后修改时间'
    private String modifiedTime;

    public CustomerAddr() {
    }

    public CustomerAddr(Integer customerAddrId, Integer customerId, String consignee, String consigneePhone, String province, String city, String district, String address, Integer isDefault, String modifiedTime) {
        this.customerAddrId = customerAddrId;
        this.customerId = customerId;
        this.consignee = consignee;
        this.consigneePhone = consigneePhone;
        this.province = province;
        this.city = city;
        this.district = district;
        this.address = address;
        this.isDefault = isDefault;
        this.modifiedTime = modifiedTime;
    }
}
