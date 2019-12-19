package com.fs.controller.be;/**
 * @author: fs
 * @create: 2019/12/12 20:20
 */
import com.fs.entity.order.OrderDetail;
import com.fs.service.order.OrderDetailService;
import com.fs.vo.ResponseVO;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

/**
 * @program personal-project-parent 
 * @description:
 * @author: fs
 * @create: 2019/12/12 20:20 
 */
@RestController
@RequestMapping("/detail")
public class OrderDetailController {
    @Autowired
    private OrderDetailService detailService;

    @RequestMapping("/list")
    public ResponseVO list(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                           @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        List<OrderDetail> details = detailService.getPageHelper(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(details,5);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
        return responseVO;
    }

    @PostMapping("/insert")
    public ResponseVO insert(@Valid OrderDetail detail,
                             BindingResult bindingResult
    ) {
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("格式错误").data(false).build();
        } else {
            if (detailService.insert(detail) > 0) {
                return ResponseVO.builder().code("200").msg("添加成功").data(true).build();
            }
            return ResponseVO.builder().code("500").msg("添加失败").data(false).build();
        }
    }

    @GetMapping("/delete")
    public Boolean delete(int orderDetailId){
        return detailService.delete(orderDetailId) > 0 ? true : false;
    }

    @PostMapping("/update")
    public ResponseVO update(@Valid OrderDetail detail,
                             BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("格式错误").data(false).build();
        } else {
            if (detailService.update(detail) > 0) {
                return ResponseVO.builder().code("200").msg("修改成功").data(true).build();
            }
            return ResponseVO.builder().code("500").msg("修改失败").data(false).build();
        }
    }

    @GetMapping("/{orderId}")
    public ResponseVO search(@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum,
                               @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize,
                               @PathVariable("orderId") Integer orderId) {
        List<OrderDetail> details = detailService.getFilter(pageNum,pageSize,orderId);
        PageInfo pageInfo = new PageInfo(details,5);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
        return responseVO;
    }
}
