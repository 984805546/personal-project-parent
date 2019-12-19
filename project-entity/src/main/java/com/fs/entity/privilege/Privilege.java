package com.fs.entity.privilege;/**
 * @author: fs
 * @create: 2019/12/19 10:51
 */

import lombok.Data;

/**
 * @program personal-project-parent 
 * @description:
 * @author: fs
 * @create: 2019/12/19 10:51 
 */
@Data
public class Privilege {
    private String id;
    private String name;
    private String uri;
    private Boolean parent;
    private Integer pid;
}
