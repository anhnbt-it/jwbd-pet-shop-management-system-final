package dao;

import model.entities.Product;


import java.sql.SQLException;
import java.util.List;

public interface iProductDao {
    Product selectProduct(int id);
    List<Product> selectAllProduct();
}
