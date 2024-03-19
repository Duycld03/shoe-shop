/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package DAOs;

import Models.Customer;
import Utils.MD5;
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
public class CustomerDAOTest {

    public CustomerDAOTest() {
    }

    //invalid username
    @Test
    public void testCheckUserLogin_test_1() {
        String username = "";
        String password = "";
        CustomerDAO instance = new CustomerDAO();
        boolean result = instance.checkLUserLogin(username, password);
        assertFalse(result);
    }

    //Do not exit user name
    @Test
    public void testCheckUserLogin_test_2() {
        String username = "TungDT111111";
        String password = "12345678910";
        CustomerDAO instance = new CustomerDAO();
        boolean result = instance.checkLUserLogin(username, password);
        assertFalse(result);
    }

    //invalid password
    @Test
    public void testCheckUserLogin_test_3() {
        String username = "Phucdt1123";
        String password = "12345";
        CustomerDAO instance = new CustomerDAO();
        boolean result = instance.checkLUserLogin(username, password);
        assertFalse(result);
    }

    //invalid username
    @Test
    public void testCheckUserLogin_test_4() {
        String username = "Phuc";
        String password = "12345678910";
        CustomerDAO instance = new CustomerDAO();
        boolean result = instance.checkLUserLogin(username, password);
        assertFalse(result);
    }

    //invalid username
    @Test
    public void testCheckUserLogin_test_5() {
        String username = "example_Phuc_123456789012312312312";
        String password = "12345678910Phuc@";
        CustomerDAO instance = new CustomerDAO();
        boolean result = instance.checkLUserLogin(username, password);
        assertFalse(result);
    }

    //user exited
    @Test
    public void testCheckUserLogin_test_6() {
        String username = "Phucdt1123";
        String password = "12345678910Phuc@";
        CustomerDAO instance = new CustomerDAO();
        boolean result = instance.checkLUserLogin(username, password);
        assertTrue(result);
    }

    //test useerpassword Boundary value
    @Test
    public void testCheckUserLogin_test_7() {
        String username = "TienDM";
        String password = "12345678";
        CustomerDAO instance = new CustomerDAO();
        boolean result = instance.checkLUserLogin(username, password);
        assertTrue(result);
    }

    //test useername Boundary value
    @Test
    public void testCheckUserLogin_test_8() {
        String username = "Phucdt1123Phucdt1123Phucdt1";
        String password = "12345678";
        CustomerDAO instance = new CustomerDAO();
        boolean result = instance.checkLUserLogin(username, password);
        assertTrue(result);
    }

    @Test
    public void testCheckcustomerInforExist_test_1() {
        String userName = "";
        String email = "";
        String PhoneNumber = "";
        CustomerDAO instance = new CustomerDAO();
        boolean res = instance.checkCustomerInforExist(email, userName, PhoneNumber);
        assertFalse(res);
    }

    @Test
    public void testCheckcustomerInforExist_test_2() {
        String userName = "PhuTH";
        String email = "";
        String PhoneNumber = "";
        CustomerDAO instance = new CustomerDAO();
        boolean res = instance.checkCustomerInforExist(email, userName, PhoneNumber);
        assertTrue(res);
    }

    @Test
    public void testCheckcustomerInforExist_test_3() {
        String userName = "";
        String email = "";
        String PhoneNumber = "0969123662";
        CustomerDAO instance = new CustomerDAO();
        boolean res = instance.checkCustomerInforExist(email, userName, PhoneNumber);
        assertTrue(res);
    }

    @Test
    public void testCheckcustomerInforExist_test_4() {
        String userName = "";
        String email = "PhuTH@email.com";
        String PhoneNumber = "";
        CustomerDAO instance = new CustomerDAO();
        boolean res = instance.checkCustomerInforExist(email, userName, PhoneNumber);
        assertTrue(res);
    }

    @Test
    public void testCheckcustomerInforExist_test_5() {
        String userName = "PhuTH";
        String email = "PhuTH@email.com";
        String PhoneNumber = "0969123662";
        CustomerDAO instance = new CustomerDAO();
        boolean res = instance.checkCustomerInforExist(email, userName, PhoneNumber);
        assertTrue(res);
    }

    //Test infor was exited
    //Email exited
    @Test
    public void testCheckcustomerInforExist_test_6() {
        String userName = "";
        String email = "PhuTH@email.com";
        String PhoneNumber = "0969123662";
        CustomerDAO instance = new CustomerDAO();
        boolean res = instance.checkCustomerInforExist(email, userName, PhoneNumber);
        assertTrue(res);
    }

    @Test
    public void testCheckcustomerInforExist_test_7() {
        String userName = "";
        String email = "";
        String PhoneNumber = "0969123662";
        CustomerDAO instance = new CustomerDAO();
        boolean res = instance.checkCustomerInforExist(email, userName, PhoneNumber);
        assertTrue(res);
    }

    @Test
    public void testCheckcustomerInforExist_test_8() {
        String userName = "PhuTH";
        String email = "";
        String PhoneNumber = "0969123662";
        CustomerDAO instance = new CustomerDAO();
        boolean res = instance.checkCustomerInforExist(email, userName, PhoneNumber);
        assertTrue(res);
    }

    //information do not exit
    @Test
    public void testCheckcustomerInforExist_test_10() {
        String userName = "DoanTP";
        String email = "phucdt11230@gmail.com";
        String PhoneNumber = "0334237435";
        CustomerDAO instance = new CustomerDAO();
        boolean res = instance.checkCustomerInforExist(email, userName, PhoneNumber);
        assertFalse(res);
    }
}
