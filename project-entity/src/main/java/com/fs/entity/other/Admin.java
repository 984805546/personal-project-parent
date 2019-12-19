package com.fs.entity.other;/**
 * @author: fs
 * @create: 2019/12/03 09:39
 */

import lombok.Builder;
import lombok.Data;

/**
 * @program personal-project-parent 
 * @description:'管理人员信息表'
 * @author: fs
 * @create: 2019/12/03 09:39 
 */
@Data
public class Admin {
    //'主键ID'
    private Integer adminId;
    //'管理账号'
    private String adminUsername;
    //'管理密码'
    private String adminPassword;

    public Admin() {
    }

    public Admin(Integer adminId, String adminUsername, String adminPassword) {
        this.adminId = adminId;
        this.adminUsername = adminUsername;
        this.adminPassword = adminPassword;
    }
}
