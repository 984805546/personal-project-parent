package com.fs.controller.be;/**
 * @author: fs
 * @create: 2019/12/18 12:01
 */

import com.fs.entity.product.WarehouseProduct;
import com.fs.service.product.WarehouseProductService;
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
 * @create: 2019/12/18 12:01
 */
@RestController
@RequestMapping("/warehouse")
public class WarehouseController {
    @Autowired
    private WarehouseProductService warehouseService;

    @RequestMapping("/list")
    public ResponseVO list(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                           @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        List<WarehouseProduct> warehouses = warehouseService.getPageHelper(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(warehouses,5);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
        return responseVO;
    }

    @PostMapping("/insert")
    public ResponseVO insert(@Valid WarehouseProduct warehouse,
                             BindingResult bindingResult
    ) {
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("格式错误").data(false).build();
        } else {
            if (warehouseService.insert(warehouse) > 0) {
                return ResponseVO.builder().code("200").msg("添加成功").data(true).build();
            }
            return ResponseVO.builder().code("500").msg("添加失败").data(false).build();
        }
    }

    @GetMapping("/delete")
    public Boolean delete(int wpId){
        return warehouseService.delete(wpId,null) > 0 ? true : false;
    }

    @PostMapping("/update")
    public ResponseVO update(@Valid WarehouseProduct warehouse,
                             BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("格式错误").data(false).build();
        } else {
            if (warehouseService.update(warehouse) > 0) {
                return ResponseVO.builder().code("200").msg("修改成功").data(true).build();
            }
            return ResponseVO.builder().code("500").msg("修改失败").data(false).build();
        }
    }

    @GetMapping("/search")
    public ResponseVO search(@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum,
                             @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize,
                             String productName, String productCore) {
        List<WarehouseProduct> warehouses = warehouseService.getFilter(pageNum,pageSize,productName,productCore);
        PageInfo pageInfo = new PageInfo(warehouses,5);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
        return responseVO;
    }

    @GetMapping("/searchById")
    public ResponseVO searchById(Integer wpId, Integer productId) {
        WarehouseProduct warehouse = warehouseService.getById(wpId, productId);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(warehouse).build();
        return responseVO;
    }
}
