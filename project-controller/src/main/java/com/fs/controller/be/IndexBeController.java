package com.fs.controller.be;/**
 * @author: fs
 * @create: 2019/12/08 15:25
 */

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @program personal-project-parent 
 * @description:
 * @author: fs
 * @create: 2019/12/08 15:25 
 */
@Controller
@RequestMapping("/be")
public class IndexBeController {
    @RequestMapping("/test")
    public String test() {
        return "index";
    }

    @RequestMapping("/login")
    public String login() {
        return "be/login";
    }

    @RequestMapping("/noPermission")
    public String noPermission(){
        return "be/noPermission";
    }

    @RequestMapping("/index")
    public String index() {
        return "be/index";
    }

    @RequestMapping("/user")
    public String user() {
        return "be/user";
    }

    @RequestMapping("/role")
    public String role() {
        return "be/role";
    }

    @RequestMapping("/privilege")
    public String privilege() {
        return "be/privilege";
    }

    @RequestMapping("/brand")
    public String brand() {
        return "be/brand";
    }

    @RequestMapping("/category")
    public String category() {
        return "be/category";
    }

    @RequestMapping("/product")
    public String product(){
        return "be/product";
    }

    @RequestMapping("/picture")
    public String picture(){
        return "be/picture";
    }

    @RequestMapping("/customer")
    public String customer(){
        return "be/customer";
    }

    @RequestMapping("/comment")
    public String comment(){
        return "be/comment"; }

    @RequestMapping("/order")
    public String order(){
        return "be/order";
    }

    @RequestMapping("/warehouse")
    public String warehouse(){
        return "be/warehouse";
    }

    @RequestMapping("/detail/{orderId}")
    public ModelAndView detail(@PathVariable("orderId") Integer orderId){
        ModelAndView mav = new ModelAndView();
        mav.addObject("orderId", orderId);
        mav.setViewName("be/detail");
        return mav;
    }
}
