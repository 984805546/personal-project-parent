package com.fs.controller.be;/**
 * @author: fs
 * @create: 2019/12/03 11:42
 */

import com.fs.service.other.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @program personal-project-parent 
 * @description:
 * @author: fs
 * @create: 2019/12/03 11:42 
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("/login")
    public String login() {
        return "be/adminLogin";
    }

    @RequestMapping("/dologin")
    public String doLogin(@RequestParam("username") String username, @RequestParam("password") String password) {
        System.out.println(username+" "+password);
        return "/be/adminLogin";
    }

    @RequestMapping("/forgot")
    public String forgot(@RequestParam("username") String username, @RequestParam("password") String password) {
        return "/be/adminLogin";
    }
}
