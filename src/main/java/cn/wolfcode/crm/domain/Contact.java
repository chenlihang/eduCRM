package cn.wolfcode.crm.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Getter
@Setter

public class Contact {

    private Long id;

    private String name;

    private Boolean gander;

    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;

    private String dept;

    private String duty;

    private String tel;

    private String qq;

    private String email;

    private Boolean main;

    private String intro;

    private Keyaccount keyaccount;
}
