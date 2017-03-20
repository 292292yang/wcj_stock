package cn.zhisheng.repository;

import cn.zhisheng.model.StockEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by 10412 on 2016/12/22.
 */
@Repository
public interface StockRepository extends JpaRepository<StockEntity, Integer>
{
    // 修改库存
    @Modifying
    @Transactional
    @Query("update StockEntity stock set stock.partNO=:ppartNO, stock.partName=:ppartName," +
            " stock.model=:pmodel, stock.loc=:ploc,stock.quantity=:pquantity,stock.price=:pprice where stock.id=:pid")
    void updateStock(@Param("ppartNO") String partNO, @Param("ppartName") String partName, @Param("pmodel") String model,
                           @Param("ploc") String loc, @Param("pquantity") int quantity, @Param("pprice")BigDecimal price,
                           @Param("pid") int id);

    @Query("SELECT s FROM  StockEntity s WHERE s.partName like :partName")
    List<StockEntity> queryByPartName(@Param("partName")String partName);
}
