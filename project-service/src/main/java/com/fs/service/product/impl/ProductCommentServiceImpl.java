package com.fs.service.product.impl;/**
 * @author: fs
 * @create: 2019/12/02 11:02
 */

import com.fs.dao.product.ProductCommentDao;
import com.fs.entity.product.ProductComment;
import com.fs.service.product.ProductCommentService;
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
public class ProductCommentServiceImpl implements ProductCommentService {
    @Autowired
    private ProductCommentDao commentDao;

    @Override
    public int insert(ProductComment comment) {
        return commentDao.insert(comment);
    }

    @Override
    public int delete(Integer commentId) {
        return commentDao.delete(commentId);
    }

    @Override
    public int update(ProductComment comment) {
        return commentDao.update(comment);
    }

    @Override
    public List<ProductComment> getPageHelper(Integer pageNum, Integer pageSize) {
        return commentDao.getPageHelper(pageNum, pageSize);
    }

    @Override
    public List<ProductComment> getFilter(Integer pageNum, Integer pageSize, String productName,
                                          String orderSn,String loginUsername) {
        return commentDao.getFilter(pageNum, pageSize, productName,orderSn,loginUsername);
    }
}
