package com.fs.entity.product;/**
 * @author: fs
 * @create: 2019/12/03 09:15
 */

import com.fs.entity.other.BrandInfo;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.List;

/**
 * @program personal-project-parent 
 * @description:'商品信息表'
 * @author: fs
 * @create: 2019/12/03 09:15 
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
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
}
