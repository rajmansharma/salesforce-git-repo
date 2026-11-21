/**
 * Calculator
 * A simple calculator utility class demonstrating basic Apex concepts:
 * static methods, Decimal math, exception handling, and a custom exception.
 */
public with sharing class Calculator {

    /** Custom exception thrown for invalid calculator operations. */
    public class CalculatorException extends Exception {}

    public static Decimal add(Decimal a, Decimal b) {
        validate(a, b);
        return a + b;
    }

    public static Decimal subtract(Decimal a, Decimal b) {
        validate(a, b);
        return a - b;
    }

    public static Decimal multiply(Decimal a, Decimal b) {
        validate(a, b);
        return a * b;
    }

    public static Decimal divide(Decimal a, Decimal b) {
        validate(a, b);
        if (b == 0) {
            throw new CalculatorException('Division by zero is not allowed.');
        }
        // Round to 4 decimal places to avoid long repeating decimals
        return (a / b).setScale(4, RoundingMode.HALF_UP);
    }

    public static Decimal modulus(Decimal a, Decimal b) {
        validate(a, b);
        if (b == 0) {
            throw new CalculatorException('Modulus by zero is not allowed.');
        }
        return Math.mod(a.longValue(), b.longValue());
    }

    public static Decimal power(Decimal base, Integer exponent) {
        if (base == null || exponent == null) {
            throw new CalculatorException('Inputs cannot be null.');
        }
        return base.pow(exponent);
    }

    /**
     * Single entry point that performs an operation based on an operator symbol.
     * Supported operators: +  -  *  /  %
     */
    public static Decimal calculate(Decimal a, Decimal b, String operator) {
        if (String.isBlank(operator)) {
            throw new CalculatorException('Operator is required.');
        }
        switch on operator.trim() {
            when '+' { return add(a, b); }
            when '-' { return subtract(a, b); }
            when '*' { return multiply(a, b); }
            when '/' { return divide(a, b); }
            when '%' { return modulus(a, b); }
            when else {
                throw new CalculatorException('Unsupported operator: ' + operator);
            }
        }
    }

    private static void validate(Decimal a, Decimal b) {
        if (a == null || b == null) {
            throw new CalculatorException('Inputs cannot be null.');
        }
    }
}
