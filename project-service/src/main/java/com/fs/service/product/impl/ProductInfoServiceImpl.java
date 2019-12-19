package com.fs.service.product.impl;/**
 * @author: fs
 * @create: 2019/12/02 11:02
 */

import com.fs.dao.product.ProductInfoDao;
import com.fs.entity.product.ProductInfo;
import com.fs.service.product.ProductInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/02 11:02
 */
@Service
public class ProductInfoServiceImpl implements ProductInfoService {
    @Autowired
    private ProductInfoDao infoDao;

    @Override
    public int insert(ProductInfo info) {
        return infoDao.insert(info);
    }

    @Override
    public int delete(Integer id) {
        return infoDao.delete(id);
    }

    @Override
    public int update(ProductInfo info) {
        return infoDao.update(info);
    }

    @Override
    public List<ProductInfo> getAll() {
        return infoDao.getAll();
    }

    @Override
    public List<ProductInfo> getPageHelper(Integer pageNum, Integer pageSize) {
        return infoDao.getPageHelper(pageNum, pageSize);
    }

    @Override
    public List<ProductInfo> getFilter(Integer pageNum, Integer pageSize, String productCore, String productName, Integer categoryId, Integer brandId) {
        return infoDao.getFilter(pageNum, pageSize, productCore, productName, categoryId, brandId);
    }
}
