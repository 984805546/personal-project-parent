package com.fs.vo;/**
 * @author: fs
 * @create: 2019/12/02 11:44
 */

import lombok.Data;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/02 11:44
 */
@Data
public class BrandInfoVO {
    //'品牌ID'
    private Integer brandId;
    //'品牌名称'
    @NotNull()
    private String brandName;
    //'联系电话'
    @NotNull()
    @Size(min=11)
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
