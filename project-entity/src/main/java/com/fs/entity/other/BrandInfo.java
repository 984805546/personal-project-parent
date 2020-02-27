package com.fs.entity.other;/**
 * @author: fs
 * @create: 2019/12/02 09:43
 */

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program personal-project-parent
 * @description:品牌信息表
 * @author: fs
 * @create: 2019/12/02 09:43
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BrandInfo {
    //'品牌ID'
    private Integer brandId;
    //'品牌名称'
    private String brandName;
    //'联系电话'
    private String telephone;
    //'品牌网络'
    private String brandWeb;
    //'品牌logo URL'
    private String brandLogo;
    //'品牌描述'
    private String brandDesc;
    //'最后修改时间'
    private String modifiedTime;
}
