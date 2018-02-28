package cn.wolfcode.crm.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Classroom {
    private Long id;

    private String name;

    private String address;

    private Integer seats;

    private String remark;

    private Byte state;


}