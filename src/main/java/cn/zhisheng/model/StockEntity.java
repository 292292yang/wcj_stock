package cn.zhisheng.model;

import org.springframework.context.annotation.Primary;

import javax.persistence.*;
import java.math.BigDecimal;

/**
 * Created by 10412 on 2016/12/21.
 */
@Entity
@Table(name = "stock", schema = "springdemo", catalog = "")
public class StockEntity
{
    /**
     * 主键
     */
    private int id;
    /**
     * 配件号
     */
    private String partNO;

    /**
     * 配件名称
     */
    private String partName;

    /**
     * 适用车型
     */
    private String model;

    /**
     * 保存位置
     */
    private String loc;

    /**
     * 剩余数量
     */
    private Integer quantity;

    /**
     * 单价
     */
    private BigDecimal price;

    @Id
    @Column(name = "id", nullable = false)
    @Primary
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "partNO", nullable = false, length = 200)
    public String getPartNO() {
        return partNO;
    }

    public void setPartNO(String partNO) {
        this.partNO = partNO;
    }

    @Basic
    @Column(name = "partName", nullable = false, length = 200)
    public String getPartName() {
        return partName;
    }

    public void setPartName(String partName) {
        this.partName = partName;
    }

    @Basic
    @Column(name = "model", nullable = false, length = 200)
    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    @Basic
    @Column(name = "loc", nullable = false, length = 200)
    public String getLoc() {
        return loc;
    }

    public void setLoc(String loc) {
        this.loc = loc;
    }

    @Basic
    @Column(name = "quantity", nullable = false, length = 200)
    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    @Basic
    @Column(name = "price", nullable = false, length = 200)
    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}
