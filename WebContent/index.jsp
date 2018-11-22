<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Application</title>
<script>
    function openWin1() {
    location.href="clogin.jsp";
}
    function openWin2() {
        location.href="login1.jsp";
    }
            </script>
            <style>
            body
            {
             background-image: url("homepage.jpg");
    background-color: black;
    background-repeat: no-repeat;
    background-position: center;
    background-size:cover;
    height: 100%;
    font-size:20px;
    font-family:ravie;
    color:#FA8072;}</style>
</head>
<body>
<div style="background:black;height:100px;width:100%;">
<h1  style="padding-top:30px;"><center>ONLINE HOME APPLIANCE SHOPPING</center></h1>
</div>
<div style="width:100%;height:500px;">
<center><h2 style="border:none;background:black;color:whitefont-family: "Times New Roman", Times, serif;">LOGIN AS:</h2></center>
<form>
<input type="button" value="CUSTOMER" style="color:white;height:50px;width:100px;position:relative;left:200px;top:50px;border:none;background:black;" onclick="openWin1();">
<input type="button" value="EMPLOYEE" style="color:white;height:50px;width:100px;position:relative;left:90px;top:150px;border:none;background:black;" onclick="openWin2();">
</form>
</div>

</body>
</html>