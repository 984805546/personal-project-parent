package com.fs.controller.be;/**
 * @author: fs
 * @create: 2019/12/09 10:47
 */

import com.fs.entity.product.ProductInfo;
import com.fs.entity.product.WarehouseProduct;
import com.fs.service.other.BrandInfoService;
import com.fs.service.product.ProductCategoryService;
import com.fs.service.product.ProductPicInfoService;
import com.fs.service.product.ProductInfoService;
import com.fs.service.product.WarehouseProductService;
import com.fs.vo.ResponseVO;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.util.List;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/09 10:47
 */
@RestController
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductInfoService productInfoService;
    @Autowired
    private WarehouseProductService warehouseService;

    @RequestMapping("/all")
    public ResponseVO all() {
        List<ProductInfo> productInfos = productInfoService.getAll();
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(productInfos).build();
        return responseVO;
    }

    @RequestMapping("/list")
    public ResponseVO list(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                           @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        List<ProductInfo> categories = productInfoService.getPageHelper(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(categories,5);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
        return responseVO;
    }

    @PostMapping("/insert")
    public ResponseVO insert(@Valid ProductInfo productInfo, Integer currentCnt,
                             Integer lockCnt, BindingResult bindingResult
                             ) {
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("格式错误").data(false).build();
        } else {
            productInfoService.insert(productInfo);
            System.out.println(productInfo.getProductId());
            WarehouseProduct warehouseProduct = new WarehouseProduct(0,productInfo.getProductId(),currentCnt,lockCnt,null);
            warehouseService.insert(warehouseProduct);
            return ResponseVO.builder().code("200").msg("添加成功").data(true).build();
        }
    }

    @GetMapping("/delete")
    public Boolean delete(int productId){
        productInfoService.delete(productId);
        warehouseService.delete(null, productId);
        return true;
    }

    @PostMapping("/update")
    public ResponseVO update(@Valid ProductInfo productInfo,Integer currentCnt,
                             Integer lockCnt, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("格式错误").data(false).build();
        } else {
            productInfoService.update(productInfo);
            WarehouseProduct warehouseProduct = new WarehouseProduct(0,productInfo.getProductId(),currentCnt,lockCnt,null);
            warehouseService.update(warehouseProduct);
            return ResponseVO.builder().code("200").msg("修改成功").data(true).build();
        }
    }

    @GetMapping("/search")
    public ResponseVO search(@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum,
                             @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize,
                             String productCore,String productName,Integer categoryId,Integer brandId) {
        List<ProductInfo> productInfos = productInfoService.getFilter(pageNum,pageSize,productCore,productName,categoryId,brandId);
        PageInfo pageInfo = new PageInfo(productInfos,5);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
        return responseVO;
    }
}
