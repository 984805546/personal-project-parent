package com.fs.interceptor;/**
 * @author: fs
 * @create: 2019/12/02 14:50
 */

import com.fs.entity.privilege.Privilege;
import com.fs.entity.privilege.Role;
import com.fs.entity.privilege.User;
import com.fs.service.privilege.PrivilegeService;
import com.fs.service.privilege.RoleService;
import com.fs.service.privilege.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @program personal-project-parent
 * @description:
 * @author: fs
 * @create: 2019/12/02 14:50
 */
@Controller
public class CheckloginInterceptor implements HandlerInterceptor {
    @Autowired
    private UserService userService ;

    @Autowired
    private RoleService roleService ;

    @Autowired
    private PrivilegeService privilegeService;
    private String loginUrl = "be/login";


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();
        //判断是否登录
        User user = (User) session.getAttribute("user");
        if(user==null) {
            response.sendRedirect(loginUrl);
            return false;
        }

        //使每个角色的权限不重复
        List<Role> roles = roleService.getRoles(user.getId());
        Set<Privilege> privileges = new HashSet<Privilege>();
        for (Role role : roles) {
            for (Privilege privilege : privilegeService.getPrivileges(role.getId())) {
                privileges.add(privilege);
            }
        }

        String requestUri = getRequestUrl(request);
        List<String> list = getprivilege(privileges);

        if(isAllowd(list, requestUri)) {
            return true;
        }else {
            response.sendRedirect("be/nopermission");
            return false;
        }
    }

    //判断是否有权限访问该地址
    public boolean isAllowd(List<String> list,String requestUri) {
        boolean isAllowd = false;
        for(String allowList:list) {
            if(allowList.equals(requestUri)) {
                isAllowd=true;
                break;
            }
        }
        return isAllowd;
    }

    //将权限中的地址分开（例如有Uri="/be/customer,/be/comment"）
    public List<String> getprivilege(Set<Privilege> privileges){
        Set<String> set = new TreeSet<String>();
        for(Privilege privilege:privileges) {
            String[] uris = privilege.getUri().trim().split(",");
            if(uris!=null) {
                for(String uri:uris) {
                    set.add(uri);
                }
            }
        }
        return new ArrayList<>(set);
    }

    //获取请求地址
    public String getRequestUrl(HttpServletRequest request) {
        String context = request.getContextPath();
        String requestUri =  request.getRequestURI();
        String result = requestUri.substring(context.length());
        return result;
    }
}
