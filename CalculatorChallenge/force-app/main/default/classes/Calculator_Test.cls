
@isTest
private class Calculator_Test {

    //test1
    @isTest
    static void addTest() {
        Calculator calc = new Calculator();
        Integer actual = calc.add(2,3);
        Assert.areEqual(5, actual, 'Addition test has failed');
    }

    //test 2
    @isTest
    static void multiplyTest() {
        Calculator calc = new Calculator();
        Integer actual = calc.multiple(2, 3);
        Assert.areEqual(6, actual, 'Multiply test failed');
    }

    //test 3 and 4
    @isTest
    static void divideTest() {
        Calculator calc = new Calculator();
        Integer actual = calc.divide(10, 2);
        Assert.areEqual(5, actual, 'Division test failed');
        actual = calc.divide(11, 2);
        Assert.areEqual(5, actual, 'Division test with remainder failed');
        actual = calc.divide(10, 0);
        Assert.areEqual(0, actual, 'Divide by 0 test failed');
    }

    // //test 5
    @isTest
    static void remainderTest() {
        Calculator calc = new Calculator();
        Integer actual = calc.mod(5, 2);
        Assert.areEqual(1, actual, 'Remainder test failed');
        actual = calc.mod(5, 0);
        Assert.areEqual(0, actual, 'Remainder divide by 0 test failed');
    }
}