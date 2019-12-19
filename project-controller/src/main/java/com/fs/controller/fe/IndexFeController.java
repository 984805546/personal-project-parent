package com.fs.controller.fe;/**
 * @author: fs
 * @create: 2019/12/16 12:06
 */

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
