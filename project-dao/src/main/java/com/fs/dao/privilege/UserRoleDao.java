package com.fs.dao.privilege;

import com.fs.entity.privilege.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author: fs
 * @create: 2019/12/19 10:57
 */
public interface UserRoleDao {

    int deleteByUser(Integer userId);

    int insert(@Param("userId") Integer userId, @Param("roles") List<Role> roles);
}
