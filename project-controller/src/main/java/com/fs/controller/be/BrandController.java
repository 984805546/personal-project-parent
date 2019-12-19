package com.fs.controller.be;/**
 * @author: fs
 * @create: 2019/12/02 11:29
 */

import ch.qos.logback.core.db.dialect.DBUtil;
import com.fs.entity.other.BrandInfo;
import com.fs.service.other.BrandInfoService;
import com.fs.vo.BrandInfoVO;
import com.fs.vo.ResponseVO;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.BeanUtils;
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
 * @create: 2019/12/02 11:29
 */
@RestController
@RequestMapping("/brand")
public class BrandController {

    @Autowired
    private BrandInfoService brandInfoService;

    @RequestMapping("/all")
    public ResponseVO all() {
        List<BrandInfo> brandInfos = brandInfoService.getAll();
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(brandInfos).build();
        return responseVO;
    }

    @RequestMapping("/list")
    public ResponseVO list(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                           @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        List<BrandInfo> brandInfos = brandInfoService.getPageHelper(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(brandInfos,5);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
        return responseVO;
    }

    @PostMapping("/insert")
    public ResponseVO insert(@Valid BrandInfo brandInfo,
                         BindingResult bindingResult) {
//        BrandInfo brandInfo = new BrandInfo();
//        BeanUtils.copyProperties(brandInfoVO, brandInfo);
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("请按要求填写").data(false).build();
        } else {
            if (brandInfoService.insert(brandInfo) > 0) {
                return ResponseVO.builder().code("200").msg("添加成功").data(true).build();
            }
            return ResponseVO.builder().code("500").msg("添加失败").data(false).build();
        }
    }

    @GetMapping("/delete")
    public Boolean delete(int brandId){
        return brandInfoService.delete(brandId) > 0 ? true : false;
    }

    @PostMapping("/update")
    public ResponseVO update(@Valid BrandInfo brandInfo,
                             BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("请按要求填写").data(false).build();
        } else {
            if (brandInfoService.update(brandInfo) > 0) {
                return ResponseVO.builder().code("200").msg("修改成功").data(true).build();
            }
            return ResponseVO.builder().code("500").msg("修改失败").data(false).build();
        }
    }

    @GetMapping("/search")
    public ResponseVO search(@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum,
                             @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize,
                             @RequestParam(value = "brandName", required = false) String brandName) {
        List<BrandInfo> brandInfos = brandInfoService.getByName(pageNum,pageSize,brandName);
        PageInfo pageInfo = new PageInfo(brandInfos,5);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
        return responseVO;
    }
}
