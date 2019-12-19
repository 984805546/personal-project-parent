package com.fs.controller.be;/**
 * @author: fs
 * @create: 2019/12/12 20:20
 */

import com.fs.entity.order.OrderMaster;
import com.fs.service.order.OrderMasterService;
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
 * @create: 2019/12/12 20:20 
 */
@RestController
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderMasterService masterService;

    @RequestMapping("/list")
    public ResponseVO list(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                           @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        List<OrderMaster> masters = masterService.getPageHelper(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(masters,5);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
        return responseVO;
    }

    @PostMapping("/insert")
    public ResponseVO insert(@Valid OrderMaster master,
                             BindingResult bindingResult
    ) {
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("格式错误").data(false).build();
        } else {
            if (masterService.insert(master) > 0) {
                return ResponseVO.builder().code("200").msg("添加成功").data(true).build();
            }
            return ResponseVO.builder().code("500").msg("添加失败").data(false).build();
        }
    }

    @GetMapping("/delete")
    public Boolean delete(int orderId){
        return masterService.delete(orderId) > 0 ? true : false;
    }

    @PostMapping("/update")
    public ResponseVO update(@Valid OrderMaster master,
                             BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("格式错误").data(false).build();
        } else {
            if (masterService.update(master) > 0) {
                return ResponseVO.builder().code("200").msg("修改成功").data(true).build();
            }
            return ResponseVO.builder().code("500").msg("修改失败").data(false).build();
        }
    }

    @GetMapping("/search")
    public ResponseVO search(@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum,
                             @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize,
                             Integer orderStatus, String loginUsername, String orderSn) {
        List<OrderMaster> masters = masterService.getFilter(pageNum,pageSize,orderStatus,loginUsername,orderSn);
        PageInfo pageInfo = new PageInfo(masters,5);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
        return responseVO;
    }

    @GetMapping("/{orderId}")
    public ResponseVO search(@PathVariable("orderId") Integer orderId) {
        OrderMaster master = masterService.getById(orderId);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(master).build();
        return responseVO;
    }
}
