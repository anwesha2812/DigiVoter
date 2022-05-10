<%-- 
    Document   : applicantionform
    Created on : 28-Jan-2022, 11:59:33 pm
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style-applicationform.css">
        <title>Application Form</title>
    </head>
    <body>
        <%
            String VOTERID="";
                Cookie[] cookies = request.getCookies();

                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("MIDc")) {
                            VOTERID=cookie.getValue();  
                        }
                    }
                }
        %>
        <div class="wrapper">
            <form action="ApplicantIntakeServlet" class="form" method="post" enctype="multipart/form-data">
            <h2 class="title">Application Form </h2>
            <div class="input-group">
                <label for="name">Name:</label>
                <input type="text" name="appl-name" id="name" required class="name-input">
            </div>
            <div class="input-group">
                <label for="age">Age:</label>
                <input type="number" name="age" id="age" required class="age-input">
            </div>
            <div class="input-group">
                <label for="gender">Gender:</label>
                <input type="radio" name="gender" id="" class="radio-btn" value="male">Male
                <input type="radio" name="gender" id="" class="radio-btn"  value="female">Female
                <input type="radio" name="gender" id="" class="radio-btn" value="other">Other
            </div>
            <div class="input-group" class="form-group">
                <label for="gender"> Year:</label>
                <input type="radio" name="year" id="" class="radio-btn" value="FE">FE
                <input type="radio" name="year" id="" class="radio-btn" value="SE">SE
                <input type="radio" name="year" id="" class="radio-btn" value="TE">TE
                <input type="radio" name="year" id="" class="radio-btn" value="BE">BE
            </div>
            <div class="input-group">
                <label for="branch">Branch:</label>                    
                    <input list="branch" name="branch" id="browser">
                    <datalist id="branch">
                        <option value="Computer Engineering">
                        <option value="Civil Engineering">
                        <option value="IT Engineering">
                        <option value="Electronics and Telecommunication">
                        <option value="Mechanical Engineering">
                        <option value="AI/DS">
            </div>
            <div class="input-group">
                <label for="division">Division:</label>
                <input type="text" name="division" id="division" required>
            </div>
            <div class="input-group">
                <label for="moodleId">Moodle-Id:</label>
                <input type="number" name="moodleId" id="moodleId" value="<%=VOTERID%>" disabled>
            </div>
            <div class="input-group">
                <label for="Applicants Photo">Applicants Photo:</label>
                <input type="file" accept="image/*" class="file" name="photo" >
            </div>
            <div class="input-group">
                <label for="Posts">Choose your Posts you would like to run for?:</label>
                <input list="browsers" name="posts" id="browser" required>
                <datalist id="browsers">
                    <option value="GS">
                    <option value="CS">
                    <option value="JCS">
                    <option value="SS">
                    <option value="JSS">
                    <option value="LR">
                    <option value="JLR">
            </div>
            <h2>Answer the following questions in brief</h2>
            <div class="input-group">
                <label for="question1">What are your hobbies?</label>
                <input type="text" id="question1" name="q1" required>
            </div>
            <div class="input-group">
                <label for="question2">Why do you want to run for the above post?</label>
                <input type="text" id="question2" name="q2" required>
            </div>
            <div class="input-group">
                <label for="question3">What changes would you implement if you were elected for the post?</label><br>
                <input type="text" id="question3" name="q3" required>
            </div>
            <div class="input-group">
                <label for="motto">Mention your motto/slogan/message for campaign:</label>
                <input type="text" id="question4" name="q4" required>
            </div>
            <div class="input-group">
                <label for="exp">Do you have any past leadership experience?</label>
                <input type="radio" name="q5" id="exp" class="radio-btn" value="yes">Yes
                <input type="radio" name="q5" id="exp" class="radio-btn" value="no">No
            </div>
            <div class="input-group">
                <label for="AttachFile">Attach your CV:</label>
            </div>
            <div>
                <input type="file" name="cv" id="file" required>
            </div>
            <div class="input-group">
                <input type="submit" value="Submit" class="submit-btn" name="submit">
                <input type="reset" value=" reset" class="reset-btn" name="reset">
            </div>
        </form>
        </form>
    </div>
    </body>
</html>
