package cn.wolfcode.crm.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
/**
 * 客户实体类
 * @author CrystalBaby
 */
@Getter@Setter
public class Customer extends BaseDomain {

    /**
     * 客户姓名
     */
    private String name;

    /**
     * 客户微信
     */
    private String weChat;

    /**
     * 客户QQ
     */
    private String QQ;

    /**
     * 客户电话
     */
    private String tel;

    /**
     * 年龄
     */
    private Integer age;

    /**
     * 性别
     */
    private Boolean gender;

    /**
     * 邮箱
     */
    private String email;





    /**
     * 专业
     */
    private String major;

    /**
     * 学校
     */
    private String school;

    /**
     * 大学毕业时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date graduateTime;

    /**
     * 工作年限
     */
    private Integer workSeniority;

    /**
     * 录入人_ID
     */
    private Long inputUser_id;

    /**
     * 销售员_ID
     */
    private Long salesman_id;

    /**
     * 录入时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date inputTime;


    /**
     * 合作高校
     */
    private Long collegeClient;



    /**
     * 携带电脑
     */
    private Boolean computer;

    /**
     * 下次跟进日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date nextFollowDate;

    /**
     * 关注问题
     */
    private String concern;

    /**
     * 备注
     */
    private String remark;

    //////-----------------------------------------------------/////////////////////////////////
    /**
     * 学历
     */
    private Integer diplomas;
    /**
     * 省份
     */
    private DataDictionaryItem province;


    /**
     * 客户来源
     */
    private DataDictionaryItem source;

    /**
     * 客户类型
     */
    private DataDictionaryItem clientType;

    /**
     * 意向校区
     */
    private DataDictionaryItem intentionCampus;

    /**
     * 意向学科
     */
    private DataDictionaryItem intentionSubject;

    /**
     * 意向班级
     */
    private DataDictionaryItem intentionClass;

    /**
     * 意向程度
     */
    private DataDictionaryItem intentionExtent;

    /**
     * 当前状态
     */
    private DataDictionaryItem state;






}