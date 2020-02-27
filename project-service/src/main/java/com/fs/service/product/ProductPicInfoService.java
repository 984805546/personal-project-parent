package com.fs.service.product;/**
 * @author: fs
 * @create: 2019/12/02 11:01
 */

import com.fs.entity.order.OrderCart;
import com.fs.entity.product.ProductPicInfo;

import java.util.List;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/02 11:01
 */
public interface ProductPicInfoService {
    int insert(ProductPicInfo picInfo);

    int delete(Integer productPicId);

    int update(ProductPicInfo picInfo);

    int updateMaster(ProductPicInfo picInfo);

    List<ProductPicInfo> getAll();

    List<ProductPicInfo> getPageHelper(Integer pageNum, Integer pageSize);

    List<ProductPicInfo> getFilter(Integer pageNum, Integer pageSize, Integer productId, String productName, Integer picMaster);
}
