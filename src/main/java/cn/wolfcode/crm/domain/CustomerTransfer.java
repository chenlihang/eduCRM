package cn.wolfcode.crm.domain;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
@Getter@Setter
public class CustomerTransfer extends BaseDomain{
    //被移交的客户
    private Customer customer;
    //移交时间
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date inputTime;
    //录入人
    private Employee inputUser;
    //现任
    private Employee newOwner;
    //前任
    private Employee prevOwner;
}