package cn.wolfcode.crm.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter@Setter
public class Keyaccount  extends BaseDomain{


    private String name;

    private String address;

    private DataDictionaryItem importance;

    private DataDictionaryItem intentionLevel;

    private DataDictionaryItem subject;

    private DataDictionaryItem college;

    private Contact contact;

    private Employee marketer;

    private Employee tracer;

    private Date prevTranceTime;

    private Date nextTranceTime;

    private boolean traceState;

    private Long schoolTel;

    private boolean customerStatus;

    private String email;

    private Long stuNumber;

    private Long itstuNumber;

    private DataDictionaryItem type;

    private DataDictionaryItem educate;

    private String telegraph;

    private String postcode;

    private String teacherNumber;

    private String remark;

    private String introduction;

    private boolean cooperation;


}