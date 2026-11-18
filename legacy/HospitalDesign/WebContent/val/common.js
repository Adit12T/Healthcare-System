// JavaScript Document


function number(e)
{	
	var key;
	var keychar;
	if (window.event){
		key = window.event.keyCode;		
	}else if (e){
		key = e.which;		
	}
	else
		return true;
	
	if((key == 8) || (key == 0))
		return true;
		
	keychar = String.fromCharCode(key);
	keychar = keychar.toLowerCase();
	if((key > 47) && (key < 58)){				
		return true;
	}else
	    return false;	
}

function alphanumber(e)
{	
	var key;
	var keychar;
	if (window.event){
		key = window.event.keyCode;		
	}else if (e){
		key = e.which;		
	}
	else
		return true;
	//alert(key);
	if((key == 8) || (key == 0))
		return true;
	
	
	keychar = String.fromCharCode(key);
	keychar = keychar.toLowerCase();
	//alert(keychar);
	
	if(key!=32)
	{ 
		
		invalids = "`~@#$%^*()_+=\|{}[];'\"<>&?!,\\";
		  for(i=0; i<invalids.length; i++) {
			if(keychar != 0)
			{
				if(keychar.indexOf(invalids.charAt(i)) >= 0 || keychar==false) {				           			  
					return false;               
				}
			}
		  }
	}
	return true;		
}




function isNumeric(obj_nam){
  var x=trim(document.getElementById(obj_nam).value);
//  var anum=/(^\d+$)|(^\d+\.\d+$)/;
  var anum=/(^\d+$)/;
  if (anum.test(x)){    
	return true;
  }else{
	  return false;             
  }
}

function alpha(e)
{	
	var key;
	var keychar;
	if (window.event){
		key = window.event.keyCode;		
	}else if (e){
		key = e.which;		
	}
	else
		return true;
	if((key == 8) || (key == 0))
		return true;
		
	keychar = String.fromCharCode(key);
	keychar = keychar.toLowerCase();
	if(key!=32)
	{ 
		
	invalids = "`~@#$%^*()_+=\|{}[]:;'\"<>&?/!,.-1234567890\\";
	//	invalids = "`~@#$%^*()_+=\|\,{}[]:;'\"<>&?/!\\";
		  for(i=0; i<invalids.length; i++) {
			if(keychar.indexOf(invalids.charAt(i)) >= 0 || keychar==false) {				           			  
				   return false;               
			}
		  }
	}
	return true;
		
}

function mypopup(url,width,height)
 {
   mywindow = window.open (url,"mywindow1","location=0,status=1,scrollbars=1,resizable=1,menubar=1,width="+width+",height="+height);
  
   mywindow.focus();
 } 

function numberctrl(e)
{	
	var key;
	var keychar;
	var isCtrl;
	var forbiddenKeys = new Array('a', 'n', 'c', 'x', 'v', 'j');
	if (window.event){
		key = window.event.keyCode;
		if(window.event.ctrlKey)
			isCtrl = true;
        else
            isCtrl = false;
	}else if (e){
		key = e.which;
		if(e.ctrlKey)
			isCtrl = true;
        else
            isCtrl = false;
	}
	else
		return true;	

	if(isCtrl)
	{
		for(i=0; i<forbiddenKeys .length; i++)
		{
			//case-insensitive comparation				
			if(forbiddenKeys[i].toLowerCase() == String.fromCharCode(key).toLowerCase())
			{
					alert('Key combination CTRL + '
							+String.fromCharCode(key)
							+' has been disabled.');
					return false;
			}
		}
	}	
	if((key == 8) || (key == 0))
		return true;
		
	//keychar = String.fromCharCode(key);
	//keychar = keychar.toLowerCase();
	//if((key > 47) && (key < 58)){				
	//	return true;
	//}else
	  //  return false;	
}
function emailctrl(e)
{	
	var key;
	var keychar;
	var isCtrl;
	var forbiddenKeys = new Array('a', 'n', 'c', 'x', 'v', 'j');
	if (window.event){
		key = window.event.keyCode;
		if(window.event.ctrlKey)
			isCtrl = true;
        else
            isCtrl = false;
	}else if (e){
		key = e.which;
		if(e.ctrlKey)
			isCtrl = true;
        else
            isCtrl = false;
	}
	else
		return true;	

	if(isCtrl)
	{
		for(i=0; i<forbiddenKeys .length; i++)
		{
				//case-insensitive comparation				
			if(forbiddenKeys[i].toLowerCase() == String.fromCharCode(key).toLowerCase())
			{
				alert('Key combination CTRL + '
						+String.fromCharCode(key)
						+' has been disabled.');
				return false;
			}
		}
	}	
	if((key == 8) || (key == 0))
		return true;	
}

function isEmailId(SEmail) {
	
	 var emailPattern = /^[a-zA-Z0-9]+([\-_.a-zA-Z0-9]+)*\@[\-_a-zA-Z0-9]+\.[a-zA-Z0-9]{2,3}(\.[a-zA-Z0-9]{2})*$/;
		if(SEmail != null)
		{
			return emailPattern.test(SEmail);
		}	
		else
		{
			return SEmail;
		}
	}


function isAlphabets(obj_nam){
var x = trim(document.getElementById(obj_nam).value);
var invalids = "`~@#$%^*()_+=\|{}[]:;,.-'\"<>?!/1234567890";
for(i=0; i<invalids.length; i++) {
if(x.indexOf(invalids.charAt(i)) >= 0 || x==false) {
return false;
}
}
return true;
}



function alphanumberctrl(e)
{	
	var key;
	var keychar;
	var isCtrl;
	var forbiddenKeys = new Array('a', 'n', 'c', 'x', 'v', 'j');
	if (window.event){
		key = window.event.keyCode;	
		if(window.event.ctrlKey)
			isCtrl = true;
        else
            isCtrl = false;
	}else if (e){
		key = e.which;
		if(e.ctrlKey)
			isCtrl = true;
        else
            isCtrl = false;
	}
	else
		return true;
	//alert(key);
	if(isCtrl)
	{
		for(i=0; i<forbiddenKeys .length; i++)
		{
				//case-insensitive comparation				
			if(forbiddenKeys[i].toLowerCase() == String.fromCharCode(key).toLowerCase())
			{
					alert('Key combination CTRL + '
							+String.fromCharCode(key)
							+' has been disabled.');
					return false;
			}
		}
	}

	if((key == 8) || (key == 0))
		return true;
	/*
	keychar = String.fromCharCode(key);
	keychar = keychar.toLowerCase();
	//alert(keychar);
	
	if(key!=32)
	{ 
		
		invalids = "`~@#$%^*-()_+=\|{}[].:;'\"<>&?/!,\\";
		  for(i=0; i<invalids.length; i++) {
			if(keychar != 0)
			{
				if(keychar.indexOf(invalids.charAt(i)) >= 0 || keychar==false) {				           			  
				//alert(keychar.indexOf(invalids.charAt(i)));
					return false;               
				}
			}
		  }
	}
	return true;		
	*/
}


function trim(value) {
   var temp = value;
   var obj = /^(\s*)([\W\w]*)(\b\s*$)/;
   if (obj.test(temp)) { temp = temp.replace(obj, '$2'); }
   var obj = / +/g;
   temp = temp.replace(obj, " ");
   if (temp == " ") { temp = ""; }
   return temp;
}

function isEmailUserId(SEmail) {
	
	 var emailPattern = /^[a-zA-Z0-9]+([\-_.a-zA-Z0-9]+)*$/;
		if(SEmail != null)
		{
			return emailPattern.test(SEmail);
		}	
		else
		{
			return SEmail;
		}
	}
	function isDomainName(SEmail) {
	
	 var emailPattern = /^[\-_a-zA-Z0-9]+\.[a-zA-Z0-9]{2,3}(\.[a-zA-Z0-9]{2})*$/;
		if(SEmail != null)
		{
			return emailPattern.test(SEmail);
		}	
		else
		{
			return SEmail;
		}
	}


function alphactrl(e)
{	
	var key;
	var keychar;
	var isCtrl;
	var forbiddenKeys = new Array('a', 'n', 'c', 'x', 'v', 'j');
	if (window.event){
		key = window.event.keyCode;	
		if(window.event.ctrlKey)
			isCtrl = true;
        else
            isCtrl = false;
	}else if (e){
		key = e.which;
		if(e.ctrlKey)
			isCtrl = true;
        else
            isCtrl = false;
	}
	else
		return true;
	//alert(key);
	if(isCtrl)
	{
		for(i=0; i<forbiddenKeys .length; i++)
		{
				//case-insensitive comparation				
			if(forbiddenKeys[i].toLowerCase() == String.fromCharCode(key).toLowerCase())
			{
					alert('Key combination CTRL + '
							+String.fromCharCode(key)
							+' has been disabled.');
					return false;
			}
		}
	}

	if((key == 8) || (key == 0))
		return true;
	/*
	keychar = String.fromCharCode(key);
	keychar = keychar.toLowerCase();
	//alert(keychar);
	
	if(key!=32)
	{ 
		
		invalids = "`~@#$%^*-()_+=\|{}[].:;'\"<>&?/!,\\";
		  for(i=0; i<invalids.length; i++) {
			if(keychar != 0)
			{
				if(keychar.indexOf(invalids.charAt(i)) >= 0 || keychar==false) {				           			  
				//alert(keychar.indexOf(invalids.charAt(i)));
					return false;               
				}
			}
		  }
	}
	return true;		
	*/
}


function alphadothyphen(e)
{	
	var key;
	var keychar;
	if (window.event){
		key = window.event.keyCode;		
	}else if (e){
		key = e.which;		
	}
	else
		return true;
	if((key == 8) || (key == 0))
		return true;
		
	keychar = String.fromCharCode(key);
	keychar = keychar.toLowerCase();
	if(key!=32)
	{ 
		
	invalids = "`~@#$%^*()_+=\|{}[]:;'\"<>&?/!,1234567890\\";
	//	invalids = "`~@#$%^*()_+=\|\,{}[]:;'\"<>&?/!\\";
		  for(i=0; i<invalids.length; i++) {
			if(keychar.indexOf(invalids.charAt(i)) >= 0 || keychar==false) {				           			  
				   return false;               
			}
		  }
	}
	return true;
		
}


function get_radio_value(obj)
{	

	var rad_val='';
	for (var i=0; i < obj.length; i++)
  	{
	   if (obj[i].checked)
	   {
		  var rad_val = obj[i].value;
	   }
   	}
	//alert(obj.length+"~"+rad_val);
 return  rad_val;
}

function reg_enable() {
	//var frm=document.reg_frm;
	
	
  	if(get_radio_value(document.reg_frm.onetimeid)=='Y')
	{
		 document.reg_frm.iddetails.disabled=false;
		   
	}
	else
	{
		
	 
	      document.reg_frm.iddetails.disabled=true;
		  document.reg_frm.iddetails.value='';
		   
	}
}

function commuhide() {
	//var frm=document.reg_frm;
		
  	if(document.getElementById('txtccategory').value ==8)
	{
		 document.reg_frm.certifno.disabled=true;
		 document.reg_frm.issuauthority.disabled=true;
		 document.reg_frm.talukdis.disabled=true;
		  document.reg_frm.taluk_s.disabled=true;
		 document.reg_frm.certifno.value='';
		 document.reg_frm.issuauthority.value='';
		 document.reg_frm.talukdis.value='';
		   
	}
	else
	{
		 
	     document.reg_frm.certifno.disabled=false;
		 document.reg_frm.issuauthority.disabled=false;
		 document.reg_frm.talukdis.disabled=false;
		    document.reg_frm.taluk_s.disabled=false;
	}
}


function spo_enable() {
	//var frm=document.reg_frm;
		
  	if(get_radio_value(document.reg_frm.maristatu)=='Y')
	{
		 document.reg_frm.txthname.disabled=false;
		   
	}
	else
	{
		
	 
	      document.reg_frm.txthname.disabled=true;
		  document.reg_frm.txthname.value='';
		   
	}
}

function hidewidow() {
	
	if(get_radio_value(document.reg_frm.optsex)=='M') {
		
		document.reg_frm.widow[0].disabled=true;
		document.reg_frm.widow[1].disabled=true; 
		document.reg_frm.widow[0].checked=false;
		document.reg_frm.widow[1].checked=false;
		
		
		
	} else {
		
		document.reg_frm.widow[0].disabled=false;
		document.reg_frm.widow[1].disabled=false;
		document.reg_frm.widow[0].checked=false;
		document.reg_frm.widow[1].checked=false;
		
		
	}
	
}


function widow_enable() {
	//var frm=document.reg_frm;
	
	
  	if(get_radio_value(document.reg_frm.widow)=='Y')
	{
		 document.reg_frm.widowauth.disabled=false;
		 document.reg_frm.widow_taluk.disabled=false;
		 document.reg_frm.widow_taluk_s.disabled=false;
		 document.reg_frm.widow_income.disabled=false;
		 document.reg_frm.widowmstatus[0].disabled=false;
		 document.reg_frm.widowmstatus[1].disabled=false;
		   
	}
	else
	{
		
	 
	     document.reg_frm.widowauth.disabled=true;
		 document.reg_frm.widow_taluk.disabled=true;
		 document.reg_frm.widow_taluk_s.disabled=true;
		 document.reg_frm.widow_income.disabled=true;
		 document.reg_frm.widowmstatus[0].disabled=true;
		 document.reg_frm.widowmstatus[1].disabled=true;
		 document.reg_frm.widowauth.value='';
		 document.reg_frm.widow_taluk.value='';
		  document.reg_frm.widow_taluk_s.value='';
		 document.reg_frm.widow_income.value='';
		 document.reg_frm.widowmstatus[0].checked=false;
		 document.reg_frm.widowmstatus[1].checked=false;
		 
		   
	}
}


function abled_pers() {
	//var frm=document.reg_frm;
	
	
  	if(get_radio_value(document.reg_frm.abled)=='Y')
	{
		 document.reg_frm.visual_imp.disabled=false;
		 document.reg_frm.hearing.disabled=false;
		 document.reg_frm.ortho.disabled=false;
		 document.reg_frm.per_disab.disabled=false;
		 document.reg_frm.scribe[0].disabled=false;
		 document.reg_frm.scribe[1].disabled=false;
		   
	}
	else
	{
		
		document.reg_frm.visual_imp.disabled=true;
		 document.reg_frm.hearing.disabled=true;
		 document.reg_frm.ortho.disabled=true;
		 document.reg_frm.per_disab.disabled=true;
		 document.reg_frm.scribe[0].disabled=true;
		 document.reg_frm.scribe[1].disabled=true;
		 
		 document.reg_frm.visual_imp.checked=false;
		 document.reg_frm.hearing.checked=false;
		 document.reg_frm.ortho.checked=false;
		 document.reg_frm.per_disab.value='';
		 document.reg_frm.scribe[0].checked=false;
		 document.reg_frm.scribe[1].checked=false;
	 	 
		   
	}
}


function exservices() {
	//var frm=document.reg_frm;
	
	
  	if(get_radio_value(document.reg_frm.exserv)=='Y')
	{
		 document.reg_frm.exser_ppono.disabled=false;
		 document.reg_frm.exseldobday.disabled=false;
		  document.reg_frm.exseldobmon.disabled=false;
		   document.reg_frm.exseldobyear.disabled=false;
		 
		   
	}
	else
	{
		
		document.reg_frm.exser_ppono.disabled=true;
		document.reg_frm.exseldobday.disabled=true;
		document.reg_frm.exseldobmon.disabled=true;
		document.reg_frm.exseldobyear.disabled=true;
		
		document.reg_frm.exser_ppono.value='';
		document.reg_frm.exseldobday.value='';
		document.reg_frm.exseldobmon.value='';
		document.reg_frm.exseldobyear.value='';
		 
		   
	}
}


function govemployee() {
	//var frm=document.reg_frm;
	
	
  	if(get_radio_value(document.reg_frm.gov_emp)=='Y')
	{
		 document.reg_frm.yrs_serv.disabled=false;
		 document.reg_frm.gov_initi[0].disabled=false;
		 document.reg_frm.gov_initi[1].disabled=false;
		 
		 document.reg_frm.gov_pend[0].disabled=false;
		 document.reg_frm.gov_pend[1].disabled=false;
		 
		 document.reg_frm.gov_puni[0].disabled=false;
		 document.reg_frm.gov_puni[1].disabled=false;
		 
		   
	}
	else
	{
		
		document.reg_frm.yrs_serv.disabled=true;
		 document.reg_frm.gov_initi[0].disabled=true;
		 document.reg_frm.gov_initi[1].disabled=true;
		 
		 document.reg_frm.gov_pend[0].disabled=true;
		 document.reg_frm.gov_pend[1].disabled=true;
		 
		 document.reg_frm.gov_puni[0].disabled=true;
		 document.reg_frm.gov_puni[1].disabled=true;
		 				
		document.reg_frm.yrs_serv.value='';
		 document.reg_frm.gov_initi[0].checked=false;
		 document.reg_frm.gov_initi[1].checked=false;
		 
		 document.reg_frm.gov_pend[0].checked=false;
		 document.reg_frm.gov_pend[1].checked=false;
		 
		 document.reg_frm.gov_puni[0].checked=false;
		 document.reg_frm.gov_puni[1].checked=false;
		 
		   
	}
}


function agecons() {
	//var frm=document.reg_frm;
	
	
  	if(get_radio_value(document.reg_frm.age_concess)=='Y')
	{
		 document.reg_frm.age_concess_txt_1.disabled=false;
		/* document.reg_frm.age_concess_txt_2.disabled=false;*/
		 	 
		   
	}
	else
	{
		
		document.reg_frm.age_concess_txt_1.disabled=true;
		document.reg_frm.age_concess_txt_1.value='';
		/*document.reg_frm.age_concess_txt_2.disabled=true;*/
		
		/*document.reg_frm.age_concess_txt_2.value='';  */
		   
	}
}


function claimfee() {
	//var frm=document.reg_frm;
	
	
  	if(get_radio_value(document.reg_frm.claim_fee)=='Y')
	{
		 document.reg_frm.txt_exe_cate.disabled=false;
		 document.reg_frm.claim_fee_val[0].disabled=false;
		 document.reg_frm.claim_fee_val[1].disabled=false;
		 document.reg_frm.claim_fee_val[2].disabled=false;
		 document.reg_frm.claim_fee_val[3].disabled=false;
		 document.reg_frm.claim_fee_val[4].disabled=false;
		 
		 
		 
		   
	}
	else
	{
		
		 document.reg_frm.txt_exe_cate.disabled=true;
		 document.reg_frm.claim_fee_val[0].disabled=true;
		 document.reg_frm.claim_fee_val[1].disabled=true;
		 document.reg_frm.claim_fee_val[2].disabled=true;
		 document.reg_frm.claim_fee_val[3].disabled=true;
		 document.reg_frm.claim_fee_val[4].disabled=true;
		 
		 document.reg_frm.claim_fee_val[0].checked=false;
		 document.reg_frm.claim_fee_val[1].checked=false;
		 document.reg_frm.claim_fee_val[2].checked=false;
		 document.reg_frm.claim_fee_val[3].checked=false;
		 document.reg_frm.claim_fee_val[4].checked=false;
		 document.reg_frm.txt_exe_cate.value='';
		 
		   
	}
}

function getcommun()
{
var x=1;
document.getElementById('issuauthority').options.length=0;
document.getElementById('issuauthority').options[0] = new Option('Select','');
//document.reg_frm.txtcentrecode.value='';
company_apply=document.getElementById('txtccategory').value;
//alert(company_apply);
//confirmed_employe=get_radio_value(document.reg_frm.confirmed_employe);
var centre_list='';
//var addyear=0;
if(company_apply !="")
{
centre_list=getCentrefromajax();
if(centre_list.indexOf(",")==-1)
{
var centre_info = centre_list.split("|");
centre_code=centre_info[0].toString();
centre_value=centre_info[1].toString();
document.getElementById('issuauthority').options[x] = new Option(centre_value,centre_code);
}
else
{
var centre_multiple = centre_list.split(",");
for(i = 0; i < centre_multiple.length; i++)
{
centre_list=centre_multiple[i];
var centre_info = centre_list.split("|");
centre_code=centre_info[0].toString();
centre_value=centre_info[1].toString();
document.getElementById('issuauthority').options[x] = new Option(centre_value,centre_code);
x++;
}
}

}
}//end of function getYears()

function getCentrefromajax(){
if (window.XMLHttpRequest)
{// code for IE7+, Firefox, Chrome, Opera, Safari
xmlhttp=new XMLHttpRequest();
}
else
{// code for IE6, IE5
xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
}
state_apply=document.getElementById('txtccategory').value;
//alert(state_apply);
xmlhttp.open("POST",'ajax_getCommunity.php?selcompany='+state_apply,false);
//xmlhttp.open("POST",'ajax_checkImageStatus.php?imagename='+imagename_1+imagename_2+imagename_3+imagename_4+imagename_5+'&imagetype=signature',false);
xmlhttp.send(null);
return xmlhttp.responseText;
}

