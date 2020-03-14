package cf.honeybear.haitao.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**地址信息 */
@Data
public class Address implements Serializable {
    private Integer id;

    private String name;

    private String othername;

    private String phone;

    private Integer province;

    private String provinceStr;

    private Integer city;

    private String cityStr;

    private Integer area;

    private String areaStr;

    private String detailadress;

    private String pca;

    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createtime;

    private Integer defaultaddress;

    private Integer binding;

    private String remarks;


    private static final long serialVersionUID = 1L;

    public Address() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getOthername() {
        return othername;
    }

    public void setOthername(String othername) {
        this.othername = othername == null ? null : othername.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }


    public String getDetailadress() {
        return detailadress;
    }

    public void setDetailadress(String detailadress) {
        this.detailadress = detailadress == null ? null : detailadress.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Integer getDefaultaddress() {
        return defaultaddress;
    }

    public void setDefaultaddress(Integer defaultaddress) {
        this.defaultaddress = defaultaddress;
    }

    public Integer getBinding() {
        return binding;
    }

    public void setBinding(Integer binding) {
        this.binding = binding;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", name=").append(name);
        sb.append(", othername=").append(othername);
        sb.append(", phone=").append(phone);
        sb.append(", province=").append(province);
        sb.append(", city=").append(city);
        sb.append(", area=").append(area);
        sb.append(", detailadress=").append(detailadress);
        sb.append(", createtime=").append(createtime);
        sb.append(", defaultaddress=").append(defaultaddress);
        sb.append(", binding=").append(binding);
        sb.append(", remarks=").append(remarks);
        sb.append("]");
        return sb.toString();
    }

}