package cn.wolfcode.crm.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
@Getter
@Setter
public class Classschedule extends BaseDomain{


    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date time;

    private String week;

    private Classmanagement grade;

    private String charge;

    private String coursename;

    private String attendacher;

    private Classroom classroom;

    private String remark;

    private String state;


}