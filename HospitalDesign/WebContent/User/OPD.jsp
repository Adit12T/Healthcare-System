<!DOCTYPE HTML>
<html>

<head>
  <title>Home</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
  <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
</head>

<body>
  <div id="main">
  <%@include file="Header.jsp" %>
    <div id="site_content">
      <ul id="images">
        <li><img src="images/1.jpg" width="600" height="300" alt="seascape_one" /></li>
        <li><img src="images/2.jpg" width="600" height="300" alt="seascape_two" /></li>
        <li><img src="images/3.jpg" width="600" height="300" alt="seascape_three" /></li>
        <li><img src="images/4.jpg" width="600" height="300" alt="seascape_four" /></li>
        <li><img src="images/7.jpg" width="600" height="300" alt="seascape_five" /></li>
        <li><img src="images/6.jpg" width="600" height="300" alt="seascape_seascape" /></li>
      </ul>
      <div id="sidebar_container">
        <div class="sidebar">
          <h3>Latest News</h3>
          <h4><img src="images/head.jpg" width="220" height="180"></h4>
          <h5>January 1st, 2012</h5>
          <p>2012 sees the redesign of our website. Take a look around and let us know what you think.<br /><a href="#">Read more</a></p>
          <h4>20% Discount</h4>
          <h5>March 1st, 2012</h5>
          <p>We are offering a 20% discount to all new customers.<br /><a href="#">Read more</a></p>
        </div>
      </div>
      <div class="content">
        <h1>Department Of OPD</h1>

<p>Free OPD is conducted daily between 8.30 A.M. to 1.00 P.M. The nominal registration charges (Rs 40 only) are taken for documentation. Paid OPD conducted from 1 to 8 P.M. is charged Rs.250/-. The consultants are available as per the time schedule mentioned in consultants OPD schedule.</p>
<p>Demand consultation is available. Phone: 24hrs. help line 4206754, enquiry counter Ext. 445.</p>
<p>New patients have to register at the registration counter on arrival for OPD consultation. They have to deposit registration fees Rs. 50 or Rs. 250 as applicable. The patients are issued with a registration card and consultation folder. Patients then have to move to the chamber of the consultant and wait for their turn to be called. After the consultant has seen the patient, consultant retains the folder for future reference and writes the prescription for treatment and investigations are ordered if required.</p>
<p>Old patients produce their registration card to the registration counter, the clerk takes out the old record and pastes revisit ticket on the folder at the cost of Rs. 40 and direct the patient to the consultant’s chamber, where he awaits his turn.</p>
<p>The Department covered are General Medicine, Cardiology, Nephrology, Chest Diseases, Gastroenterology, Dermatology, Hematology. Oncology, General Surgery, Orthopedics, Cardio-thoracic surgery, Uro-surgery, Neurology, Plastic surgery, G.I. surgery, Obstetrics & Gynecology, Pediatrics, Psychiatry, Clinical Psychology, Ophthalmology, Dentistry, ENT, Physiotherapy, dietetics and so on.</p>
<h3>Casualty Service available at 24hrs</h3>
</div>
    </div>
    <footer>
      <p>Copyright &copy; Central Hospital </p>
    </footer>
  </div>
  <p>&nbsp;</p>
  <!-- javascript at the bottom for fast page loading -->
  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/jquery.easing-sooper.js"></script>
  <script type="text/javascript" src="js/jquery.sooperfish.js"></script>
  <script type="text/javascript" src="js/jquery.kwicks-1.5.1.js"></script>
  <script type="text/javascript">
    $(document).ready(function() {
      $('#images').kwicks({
        max : 600,
        spacing : 2
      });
      $('ul.sf-menu').sooperfish();
    });
  </script>
</body>
</html>
