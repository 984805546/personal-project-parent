package com.test;/**
 * @author: fs
 * @create: 2019/12/02 15:23
 */

import com.fs.entity.other.BrandInfo;
import com.fs.service.other.BrandInfoService;
import config.AppConfig;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/02 15:23
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = AppConfig.class)
public class BrandInfoTest {
    @Autowired
    private BrandInfoService brandInfoService;
    @Test
    public void getAll() {
        List<BrandInfo> result = brandInfoService.getPageHelper(1, 4);
        for (BrandInfo brandInfo : result) {
            System.out.println("-----debug: brandInfo = " + brandInfo);
        }
    }
}
