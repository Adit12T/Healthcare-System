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
        <h1>Welcome to Central Hospital</h1>
        

<p>Central Hospital & Research Centre is not only a hospital to treat disease but a complete institution for care of whole Society.</p>
<p> This hospital was established in the year 1979 by Late Shri Thakurdasji in the fond memory of his father Shri Centralji Pagarani.</p> 
<p>Since its inception the founder of this hospital knew the problems of large section of our society, especially the rural masses who couldn’t afford treatment.</p>
<p> He laid the
principle of free OPD, where any patient can consult any specialist doctor, and made available all specialities of medical sciences with finest investigation facilities under one roof.</p>

<h2>OUR AIM</h2>

<p>At Central hospital quality patient care is the prime objective. Caring attitude with precise skills are interwoven with modern technology to offer highly specialised diagnostic and therapeutic service. Our aim is to bring world class medical facilities within the reach of a common-man. Sickness is a frightening experience. When a patient comes to a hospital he is entrusting himself to a team of strangers. At Central we stretch ourselves to create an atmosphere of mutual trust and confidence. All patients receive the same consideration regardless of cast creed or religion, socio-economic status or sex. Central is a referral hospital covering a large spectrum of specialities at one place.</p> 
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
