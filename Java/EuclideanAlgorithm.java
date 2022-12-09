package JavaBasic.lesson10;

import java.util.Scanner;

public class EuclideanAlgorithm {
    public static int getGreatestCommonDivisor(int dividend, int divisor) {
        if (divisor == 0) {
            return dividend;
        }

        return getGreatestCommonDivisor(divisor, dividend % divisor);
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Введите большее целое число:");
        int number1 = scanner.nextInt();

        System.out.println("Введите меньшее целое число:");
        int number2 = scanner.nextInt();

        if (number1 == 0 && number2 == 0) {
            System.out.println("Наибольший общий делитель не определяется");
        } else {
            System.out.println("Наибольший общий делитель данных чисел равен " + getGreatestCommonDivisor(number1, number2));
        }
    }
}