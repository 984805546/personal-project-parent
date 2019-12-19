package com.fs.service.privilege;/**
 * @author: fs
 * @create: 2019/12/19 11:47
 */

import com.fs.entity.privilege.Privilege;
import com.fs.entity.privilege.Role;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/19 11:47
 */
public interface RolePrivilegeService {
    int deleteByRole(Integer roleId);

    int insert(Integer roleId, List<Privilege> privileges);

    void update(Role role, List<Privilege> privileges);
}
