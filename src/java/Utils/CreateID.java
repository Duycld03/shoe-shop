/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Doan Thanh Phuc - CE170580
 */
public class CreateID {

	public static String autoIncreaseID(List<String> originalList, String ID) {
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

}
