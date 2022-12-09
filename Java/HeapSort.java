package JavaBasic.lesson11;

// Реализовать пирамидальную сортировку

import java.util.Arrays;

public class HeapSort {
    public static void sift(int[] array, int heapLength, int i) { // приводим массив к виду кучи, для каждого элемента выполняем просеивание
        int leftChildIndex = 2 * i + 1;
        int rightChildIndex = 2 * i + 2;

        while (leftChildIndex < heapLength) { // есть хотя бы один ребенок
            int maxElementIndex = i; // элемент с индексом i - родитель, пока максимальный элемент

            if (array[leftChildIndex] > array[maxElementIndex]) { // если первый ребенок больше макс элемента
                maxElementIndex = leftChildIndex; // то первый ребенок становится макс элементом
            }

            if (rightChildIndex < heapLength && array[rightChildIndex] > array[maxElementIndex]) { // если есть второй ребенок и он больше макс элемента
                maxElementIndex = rightChildIndex; // то второй ребенок становится макс элементом
            }

            if (maxElementIndex == i) { // если макс элемент - родитель, то просеивание завершено
                return;
            }

            int temp = array[i]; // если макс элемент не родитель, то меняем местами родителя и макс элемент
            array[i] = array[maxElementIndex];
            array[maxElementIndex] = temp;

            i = maxElementIndex;
            leftChildIndex = 2 * i + 1;
            rightChildIndex = 2 * i + 2;
        }
    }

    public static void heapSort(int[] array) {
        for (int i = array.length / 2 - 1; i >= 0; i--) { // приводим массив к виду кучи
            sift(array, array.length, i); // для каждого элемента выполняем просеивание
        }

        for (int i = array.length - 1; i >= 1; i--) { // меняем местами макс элемент (теперь нулевой) с последним элементом, уменьшаем массив на 1 элемент
            int temp = array[0];
            array[0] = array[i];
            array[i] = temp;

            sift(array, i, 0); // приводим массив новой длины к виду кучи, просеиваем нулевой элемент
        }
    }

    public static void main(String[] args) {
        int[] array = {23, 5, 6, 78, 3, 6, 0, 32, 1, 4, 4};
        heapSort(array);
        System.out.println(Arrays.toString(array));
    }
}