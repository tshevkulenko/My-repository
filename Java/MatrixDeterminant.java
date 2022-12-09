package JavaBasic.lesson14;

// Найти определитель матрицы
public class MatrixDeterminant {
    public static double[][] getLowerOrderMatrix(int rowIndex, int columnIndex, double[][] matrix) {
        double[][] resultMatrix = new double[matrix.length - 1][matrix.length - 1];
        int resultMatrixRowIndex = 0;

        for (int i = 0; i < matrix.length; ++i) {
            int resultMatrixColumnIndex = 0;

            if (i == rowIndex) {
                continue;
            }

            for (int j = 0; j < matrix.length; ++j) {
                if (j == columnIndex) {
                    continue;
                }

                resultMatrix[resultMatrixRowIndex][resultMatrixColumnIndex] = matrix[i][j];
                ++resultMatrixColumnIndex;
            }

            ++resultMatrixRowIndex;
        }

        return resultMatrix;
    }

    public static double getDeterminant(double[][] matrix) {
        if (matrix.length == 1) {
            return matrix[0][0];
        }

        if (matrix.length == 2) {
            return matrix[0][0] * matrix[1][1] - matrix[0][1] * matrix[1][0];
        }

        double determinant = 0;
        int sign = 1;

        for (int i = 0; i < matrix.length; ++i) {
            determinant += matrix[0][i] * sign * getDeterminant(getLowerOrderMatrix(0, i, matrix));
            sign = -sign;
        }

        return determinant;
    }

    public static void main(String[] args) {
        double[][] matrix = {
                {1.1, -2.2, 0, 0},
                {0, 1.3, 2.4, 0},
                {4.5, -4.6, 6.7, 1.8},
                {1.9, 0, 5, -3},
        };

        System.out.println("Определитель матрицы равен " + getDeterminant(matrix));
    }
}