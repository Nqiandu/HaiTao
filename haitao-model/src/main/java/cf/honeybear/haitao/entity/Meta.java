package cf.honeybear.haitao.entity;

import lombok.Data;

import java.io.Serializable;
@Data
public class Meta implements Serializable {
    private Boolean keepAlive;//菜单切换时间是否保活

    private Boolean requireAuth;//是否登陆后才能访问

    public Boolean getKeepAlive() {
        return keepAlive;
    }

    public void setKeepAlive(Boolean keepAlive) {
        this.keepAlive = keepAlive;
    }

    public Boolean getRequireAuth() {
        return requireAuth;
    }

    public void setRequireAuth(Boolean requireAuth) {
        this.requireAuth = requireAuth;
    }
}
