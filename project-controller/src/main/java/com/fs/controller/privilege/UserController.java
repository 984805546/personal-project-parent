package com.fs.controller.privilege;/**
 * @author: fs
 * @create: 2019/12/19 15:24
 */

import com.fs.entity.privilege.User;
import com.fs.service.privilege.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @program personal-project-parent 
 * @description:
 * @author: fs
 * @create: 2019/12/19 15:24 
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/doLogin")
    public String doLogin(User user, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("user", userService.findUser(user));

        return "index";
    }

    @RequestMapping("/forgot")
    public String forgot(User user) {
        userService.insert(user);
        return "be/login";
    }
}
