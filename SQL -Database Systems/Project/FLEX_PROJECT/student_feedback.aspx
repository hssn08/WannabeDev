<%@ Page Language="C#" AutoEventWireup="true" CodeFile="student_feedback.aspx.cs" Inherits="student_feeedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Teachers Assessment Form</title>
</head>
<body>
<style>
  body {
font-family: Arial, sans-serif;
font-size: 16px;
line-height: 1.5;
background-color: #f6f7f9;
margin: 0;
padding: 0;
}
h1 {
text-align: center;
margin-top: 60px;
font-size: 50px;
color: #333333;
text-shadow: 2px 2px #ffffff;
animation: fadeInUp 1s ease-out;
}
h2 {
font-size: 30px;
margin-top: 30px;
color: #333333;
text-shadow: 2px 2px #ffffff;
}

/* Form styles */
form {
max-width: 700px;
margin: 0 auto;
background-color: #ffffff;
padding: 50px;
border-radius: 10px;
box-shadow: 0 0 50px rgba(0, 0, 0, 0.2);
animation: fadeIn 1s ease-out;
}
label {
display: block;
font-weight: bold;
margin-top: 20px;
color: #333333;
}
input[type="text"],
input[type="date"] {
width: 100%;
padding: 15px;
font-size: 18px;
border-radius: 5px;
border: none;
background-color: #f6f7f9;
margin-top: 5px;
color: #333333;
}
input[type="radio"] {
margin-right: 10px;
margin-top: 5px;
}
button[type="submit"] {
display: block;
margin-top: 30px;
padding: 15px;
font-size: 18px;
font-weight: bold;
color: #ffffff;
background-color: #e74c3c;
border: none;
border-radius: 5px;
cursor: pointer;
transition: all 0.3s ease-in-out;
}
button[type="submit"]:hover {
background-color: #c0392b;
transform: scale(1.05);
}

/* Style for the first box */
.box1 {
background-color: #3498db;
color: #ffffff;
padding: 50px;
border: 1px solid #2980b9;
border-radius: 10px;
box-shadow: 0 0 50px rgba(0, 0, 0, 0.2);
animation: fadeInLeft 1s ease-out;
}



/* Animation styles */
@keyframes fadeIn {
from {
opacity: 0;
}
to {
opacity: 1;
}
}

@keyframes fadeInUp {
from {
opacity: 0;
transform: translateY(50px);
}
to {
opacity: 1;
transform: translateY(0);
}
}
@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

  </style>
	<h1>Teachers Assessment Form</h1>

	<form id="form1" runat="server">
         <div class="box1">
		<label for="date">Date:</label>
		<input type="date" id="date" name="date"><br>&nbsp;<br><br>


		<label for="subject">Subject:>
             <br>
             <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Registered_Course" DataValueField="Registered_Course">
             </asp:DropDownList>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FLEX_PROJECTConnectionString %>" SelectCommand="SELECT registered_courses.Registered_Course
FROM registered_courses 
WHERE registered_courses.Student_Id =  @Student_Id AND registered_courses.feedback_status = 'notsubmitted';
">
                 <SelectParameters>
                     <asp:SessionParameter Name="Student_Id" SessionField="Student_Id" />
                 </SelectParameters>
             </asp:SqlDataSource>
             <br>

		<label for="schedule">Schedule:</label>
		<input type="text" id="schedule" name="schedule"><br><br>

		<label for="room">Room Number:</label>
		<input type="text" id="room" name="room"><br><br>

		<label for="year">School year:</label>
		<input type="text" id="year" name="year"><br><br>
             <p style="box-sizing: border-box; color: rgb(99, 33, 28); font-family: &quot;Nova Round&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, 0.75); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
                 <strong style="box-sizing: border-box;">Please fill out the form in evaluating your instructor for the semester. After completion, please press the submit button.</strong></p>
             <p style="box-sizing: border-box; color: rgb(99, 33, 28); font-family: &quot;Nova Round&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, 0.75); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
                 <strong style="box-sizing: border-box;">For reference, the metric are as follows:</strong></p>
             <p style="box-sizing: border-box; color: rgb(99, 33, 28); font-family: &quot;Nova Round&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, 0.75); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; padding-left: 30px;">
                 1&nbsp; - Poor<br style="box-sizing: border-box;" />
                 2 -&nbsp;Below Average<br style="box-sizing: border-box;" />
                 3 - Average<br style="box-sizing: border-box;" />
                 4 - Good<br style="box-sizing: border-box;" />
                 5 - Excellent</p>
        
		<h2>Appearance and Personal Presentation</h2>
		<label for="well_presentable">Teacher attends class in a well presentable manner:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
		&nbsp;<asp:RadioButton value="1" name="q1" ID="RadioButton1" runat="server"  GroupName="q1"/>
        <asp:RadioButton value="2" name="q1" ID="RadioButton2" runat="server"  GroupName="q1"/>
        <asp:RadioButton value="3" name="q1" ID="RadioButton3" runat="server"  GroupName="q1"/>
        <asp:RadioButton value="4" name="q1" ID="RadioButton4" runat="server"  GroupName="q1"/>
        <asp:RadioButton value="5" name="q1" ID="RadioButton5" runat="server"  GroupName="q1"/>
        <br><br>

		<label for="enthusiasm">Teacher shows enthusiasm when teaching in class:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
		&nbsp;<asp:RadioButton value="1" name="q2" ID="RadioButton6" runat="server" GroupName="q2"/>
        <asp:RadioButton value="2" name="q2" ID="RadioButton7" runat="server" GroupName="q2"/>
        <asp:RadioButton value="3" name="q2" ID="RadioButton8" runat="server" GroupName="q2"/>
        <asp:RadioButton value="4" name="q2" ID="RadioButton9" runat="server" GroupName="q2"/>
        <asp:RadioButton value="5" name="q2" ID="RadioButton10" runat="server" GroupName="q2"/>
        <br><br>

		<label for="initiative">Teacher shows initiative and flexibility in teaching:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
         &nbsp;<asp:RadioButton value="1" name="q3" ID="RadioButton11" runat="server" GroupName="q3" />
        <asp:RadioButton value="2" name="q3" ID="RadioButton12" runat="server" GroupName="q3"/>
        <asp:RadioButton value="3" name="q3" ID="RadioButton13" runat="server" GroupName="q3"/>
        <asp:RadioButton value="4" name="q3" ID="RadioButton14" runat="server" GroupName="q3"/>
        <asp:RadioButton value="5" name="q3" ID="RadioButton15" runat="server" GroupName="q3"/>
        <br><br>

		<label for="knowledge">Teacher is well articulated and shows full knowledge of the subject in teaching:&nbsp;&nbsp; </label>
&nbsp;<asp:RadioButton value="1" name="q4" ID="RadioButton16" runat="server" GroupName="q4"/>
        <asp:RadioButton value="2" name="q4" ID="RadioButton17" runat="server" GroupName="q4"/>
        <asp:RadioButton value="3" name="q4" ID="RadioButton18" runat="server" GroupName="q4"/>
        <asp:RadioButton value="4" name="q4" ID="RadioButton19" runat="server" GroupName="q4"/>
        <asp:RadioButton value="5" name="q4" ID="RadioButton20" runat="server" GroupName="q4"/>
        <br><br>

		<label for="clear_speaker">Teacher speaks loud and clear enough to be heard by the whole class:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
&nbsp;<asp:RadioButton value="1" name="q5" ID="RadioButton21" runat="server" GroupName="q5"/>
        <asp:RadioButton value="2" name="q5" ID="RadioButton22" runat="server" GroupName="q5"/>
        <asp:RadioButton value="3" name="q5" ID="RadioButton23" runat="server" GroupName="q5"/>
        <asp:RadioButton value="4" name="q5" ID="RadioButton24" runat="server" GroupName="q5"/>
        <asp:RadioButton value="5" name="q5" ID="RadioButton25" runat="server" GroupName="q5"/>
        <br><br>

		<h2>Professional Practices</h2>
		<label for="professionalism">Teacher shows professionalism in class:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
		&nbsp;<asp:RadioButton value="1" name="q6" ID="RadioButton26" runat="server" GroupName="q6"/>
        <asp:RadioButton value="2" name="q6" ID="RadioButton27" runat="server" GroupName="q6"/>
        <asp:RadioButton value="3" name="q6" ID="RadioButton28" runat="server" GroupName="q6"/>
        <asp:RadioButton value="4" name="q6" ID="RadioButton29" runat="server" GroupName="q6"/>
        <asp:RadioButton value="5" name="q6" ID="RadioButton30" runat="server" GroupName="q6"/>
        <br><br>

		<label for="commitment">TeTeacher shows commitment to teaching the class:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
		&nbsp;<asp:RadioButton value="1" name="q7" ID="RadioButton31" runat="server" GroupName="q7"/>
        <asp:RadioButton value="2" name="q7" ID="RadioButton32" runat="server" GroupName="q7"/>
        <asp:RadioButton value="3" name="q7" ID="RadioButton33" runat="server" GroupName="q7"/>
        <asp:RadioButton value="4" name="q7" ID="RadioButton34" runat="server" GroupName="q7"/>
        <asp:RadioButton value="5" name="q7" ID="RadioButton35" runat="server" GroupName="q7"/>
        <br><br>

		<label for="discussions">Teacher encourages students to engage in class discussions and ask questions:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
&nbsp;<asp:RadioButton value="1" name="q8" ID="RadioButton36" runat="server" GroupName="q8"/>
        <asp:RadioButton value="2" name="q8" ID="RadioButton37" runat="server" GroupName="q8"/>
        <asp:RadioButton value="3" name="q8" ID="RadioButton38" runat="server" GroupName="q8"/>
        <asp:RadioButton value="4" name="q8" ID="RadioButton39" runat="server" GroupName="q8"/>
        <asp:RadioButton value="5" name="q8" ID="RadioButton40" runat="server" GroupName="q8"/>
        <br><br>

		<label for="criticisms">Teacher handles criticisms and suggestions professionally:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
             &nbsp;<asp:RadioButton value="1" name="q9" ID="RadioButton41" runat="server" GroupName="q9"/>
        <asp:RadioButton value="2" name="q9" ID="RadioButton42" runat="server" GroupName="q9"/>
        <asp:RadioButton value="3" name="q9" ID="RadioButton43" runat="server" GroupName="q9"/>
        <asp:RadioButton value="4" name="q9" ID="RadioButton44" runat="server" GroupName="q9"/>
        <asp:RadioButton value="5" name="q9" ID="RadioButton45" runat="server" GroupName="q9"/>
        <br><br>

		<label for="ontime">TeacTeacher comes to class on time:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
             &nbsp;<asp:RadioButton value="1" name="q10" ID="RadioButton46" runat="server" GroupName="q10" />
        <asp:RadioButton value="2" name="q10" ID="RadioButton47" runat="server" GroupName="q10"/>
        <asp:RadioButton value="3" name="q10" ID="RadioButton48" runat="server" GroupName="q10"/>
        <asp:RadioButton value="4" name="q10" ID="RadioButton49" runat="server" GroupName="q10"/>
        <asp:RadioButton value="5" name="q10" ID="RadioButton50" runat="server" GroupName="q10"/>
        <br><br>

		<label for="class_end">Teacher ends class on time:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
&nbsp;<asp:RadioButton value="1" name="q11" ID="RadioButton51" runat="server" GroupName="q11"/>
        <asp:RadioButton value="2" name="q11" ID="RadioButton52" runat="server" GroupName="q11"/>
        <asp:RadioButton value="3" name="q11" ID="RadioButton53" runat="server" GroupName="q11"/>
        <asp:RadioButton value="4" name="q11" ID="RadioButton54" runat="server" GroupName="q11"/>
        <asp:RadioButton value="5" name="q11" ID="RadioButton55" runat="server" GroupName="q11"/>
        <br><br>

		<h2>Teaching Methodshodsds</h2>
		<label for="knowledge_subject">Teacher shows well-rounded knowledge over the subject matter:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
             &nbsp;<asp:RadioButton value="1" name="q12" ID="RadioButton56" runat="server" GroupName="q12" />
        <asp:RadioButton value="2" name="q12" ID="RadioButton57" runat="server" GroupName="q12"/>
        <asp:RadioButton value="3" name="q12" ID="RadioButton58" runat="server" GroupName="q12"/>
        <asp:RadioButton value="4" name="q12" ID="RadioButton59" runat="server" GroupName="q12"/>
        <asp:RadioButton value="5" name="q12" ID="RadioButton60" runat="server" GroupName="q12"/>
        <br><br>

		<label for="organized_lesson">Teacher has organized the lesson conducive for easy understanding of students:&nbsp;&nbsp;&nbsp;&nbsp; </label> 
             &nbsp;<asp:RadioButton value="1" name="q13" ID="RadioButton61" runat="server" GroupName="q13"/>
        <asp:RadioButton value="2" name="q13" ID="RadioButton62" runat="server" GroupName="q13"/>
        <asp:RadioButton value="3" name="q13" ID="RadioButton63" runat="server" GroupName="q13"/>
        <asp:RadioButton value="4" name="q13" ID="RadioButton64" runat="server" GroupName="q13"/>
        <asp:RadioButton value="5" name="q13" ID="RadioButton65" runat="server" GroupName="q13"/>
        <br><br>

		<label for="dynamism">Teacher shows dynamism and enthusiasm:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
&nbsp;<asp:RadioButton value="1" name="q14" ID="RadioButton66" runat="server" GroupName="q14"/>
        <asp:RadioButton value="2" name="q14" ID="RadioButton67" runat="server" GroupName="q14"/>
        <asp:RadioButton value="3" name="q14" ID="RadioButton68" runat="server" GroupName="q14"/>
        <asp:RadioButton value="4" name="q14" ID="RadioButton69" runat="server" GroupName="q14"/>
        <asp:RadioButton value="5" name="q14" ID="RadioButton70" runat="server" GroupName="q14"/>
        <br><br>

		<label for="stimulates">Teacher stimulates the critical thinking of students:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label> 
             &nbsp;<asp:RadioButton value="1" name="q15" ID="RadioButton71" runat="server" GroupName="q15"/>
        <asp:RadioButton value="2" name="q15" ID="RadioButton72" runat="server" GroupName="q15"/>
        <asp:RadioButton value="3" name="q15" ID="RadioButton73" runat="server" GroupName="q15"/>
        <asp:RadioButton value="4" name="q15" ID="RadioButton74" runat="server" GroupName="q15"/>
        <asp:RadioButton value="5" name="q15" ID="RadioButton75" runat="server" GroupName="q15"/>
        <br><br>

		<label for="class_env">Teacher handles the class environment conducive for learning:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label> 
             &nbsp;<asp:RadioButton value="1" name="q16" ID="RadioButton76" runat="server" GroupName="q16"/>
        <asp:RadioButton value="2" name="q16" ID="RadioButton77" runat="server" GroupName="q16"/>
        <asp:RadioButton value="3" name="q16" ID="RadioButton78" runat="server" GroupName="q16"/>
        <asp:RadioButton value="4" name="q16" ID="RadioButton79" runat="server" GroupName="q16"/>
        <asp:RadioButton value="5" name="q16" ID="RadioButton80" runat="server" GroupName="q16"/>
        <br><br>

		<h2>Disposition Towards Students</h2>
		<label for="student_learning">Teacher believes that students can learn from the class:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
		&nbsp;<asp:RadioButton value="1" name="q17" ID="RadioButton81" runat="server" GroupName="q17"/>
        <asp:RadioButton value="2" name="q17" ID="RadioButton82" runat="server" GroupName="q17"/>
        <asp:RadioButton value="3" name="q17" ID="RadioButton83" runat="server" GroupName="q17"/>
        <asp:RadioButton value="4" name="q17" ID="RadioButton84" runat="server" GroupName="q17"/>
        <asp:RadioButton value="5" name="q17" ID="RadioButton85" runat="server" GroupName="q17"/>
        <br><br>

		<label for="respect_cultural">Teacher shows equal respect to various cultural backgrounds, individuals, religion, and race:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
             &nbsp;<asp:RadioButton value="1" name="q18" ID="RadioButton86" runat="server" GroupName="q18"/>
        <asp:RadioButton value="2" name="q18" ID="RadioButton87" runat="server" GroupName="q18"/>
        <asp:RadioButton value="3" name="q18" ID="RadioButton88" runat="server" GroupName="q18"/>
        <asp:RadioButton value="4" name="q18" ID="RadioButton89" runat="server" GroupName="q18"/>
        <asp:RadioButton value="5" name="q18" ID="RadioButton90" runat="server" GroupName="q18"/>
        <br><br>

		<label for="strengths_weaknesses">Teacher finds the students strengths as basis for growth and weaknesses for opportunities for improvement:&nbsp;&nbsp;&nbsp;&nbsp; </label>
&nbsp;<asp:RadioButton value="1" name="q19" ID="RadioButton91" runat="server"  GroupName="q19"/>
        <asp:RadioButton value="2" name="q19" ID="RadioButton92" runat="server" GroupName="q19"/>
        <asp:RadioButton value="3" name="q19" ID="RadioButton93" runat="server" GroupName="q19"/>
        <asp:RadioButton value="4" name="q19" ID="RadioButton94" runat="server" GroupName="q19"/>
        <asp:RadioButton value="5" name="q19" ID="RadioButton95" runat="server" GroupName="q19"/>
        <br><br>

		<label for="student_improvement">Teacher understands the weakness of a student and helps in the student's improvement:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
		&nbsp;<asp:RadioButton value="1" name="q20" ID="RadioButton96" runat="server" GroupName="q20"/>
        <asp:RadioButton value="2" name="q20" ID="RadioButton97" runat="server" GroupName="q20"/>
        <asp:RadioButton value="3" name="q20" ID="RadioButton98" runat="server" GroupName="q20"/>
        <asp:RadioButton value="4" name="q20" ID="RadioButton99" runat="server" GroupName="q20"/>
        <asp:RadioButton value="5" name="q20" ID="RadioButton100" runat="server" GroupName="q20"/>
        <br><br>
        </div>
		<label for="comments">Comments:</label><br>
		<textarea id="comments" name="comments" rows="5" cols="50"></textarea><br><br>

		&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
	</form>
</body>
</html>

