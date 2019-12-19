package com.fs.service.product.impl;/**
 * @author: fs
 * @create: 2019/12/02 11:02
 */

import com.fs.dao.product.ProductCategoryDao;
import com.fs.entity.product.ProductCategory;
import com.fs.service.product.ProductCategoryService;
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
public class ProductCategoryServiceImpl implements ProductCategoryService {
    @Autowired
    private ProductCategoryDao categoryDao;


    @Override
    public int insert(ProductCategory category) {
        return categoryDao.insert(category);
    }

    @Override
    public int delete(Integer id) {
        return categoryDao.delete(id);
    }

    @Override
    public int update(ProductCategory category) {
        return categoryDao.update(category);
    }

    @Override
    public List<ProductCategory> getAll() {
        return categoryDao.getAll();
    }

    @Override
    public List<ProductCategory> getPageHelper(Integer pageNum, Integer pageSize) {
        return categoryDao.getPageHelper(pageNum, pageSize);
    }

    @Override
    public List<ProductCategory> getByName(Integer pageNum, Integer pageSize, String categoryName) {
        return categoryDao.getByName(pageNum, pageSize, categoryName);
    }

}
