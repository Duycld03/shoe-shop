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
    private ProductDAO proDao = new ProductDAO();

    /**
     * Test of searchProductByName method, of class ProductDAO.
     */
//    @Test
//    public void testSearchProductByName_Test_1() {
//        String name = "";
//        int expectSize = 23;
//        List<Product> result = proDao.searchProductByName(name);
//        int resultSize = result.size();
//        assertEquals(expectSize, resultSize);
//    }

    /**
     * Test of searchProductByName method, of class ProductDAO.
     */
    //Test search Product by name
    @Test
    public void testSearchProductByName_Test_2() {
        String name = "Adidas Adios Pro 3";
        int expectSize = 1;
        List<Product> result = proDao.searchProductByName(name);
        int resultSize = result.size();
        assertEquals(expectSize, resultSize);
    }

//    /**
//     * Test of searchProductByName method, of class ProductDAO.
//     */
//    @Test
//    public void testSearchProductByName_Test_3() {
//        String name = "Thuong Dinh";
//        int expectSize = 0;
//        List<Product> result = proDao.searchProductByName(name);
//        int resultSize = result.size();
//        assertEquals(expectSize, resultSize);
//    }

    /**
     * Test of searchProductByName method, of class ProductDAO.
     */
    @Test
    public void testSearchProductByName_Test_4() {
        String name = "Adios";
        int expectSize = 2;
        List<Product> result = proDao.searchProductByName(name);
        int resultSize = result.size();
        assertEquals(expectSize, resultSize);
    }

    //Invalid ProductID
//    @Test
//    public void testAddProduct_test_1() {
//        String productID = "";
//        String productName = "";
//        float price = 0;
//        float discount = 0;
//        String description = "";
//        boolean isDelect = true;
//        String BrandId = "";
//        Product newPro = new Product(productID, productName, price, discount, description, BrandId, isDelect);
//        boolean res = proDao.addProduct(newPro);
//        assertFalse(res);
//
//    }

    //Invalid ProductID
//    @Test
//    public void testAddProduct_test_2() {
//        String productID = "24P";
//        String productName = "";
//        float price = 0;
//        float discount = 0;
//        String description = "";
//        boolean isDelect = true;
//        String BrandId = "";
//        Product newPro = new Product(productID, productName, price, discount, description, BrandId, isDelect);
//        boolean res = proDao.addProduct(newPro);
//        assertFalse(res);
//
//    }

    //ProductID was exited
//    @Test
//    public void testAddProduct_test_3() {
//        String productID = "P11";
//        String productName = "";
//        float price = 0;
//        float discount = 0;
//        String description = "";
//        boolean isDelect = true;
//        String BrandId = "";
//        Product newPro = new Product(productID, productName, price, discount, description, BrandId, isDelect);
//        boolean res = proDao.addProduct(newPro);
//        assertFalse(res);
//
//    }

    //Invalid Product Name
//    @Test
//    public void testAddProduct_test_4() {
//        String productID = "P24";
//        String productName = "";
//        float price = 0;
//        float discount = 0;
//        String description = "";
//        boolean isDelect = false;
//        String BrandId = "Br2";
//        Product newPro = new Product(productID, productName, price, discount, description, BrandId, isDelect);
//        boolean res = proDao.addProduct(newPro);
//        assertFalse(res);
//    }

     //Test Demo for add product
    //Product name was exited
    @Test
    public void testAddProduct_test_5() {
        String productID = "P24";
        String productName = "adidas adios pro 3_A";
        float price = 0;
        float discount = 0;
        String description = "Enhanced stability for a comfortable movement experience";
        boolean isDelect = true;
        String BrandId = "Br2";
        Product newPro = new Product(productID, productName, price, discount, description, BrandId, isDelect);
        boolean res = proDao.addProduct(newPro);
        assertFalse(res);
    }

    //invalid price
//    @Test
//    public void testAddProduct_test_6() {
//        String productID = "P24";
//        String productName = "adidas adios pro 3_A2";
//        float price = 0;
//        float discount = 0;
//        String description = "";
//        boolean isDelect = false;
//        String BrandId = "Br2";
//        Product newPro = new Product(productID, productName, price, discount, description, BrandId, isDelect);
//        boolean res = proDao.addProduct(newPro);
//        assertFalse(res);
//    }

    //invalid price
//    @Test
//    public void testAddProduct_test_7() {
//        String productID = "P24";
//        String productName = "adidas adios pro 3_A2";
//        float price = -1000;
//        float discount = 0;
//        String description = "Enhanced stability for a comfortable movement experience";
//        boolean isDelect = true;
//        String BrandId = "Br2";
//        Product newPro = new Product(productID, productName, price, discount, description, BrandId, isDelect);
//        boolean res = proDao.addProduct(newPro);
//        assertFalse(res);
//    }

    //invalid discount
//    @Test
//    public void testAddProduct_test_8() {
//        String productID = "P24";
//        String productName = "adidas adios pro 3_A2";
//        float price = 10;
//        float discount = -1000;
//        String description = "";
//        boolean isDelect = false;
//        String BrandId = "Br2";
//        Product newPro = new Product(productID, productName, price, discount, description, BrandId, isDelect);
//        boolean res = proDao.addProduct(newPro);
//        assertFalse(res);
//    }

    //brand do not exit
//    @Test
//    public void testAddProduct_test_9() {
//        String productID = "P24";
//        String productName = "adidas adios pro 3_A2";
//        float price = (float) 2.7;
//        float discount = 0;
//        String description = "Enhanced stability for a comfortable movement experience";
//        boolean isDelect = true;
//        String BrandId = "";
//        Product newPro = new Product(productID, productName, price, discount, description, BrandId, isDelect);
//        boolean res = proDao.addProduct(newPro);
//        assertFalse(res);
//    }

    //Brand do not exit
//    @Test
//    public void testAddProduct_test_10() {
//        String productID = "P24";
//        String productName = "adidas adios pro 3_A2";
//        float price = 10;
//        float discount = (float) 3.2;
//        String description = "Enhanced stability for a comfortable movement experience";
//        boolean isDelect = true;
//        String BrandId = "Br10";
//        Product newPro = new Product(productID, productName, price, discount, description, BrandId, isDelect);
//        boolean res = proDao.addProduct(newPro);
//        assertFalse(res);
//    }

    //success
//    @Test
//    public void testAddProduct_test_11() {
//        String productID = "P24";
//        String productName = "adidas adios pro 3_A2";
//        float price = 10;
//        float discount = (float) 3.2;
//        String description = "Enhanced stability for a comfortable movement experience";
//        boolean isDelect = false;
//        String BrandId = "Br2";
//        Product newPro = new Product(productID, productName, price, discount, description, BrandId, isDelect);
//        boolean res = proDao.addProduct(newPro);
//        assertTrue(res);
//    }

}
