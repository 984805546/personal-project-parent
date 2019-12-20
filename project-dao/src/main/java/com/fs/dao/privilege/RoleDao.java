package com.fs.dao.privilege;

import com.fs.entity.privilege.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author: fs
 * @create: 2019/12/19 10:57
 */
public interface RoleDao {

    int insert(Role role);

    int delete(Integer id);

    int update(Role role);

    Role findRole(Integer roleId);

    List<Role> getAll();

    List<Role> getPageHelper(@Param("pageNum")Integer pageNum, @Param("pageSize")Integer pageSize);

    List<Role> getFilter(@Param("pageNum")Integer pageNum,@Param("pageSize")Integer pageSize,@Param("name")String name);

    List<Role> getRoles(Integer userId);
}
