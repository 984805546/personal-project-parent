package com.fs.dao.product;/**
 * @author: fs
 * @create: 2019/12/02 09:58
 */

import com.fs.entity.product.ProductInfo;
import com.fs.entity.product.ProductPicInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @program personal-project-parent 
 * @description:
 * @author: fs
 * @create: 2019/12/02 09:58 
 */
public interface ProductPicInfoDao {

    int insert(ProductPicInfo picInfo);

    int delete(Integer productPicId);

    int update(ProductPicInfo picInfo);

    int updateMaster(Integer productPicId,Integer productId);

    ProductPicInfo getByUrl();

    List<ProductPicInfo> getAll();

    List<ProductPicInfo> getPageHelper(@Param("pageNum") Integer pageNum, @Param("pageSize") Integer pageSize);

    List<ProductPicInfo> getFilter(@Param("pageNum") Integer pageNum, @Param("pageSize") Integer pageSize,
                                   @Param("productId") Integer productId, @Param("productName") String productName,
                                   @Param("picMaster") Integer picMaster);
}
