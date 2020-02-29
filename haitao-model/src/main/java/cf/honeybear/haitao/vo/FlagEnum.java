package cf.honeybear.haitao.vo;

public enum  FlagEnum {

    NO("0","失败"),
    YES("200","成功");

    /**
     * 码值
     */
    private String code;
    /**
     * 描述
     */
    private String desc;

    FlagEnum(String code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDesc() {
        return desc;
    }
    public String getDesc(String code) {
        for (FlagEnum flagEnum:FlagEnum.values()){
            if (flagEnum.code.equals(code)){
                return flagEnum.desc;
            }
        }
        return "";
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}
