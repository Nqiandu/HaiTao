package cf.honeybear.haitao.vo;

import java.io.Serializable;

/**
 * @Author JN
 * @Date 2020/3/6 22:50
 * @Version 1.0
 **/
public class ResultBean implements Serializable {
    private Integer code;
    private String msg;
    private Object obj;
    private int total;


    public ResultBean(){

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

    public ResultBean(Integer code, String msg, Object obj) {
        this.code = code;
        this.msg = msg;
        this.obj = obj;
    }

    public ResultBean(Integer code, String msg, Object obj,Integer total) {
        this.code = code;
        this.msg = msg;
        this.obj = obj;
        this.total = total;
    }

    public ResultBean(Integer code,Object obj,Integer total) {
        this.code = code;
        this.obj = obj;
        this.total = total;
    }

    public ResultBean(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }
    public ResultBean(Object obj) {
        this.obj = obj;
    }


    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}
