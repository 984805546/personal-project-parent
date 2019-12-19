package com.fs.controller.be;/**
 * @author: fs
 * @create: 2019/12/08 15:16
 */

import com.fs.entity.product.ProductCategory;
import com.fs.service.product.ProductCategoryService;
import com.fs.vo.ResponseVO;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/08 15:16
 */
@RestController
@RequestMapping("/category")
public class CategoryController {
    @Autowired
    private ProductCategoryService categoryService;

    @RequestMapping("/all")
    public ResponseVO all() {
        List<ProductCategory> categories = categoryService.getAll();
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(categories).build();
        return responseVO;
    }

    @RequestMapping("/list")
    public ResponseVO list(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                           @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        List<ProductCategory> categories = categoryService.getPageHelper(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(categories,5);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
        return responseVO;
    }

    @PostMapping("/insert")
    public ResponseVO insert(@Valid ProductCategory category,
                             BindingResult bindingResult) {
//        BrandInfo brandInfo = new BrandInfo();
//        BeanUtils.copyProperties(brandInfoVO, brandInfo);
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("格式错误").data(false).build();
        } else {
            if (categoryService.insert(category) > 0) {
                return ResponseVO.builder().code("200").msg("添加成功").data(true).build();
            }
            return ResponseVO.builder().code("500").msg("添加失败").data(false).build();
        }
    }

    @GetMapping("/delete")
    public Boolean delete(int categoryId){
        return categoryService.delete(categoryId) > 0 ? true : false;
    }

    @PostMapping("/update")
    public ResponseVO update(@Valid ProductCategory category,
                             BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("格式错误").data(false).build();
        } else {
            if (categoryService.update(category) > 0) {
                return ResponseVO.builder().code("200").msg("修改成功").data(true).build();
            }
            return ResponseVO.builder().code("500").msg("修改失败").data(false).build();
        }
    }

    @GetMapping("/search")
    public ResponseVO search(@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum,
                             @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize,
                             @RequestParam(value = "categoryName", required = false) String categoryName) {
        List<ProductCategory> categories = categoryService.getByName(pageNum,pageSize,categoryName);
        PageInfo pageInfo = new PageInfo(categories,5);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
        return responseVO;
    }
}
