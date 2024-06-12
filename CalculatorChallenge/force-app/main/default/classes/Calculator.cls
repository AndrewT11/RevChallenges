public with sharing class Calculator {
    public Calculator() {

    }
// challenge 1
    public integer add(integer num1, integer num2) {
        return num1 + num2;
    }
// challenge 2
    public integer multiple(integer num1, integer num2) {
        integer total = 0;

        for (integer i = 1; i <= num2; i++) {
            total = add(total, num1);
        }
        return total;
    }
// challenge 3 and 4
    public integer divide(integer num1, integer num2) {
        if(num2 == 0) {
            return 0;
        } 
        integer counter = 0;
        integer numerator = num1;
        integer denominator = 0;
        while(numerator >= (denominator + num2)) {
            denominator = add(denominator, num2);
            counter++;
        }
        return counter;
    }

// challenge 5
    public Integer mod(integer num1, integer num2) {
        if(num2==0) {
            return 0;
        }
        Integer counter = 0;
        Integer numerator = num1;
        Integer denominator = 0;
       while (numerator >= (denominator + num2)){
            denominator = add(denominator, num2);
       }
        Integer remainder = numerator - denominator;

        return remainder;
    }

// elite challenge
    public Integer calculate(String equation) {

        

        return Integer;
    } 

}