package com.fs.vo;/**
 * @author: fs
 * @create: 2019/12/02 15:01
 */

import lombok.Builder;
import lombok.Data;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/02 15:01
 */
@Data
@Builder
public class ResponseVO {
    private String code;
    private String msg;
    private Object data;
}
