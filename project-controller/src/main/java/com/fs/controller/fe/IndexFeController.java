package com.fs.controller.fe;/**
 * @author: fs
 * @create: 2019/12/16 12:06
 */

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @program personal-project-parent 
 * @description:
 * @author: fs
 * @create: 2019/12/16 12:06 
 */
@Controller
@RequestMapping("/fe")
public class IndexFeController {
    @RequestMapping("/index")
    public String index() {
        return "fe/index";
    }

    @RequestMapping("/about-us")
    public String aboutUs() {
        return "fe/about-us";
    }

    @RequestMapping("/address")
    public String address() {
        return "fe/address";
    }

    @RequestMapping("/cart")
    public String cart() {
        return "fe/cart";
    }

    @RequestMapping("/checkout")
    public String checkout() {
        return "fe/checkout";
    }

    @RequestMapping("/contact")
    public String contact() {
        return "fe/contact";
    }

    @RequestMapping("/customer-details")
    public String customerDetail() {
        return "fe/customer-details";
    }

    @RequestMapping("/login")
    public String login() {
        return "fe/login";
    }

    @RequestMapping("/product-details/{productId}")
    public ModelAndView productDetail(@PathVariable("productId") Integer productId) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("productId", productId);
        mav.setViewName("fe/product-details");
//        return "";
        return mav;
    }

    @RequestMapping("/shop")
    public String shop() {
        return "fe/shop";
    }
}
