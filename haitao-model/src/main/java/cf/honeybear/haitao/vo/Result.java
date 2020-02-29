package cf.honeybear.haitao.vo;

import lombok.Data;

import java.io.Serializable;

/** 定义统一的返回值类型
 * code:返回状态码
 * msg:返回消息（"保存错误"）
 * */
public class Result implements Serializable {
    private Integer code;
    private String msg;
    private Object obj;

    public static Result ok(String msg){
        return new Result(200,msg,null);
    }
    public static Result ok(String msg,Object obj){
        return new Result(200,msg,obj);
    }

    public static Result erro(String msg){
        return new Result(500,msg,null);
    }
    public static Result erro(String msg,Object obj){
        return new Result(500,msg,obj);
    }
    public Result(){

    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getObj() {
        return obj;
    }

    public void setObj(Object obj) {
        this.obj = obj;
    }

    public Result(Integer code, String msg, Object obj) {
        this.code = code;
        this.msg = msg;
        this.obj = obj;
    }
    public Result(Integer code, String msg) {
        this.code = code;
        this.msg = msg;

    }
}
