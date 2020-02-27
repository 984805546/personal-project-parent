package com.fs.controller.be;/**
 * @author: fs
 * @create: 2019/12/23 19:57
 */

import com.google.code.kaptcha.Producer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/23 19:57
 */
@Controller
@RequestMapping("/captcha")
public class KaptchaController {
    @Autowired
    private Producer captchaProducer;

    @RequestMapping("/default")
    public void getCaptcha(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("image/jpeg");
        String capText = captchaProducer.createText();
        request.getSession().setAttribute("captcha", capText);
        BufferedImage bi = captchaProducer.createImage(capText);
        ServletOutputStream outputStream = response.getOutputStream();
        ImageIO.write(bi, "jpg", outputStream);
        try {
            outputStream.flush();
        } finally {
            outputStream.close();
        }
    }
}
