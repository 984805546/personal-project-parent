package com.fs.entity.customer;/**
 * @author: fs
 * @create: 2019/12/03 09:43
 */

import lombok.Builder;
import lombok.Data;

/**
 * @program personal-project-parent
 * @description:'用户信息表'
 * @author: fs
 * @create: 2019/12/03 09:43
 */
@Data
public class CustomerInf {
    //'自增主键ID'
    private Integer customerInfId;
    //'customer_login表的自增ID'
    private Integer customerId;
    //'用户真实姓名'
    private String customerName;
    //'证件类型:1 身份证，2 军官证，3 护照'
    private Integer identityCardType;
    //'证件号码'
    private String identityCardNo;
    //'手机号'
    private String mobilePhone;
    //'邮箱'
    private String customerEmail;
    //'性别'
    private String gender;
    //'注册时间'
    private String registerTime;
    //'最后修改时间'
    private String modifiedTime;

    public CustomerInf() {
    }

    public CustomerInf(Integer customerInfId, Integer customerId, String customerName, Integer identityCardType, String identityCardNo, String mobilePhone, String customerEmail, String gender, String registerTime, String modifiedTime) {
        this.customerInfId = customerInfId;
        this.customerId = customerId;
        this.customerName = customerName;
        this.identityCardType = identityCardType;
        this.identityCardNo = identityCardNo;
        this.mobilePhone = mobilePhone;
        this.customerEmail = customerEmail;
        this.gender = gender;
        this.registerTime = registerTime;
        this.modifiedTime = modifiedTime;
    }
}
