package com.base.personlol.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class SessionInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
            // 현재 요청이 AJAX 요청인 경우 처리를 건너뛰고 통과
            return true;
        }
        
        if (request.getSession().getAttribute("id") == null) {
            System.out.println("인터셉터 발동!");
            System.out.println("로그인 안되어있음");
            response.sendRedirect("/personlol/logine");
            return false;
        }
        
        return true;    
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        
    }
}