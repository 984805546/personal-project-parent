package com.fs.dao.privilege;

import com.fs.entity.privilege.Privilege;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author: fs
 * @create: 2019/12/19 10:57
 */
public interface PrivilegeDao {

    int insert(Privilege privilege);

    int delete(Integer id);

    int update(Privilege privilege);

    Privilege findPrivilege(String id);

    List<Privilege> getAll();

    List<Privilege> getPageHelper(@Param("pageNum")Integer pageNum, @Param("pageSize")Integer pageSize);

    List<Privilege> getFilter(@Param("pageNum")Integer pageNum,@Param("pageSize")Integer pageSize,@Param("name")String name);

    List<Privilege> getPrivileges(Integer roleId);

}
