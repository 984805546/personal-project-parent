package com.fs.dao.other;/**
 * @author: fs
 * @create: 2019/12/02 09:58
 */

import com.fs.entity.other.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @program personal-project-parent 
 * @description:
 * @author: fs
 * @create: 2019/12/02 09:58 
 */
public interface AdminDao {

    int insert(Admin admin);

    int delete(Integer id);

    int update(Admin admin);

    List<Admin> getAll(@Param("pageNum") Integer pageNum, @Param("pageSize") Integer pageSize);

    Admin getById(Integer id);
}
