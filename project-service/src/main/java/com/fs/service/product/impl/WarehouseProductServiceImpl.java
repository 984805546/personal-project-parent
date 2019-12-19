package com.fs.service.product.impl;/**
 * @author: fs
 * @create: 2019/12/02 11:02
 */

import com.fs.dao.product.WarehouseProductDao;
import com.fs.entity.product.WarehouseProduct;
import com.fs.service.product.WarehouseProductService;
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
public class WarehouseProductServiceImpl implements WarehouseProductService {
    @Autowired
    private WarehouseProductDao warehouseDao;

    @Override
    public int insert(WarehouseProduct warehouse) {
        return warehouseDao.insert(warehouse);
    }

    @Override
    public int delete(Integer wpId, Integer productId) {
        return warehouseDao.delete(wpId,productId);
    }

    @Override
    public int update(WarehouseProduct warehouse) {
        return warehouseDao.update(warehouse);
    }

    @Override
    public List<WarehouseProduct> getPageHelper(Integer pageNum, Integer pageSize) {
        return warehouseDao.getPageHelper(pageNum, pageSize);
    }

    @Override
    public List<WarehouseProduct> getFilter(Integer pageNum, Integer pageSize, String productName, String productCore) {
        return warehouseDao.getFilter(pageNum, pageSize, productName, productCore);
    }

    @Override
    public WarehouseProduct getById(Integer wpId, Integer productId) {
        return warehouseDao.getById(wpId,productId);
    }
}
