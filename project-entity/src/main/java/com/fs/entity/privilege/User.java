package com.fs.entity.privilege;/**
 * @author: fs
 * @create: 2019/12/19 10:50
 */

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/19 10:50
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private Integer id;
    private String username;
    private String password;
    private String name;
}
