package com.fs.entity.customer;/**
 * @author: fs
 * @create: 2019/12/03 09:41
 */

import lombok.Builder;
import lombok.Data;

/**
 * @program personal-project-parent 
 * @description:'用户登录表'
 * @author: fs
 * @create: 2019/12/03 09:41 
 */
@Data
public class CustomerLogin {
    //'用户ID'
    private Integer customerId;
    //'用户登录名'
    private String loginUsername;
    //'md5加密的密码'
    private String password;
    //'最后修改时间'
    private String modifiedTime;

    public CustomerLogin() {
    }

    public CustomerLogin(Integer customerId, String loginUsername, String password, String modifiedTime) {
        this.customerId = customerId;
        this.loginUsername = loginUsername;
        this.password = password;
        this.modifiedTime = modifiedTime;
    }
}
