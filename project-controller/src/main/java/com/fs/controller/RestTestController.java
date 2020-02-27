//package com.fs.controller;/**
// * @author: fs
// * @create: 2019/12/25 15:03
// */
//
//import com.fs.entity.privilege.User;
//import com.fs.service.privilege.UserService;
//import com.fs.vo.ResponseVO;
//import com.github.pagehelper.PageInfo;
//import io.swagger.annotations.Api;
//import io.swagger.annotations.ApiOperation;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.*;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//import javax.validation.Valid;
//import java.util.List;
//
///**
// * @program personal-project-parent
// * @description:
// * @author: fs
// * @create: 2019/12/25 15:03
// */
//@RestController
////@CrossOrigin(value = {"http://127.0.0.1:8848"},
////        methods = {
////                RequestMethod.DELETE,
////                RequestMethod.PUT,
////                RequestMethod.POST,
////                RequestMethod.GET,
////                RequestMethod.OPTIONS,
////                RequestMethod.HEAD
////        })
//@Api("users")
//public class RestTestController {
//    @Autowired
//    private UserService userService;
//
//    @GetMapping("/users")
//    @ApiOperation("获取所有用户信息")
//    public ResponseVO all(User user) {
//        List<User> users = userService.getAll();
//        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(users).build();
//        return responseVO;
//    }
//
//    @GetMapping("/users/{name}")
//    @ApiOperation("获取某一个用户信息")
//    public ResponseVO search(@PathVariable String name) {
//        List<User> users = userService.getFilter(1,5,name);
//        PageInfo pageInfo = new PageInfo(users,5);
//        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(pageInfo).build();
//        return responseVO;
//    }
//
//    @PostMapping("/users")
//    @ApiOperation("增加用户信息")
//    public ResponseVO insert(User user) {
//        System.out.println("-----debug: user = " + user);
//        return ResponseVO.builder().code("200").msg("success").data(user).build();
//    }
//
//    @DeleteMapping("/users/{id}")
//    @ApiOperation("删除某一个用户信息")
//    public ResponseVO delete(@PathVariable int id){
//        return ResponseVO.builder().code("200").msg("success").data(id).build();
//    }
//
//    @PutMapping("/users/{id}")
//    @ApiOperation("修改某一个用户信息")
//    public ResponseVO update(@PathVariable Integer id, User user) {
//        System.out.println("-----debug: id = " + id);
//        System.out.println("-----debug: user = " + user);
//        return ResponseVO.builder().code("200").msg("success").data(user).build();
//    }
//}