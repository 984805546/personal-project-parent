package com.fs.entity.product;/**
 * @author: fs
 * @create: 2019/12/03 09:15
 */

import com.fs.entity.other.BrandInfo;
import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * @program personal-project-parent 
 * @description:'商品信息表'
 * @author: fs
 * @create: 2019/12/03 09:15 
 */
@Data
public class ProductInfo {
    //'商品ID'
    private Integer productId;
    //'商品编码'
    private String productCore;
    //'商品名称'
    private String productName;
    //'品牌表的ID'
    private Integer brandId;
    //'分类ID'
    private Integer categoryId;
    //'商品销售价格'
    private BigDecimal price;
    //'商品加权平均成本'
    private BigDecimal averageCost;
    //'生产日期'
    private String productionDate;
    //'商品有效期'
    private Integer shelfLife;
    //'商品描述'
    private String descript;
    //'最后修改时间'
    private String modifiedTime;
//
//    private List<BrandInfo> brand;
//
//    private List<ProductCategory> category;

    public ProductInfo() {
    }

    public ProductInfo(Integer productId, String productCore, String productName, Integer brandId, Integer categoryId, BigDecimal price, BigDecimal averageCost, String productionDate, Integer shelfLife, String descript, String modifiedTime) {
        this.productId = productId;
        this.productCore = productCore;
        this.productName = productName;
        this.brandId = brandId;
        this.categoryId = categoryId;
        this.price = price;
        this.averageCost = averageCost;
        this.productionDate = productionDate;
        this.shelfLife = shelfLife;
        this.descript = descript;
        this.modifiedTime = modifiedTime;
    }
}
