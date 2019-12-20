package com.fs.service.privilege;/**
 * @author: fs
 * @create: 2019/12/19 11:47
 */

import com.fs.entity.privilege.User;

import java.util.List;

/**
 * @program personal-project-parent 
 * @description:
 * @author: fs
 * @create: 2019/12/19 11:47 
 */
public interface UserService {

    int insert(User user);

    int delete(Integer id);

    int update(User user);

    User findUser(User user);

    List<User> getAll();

    List<User> getPageHelper(Integer pageNum, Integer pageSize);

    List<User> getFilter(Integer pageNum,Integer pageSize,String username);
}
