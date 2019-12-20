package com.fs.dao.privilege;

import com.fs.entity.privilege.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author: fs
 * @create: 2019/12/19 10:57
 */
public interface UserDao {

    int insert(User user);

    int delete(Integer id);

    int update(User user);

    User findUser(User user);

    List<User> getAll();

    List<User> getPageHelper(@Param("pageNum")Integer pageNum, @Param("pageSize")Integer pageSize);

    List<User> getFilter(@Param("pageNum")Integer pageNum,@Param("pageSize")Integer pageSize,@Param("username")String username);
}
