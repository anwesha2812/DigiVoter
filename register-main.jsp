<%-- 
    Document   : register-main
    Created on : 21-Nov-2021, 12:39:56 am
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register | DigiVoter</title>
        <link href= "https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"> 
        <link rel="stylesheet" href="style-register.css">
    </head>

    <body>
        <div class="font">
            <div class="ellipse1"></div>
            <div class="ellipse2"></div>
            <div class="ellipse3"></div>
            <div class="ellipse4"></div>
            <div class="ellipse5"></div>
            <div class="ellipse6"></div>
            <div class="digivoterlogo"><img src="welcome .png" alt=""></div>
            <div class="register" >
                <span class="registerhere"> <h1>REGISTER HERE </h1></span>
                <div class="form"><form action="Register_main" method="post">
                        <label for="fname">
                            <h4>First Name  :</h4>
                        </label>
                        <input id="fname" name="fname" type="text" required placeholder="Enter First Name">
                        <br><br>
                        <label for="mname">
                            <h4>Middle Name  :</h4>
                        </label>
                        <input id="mname" name="mname" type="text" required placeholder="Enter Middle Name">
                        <br><br>
                        <label for="lname">
                            <h4>Last Name  :</h4>
                        </label>
                        <input id="lname" name="lname" type="text" required placeholder="Enter Last Name">
                        <br><br>
                        <label for="dob" name="dobl">
                            <h4> Date Of Birth  :</h4>
                        </label> 
                        <input id="dob" name="dob" type="date" required oninput="op.value=calculateAge()">
                        <br>
                        <label>
                            <h4>Age : </h4>
                        </label>
                        <output id="op" name="op" for="dob"> </output> <br>
                        <label><h4>Moodle ID: </h4></label>
                        <input id="moodleid" type="number" required name="moodleid"><!-- comment -->
                        <br>
                        <label id="gender-label">
                            <h4>Gender:</h4>
                        </label> 
                        <input list="gender" id="genders" name="gender">
                                   <datalist id="gender">
                            <option value="Female" id="female">
                            <option value="Male" id="male">
                            <option value="Other" id="other">
                        </datalist>

                        <h4><label for="mobnum">Mobile </label></h4>
                        <input id="mobnum" name="mobnum" type="number" oninput="opmob.value=IsMobileNumber()" required placeholder="Enter Phone Number">
                        <output id="opmob" name="opmob" for="dob"></output>
                        <h4><label for="email">Email ID</label> </h4>
                        <input id="email" name="email" type="email" required placeholder="Enter Email ID">

                        <h4>Password</h4>
                        <input id="password" name="password" type="password" onclick="pwStrengthInst()" required placeholder="Enter Password" >
                        <span id="StrengthDisp" class="badge displayBadge">Weak</span>
                        <h4>Re-Enter Password</h4>
                        <input id="password2" name="password2" type="password" required  placeholder="Re-enter Password" oninput="pw.value=pwMatch()"><br>
                        <output id="pw" for="password2"></output> <br>
                        <input type="submit" id="submit" value="CREATE ACCOUNT">
                    </form>
                </div>


            </div>
        </div>

        <style>
            #age {
                border: 1px solid rgb(70, 67, 67);
                border-radius: 3%;
            }
        </style>
        <script>
            function pwStrengthInst() {
                document.getElementById("inst").open === true;
            }
            //This function calculates the current age using provided Date of Birth.
            function calculateAge() {  
                //takes input value of Date of Birth from the form
                const db = new Date(dob.value);   
                //Calculates difference in months between DOB and current Unix Timestamp
                var month_diff = Date.now() - db.getTime(); 
                //convert the calculated difference in date format
                var age_dt = new Date(month_diff);
                //extract year from date
                var year = age_dt.getUTCFullYear();
                //now calculate the age of the user
                var age = Math.abs(year - 1970);
                //display the calculated age  
                return age;
            }
            /*This function checks whether re-entered password is the same
            as the password entered the first time */
            function pwMatch()
            {
                //Extract input from the form
                var pw1 = password.value;  
                var pw2 = password2.value;
                if (pw1 !== pw2)
                {
                    //disable submit button since passwords donot match
                    document.getElementById("submit").disabled = true;
                    return "Passwords do not match";
                } else {
                    //Enable the submit button
                    document.getElementById("submit").disabled = false;
                    return "";
                }
            }
            //Validates mobile number field
            function IsMobileNumber() {
                //initializing a Regular Expression (RegEx) 
                var mob = /^[1-9]{1}[0-9]{9}$/;
                //Extracting input value
                var txtMobile = document.getElementById("mobnum");
                //Testing whether value satisfies regex pattern
                if (mob.test(txtMobile.value) === false) {
                    txtMobile.focus();
                    return "  Please enter valid mobile number.";
                }
                return "";
            }
        </script>
        <script>
        // timeout before a callback is called

    let timeout;

    // traversing the DOM and getting the input and span using their IDs

    let password = document.getElementById('password');
    let strengthBadge = document.getElementById('StrengthDisp');

    // The strong and weak password Regex pattern checker

    let strongPassword = new RegExp('(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9])(?=.{8,})');
    let mediumPassword = new RegExp('((?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9])(?=.{6,}))|((?=.*[a-z])(?=.*[A-Z])(?=.*[^A-Za-z0-9])(?=.{8,}))');
    
    function StrengthChecker(PasswordParameter){
        // We then change the badge's color and text based on the password strength

        if(strongPassword.test(PasswordParameter)) {
            strengthBadge.style.backgroundColor = "green";
            strengthBadge.textContent = 'Strong';
        } else if(mediumPassword.test(PasswordParameter)){
            strengthBadge.style.backgroundColor = 'blue';
            strengthBadge.textContent = 'Medium';
        } else{
            strengthBadge.style.backgroundColor = 'red';
            strengthBadge.textContent = 'Weak';
        }
    }

    // Adding an input event listener when a user types to the  password input 

    password.addEventListener("input", () => {

        //The badge is hidden by default, so we show it

        strengthBadge.style.display= 'block';
        clearTimeout(timeout);

        //We then call the StrengChecker function as a callback then pass the typed password to it

        timeout = setTimeout(() => StrengthChecker(password.value), 500);

        //Incase a user clears the text, the badge is hidden again

        if(password.value.length !== 0){
            strengthBadge.style.display !== 'block';
        } else{
            strengthBadge.style.display = 'none';
        }
    });
        </script>
        <script src="register_main.js"></script>
        <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
            crossorigin="anonymous"></script> -->
    </body>

</html>
