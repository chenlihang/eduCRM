package cn.wolfcode.crm.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Getter@Setter
public class Employee extends BaseDomain {
    private String username;
    private String realname;
    private String password;
    private String tel;
    private String email;

    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date inputTime;
    private Boolean state =true;//true在职
    private Boolean admin;
    private Department dept;

    private List<Role> roles = new ArrayList<>();
}