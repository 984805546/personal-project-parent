package com.fs.entity.other;/**
 * @author: fs
 * @create: 2019/12/03 09:39
 */

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program personal-project-parent 
 * @description:'管理人员信息表'
 * @author: fs
 * @create: 2019/12/03 09:39 
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Admin {
    //'主键ID'
    private Integer adminId;
    //'管理账号'
    private String adminUsername;
    //'管理密码'
    private String adminPassword;
}
