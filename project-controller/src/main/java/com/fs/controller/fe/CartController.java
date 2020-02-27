package com.fs.controller.fe;/**
 * @author: fs
 * @create: 2019/12/12 20:20
 */

import com.fs.entity.order.OrderCart;
import com.fs.service.order.OrderCartService;
import com.fs.vo.ResponseVO;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/12 20:20
 */
@RestController
public class CartController {
    @Autowired
    private OrderCartService cartService;

    @GetMapping("/carts")
    public ResponseVO getAll(Integer customerId) {
        List<OrderCart> carts = cartService.getByCustomer(customerId);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(carts).build();
        return responseVO;
    }

    @GetMapping("/carts/{cartId}")
    public ResponseVO getById(@PathVariable Integer cartId) {
        OrderCart cart = cartService.getById(cartId);
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(cart).build();
        return responseVO;
    }

    @PostMapping("/carts")
    public ResponseVO insert(OrderCart cart) {
        boolean result = false;
        OrderCart c = cartService.getByProductId(cart.getCustomerId(), cart.getProductId());
        if (c == null) {
            result = cartService.insert(cart) > 0 ? true : false;
        } else {
            cart.setCartId(c.getCartId());
            result = cartService.update(cart) > 0 ? true : false;
        }
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(result).build();
        return responseVO;
    }

    @DeleteMapping("/carts/{cartId}")
    public ResponseVO delete(@PathVariable Integer cartId) {
        boolean result = cartService.delete(cartId) > 0 ? true : false;
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(result).build();
        return responseVO;
    }

    @PutMapping("/carts/{cartId}")
    public ResponseVO update(@PathVariable Integer cartId,OrderCart cart) {
        boolean result = cartService.update(cart) > 0 ? true : false;
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(cartId).build();
        return responseVO;
    }

    @PutMapping("/carts")
    public ResponseVO up(@PathVariable Integer[] cartId,String checked) {
        System.out.println(checked);

//        boolean result = cartService.update(cart) > 0 ? true : false;
        ResponseVO responseVO = ResponseVO.builder().code("200").msg("success").data(cartId).build();
        return responseVO;
    }
}
