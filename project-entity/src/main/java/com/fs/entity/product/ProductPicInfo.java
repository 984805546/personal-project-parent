package com.fs.entity.product;/**
 * @author: fs
 * @create: 2019/12/03 09:21
 */

import lombok.Builder;
import lombok.Data;

/**
 * @program personal-project-parent 
 * @description:'商品图片信息表'
 * @author: fs
 * @create: 2019/12/03 09:21 
 */
@Data
public class ProductPicInfo {
    //'商品图片ID'
    private Integer productPicId;
    //'商品ID'
    private Integer productId;

    private Integer picMaster;
    //'图片描述'
    private String picDesc;
    //'图片URL'
    private String picUrl;
    //'最后修改时间'
    private String modifiedTime;

    public ProductPicInfo() {
    }

    public ProductPicInfo(Integer productPicId, Integer productId, Integer picMaster, String picDesc, String picUrl, String modifiedTime) {
        this.productPicId = productPicId;
        this.productId = productId;
        this.picMaster = picMaster;
        this.picDesc = picDesc;
        this.picUrl = picUrl;
        this.modifiedTime = modifiedTime;
    }

    public String getPicUrl() {
        return "/file/download?filename="+picUrl;
    }
}
