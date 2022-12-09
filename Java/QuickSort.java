package JavaBasic.lesson11;

import java.util.Arrays;

public class QuickSort {
    public static void quickSort(int[] array, int left, int right) {
        int arrayLength = right - left + 1;

        if (arrayLength <= 1) {
            return;
        }

        if (arrayLength == 2) {
            if (array[left] > array[right]) {
                int temp = array[left];
                array[left] = array[right];
                array[right] = temp;
            }

            return;
        }

        int i = left;
        int j = right;

        int supportElement = (array[left] + array[right]) / 2;

        while (i <= j) {
            while (array[i] < supportElement) {
                ++i;
            }

            while (array[j] > supportElement) {
                --j;
            }

            if (i <= j) {
                int temp = array[i];
                array[i] = array[j];
                array[j] = temp;

                ++i;
                --j;
            }
        }

        if (i < right) {
            quickSort(array, i, right);
        }

        if (j > left) {
            quickSort(array, left, j);
        }
    }

    public static void main(String[] args) {
        int[] array = {23, 5, 6, 78, 3, 6, 0, 32, 1, 4, 4};
        quickSort(array, 0, array.length - 1);
        System.out.println(Arrays.toString(array));
    }
}