package com.fs.controller.be;/**
 * @author: fs
 * @create: 2019/12/09 19:18
 */

import com.fs.entity.product.ProductPicInfo;
import com.fs.service.product.ProductPicInfoService;
import com.fs.vo.ResponseVO;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

/**
 * @program personal-project-parent 
 * @description:
 * @author: fs
 * @create: 2019/12/09 19:18 
 */
@RestController
@RequestMapping("picture")
public class PictureController {

    @Autowired
    private ProductPicInfoService picInfoService;

    @RequestMapping("/all")
    public ResponseVO all() {
        List<ProductPicInfo> productInfos = picInfoService.getAll();
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(productInfos).build();
        return responseVO;
    }

    @RequestMapping("/list")
    public ResponseVO list(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                           @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        List<ProductPicInfo> picInfos = picInfoService.getPageHelper(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(picInfos,5);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
        return responseVO;
    }

    @PostMapping("/insert")
    public ResponseVO insert(@Valid ProductPicInfo picInfo, BindingResult bindingResult,
                             MultipartFile myFile) {
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("未按要求填写").data(false).build();
        } else {
            picInfoService.insert(picInfo);
            if (picInfo.getPicMaster() > 0) {
                picInfoService.updateMaster(picInfo);
            }
            return ResponseVO.builder().code("200").msg("添加成功").data(true).build();
        }
    }

    @GetMapping("/delete")
    public Boolean delete(Integer productPicId){
        return picInfoService.delete(productPicId) > 0 ? true : false;
    }

    @PostMapping("/update")
    public ResponseVO update(@Valid ProductPicInfo picInfo,
                             BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("格式错误").data(false).build();
        } else {
            if (picInfo.getPicMaster() > 0) {
                picInfoService.updateMaster(picInfo);
            }
            picInfoService.update(picInfo);
            return ResponseVO.builder().code("200").msg("修改成功").data(true).build();
        }
    }

    @GetMapping("/search")
    public ResponseVO search(@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum,
                             @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize,
                             Integer productId, String productName,Integer picMaster) {
        List<ProductPicInfo> picInfos = picInfoService.getFilter(pageNum,pageSize,productId,productName,picMaster);
        PageInfo pageInfo = new PageInfo(picInfos,5);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
        return responseVO;
    }
}
