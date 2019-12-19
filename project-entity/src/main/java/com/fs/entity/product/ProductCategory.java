package com.fs.entity.product;/**
 * @author: fs
 * @create: 2019/12/03 08:51
 */

import lombok.Builder;
import lombok.Data;

/**
 * @program personal-project-parent
 * @description:'商品分类表'
 * @author: fs
 * @create: 2019/12/03 08:51
 */
@Data
public class ProductCategory {
//    '分类ID'
    private Integer categoryId;
//    '分类名称'
    private String categoryName;
//    '分类编码'
    private String categoryCode;
//    '最后修改时间'
    private String modifiedTime;

    public ProductCategory() {
    }

    public ProductCategory(Integer categoryId, String categoryName, String categoryCode, String modifiedTime) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.categoryCode = categoryCode;
        this.modifiedTime = modifiedTime;
    }
}
