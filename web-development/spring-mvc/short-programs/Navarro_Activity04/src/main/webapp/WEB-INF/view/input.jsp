<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
    <title>Navarro Activity 04</title>
</head>
<body>
<div style="margin-left: 2rem">
<h1> Navarro Activity 04</h1>
<p>Enter the following: </p>
<form:form action="processNumber" modelAttribute="util" onsubmit="return checkForm()">
    <form:label path="num1"> First Number </form:label>
    <form:input path="num1" id="num1"/> <br>

    <form:label path="num2"> Second Number</form:label>
    <form:input path="num2" id="num2"/><br>
    Menu: <br>
    <form:radiobutton path="choice" value="display"/> Display Numbers from First Number to Second Number <br>
    <form:radiobutton path="choice" value="display_prime"/> Display Number from First Number to Second Number and Highlight Prime Numbers <br>
    <form:radiobutton path="choice" value="display_odd_even"/> Display Number from First Number to Second Number and Highlight Even and Odd Numbers <br>
    <form:radiobutton path="choice" value="display_gcf" id="display_gcf"/> Identify the GCF of the two numbers <br>
    <form:radiobutton path="choice" value="display_lcm" id="display_lcm"/> Identify the LCM of the two numbers <br>
    <input type="submit" value="Submit">
</form:form>
</div>
<script>
    function checkForm() {
        var num1 =  document.getElementById('num1').value;
        var num2 =  document.getElementById('num2').value;
        var lcm = document.getElementById("display_lcm");
        var gcf = document.getElementById("display_gcf");

        if( lcm.checked ) {
            displayLcm(num1, num2);
        } else if( gcf.checked ) {
            displayGcf(num1, num2);
        } else{
        }
    }

    function displayGcf(num1, num2){
        var gcf = 1;

        for (var i = 1; i <= num1 && i <= num2; ++i) {
            // check if i perfectly divides both n1 and n2
            if (num1 % i == 0 && num2 % i == 0) {
                gcf = i;
            }
        }
        alert("GCF of " + num1 + " and " + num2 + " is: " + gcf);
    }

    function displayLcm( num1, num2 ) {
        var lcm;
        if( num1 > num2 ){
            lcm = num1;
        } else{
            lcm = num2;
        }

        while(true) {
            if( lcm % num1 == 0 && lcm % num2 == 0 ) {
                alert("The LCM of " + num1 + " and " + num2 +" is: " + lcm);
                break;
            }
            ++lcm;
        }
    }
</script>
</body>
</html>
