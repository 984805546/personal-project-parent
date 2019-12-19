package com.fs.entity.product;/**
 * @author: fs
 * @create: 2019/12/03 09:33
 */

import lombok.Builder;
import lombok.Data;

/**
 * @program personal-project-parent
 * @description:'商品库存表'
 * @author: fs
 * @create: 2019/12/03 09:33
 */
@Data
public class WarehouseProduct {
    //'商品库存ID'
    private Integer wpId;
    //'商品ID'
    private Integer productId;
    //'当前商品数量'
    private Integer currentCnt;
    //'当前占用数量'
    private Integer lockCnt;
    //'最后修改时间'
    private String modifiedTime;

    private ProductInfo product;

    public WarehouseProduct() {
    }

    public WarehouseProduct(Integer wpId, Integer productId, Integer currentCnt, Integer lockCnt, String modifiedTime) {
        this.wpId = wpId;
        this.productId = productId;
        this.currentCnt = currentCnt;
        this.lockCnt = lockCnt;
        this.modifiedTime = modifiedTime;
    }
}
