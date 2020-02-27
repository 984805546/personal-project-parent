package com.fs.controller.privilege;/**
 * @author: fs
 * @create: 2019/12/19 15:24
 */

import com.fs.entity.privilege.User;
import com.fs.service.privilege.UserService;
import com.fs.vo.ResponseVO;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

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
    public String doLogin(User user, String code, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("user", userService.findUser(user));
        String kaptchaExpected = request.getSession().getAttribute("captcha").toString();
        if (code.equals(kaptchaExpected)) {
            request.getSession().setAttribute("msg", null);
            return "redirect:/be/index";
        } else {
            request.getSession().setAttribute("msg", "验证码输入错误！");
            return "redirect:/be/login";
        }
    }

    @RequestMapping("/forgot")
    public String forgot(User user, String code,HttpServletRequest request) {
        userService.insert(user);
        String kaptchaExpected = (String)request.getSession()
                .getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
        if (code.equals(kaptchaExpected)) {
            request.getSession().setAttribute("msg2", null);
        } else {
            request.getSession().setAttribute("msg2", "验证码输入错误！");
        }
        return "be/login";
    }


    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/be/login";
    }

    @RequestMapping("/all")
    @ResponseBody
    public ResponseVO all(User user) {
        List<User> users = userService.getAll();
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(users).build();
        return responseVO;
    }

    @RequestMapping("/list")
    @ResponseBody
    public ResponseVO list(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                           @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        List<User> users = userService.getPageHelper(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(users,5);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
        return responseVO;
    }

    @PostMapping("/insert")
    @ResponseBody
    public ResponseVO insert(@Valid User user,
                             BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("请按要求填写").data(false).build();
        } else {
            if (userService.insert(user) > 0) {
                return ResponseVO.builder().code("200").msg("添加成功").data(true).build();
            }
            return ResponseVO.builder().code("500").msg("添加失败").data(false).build();
        }
    }

    @GetMapping("/delete")
    @ResponseBody
    public Boolean delete(int userId){
        return userService.delete(userId) > 0 ? true : false;
    }

    @PostMapping("/update")
    @ResponseBody
    public ResponseVO update(@Valid User user,
                             BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("请按要求填写").data(false).build();
        } else {
            if (userService.update(user) > 0) {
                return ResponseVO.builder().code("200").msg("修改成功").data(true).build();
            }
            return ResponseVO.builder().code("500").msg("修改失败").data(false).build();
        }
    }

    @GetMapping("/search")
    @ResponseBody
    public ResponseVO search(@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum,
                             @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize,
                             @RequestParam(value = "name", required = false) String name) {
        List<User> users = userService.getFilter(pageNum,pageSize,name);
        PageInfo pageInfo = new PageInfo(users,5);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
        return responseVO;
    }
}
