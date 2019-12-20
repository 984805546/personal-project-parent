package com.fs.service.privilege;/**
 * @author: fs
 * @create: 2019/12/19 11:47
 */

import com.fs.entity.privilege.Role;
import com.fs.entity.privilege.User;

import java.util.List;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/19 11:47
 */
public interface UserRoleService {
    int deleteByUser(Integer userId);

    int insert(Integer userId, List<Role> roles);

    void update(User user, List<Role> roles);
}
