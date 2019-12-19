package com.fs.dao.privilege;

import com.fs.entity.privilege.Privilege;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author: fs
 * @create: 2019/12/19 10:57
 */
public interface RolePrivilegeDao {

    int deleteByRole(Integer roleId);

    int insert(@Param("roleId") Integer roleId, @Param("privileges") List<Privilege> privileges);
}
