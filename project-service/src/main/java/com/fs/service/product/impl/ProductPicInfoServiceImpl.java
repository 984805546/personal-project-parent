package com.fs.service.product.impl;/**
 * @author: fs
 * @create: 2019/12/02 11:02
 */

import com.fs.dao.product.ProductPicInfoDao;
import com.fs.entity.product.ProductPicInfo;
import com.fs.service.product.ProductPicInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/02 11:02
 */
@Service
public class ProductPicInfoServiceImpl implements ProductPicInfoService {
    @Autowired
    private ProductPicInfoDao picInfoDao;

    @Override
    public int insert(ProductPicInfo picInfo) {
        return picInfoDao.insert(picInfo);
    }

    @Override
    public int delete(Integer id) {
        return picInfoDao.delete(id);
    }

    @Override
    public int update(ProductPicInfo picInfo) {
        return picInfoDao.update(picInfo);
    }

    @Override
    public int updateMaster(ProductPicInfo picInfo) {
        return picInfoDao.updateMaster(picInfo.getProductPicId(),picInfo.getProductId());
    }

    @Override
    public List<ProductPicInfo> getAll() {
        return picInfoDao.getAll();
    }

    @Override
    public List<ProductPicInfo> getPageHelper(Integer pageNum, Integer pageSize) {
        return picInfoDao.getPageHelper(pageNum, pageSize);
    }

    @Override
    public List<ProductPicInfo> getFilter(Integer pageNum, Integer pageSize, String productName, Integer picMaster) {
        return picInfoDao.getFilter(pageNum, pageSize,productName,picMaster);
    }
}
