package com.fs.controller.be;/**
 * @author: fs
 * @create: 2019/12/12 20:22
 */

import com.fs.entity.product.ProductComment;
import com.fs.service.product.ProductCommentService;
import com.fs.vo.ResponseVO;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/12 20:22
 */
@RestController
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private ProductCommentService commentService;

    @RequestMapping("/list")
    public ResponseVO list(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                           @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        List<ProductComment> comments = commentService.getPageHelper(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(comments,5);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
        return responseVO;
    }

    @PostMapping("/insert")
    public ResponseVO insert(@Valid ProductComment comment,
                             BindingResult bindingResult
    ) {
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("格式错误").data(false).build();
        } else {
            if (commentService.insert(comment) > 0) {
                return ResponseVO.builder().code("200").msg("添加成功").data(true).build();
            }
            return ResponseVO.builder().code("500").msg("添加失败").data(false).build();
        }
    }

    @GetMapping("/delete")
    public Boolean delete(int commentId){
        return commentService.delete(commentId) > 0 ? true : false;
    }

    @PostMapping("/update")
    public ResponseVO update(@Valid ProductComment comment,
                             BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("格式错误").data(false).build();
        } else {
            if (commentService.update(comment) > 0) {
                return ResponseVO.builder().code("200").msg("修改成功").data(true).build();
            }
            return ResponseVO.builder().code("500").msg("修改失败").data(false).build();
        }
    }

    @GetMapping("/search")
    public ResponseVO search(@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum,
                             @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize,
                             String productName, String orderSn, String loginUsername) {
        List<ProductComment> comments = commentService.getFilter(pageNum,pageSize,productName,orderSn,loginUsername);
        System.out.println(productName+orderSn+loginUsername);
        PageInfo pageInfo = new PageInfo(comments,5);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
        return responseVO;
    }
}
