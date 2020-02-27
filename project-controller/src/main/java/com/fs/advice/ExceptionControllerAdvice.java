package com.fs.advice;/**
 * @author: fs
 * @create: 2019/12/02 11:31
 */

import com.fs.vo.ResponseVO;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/02 11:31
 */
@ControllerAdvice
public class ExceptionControllerAdvice {
    @ExceptionHandler(RuntimeException.class)
    @ResponseBody
    public ResponseVO handlerRuntime(RuntimeException re) {
        return ResponseVO.builder().code("500").msg("服务器异常，请联系管理员！！").build();
    }
}
