package com.fs.service.other;/**
 * @author: fs
 * @create: 2019/12/02 11:01
 */

import com.fs.entity.other.BrandInfo;

import java.util.List;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/02 11:01
 */
public interface BrandInfoService {
    int insert(BrandInfo b);

    int delete(Integer id);

    int update(BrandInfo b);

    List<BrandInfo> getAll();

    List<BrandInfo> getByName(Integer pageNum,Integer pageSize, String brandName);

    List<BrandInfo> getPageHelper(int pageNum, int pageSize);
}
