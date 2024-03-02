/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package DAOs;

import Models.Product;
import Models.ProductImage;
import java.sql.ResultSet;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Doan Thanh Phuc - CE170580
 */
public class ProductDAOTest {

    public ProductDAOTest() {
    }

    /**
     * Test of searchProductByName method, of class ProductDAO.
     */
    @Test
    public void testSearchProductByName_Test_1() {
        String name = "";
        ProductDAO instance = new ProductDAO();
        int expectSize = 10;
        List<Product> result = instance.searchProductByName(name);
        int resultSize = result.size();
        assertEquals(expectSize, resultSize);
    }

    /**
     * Test of searchProductByName method, of class ProductDAO.
     */
    @Test
    public void testSearchProductByName_Test_2() {
        String name = "nike adios pro 3_A";
        ProductDAO instance = new ProductDAO();
        int expectSize = 1;
        List<Product> result = instance.searchProductByName(name);
        int resultSize = result.size();
        assertEquals(expectSize, resultSize);
    }
    /**
     * Test of searchProductByName method, of class ProductDAO.
     */
    @Test
    public void testSearchProductByName_Test_3() {
        String name = "Thuong Dinh";
        ProductDAO instance = new ProductDAO();
        int expectSize = 0;
        List<Product> result = instance.searchProductByName(name);
        int resultSize = result.size();
        assertEquals(expectSize, resultSize);
    }
    
    /**
     * Test of searchProductByName method, of class ProductDAO.
     */
    @Test
    public void testSearchProductByName_Test_4() {
        String name = "adios";
        ProductDAO instance = new ProductDAO();
        int expectSize = 7;
        List<Product> result = instance.searchProductByName(name);
        int resultSize = result.size();
        assertEquals(expectSize, resultSize);
    }
    
    

}
