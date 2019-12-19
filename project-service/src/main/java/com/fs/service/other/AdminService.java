package com.fs.service.other;/**
 * @author: fs
 * @create: 2019/12/02 11:01
 */

import com.fs.entity.other.Admin;

import java.util.List;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/02 11:01
 */
public interface AdminService {
    int insert(Admin admin);

    int delete(Integer id);

    int update(Admin admin);

    List<Admin> getAll(Integer pageNum, Integer pageSize);

    Admin getById(Integer id);
}
