package cf.honeybear.haitao.controller;

import cf.honeybear.haitao.vo.FlagEnum;
import cf.honeybear.haitao.vo.Result;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class BaseException {

    @ExceptionHandler(Exception.class)
    @ResponseBody
    public Result error(Exception e){
        e.printStackTrace();
        System.out.println("调用了公共异常处理类");
        return new Result(FlagEnum.NO,e.getMessage());
    }
}
