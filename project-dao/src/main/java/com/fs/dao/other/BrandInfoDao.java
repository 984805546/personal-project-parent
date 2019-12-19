package com.fs.dao.other;/**
 * @author: fs
 * @create: 2019/12/02 09:58
 */

import com.fs.entity.other.BrandInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @program personal-project-parent 
 * @description:
 * @author: fs
 * @create: 2019/12/02 09:58 
 */
public interface BrandInfoDao {

    int insert(BrandInfo b);

    int delete(Integer id);

    int update(BrandInfo b);

    List<BrandInfo> getAll();

    List<BrandInfo> getPageHelper(@Param("pageNum")Integer pageNum,@Param("pageSize")Integer pageSize);

    List<BrandInfo> getByName(@Param("pageNum")Integer pageNum,@Param("pageSize")Integer pageSize,@Param("brandName")String brandName);
}
