package cn.wolfcode.crm.util;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter@Setter@NoArgsConstructor
public class JsonResult {
    private boolean success=true;
    private String msg;

    public JsonResult setErrorMsg(String msg){
        this.success=false;
        this.msg=msg;
        return this;
    }
}
