package cn.wolfcode.crm.domain;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Classmanagement {
    private Long id;

    private String gradeuser;

    private Integer studenquantity;

    private DataDictionary college;

    private Boolean gradestate;

    private Classroom room;

    private Employee emp;

}