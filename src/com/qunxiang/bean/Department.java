package com.qunxiang.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * Department entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="department"
    ,catalog="qunxiang"
)

public class Department  implements java.io.Serializable {


    // Fields    

     private Integer departmentId;
     private String departmentName;


    // Constructors

    /** default constructor */
    public Department() {
    }

    
    /** full constructor */
    public Department(String departmentName) {
        this.departmentName = departmentName;
    }

   
    // Property accessors
    @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="department_id", unique=true, nullable=false)

    public Integer getDepartmentId() {
        return this.departmentId;
    }
    
    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }
    
    @Column(name="department_name")

    public String getDepartmentName() {
        return this.departmentName;
    }
    
    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }
   








}