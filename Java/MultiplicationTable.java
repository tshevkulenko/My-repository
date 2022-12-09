package JavaBasic.lesson9;

// Написать функцию, которая создает двумерный массив с таблицей умножения

import java.util.Scanner;

public class MultiplicationTable {
    public static int[][] getMultiplicationTableArray(int lastNumber) {
        int[][] multiplicationTableArray = new int[lastNumber][lastNumber];

        for (int i = 0; i < lastNumber; ++i) {
            for (int j = 0; j < lastNumber; ++j) {
                multiplicationTableArray[i][j] = (i + 1) * (j + 1);
            }
        }

        return multiplicationTableArray;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Введите конечное число таблицы умножения:");
        int lastNumber = scanner.nextInt();

        int[][] multiplicationTableArray = getMultiplicationTableArray(lastNumber);

        for (int[] row : multiplicationTableArray) {
            for (int e : row) {
                System.out.printf("%5d", e);
            }

            System.out.println();
        }
    }
}