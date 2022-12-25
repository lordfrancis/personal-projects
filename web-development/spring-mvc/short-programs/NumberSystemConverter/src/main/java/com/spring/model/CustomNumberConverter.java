package com.spring.model;

public class CustomNumberConverter {
    private String value;
    private String numFrom;
    private String numTo;

    public CustomNumberConverter(String numFrom, String numTo, String value ) {
        this.numFrom = numFrom;
        this.value = value;
        this.numTo = numTo;
    }

    public String getValue() {
        return value;
    }

    public String getNumFrom() {
        return numFrom;
    }

    public String getNumTo() {
        return numTo;
    }

    /**
     * The main helper function for converting to Decimal. Checks what type to convert from and calls the appropriate function.
     * @return String
     */
    public String convertToDecimal(){
        String result="";
        int numericValue;

        switch( this.numFrom ) {
            case "decimal":
                result = this.value;
                break;
            case "binary":
                if (!isValueConvertibleToNumber()) {
                    return "Invalid Input. Please enter a valid Binary value.";
                }
                numericValue = Integer.valueOf( this.value );
                result = String.valueOf( binaryToDecimal( numericValue ) );
                break;
            case "octal":
                if (!isValueConvertibleToNumber()) {
                    return "Invalid Input. Please enter a valid Octal value";
                }
                numericValue = Integer.valueOf( this.value );
                result = String.valueOf( octalToDecimal(numericValue) );
                break;
            case "hexadecimal":
                result = String.valueOf( hexadecimalToDecimal( this.value ) );
                break;
            default:
                result = "Invalid Choice";
                break;
        }
        return result;
    }

    /**
     * Converts a sring into int. If error, return false.
     * @return boolean
     */
    private boolean isValueConvertibleToNumber() {
        int res;
        try {
            res = Integer.valueOf( this.value );
        } catch( Exception e ) {
            return false;
        }
        return true;
    }

    /**
     * Converts a binary value to Decimal and returns the result in Int.
     * @return int
     */
    private int binaryToDecimal( int convertedBinaryValue ) {
        int decimal = 0, n = 0;

        while( true ) {
            if( convertedBinaryValue == 0) {
                break;
            } else {
                int temp = convertedBinaryValue % 10;
                decimal += temp * Math.pow(2, n);
                convertedBinaryValue = convertedBinaryValue / 10;
                n++;
            }
        }
        return decimal;
    }

    /**
     * Converts an Octal Number into Decimal and returns its result as Int.
     * @return int
     */
    private int octalToDecimal( int convertedOctalValue ) {
        int decimal = 0, base = 1;

        while( convertedOctalValue > 0 ) {
            int last_digit = convertedOctalValue % 10;
            convertedOctalValue /= 10;

            decimal += last_digit * base;
            base = base * 8;
        }
        return decimal;
    }

    /**
     * Converts a Hexadecimal number into a Decimal and returns the result as int.
     * @return int
     */
    private int hexadecimalToDecimal( String hex ) {
        String hexDigits = "0123456789ABCDEF";
        String uppercasedValue = this.value.toUpperCase();
        int decimal = 0;

        for( int i = 0; i < uppercasedValue.length(); i++ ) {
            char c = uppercasedValue.charAt(i);
            int d = hexDigits.indexOf(c);
            decimal = d + decimal * 16;
        }
        return decimal;
    }

    /**
     * The main helper function for converting into Binary.
     * @return String
     */
    public String convertToBinary() {
        String result = "";
        int numericValue;
        switch( this.numFrom ) {
            case "decimal":
                if (!isValueConvertibleToNumber()) {
                    return "Invalid Input. Please enter a valid Decimal value.";
                }
                numericValue = Integer.valueOf( this.value );
                result = String.valueOf( decimalToBinary( numericValue ) );
                break;
            case "binary":
                result = this.value;
                break;
            case "octal":
                if (!isValueConvertibleToNumber()) {
                    return "Invalid Input. Please enter a valid Octal value";
                }
                result = octalToBinary();
                break;
            case "hexadecimal":
                result = hexadecimalToBinary();
                break;
            default:
                result = "Invalid Choice";
                break;
        }

        return result;
    }

    /**
     * Converts a decimal into binary.
     * @param decimal Decimal in Int.
     * @return String
     */
    private String decimalToBinary( int decimal ) {
        String binaryValue = "";
        int binary[] = new int[40];
        int index = 0;

        while( decimal > 0 ) {
            binary[index++] = decimal % 2;
            decimal /= 2;
        }

        for(int i = index-1; i>=0; i-- ) {
            binaryValue = binaryValue + binary[i];
        }

        return binaryValue;
    }

    /**
     * Converts octal into Binary
     * @return string
     */
    private String octalToBinary() {
        int octal = Integer.valueOf( this.value );
        int decimal = octalToDecimal( octal );
        String binary = decimalToBinary( decimal );

        return binary;
    }

    /**
     * Converts hexa into binary.
     * @return string
     */
    private String hexadecimalToBinary(){
        String hex = this.value.toUpperCase();
        int decimal = hexadecimalToDecimal( hex );
        String binary = decimalToBinary( decimal );

        return binary;
    }

    /**
     * Main helper function to convert into Octal.
     * @return String
     */
    public String convertToOctal() {
        String result = "";
        int numericValue;
        switch( this.numFrom ) {
            case "decimal":
                if (!isValueConvertibleToNumber()) {
                    return "Invalid Input. Please enter a valid Decimal value.";
                }
                numericValue = Integer.valueOf( this.value );
                result =  decimalToOctal( numericValue );
                break;
            case "binary":
                if (!isValueConvertibleToNumber()) {
                    return "Invalid Input. Please enter a valid Binary value.";
                }
                numericValue = Integer.valueOf( this.value );
                result = binarytoOctal( numericValue );
                break;
            case "octal":
                result = this.value;
                break;
            case "hexadecimal":
                result = hexadecimalToOctal();
                break;
            default:
                result = "Invalid Choice";
                break;
        }
        return result;
    }

    /**
     * Converts decimal into octal
     * @param decimal Decimal value in integer.
     * @return string
     */
    private String decimalToOctal( int decimal ) {
        int rem;
        String octal = "";
        char octalValues[] = {'0','1','2','3','4','5','6','7'};

        while( decimal > 0 ){
            rem = decimal % 8;
            octal = octalValues[rem] + octal;
            decimal = decimal/8;
        }
        return octal;
    }

    /**
     * Converts binary into octal.
     * @param binary binary in integer.
     * @return String
     */
    private String binarytoOctal( int binary ) {
        int decimal = binaryToDecimal( binary );
        String octal = decimalToOctal(decimal);

        return octal;
    }

    /**
     * Converts hexadecimal to octal.
     * @return String
     */
    private String hexadecimalToOctal(){
        String hex = this.value.toUpperCase();
        int decimal = hexadecimalToDecimal(hex);
        String octal = decimalToOctal(decimal);

        return octal;
    }

    /**
     * Main helper function to convert into Hexadecimal.
     * @return String
     */
    public String convertToHexadecimal() {
        String result ="";
        int numericValue;

        switch( this.numFrom ) {
            case "decimal":
                if (!isValueConvertibleToNumber()) {
                    return "Invalid Input. Please enter a valid Decimal value.";
                }
                numericValue = Integer.valueOf( this.value );
                result =  decimalToHexadecimal( numericValue );
                break;
            case "binary":
                if (!isValueConvertibleToNumber()) {
                    return "Invalid Input. Please enter a valid Binary value.";
                }
                numericValue = Integer.valueOf( this.value );
                result = binarytoHexadecimal( numericValue );
                break;
            case "octal":
                if (!isValueConvertibleToNumber()) {
                    return "Invalid Input. Please enter a valid Octal value.";
                }
                numericValue = Integer.valueOf( this.value );
                result = octaltoHexadecimal( numericValue );
                break;
            case "hexadecimal":
                result = this.value;
                break;
            default:
                result = "Invalid Choice";
                break;
        }

        return result;
    }

    /**
     * Converts decimal into Hexadecimal
     * @param decimal Decimal value in integer.
     * @return String
     */
    private String decimalToHexadecimal( int decimal ) {
        int hexEquivalent;
        String hex="";
        char hexValues[] = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};

        while( decimal > 0) {
            hexEquivalent = decimal%16;
            hex = hexValues[hexEquivalent] + hex;
            decimal /= 16;
        }
        return hex;
    }

    /**
     * Converts binary into hexadecimal.
     * @param binary Binary value in int.
     * @return String
     */
    private String binarytoHexadecimal( int binary ) {
        int decimal = binaryToDecimal( binary );
        String hex = decimalToHexadecimal( decimal );

        return hex;
    }

    /**
     * Converts octal into hexadecimal.
     * @param octal Octal value in int.
     * @return String
     */
    private String octaltoHexadecimal( int octal ) {
        int decimal = octalToDecimal( octal );
        String hex = decimalToHexadecimal( decimal );

        return hex;
    }
}
