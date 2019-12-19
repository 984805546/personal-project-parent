package com.fs.controller.be;/**
 * @author: fs
 * @create: 2019/12/12 09:07
 */

import com.fs.entity.customer.CustomerAddr;
import com.fs.entity.customer.CustomerInf;
import com.fs.entity.customer.CustomerLogin;
import com.fs.service.customer.CustomerAddrService;
import com.fs.service.customer.CustomerInfService;
import com.fs.service.customer.CustomerLoginService;
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
 * @create: 2019/12/12 09:07 
 */
@RestController
@RequestMapping("/customer")
public class CustomerController {
    @Autowired
    private CustomerLoginService loginService;
    @Autowired
    private CustomerInfService infoService;
    @Autowired
    private CustomerAddrService addrService;

    @RequestMapping("/all")
    public ResponseVO all() {
        List<CustomerLogin> customerLogins = loginService.getAll();
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(customerLogins).build();
        return responseVO;
    }

    @RequestMapping("/list")
    public ResponseVO list(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                           @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        List<CustomerLogin> customerLogins = loginService.getPageHelper(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(customerLogins,5);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
        return responseVO;
    }

    @PostMapping("/insert")
    public ResponseVO insert(@Valid CustomerLogin customerLogin,
                             BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("格式错误").data(false).build();
        } else {
            loginService.insert(customerLogin);
            return ResponseVO.builder().code("200").msg("添加成功").data(true).build();
        }
    }

    @GetMapping("/delete")
    public Boolean delete(int customerId){
        return loginService.delete(customerId) > 0 ? true : false;
    }

    @PostMapping("/update")
    public ResponseVO update(@Valid CustomerLogin customerLogin,
                             BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("格式错误").data(false).build();
        } else {
            loginService.update(customerLogin);
            return ResponseVO.builder().code("200").msg("修改成功").data(true).build();
        }
    }

    @GetMapping("/search")
    public ResponseVO search(@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum,
                             @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize,
                             @RequestParam(value = "loginUsername", required = false) String loginUsername) {
        List<CustomerLogin> customerLogins = loginService.getByName(pageNum,pageSize,loginUsername);
        PageInfo pageInfo = new PageInfo(customerLogins,5);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
        return responseVO;
    }



    @RequestMapping("/info/list")
    public ResponseVO infoList(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                               @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        List<CustomerInf> infos = infoService.getPageHelper(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(infos,5);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
        return responseVO;
    }

    @PostMapping("/info/insert")
    public ResponseVO infoInsert(@Valid CustomerInf customerInf,
                             BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("格式错误").data(false).build();
        } else {
            infoService.insert(customerInf);
            return ResponseVO.builder().code("200").msg("添加成功").data(true).build();
        }
    }

    @GetMapping("/info/delete")
    public Boolean infoDelete(int customerInfId){
        return infoService.delete(customerInfId) > 0 ? true : false;
    }

    @PostMapping("/info/update")
    public ResponseVO infoUpdate(@Valid CustomerInf customerInf,
                             BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("格式错误").data(false).build();
        } else {
            infoService.update(customerInf);
            return ResponseVO.builder().code("200").msg("修改成功").data(true).build();
        }
    }

    @GetMapping("/info/{customerId}")
    public ResponseVO infoSearch(@PathVariable("customerId") Integer customerId) {
        CustomerInf customerInf = infoService.getByCustomerId(customerId);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(customerInf).build();
        return responseVO;
    }



    @RequestMapping("/addr/list")
    public ResponseVO addrList(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                               @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        List<CustomerAddr> addrs = addrService.getPageHelper(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(addrs,5);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
        return responseVO;
    }

    @PostMapping("/addr/insert")
    public ResponseVO addrInsert(@Valid CustomerAddr customerAddr,
                                 BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("格式错误").data(false).build();
        } else {
            addrService.insert(customerAddr);
            if (customerAddr.getIsDefault() > 0) {
                addrService.updateDefault(customerAddr);
            }
            return ResponseVO.builder().code("200").msg("添加成功").data(true).build();
        }
    }

    @GetMapping("/addr/delete")
    public Boolean addrDelete(int customerAddrId){
        return addrService.delete(customerAddrId) > 0 ? true : false;
    }

    @PostMapping("/addr/update")
    public ResponseVO addrUpdate(@Valid CustomerAddr customerAddr,
                                 BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseVO.builder().code("500").msg("格式错误").data(false).build();
        } else {
            addrService.update(customerAddr);
            if (customerAddr.getIsDefault() > 0) {
                addrService.updateDefault(customerAddr);
            }
            return ResponseVO.builder().code("200").msg("修改成功").data(true).build();
        }
    }

    @GetMapping("/addr/search")
    public ResponseVO addrSearch(Integer customerId) {
        List<CustomerAddr> customerAddr = addrService.getByCustomerId(customerId);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(customerAddr).build();
        return responseVO;
    }

    @GetMapping("/addr/default")
    public ResponseVO getDefault(Integer customerId) {
        CustomerAddr customerAddr = addrService.getDefault(customerId);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(customerAddr).build();
        return responseVO;
    }



//    @GetMapping("/searchById")
//    public ResponseVO searchById(@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum,
//                                 @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize,
//                                 @RequestParam(value = "categoryId", required = false) Integer categoryId) {
//        List<ProductInfo> categories = null;
//        if (categoryId > 0) {
//            categories = productInfoService.getByCategoryId(pageNum, pageSize, categoryId);
//        } else {
//            categories = productInfoService.getPageHelper(pageNum, pageSize);
//        }
//        PageInfo pageInfo = new PageInfo(categories,5);
//        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
//        return responseVO;
//    }
}