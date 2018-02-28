package cn.wolfcode.crm.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DataDictionaryItem extends BaseDomain {
    private  String name;
    private  DataDictionary parent;
    private  String intro;

}
