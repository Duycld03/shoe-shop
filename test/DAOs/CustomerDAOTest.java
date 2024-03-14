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

//    User Name and password both valid
    @Test
    public void testCheckUserLogin_test_1() {
        String username = "PhuTH";
        String password = "12345";
        CustomerDAO instance = new CustomerDAO();
        boolean result = instance.checkLUserLogin(username, password);
        assertTrue(result);
    }

    //Do not exit user name
    @Test
    public void testCheckUserLogin_test_2() {
        String username = "abcxyz1";
        String password = "12345";
        CustomerDAO instance = new CustomerDAO();
        boolean result = instance.checkLUserLogin(username, password);
        assertFalse(result);
    }

    //Wrong pass word
    @Test
    public void testCheckUserLogin_test_3() {
        String username = "HaiNH03";
        String password = "";
        CustomerDAO instance = new CustomerDAO();
        boolean result = instance.checkLUserLogin(username, password);
        assertFalse(result);
    }

    //do not exit user name
    @Test
    public void testCheckUserLogin_test_4() {
        String username = "";
        String password = "";
        CustomerDAO instance = new CustomerDAO();
        boolean result = instance.checkLUserLogin(username, password);
        assertFalse(result);
    }

    //Doesn't accept encoding via md5
    @Test
    public void testCheckUserLogin_test_5() {
        String username = "PhuTH";
        String password = "e10adc3949ba59abbe56e057f20f883e";
        CustomerDAO instance = new CustomerDAO();
        boolean result = instance.checkLUserLogin(username, password);
        assertFalse(result);
    }

    @Test
    public void testCheckUserLogin_test_6() {
        String username = "PhuTH";
        String password = "123456";
        CustomerDAO instance = new CustomerDAO();
        boolean result = instance.checkLUserLogin(username, password);
        assertFalse(result);
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
