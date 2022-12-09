package JavaBasic.lesson12;

// Прочитать текст из файла, и написать функцию, которая
// считает количество вхождений некоторой строки в этот
// текст без учета регистра символов

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class OccurrencesCount {
    public static void main(String[] args) throws FileNotFoundException {
        try (Scanner scanner = new Scanner(new FileInputStream("text.txt"))) {
            String stringToFind = "aaa";
            int occurrencesInTextCount = 0;

            while (scanner.hasNextLine()) {
                occurrencesInTextCount += getOccurrencesInLineCount(scanner.nextLine(), stringToFind);
            }

            System.out.println("Количество вхождений данной строки в текст равно " + occurrencesInTextCount);
        }
    }

    public static int getOccurrencesInLineCount(String string, String stringToFind) {
        stringToFind = stringToFind.toLowerCase();
        string = string.toLowerCase();

        if (stringToFind.isEmpty() || string.isEmpty()) {
            return 0;
        }

        int occurrencesInLineCount = 0;
        int index = string.indexOf(stringToFind);

        while (index != -1) {
            ++occurrencesInLineCount;

            int startIndex = index + stringToFind.length();
            index = string.indexOf(stringToFind, startIndex);
        }

        return occurrencesInLineCount;
    }
}