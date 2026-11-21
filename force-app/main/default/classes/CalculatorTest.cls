@IsTest
private class CalculatorTest {

    @IsTest
    static void testBasicOperations() {
        Test.startTest();
        System.assertEquals(15, Calculator.add(10, 5), 'Add failed');
        System.assertEquals(5, Calculator.subtract(10, 5), 'Subtract failed');
        System.assertEquals(50, Calculator.multiply(10, 5), 'Multiply failed');
        System.assertEquals(2, Calculator.divide(10, 5), 'Divide failed');
        System.assertEquals(3.3333, Calculator.divide(10, 3), 'Divide rounding failed');
        System.assertEquals(1, Calculator.modulus(10, 3), 'Modulus failed');
        System.assertEquals(1000, Calculator.power(10, 3), 'Power failed');
        Test.stopTest();
    }

    @IsTest
    static void testCalculateWithOperators() {
        System.assertEquals(8, Calculator.calculate(6, 2, '+'));
        System.assertEquals(4, Calculator.calculate(6, 2, '-'));
        System.assertEquals(12, Calculator.calculate(6, 2, '*'));
        System.assertEquals(3, Calculator.calculate(6, 2, '/'));
        System.assertEquals(0, Calculator.calculate(6, 2, '%'));
    }

    @IsTest
    static void testDivideByZero() {
        try {
            Calculator.divide(10, 0);
            System.assert(false, 'Expected CalculatorException');
        } catch (Calculator.CalculatorException e) {
            System.assert(e.getMessage().contains('Division by zero'));
        }
    }

    @IsTest
    static void testModulusByZero() {
        try {
            Calculator.modulus(10, 0);
            System.assert(false, 'Expected CalculatorException');
        } catch (Calculator.CalculatorException e) {
            System.assert(e.getMessage().contains('Modulus by zero'));
        }
    }

    @IsTest
    static void testNullInputs() {
        try {
            Calculator.add(null, 5);
            System.assert(false, 'Expected CalculatorException');
        } catch (Calculator.CalculatorException e) {
            System.assert(e.getMessage().contains('null'));
        }
        try {
            Calculator.power(null, 2);
            System.assert(false, 'Expected CalculatorException');
        } catch (Calculator.CalculatorException e) {
            System.assert(e.getMessage().contains('null'));
        }
    }

    @IsTest
    static void testInvalidOperator() {
        try {
            Calculator.calculate(1, 2, '^');
            System.assert(false, 'Expected CalculatorException');
        } catch (Calculator.CalculatorException e) {
            System.assert(e.getMessage().contains('Unsupported operator'));
        }
        try {
            Calculator.calculate(1, 2, '');
            System.assert(false, 'Expected CalculatorException');
        } catch (Calculator.CalculatorException e) {
            System.assert(e.getMessage().contains('required'));
        }
    }
}
