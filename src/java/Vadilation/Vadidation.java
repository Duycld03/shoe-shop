/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Vadilation;

import DAOs.ProductDAO;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author Doan Thanh Phuc - CE170580
 */
public class Vadidation {

    public static String CreateID(List<String> originalList, String ID) {
        List<Integer> numbers = new ArrayList<>();

        for (String originalString : originalList) {
            // Loại bỏ ký tự đặc biệt và chuyển đổi thành số nguyên
            String cleanedString = originalString.replaceAll("[^0-9]", "");
            if (!cleanedString.isEmpty()) {
                numbers.add(Integer.parseInt(cleanedString));
            }
        }
        int max = Integer.MIN_VALUE;

        for (int number : numbers) {
            if (number > max) {
                max = number;
            }
        }
        int nextNumber = max + 1;
        ID += nextNumber;
        return ID;
    }

    public static void main(String[] args) {
        List<String> originalList = new ArrayList<>();
        originalList.add("P17");
        originalList.add("P18");
        originalList.add("P21");
        originalList.add("P9");
        originalList.add("P25");
        String ID_draw = "Cus";
        String ID = CreateID(originalList, ID_draw);
        System.out.println(ID);
    }

}
