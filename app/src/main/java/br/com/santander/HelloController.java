package br.com.santander;

import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    @RequestMapping({"/"})
    public String index() {
        StringBuffer buffer = new StringBuffer();

        buffer.append("<!DOCTYPE html>");
        buffer.append("<html>");
        buffer.append("<head>");
        buffer.append("<meta charset=\"UTF-8\">");
        buffer.append("<title>Environment Variables</title>");
        buffer.append("</head>");

        buffer.append("<body>");

        buffer.append("<h1> System Environment Variables </h1>");

        Map<String, String> envs = System.getenv();

        buffer.append("<style type=\"text/css\">");
        buffer.append(".tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}");
        buffer.append(".tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}");
        buffer.append(".tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}");
        buffer.append(".tg .tg-e3zv{font-weight:bold}");
        buffer.append(".tg .tg-rc10{background-color:#f9f9f9;font-weight:bold}");
        buffer.append(".tg .tg-4eph{background-color:#f9f9f9}");
        buffer.append("</style>");
        buffer.append("<table class=\"tg\">");
        buffer.append("<tr>");
        buffer.append("<th class=\"tg-e3zv\">Key</th>");
        buffer.append("<th class=\"tg-e3zv\">Value</th>");
        buffer.append("</tr>");

        Map<String, String> treeMap = new TreeMap(envs);
        for (Map.Entry<String, String> entry : treeMap.entrySet()) {
            buffer.append("<tr>");
            buffer.append("<td class=\"tg-rc10\">" + (String) entry.getKey() + "</td>");
            buffer.append("<td class=\"tg-4eph\">" + (String) entry.getValue() + "</td>");
            buffer.append("</tr>");
        }
        buffer.append("</table>");

        buffer.append("</body>");

        buffer.append("</html>");

        return buffer.toString();
    }
}
