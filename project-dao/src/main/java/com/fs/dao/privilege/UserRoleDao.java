package com.fs.dao.privilege;

import org.apache.ibatis.annotations.Param;

/**
 * @author: fs
 * @create: 2019/12/19 10:57
 */
public interface UserRoleDao {

    int deleteByUser(Integer userId);

    int insert(@Param("userId") Integer userId, @Param("roleId") Integer roleId);
}
