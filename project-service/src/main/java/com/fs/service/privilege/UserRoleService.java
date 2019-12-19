package com.fs.service.privilege;/**
 * @author: fs
 * @create: 2019/12/19 11:47
 */

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/19 11:47
 */
public interface UserRoleService {
    int deleteByUser(Integer userId);

    int insert(Integer userId, Integer roleId);
}
