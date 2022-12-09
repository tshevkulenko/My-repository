package JavaBasic.lesson10;

// Реализовать вариант бинарного поиска с рекурсией и без рекурсии

public class BinarySearch {
    public static int binarySearchRecursion(int[] array, int left, int right, int x) {
        if (left > right) {
            return -1;
        }

        int middle = (left + right) / 2;

        if (array[middle] < x) {
            return binarySearchRecursion(array, middle + 1, right, x);
        }

        if (array[middle] > x) {
            return binarySearchRecursion(array, left, middle - 1, x);
        }

        return middle;
    }

    public static int binarySearch(int[] array, int left, int right, int x) {
        while (left <= right) {
            int middle = (left + right) / 2;

            if (array[middle] < x) {
                left = middle + 1;
                continue;
            }

            if (array[middle] > x) {
                right = middle - 1;
                continue;
            }

            return middle;
        }

        return -1;
    }

    public static void main(String[] args) {
        int[] array = {1, 2, 5, 7, 10, 12};
        int left = 0;
        int right = array.length - 1;
        int x = 8;

        System.out.println("Индекс, по которому лежит заданное число, равен " + binarySearchRecursion(array, left, right, x));
        System.out.println("Индекс, по которому лежит заданное число, равен " + binarySearch(array, left, right, x));
    }
}