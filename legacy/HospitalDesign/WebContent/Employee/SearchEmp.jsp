<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="../css/text.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="../css/grid.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="../css/layout.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="../css/nav.css"
	media="screen" />
<script src="../js/jquery-1.8.0.js" type="text/javascript"></script>
<script src="../js/setup.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setupLeftMenu();

		$('.datatable').dataTable();
		setSidebarHeight();

	});
</script>
<style type="text/css">
th{
text-align: left;
}
</style>
</head>
<body>
<div class="container_12">
		<div class="grid_10">
		<div class="box round first grid">
		<h2>Search Employee Detail</h2>
		<form action=" ../SpecialisearchServlet">
			<fieldset>
			  Search By Employee Type
			  <select name="name">
			  <option value="doctor">doctor</option>
								<option value="nurse">nurse</option>
								<option value="staff">staff</option>
								
								</select> <input type="submit" value="Go" name="s1"><br>
								OR<br><br>
				Search By Specialization
				<select size="1" name="specialization">
					<option value="">Choose Option</option>

					<option value="acupuncture">acupuncture</option>

					<option value="addl. professor">addl. professor</option>

					<option value="allergy">allergy</option>

					<option value="alternative medicine">alternative medicine</option>

					<option value="anaesthesia">anaesthesia</option>

					<option value="anatomy">anatomy</option>

					<option value="andrology">andrology</option>

					<option value="associate dean">associate dean</option>

					<option value="associate professor">associate professor</option>

					<option value="asst. of operative dentistry">asst. of
						operative dentistry</option>

					<option value="asst. professor">asst. professor</option>

					<option value="asthma">asthma</option>

					<option value="audiology">audiology</option>

					<option value="biochemistry">biochemistry</option>

					<option value="burns &amp; plastic surgery">burns &amp;
						plastic surgery</option>

					<option value="cancer surgery">cancer surgery</option>

					<option value="cardio thoracic &amp; vascular surgery">cardio
						thoracic &amp; vascular surgery</option>

					<option value="cardio thoracic surgery">cardio thoracic
						surgery</option>

					<option value="cardio vascular surgery">cardio vascular
						surgery</option>

					<option value="cardiology">cardiology</option>

					<option value="chest specialist">chest specialist</option>

					<option value="chief medical officer (dental)">chief
						medical officer (dental)</option>

					<option value="civil dental surgeon">civil dental surgeon</option>

					<option value="community medicine">community medicine</option>

					<option value="consultant dental surgeon">consultant
						dental surgeon</option>

					<option value="consultant endodontist">consultant
						endodontist</option>

					<option value="consultant oral surgeon">consultant oral
						surgeon</option>

					<option value="consultant orthodontist">consultant
						orthodontist</option>

					<option value="consultant periodontist">consultant
						periodontist</option>

					<option value="consultant physician">consultant physician</option>

					<option value="cosmetic surgery">cosmetic surgery</option>

					<option value="dental">dental</option>

					<option value="dean">dean</option>

					<option value="dental (prostho)">dental (prostho)</option>

					<option value="dental asst. surgeon">dental asst. surgeon</option>

					<option value="dental consultant">dental consultant</option>

					<option value="dental health officer">dental health
						officer</option>

					<option value="dental surgeon">dental surgeon</option>

					<option value="dental surgeon &amp; othodontist">dental
						surgeon &amp; othodontist</option>

					<option value="dental surgery">dental surgery</option>

					<option value="dermatology">dermatology</option>

					<option value="diabetology">diabetology</option>

					<option value="dietitian">dietitian</option>

					<option value="endocrinology">endocrinology</option>

					<option value="endodontist">endodontist</option>

					<option value="ent">ent</option>

					<option value="epidemiology">epidemiology</option>

					<option value="family physician">family physician</option>

					<option value="family planning">family planning</option>

					<option value="forensic medicine">forensic medicine</option>

					<option value="gastroenterology">gastroenterology</option>

					<option value="general medicine">general medicine</option>

					<option value="general physician">general physician</option>

					<option value="general practitioner">general practitioner</option>

					<option value="general surgery">general surgery</option>

					<option value="genetics">genetics</option>

					<option value="haematology">haematology</option>

					<option value="hod dentistry">hod dentistry</option>

					<option value="immunogenetics">immunogenetics</option>

					<option value="immunology">immunology</option>

					<option value="indian medicine">indian medicine</option>

					<option value="infertility &amp; reproductive health">infertility
						&amp; reproductive health</option>

					<option value="internal medicine">internal medicine</option>

					<option value="junior resident">junior resident</option>

					<option value="lecturer">lecturer</option>

					<option value="lecturer in orthodontics">lecturer in
						orthodontics</option>

					<option value="lecturer in pedodontics">lecturer in
						pedodontics</option>

					<option value="maxillo facial surgeon">maxillo facial
						surgeon</option>

					<option value="medical officer (dental)">medical officer
						(dental)</option>

					<option value="microbiology">microbiology</option>

					<option value="nephrology">nephrology</option>

					<option value="neurology">neurology</option>

					<option value="neurosurgery">neurosurgery</option>

					<option value="nuclear medicine">nuclear medicine</option>

					<option value="obstetrics &amp; gynaecology">obstetrics
						&amp; gynaecology</option>

					<option value="oncology">oncology</option>

					<option value="ophthalmology">ophthalmology</option>

					<option value="oral surgeon">oral surgeon</option>

					<option value="orthodentist">orthodentist</option>

					<option value="orthopaedics">orthopaedics</option>

					<option value="otolaryngology">otolaryngology</option>

					<option value="p.g. department of orthodontics">p.g.
						department of orthodontics</option>

					<option value="p.g. student">p.g. student</option>

					<option value="paediatric nephrology">paediatric
						nephrology</option>

					<option value="paediatric surgery">paediatric surgery</option>

					<option value="paediatrics">paediatrics</option>

					<option value="pathology">pathology</option>

					<option value="periodontist">periodontist</option>

					<option value="pg student">pg student</option>

					<option value="pharmacology">pharmacology</option>

					<option value="physiology">physiology</option>

					<option value="physiotheraphy">physiotheraphy</option>

					<option value="plastic &amp; cosmetic surgery">plastic
						&amp; cosmetic surgery</option>

					<option value="plastic &amp; maxillofacial">plastic &amp;
						maxillofacial</option>

					<option value="plastic &amp; microsurgeon">plastic &amp;
						microsurgeon</option>

					<option value="plastic surgery">plastic surgery</option>

					<option value="principal">principal</option>

					<option value="prof. &amp; head">prof. &amp; head</option>

					<option value="prof. &amp; head of dental surgery">prof.
						&amp; head of dental surgery</option>

					<option value="prof. &amp; hod">prof. &amp; hod</option>

					<option value="prof. of dental surgeon">prof. of dental
						surgeon</option>

					<option value="professor">professor</option>

					<option value="professor in charge of principal">professor
						in charge of principal</option>

					<option value="prosthodontist">prosthodontist</option>

					<option value="psychiatry">psychiatry</option>

					<option value="radiology">radiology</option>

					<option value="radiotherapy">radiotherapy</option>

					<option value="reader in pedodontics">reader in
						pedodontics</option>

					<option value="registrar">registrar</option>

					<option value="retd. principal">retd. principal</option>

					<option value="rheumatology">rheumatology</option>

					<option value="senior dental surgeon">senior dental
						surgeon</option>

					<option value="senior medical officer">senior medical
						officer</option>

					<option value="senior resident">senior resident</option>

					<option value="senior resident (dental)">senior resident
						(dental)</option>

					<option value="sexology">sexology</option>

					<option value="sonology">sonology</option>

					<option value="sr. dental surgeon">sr. dental surgeon</option>

					<option value="transfusion medicine">transfusion medicine</option>

					<option value="tutor in dental surgeon">tutor in dental
						surgeon</option>

					<option value="ultrasonology">ultrasonology</option>

					<option value="urology">urology</option>

					<option value="vascular surgery">vascular surgery</option>

					<option value="venereal diseases">venereal diseases</option>

					<option value="vice principal">vice principal</option>


				</select><input type="submit" value="search" name="s1">
			</fieldset>
			
		</form>
		 </div>
        </div>
    </div>
</body>
</html>