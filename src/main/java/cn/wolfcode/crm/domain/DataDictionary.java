package cn.wolfcode.crm.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class DataDictionary extends BaseDomain {
    private  String name;
    private  String sn;
    private  String intro;
    private List<DataDictionaryItem> items = new ArrayList<>();

}
