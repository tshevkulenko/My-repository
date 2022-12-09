package JavaBasic.lesson13;

// Реализовать размытие изображения

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.awt.image.WritableRaster;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;

public class BlurImage {
    public static void main(String[] args) throws IOException {
        BufferedImage originalImage = ImageIO.read(new File("image.jpg"));
        WritableRaster originalRaster = originalImage.getRaster();

        int width = originalRaster.getWidth();
        int height = originalRaster.getHeight();

        BufferedImage resultImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        WritableRaster resultRaster = resultImage.getRaster();

        final int MATRIX_SIDE_LENGTH = 3;
        double[][] coefficientsMatrix = new double[MATRIX_SIDE_LENGTH][MATRIX_SIDE_LENGTH];
        final double MATRIX_COEFFICIENT = 1.0 / Math.pow(MATRIX_SIDE_LENGTH, 2);

        for (int i = 0; i < MATRIX_SIDE_LENGTH; ++i) {
            for (int j = 0; j < MATRIX_SIDE_LENGTH; ++j) {
                coefficientsMatrix[i][j] = MATRIX_COEFFICIENT;
            }
        }

        final int COLORS_COUNT_IN_RGB = 3;
        double[] currentPixel = new double[COLORS_COUNT_IN_RGB];
        double[] neighborPixel = new double[COLORS_COUNT_IN_RGB];

        int indentFromBorder = MATRIX_SIDE_LENGTH / 2;
        int xUpperLimit = width - indentFromBorder;
        int yUpperLimit = height - indentFromBorder;

        for (int y = indentFromBorder; y < yUpperLimit; ++y) {
            for (int x = indentFromBorder; x < xUpperLimit; ++x) {
                for (int neighborY = y - indentFromBorder, i = 0; i < MATRIX_SIDE_LENGTH; ++neighborY, ++i) {
                    for (int neighborX = x - indentFromBorder, j = 0; j < MATRIX_SIDE_LENGTH; ++neighborX, ++j) {
                        originalRaster.getPixel(neighborX, neighborY, neighborPixel);

                        for (int k = 0; k < COLORS_COUNT_IN_RGB; ++k) {
                            currentPixel[k] += neighborPixel[k] * coefficientsMatrix[i][j];
                        }
                    }
                }

                for (int i = 0; i < currentPixel.length; i++) {
                    currentPixel[i] = sat(currentPixel[i]);
                }

                resultRaster.setPixel(x, y, currentPixel);
                Arrays.fill(currentPixel, 0);
            }
        }

        ImageIO.write(resultImage, "jpg", new File("result.jpg"));
    }

    public static int sat(double number) {
        if (number <= 0) {
            return 0;
        }

        if (number >= 255) {
            return 255;
        }

        return (int) Math.round(number);
    }
}