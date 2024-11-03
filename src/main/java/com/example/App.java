package com.example;

/**
 * Hello world!
 *
 */
public class App {


    public static void main(String[] args) {
        // Print a greeting message
        System.out.println("Welcome to MyApp!");

        // Example usage of a method
        int number = 5;
        System.out.println("Factorial of " + number + " is " + factorial(number));
}

    /**
     * Calculates the factorial of a given number.
     * @param n the number to calculate the factorial of
     * @return the factorial of the number
     */
    public static int factorial(int n) {
        if (n == 0) {
            return 1;
        } else {
            return n * factorial(n - 1);
        }
    }
}