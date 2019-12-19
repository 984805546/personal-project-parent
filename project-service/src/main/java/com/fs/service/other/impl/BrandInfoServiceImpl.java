package com.fs.service.other.impl;/**
 * @author: fs
 * @create: 2019/12/02 11:02
 */

import com.fs.dao.other.BrandInfoDao;
import com.fs.entity.other.BrandInfo;
import com.fs.service.other.BrandInfoService;
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
public class BrandInfoServiceImpl implements BrandInfoService {
    @Autowired
    private BrandInfoDao brandInfoDao;

    @Override
    public int insert(BrandInfo b) {
        return brandInfoDao.insert(b);
    }

    @Override
    public int delete(Integer id) {
        return brandInfoDao.delete(id);
    }

    @Override
    public int update(BrandInfo b) {
        return brandInfoDao.update(b);
    }

    @Override
    public List<BrandInfo> getAll() {
        return brandInfoDao.getAll();
    }

    @Override
    public List<BrandInfo> getByName(Integer pageNum,Integer pageSize,String brandName) {
        return brandInfoDao.getByName(pageNum,pageSize,brandName);
    }

    @Override
    public List<BrandInfo> getPageHelper(int pageNum, int pageSize) {
        return brandInfoDao.getPageHelper(pageNum,pageSize);
    }
}
