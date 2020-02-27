package cf.honeybear.haitao.vo;

import lombok.Data;

import java.io.Serializable;

/** 定义统一的返回值类型
 * code:返回状态码
 * msg:返回消息（"保存错误"）
 * */
@Data
public class Result implements Serializable {
    private Object object;
    private FlagEnum code;
    private String msg;
    private int tatal;
    private Object other;

    public Result(Object object, FlagEnum code, String msg, int tatal, Object other) {
        this.object = object;
        this.code = code;
        this.msg = msg;
        this.tatal = tatal;
        this.other = other;
    }

    public Result(FlagEnum code, String msg, int tatal, Object other) {
        this.code = code;
        this.msg = msg;
        this.tatal = tatal;
        this.other = other;
    }
    public Result(Object object, FlagEnum code, String msg) {
        this.object = object;
        this.code = code;
        this.msg = msg;
    }
    public Result(FlagEnum code, String msg) {
        this.code = code;
        this.msg = msg;
    }

}
