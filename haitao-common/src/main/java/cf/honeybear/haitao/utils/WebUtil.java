package cf.honeybear.haitao.utils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class WebUtil {


    //GET字符集设置处理
    public static Map<String, String> convertCharsetToUTF8(Map<String, String> searchMap) throws Exception {
        Iterator<Map.Entry<String, String>> entries = searchMap.entrySet().iterator();
        Map map = new HashMap();
        while (entries.hasNext()) {
            Map.Entry<String, String> entry = entries.next();
            map.put(new String(entry.getKey().getBytes("ISO8859-1"), "UTF-8"), new String(entry.getValue().getBytes("ISO8859-1"), "UTF-8"));
        }
        return map;
    }

    public static String getCityByIP(String ip) throws JSONException {
        /*if(ip.equals("0:0:0:0:0:0:0:1")){
            return "本地";
        }*/
        try {
            URL url = new URL("http://opendata.baidu.com/api.php?query=" + ip + "&co=&resource_id=6006&t=1433920989928&ie=utf8&oe=utf-8&format=json");
            URLConnection conn = url.openConnection();
            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
            String line = null;
            StringBuffer result = new StringBuffer();
            while ((line = reader.readLine()) != null) {
                result.append(line);
            }
            reader.close();
            JSONObject jsStr = JSONObject.parseObject(result.toString());
            JSONArray jsData = (JSONArray) jsStr.get("data");
            JSONObject data = (JSONObject) jsData.get(0);//位置
            return (String) data.get("location");
        } catch (IOException e) {
            return "读取失败";
        }
    }


    //浏览器类型
    public static String getBrowserName(String agent) {
		agent=agent.toLowerCase(); 
        if (agent.indexOf("msie 7") > 0) {
            return "ie7";
        } else if (agent.indexOf("msie 8") > 0) {
            return "ie8";
        } else if (agent.indexOf("msie 9") > 0) {
            return "ie9";
        } else if (agent.indexOf("msie 10") > 0) {
            return "ie10";
        } else if (agent.indexOf("msie") > 0) {
            return "ie";
        } else if (agent.indexOf("opera") > 0) {
            return "opera";
        } else if (agent.indexOf("chrome") > 0) {
            return "chrome";
        } else if (agent.indexOf("firefox") > 0) {
            return "firefox";
        } else if (agent.indexOf("webkit") > 0) {
            return "webkit";
        } else if (agent.indexOf("gecko") > 0 && agent.indexOf("rv:11") > 0) {
            return "ie11";
        } else {
            return "others";
        }
    }

  /**获取浏览器
   * @param request
   * @return
   */
  public static String getRequestBrowserInfo(HttpServletRequest request) {
        String browserVersion = null;
        String header = request.getHeader("user-agent");
        if(header == null || header.equals("")){
            return "";
        }
        if(header.indexOf("MSIE") > 0){
            browserVersion = "IE";
        }else if (header.indexOf("msie 7") > 0){
            browserVersion = "IE7";
        }else if (header.indexOf("msie 8") > 0){
            browserVersion = "IE8";
        }else if (header.indexOf("msie 9") > 0){
            browserVersion = "IE9";
        }else if (header.indexOf("msie 10") > 0){
            browserVersion = "IE10";
        }else if (header.indexOf("gecko") > 0 && header.indexOf("rv:11") > 0) {
            return "IE11";
        }else if(header.indexOf("Firefox") > 0){
            browserVersion = "Firefox";
        }else if(header.indexOf("Chrome") > 0){
            browserVersion = "Chrome";
        }else if(header.indexOf("Safari") > 0){
            browserVersion = "Safari";
        }else if(header.indexOf("Camino") > 0){
            browserVersion = "Camino";
        }else if(header.indexOf("Konqueror") > 0){
            browserVersion = "Konqueror";
        }else if(header.indexOf("edge") > 0){
            return "Edge";
        }
        return browserVersion;
    }

  /** 获取操作系统
   * @param request
   * @return
   */
  public static String getRequestOsInfo(HttpServletRequest request) {
        String browserOs = "";
        String header = request.getHeader("user-agent");
        if(header == null || header.equals("")){
            return "";
        }
        if(header.toLowerCase().contains("windows" )){
            browserOs = "Windows";
        }else if (header.toLowerCase().contains("mac" )){
            browserOs = "Mac";
        }else if (header.toLowerCase().contains("x11" )){
            browserOs = "Unix";
        }else if (header.toLowerCase().contains("android" )){
            browserOs = "Android";
        }else if (header.toLowerCase().contains("iphone" )){
            browserOs = "Iphone";
        }
        else if (header.toLowerCase().contains("ios" )){
            browserOs = "Ios";
        }else {
            browserOs = "UnKnown, More-Info: " + header;
        }
        return browserOs;
    }



  /** 获取ip地址
   * @param request
   * @return
   */
  public static String getIpAddr(HttpServletRequest request) {
        String ipAddress = request.getHeader("x-forwarded-for");
        if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("Proxy-Client-IP");
        }
        if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("WL-Proxy-Client-IP");
        }
        if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getRemoteAddr();
            if(ipAddress.equals("127.0.0.1") || ipAddress.equals("0:0:0:0:0:0:0:1")){
                //根据网卡取本机配置的IP
                InetAddress inet=null;
                try {
                    inet = InetAddress.getLocalHost();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                ipAddress= inet.getHostAddress();
            }
        }
        //对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
        if(ipAddress!=null && ipAddress.length()>15){ //"***.***.***.***".length() = 15
            if(ipAddress.indexOf(",")>0){
                ipAddress = ipAddress.substring(0,ipAddress.indexOf(","));
            }
        }
        return ipAddress;
    }

}
