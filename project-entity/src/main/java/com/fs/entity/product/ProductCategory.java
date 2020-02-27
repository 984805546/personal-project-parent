package com.fs.entity.product;/**
 * @author: fs
 * @create: 2019/12/03 08:51
 */

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program personal-project-parent
 * @description:'商品分类表'
 * @author: fs
 * @create: 2019/12/03 08:51
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductCategory {
//    '分类ID'
    private Integer categoryId;
//    '分类名称'
    private String categoryName;
//    '分类编码'
    private String categoryCode;
//    '最后修改时间'
    private String modifiedTime;
}
