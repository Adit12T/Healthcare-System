// JavaScript Document

var DateDiff = {

    inDays: function(d1, d2) {
        var t2 = d2.getTime();
        var t1 = d1.getTime();

        return parseInt((t2-t1)/(24*3600*1000));
    },

    inWeeks: function(d1, d2) {
        var t2 = d2.getTime();
        var t1 = d1.getTime();

        return parseInt((t2-t1)/(24*3600*1000*7));
    },

    inMonths: function(d1, d2) {
        var d1Y = d1.getFullYear();
        var d2Y = d2.getFullYear();
        var d1M = d1.getMonth();
        var d2M = d2.getMonth();

        return (d2M+12*d2Y)-(d1M+12*d1Y);
    },

    inYears: function(d1, d2) {
        return d2.getFullYear()-d1.getFullYear();
    }
}



function login_val(){
	
	if(document.getElementById('reg_no').value=='')
			{			
				alert("Please Enter Your Registration No.");
				document.getElementById('reg_no').focus();
				return false;	
			}
			 
			if(document.getElementById('seldobday').value=='' && document.getElementById('seldobmon').value=='' && document.getElementById('seldobday').value=='')
					 {
						 alert("Please Select Date of Birth");
						document.getElementById('seldobday').focus();
						return false;
					 }
							  
				  if(document.getElementById('seldobday').value!='' && document.getElementById('seldobmon').value=='' && document.getElementById('seldobyear').value=='')
					 {
						 alert("Please Select Month and Year in the Date of Birth");
						document.getElementById('seldobmon').focus();
						return false;
					 }
					 
					 if(document.getElementById('seldobday').value!='' && document.getElementById('seldobmon').value!='' && document.getElementById('seldobyear').value=='')
					 {
						 alert("Please Select Year in the Date of Birth");
						document.getElementById('seldobyear').focus();
						return false;
					 }
					 
					 if(document.getElementById('seldobday').value=='' && document.getElementById('seldobmon').value!='' && document.getElementById('seldobyear').value!='')
					 {
						 alert("Please Select Date in the Date of Birth");
						document.getElementById('seldobday').focus();
						return false;
					 }
					  if(document.getElementById('seldobday').value!='' && document.getElementById('seldobmon').value=='' && document.getElementById('seldobyear').value!='')
					 {
						 alert("Please Select Month in the Date of Birth");
						document.getElementById('seldobmon').focus();
						return false;
					 }		
			
			document.reg_frm2.action="login.php";
			document.reg_frm2.submit();
	
}


function validate(){
	
	var frm=document.reg_frm;	
	
	   if(get_radio_value(document.reg_frm.post_apply) == '')
		   {
			alert("Please Select Post Applied");
			document.getElementById('post_apply').focus();
			return false;	
		   }
	 
	if(get_radio_value(document.reg_frm.post_apply)=='officers')
	{
		if(document.getElementById('gate_alpha1').value=='')
			{			
				alert("Please Select first two alphabets in the GATE Registration No. ");
				document.getElementById('gate_alpha1').focus();
				return false;	
			}
			 
			if(document.getElementById('gate_no1').value=='')
			{	
				alert("Please Enter 4 digits in the GATE Registration No. ");
				document.getElementById('gate_no1').focus();
				return false;	
			}
			
			if(trim(document.getElementById('gate_no1').value).length < 4)
			{	
				alert("GATE Registration No. should be 8 digits.");
				document.getElementById('gate_no1').focus();
				return false;	
			}
			
			if(document.getElementById('gate_no2').value=='')
			{			
				alert("Please Enter 4 digits in the GATE Registration No. ");
				document.getElementById('gate_no2').focus();
				return false;	
			}
			
			if(trim(document.getElementById('gate_no2').value).length < 4)
			{	
				alert("GATE Registration No. should be 8 digits.");
				document.getElementById('gate_no2').focus();
				return false;	
			}
			//confirm checking
			
			if(document.getElementById('gate_alpha_confirm1').value=='')
			{			
				alert("Please Select first two alphabets in the Reconfirm GATE Registration No. ");
				document.getElementById('gate_alpha_confirm1').focus();
				return false;	
			}
			 
			if(document.getElementById('gate_no1_confirm').value=='')
			{	
				alert("Please Enter 4 digits in the Reconfirm GATE Registration No. ");
				document.getElementById('gate_no1_confirm').focus();
				return false;	
			}
			
			if(document.getElementById('gate_no2_confirm').value=='')
			{			
				alert("Please Enter 4 digits in the Reconfirm GATE Registration No. ");
				document.getElementById('gate_no2_confirm').focus();
				return false;	
			}
			
			
			
			//compare with reconfirmation GATE no
			
			if( (document.getElementById('gate_alpha1').value!=document.getElementById('gate_alpha_confirm1').value) || (document.getElementById('gate_no1').value!=document.getElementById('gate_no1_confirm').value) || (document.getElementById('gate_no2').value!=document.getElementById('gate_no2_confirm').value) )
			{
				alert("Please check your GATE registration and reconfirm.");
				document.getElementById('gate_alpha_confirm1').focus();
				return false; 
			}
					
	 }
	 
	 
	 
	 //Asst officers code start
	 
	 
	 
	if(get_radio_value(document.reg_frm.post_apply)=='asst')
	{
		if(document.getElementById('gate_alpha2').value=='')
			{			
				alert("Please Select first two alphabets in the GATE Registration No. ");
				document.getElementById('gate_alpha2').focus();
				return false;	
			}
			 
			if(document.getElementById('gate_no11').value=='')
			{	
				alert("Please Enter 4 digits in the GATE Registration No. ");
				document.getElementById('gate_no11').focus();
				return false;	
			}
			
			if(trim(document.getElementById('gate_no11').value).length < 4)
			{	
				alert("GATE Registration No. should be 8 digits.");
				document.getElementById('gate_no11').focus();
				return false;	
			}
			
			if(document.getElementById('gate_no12').value=='')
			{			
				alert("Please Enter 4 digits in the GATE Registration No. ");
				document.getElementById('gate_no12').focus();
				return false;	
			}
			if(trim(document.getElementById('gate_no12').value).length < 4)
			{	
				alert("GATE Registration No. should be 8 digits.");
				document.getElementById('gate_no12').focus();
				return false;	
			}
			
			//confirm checking
			
			if(document.getElementById('gate_alpha_confirm2').value=='')
			{			
				alert("Please Select first two alphabets in the Reconfirm GATE Registration No. ");
				document.getElementById('gate_alpha_confirm2').focus();
				return false;	
			}
			 
			if(document.getElementById('gate_no11_confirm').value=='')
			{	
				alert("Please Enter 4 digits in the Reconfirm GATE Registration No. ");
				document.getElementById('gate_no11_confirm').focus();
				return false;	
			}
			
			if(document.getElementById('gate_no12_confirm').value=='')
			{			
				alert("Please Enter 3 digits in the Reconfirm GATE Registration No. ");
				document.getElementById('gate_no12_confirm').focus();
				return false;	
			}
			
			//compare with reconfirmation GATE no
			
			if( (document.getElementById('gate_alpha2').value!=document.getElementById('gate_alpha_confirm2').value) || (document.getElementById('gate_no11').value!=document.getElementById('gate_no11_confirm').value) || (document.getElementById('gate_no12').value!=document.getElementById('gate_no12_confirm').value) )
			{
				alert("Please check your GATE registration and reconfirm.");
				document.getElementById('gate_alpha_confirm11').focus();
				return false; 
			}
			
			
			
	 }
	 
	  
	 if(document.reg_frm.accept_gateno.checked == false)
		{ 	 
			alert("Please accept the terms and conditions before submission");
			document.getElementById('accept_gateno').focus();
			return false;	
		   }
		  
                    document.reg_frm.action="registration_2.php";
					document.reg_frm.submit();

 
}




function not_eligible()
 {
 
 if(get_radio_value(document.reg_frm.emp_iocl)=='No')
  {
	 if(document.getElementById('regular_course').value=='No')
	 alert('Candidates with full time regular course are only eligible to apply');
	 document.getElementById('regular_course').focus();
	 return false;	
  }
 }




function validate_main()
{
	              

	
	if(document.getElementById('first_name').value=="")
		{
			alert("Please Enter Your Name");
			document.getElementById('first_name').focus();
			return false;
		}
		
   if(!isAlphabets('first_name'))
	{
				alert("Name should be Alphabets Only");
				document.getElementById('first_name').focus();
				return false;
	}
	
	/*if(get_radio_value(document.reg_frm.optsex) == '')
		   {
			alert("Please Select Gender");
			document.getElementById('optsex').focus();
			return false;	
		   }*/
	
	//Date of Birth validation
		
		if(document.getElementById('seldobday').value=='' && document.getElementById('seldobmon').value=='' && document.getElementById('seldobday').value=='')
					 {
						 alert("Please Select Date of Birth");
						document.getElementById('seldobday').focus();
						return false;
					 }
							  
				  if(document.getElementById('seldobday').value!='' && document.getElementById('seldobmon').value=='' && document.getElementById('seldobyear').value=='')
					 {
						 alert("Please Select Month and Year in the Date of Birth");
						document.getElementById('seldobmon').focus();
						return false;
					 }
					 
					 if(document.getElementById('seldobday').value!='' && document.getElementById('seldobmon').value!='' && document.getElementById('seldobyear').value=='')
					 {
						 alert("Please Select Year in the Date of Birth");
						document.getElementById('seldobyear').focus();
						return false;
					 }
					 
					 if(document.getElementById('seldobday').value=='' && document.getElementById('seldobmon').value!='' && document.getElementById('seldobyear').value!='')
					 {
						 alert("Please Select Date in the Date of Birth");
						document.getElementById('seldobday').focus();
						return false;
					 }
					  if(document.getElementById('seldobday').value!='' && document.getElementById('seldobmon').value=='' && document.getElementById('seldobyear').value!='')
					 {
						 alert("Please Select Month in the Date of Birth");
						document.getElementById('seldobmon').focus();
						return false;
					 }		
					 
					 
					 if(document.getElementById('seldobday').value!='' && document.getElementById('seldobmon').value!='' && document.getElementById('seldobyear').value!='')
					 {
						$dobday=document.getElementById('seldobday').value;
						$dobmon=document.getElementById('seldobmon').value
						$dobyear=document.getElementById('seldobyear').value
					   curDate=currentDate.split(":");
						var d1 = new Date($dobyear,$dobmon,$dobday);
						var d2 = new Date(curDate[0],curDate[1],curDate[2]);
									dateDiff=DateDiff.inDays(d1, d2);
									if(dateDiff <0){
										 alert('Invalid Date Of Birth.');
										 document.getElementById('seldobyear').focus();
										 return false;
									} 
					 }
	if(get_radio_value(document.reg_frm.emp_iocl) == '')
		   {
			alert("Please Select Are You presently in Employment with IOCL");
			document.getElementById('emp_iocl').focus();
			return false;	
		   }
		   
    if(document.getElementById('txtccategory').value=='')
		{			
			alert('Please Select your Category');
			document.getElementById('txtccategory').focus();
			return false;	
		}
		
// CATEGORY DETAILS START
 if(document.getElementById('txtccategory').value=='2' || document.getElementById('txtccategory').value=='3' || document.getElementById('txtccategory').value=='4')
 {	
	if(document.getElementById('caste_name').value=='')
		{			
			alert('Please Enter your Name of Caste/Community');
			document.getElementById('caste_name').focus();
			return false;	
		}
		
   if(document.getElementById('seldobday_caste').value=='' && document.getElementById('seldobmon_caste').value=='' && document.getElementById('seldobyear_caste').value=='')
	 {
		 alert("Please Select the Date of Issuing Caste cert.");
		document.getElementById('seldobday_caste').focus();
		return false;
	 }
				
	if(document.getElementById('seldobday_caste').value!='' && document.getElementById('seldobmon_caste').value=='' && document.getElementById('seldobyear_caste').value=='')
	 {
		 alert("Please Select Month and Year in the Date of Issuing Caste cert.");
		document.getElementById('seldobmon_caste').focus();
		return false;
	 }
	 if(document.getElementById('seldobday_caste').value=='' && document.getElementById('seldobmon_caste').value!='' && document.getElementById('seldobyear_caste').value=='')
	 {
		 alert("Please Select Date and Year in the Date of Issuing Caste cert.");
		document.getElementById('seldobday_caste').focus();
		return false;
	 }
	 
	 if(document.getElementById('seldobday_caste').value=='' && document.getElementById('seldobmon_caste').value=='' && document.getElementById('seldobyear_caste').value!='')
	 {
		 alert("Please Select Date and Month in the Date of Issuing Caste cert.");
		document.getElementById('seldobday_caste').focus();
		return false;
	 }
	 
	 if(document.getElementById('seldobday_caste').value!='' && document.getElementById('seldobmon_caste').value!='' && document.getElementById('seldobyear_caste').value=='')
	 {
		 alert("Please Select Year in the Date of Issuing Caste cert.");
		document.getElementById('seldobyear_caste').focus();
		return false;
	 }
	 
	 if(document.getElementById('seldobday_caste').value=='' && document.getElementById('seldobmon_caste').value!='' && document.getElementById('seldobyear_caste').value!='')
	 {
		 alert("Please Select Date in the Date of Issuing Caste cert.");
		document.getElementById('seldobday_caste').focus();
		return false;
	 }
	  
	  if(document.getElementById('seldobday_caste').value!='' && document.getElementById('seldobmon_caste').value=='' && document.getElementById('seldobyear_caste').value!='')
	 {
		 alert("Please Select Month in the Date of Issuing Caste cert.");
		document.getElementById('seldobmon_caste').focus();
		return false;
	 }
	 
	 
	
	if(document.getElementById('seldobday_caste').value!='' && document.getElementById('seldobmon_caste').value!='' && document.getElementById('seldobyear_caste').value!='')
	 {
	    $dobday=document.getElementById('seldobday_caste').value;
		$dobmon=document.getElementById('seldobmon_caste').value
		$dobyear=document.getElementById('seldobyear_caste').value
	   curDate=currentDate.split(":");
		var d1 = new Date($dobyear,$dobmon,$dobday);
		var d2 = new Date(curDate[0],curDate[1],curDate[2]);
					dateDiff=DateDiff.inDays(d1, d2);
					if(dateDiff <0){
						 alert('Date of Issuing Caste cert. Cannot be Greater Than Current Date');
						 document.getElementById('seldobyear_caste').focus();
					     return false;
					} 
	 }
	 
	 
	 if(document.getElementById('caste_auth').value=='')
		{			
			alert('Please Enter Caste cert. issuing authority');
			document.getElementById('caste_auth').focus();
			return false;	
		}
	 
	
 }
	 
// CATEGORY DETAILS END
	 
	 if(document.getElementById('txtregl').value=='')
		{			
			alert("Please Select Religion");
			document.getElementById('txtregl').focus();
			return false;	
		}
		
	 if(document.getElementById('txtregl').value=='7')
		{			
		  if(document.getElementById('other_regligion').value=='')
		   {
			alert("Please Enter your Religion");
			document.getElementById('other_regligion').focus();
			return false;	
		   }
		}
		
		//Handicap validation
		if(document.getElementById('handicap').value=='')		 
		   {
			alert("Please Select Whether belongs to persons with Disabilities(PWD)?");
			document.getElementById('handicap').focus();
			return false;	
		   }
	
		if(document.getElementById('handicap').value=='Yes')		 
		   {
		     if(document.getElementById('disable_percentage').value=='')
			  {
				  alert("Please Enter % of Disability");
			     document.getElementById('disable_percentage').focus();
			     return false;	
			  }
			  
			  if(document.getElementById('type_disable').value=='')
			  {
				  alert("Please Select Type of Disability");
			     document.getElementById('type_disable').focus();
			     return false;	
			  }
			  
			  if(document.getElementById('pwd_cert_no').value=='')
			  {
				  alert("Please Enter PWD certificate Sl.NO.");
			     document.getElementById('pwd_cert_no').focus();
			     return false;	
			  }
			    
			  if(document.getElementById('seldobday_pwd').value=='' && document.getElementById('seldobmon_pwd').value=='' && document.getElementById('seldobyear_pwd').value=='')
				 {
					 alert("Please Select the Date of Issuing PWD cert.");
					document.getElementById('seldobday_pwd').focus();
					return false;
				 }
							
				if(document.getElementById('seldobday_pwd').value!='' && document.getElementById('seldobmon_pwd').value=='' && document.getElementById('seldobyear_pwd').value=='')
				 {
					 alert("Please Select Month and Year in the Date of Issuing PWD cert.");
					document.getElementById('seldobmon_pwd').focus();
					return false;
				 }
				 
				
				 if(document.getElementById('seldobday_pwd').value=='' && document.getElementById('seldobmon_pwd').value!='' && document.getElementById('seldobyear_pwd').value=='')
				 {
					 alert("Please Select Date and Year in the Date of Issuing PWD cert.");
					document.getElementById('seldobday_pwd').focus();
					return false;
				 }
				 
				 if(document.getElementById('seldobday_pwd').value=='' && document.getElementById('seldobmon_pwd').value=='' && document.getElementById('seldobyear_pwd').value!='')
				 {
					 alert("Please Select Date and Month in the Date of Issuing PWD cert.");
					document.getElementById('seldobday_pwd').focus();
					return false;
				 }
				 
				 if(document.getElementById('seldobday_pwd').value!='' && document.getElementById('seldobmon_pwd').value!='' && document.getElementById('seldobyear_pwd').value=='')
				 {
					 alert("Please Select Year in the Date of Issuing PWD cert.");
					document.getElementById('seldobyear_pwd').focus();
					return false;
				 }
				 
				 if(document.getElementById('seldobday_pwd').value=='' && document.getElementById('seldobmon_pwd').value!='' && document.getElementById('seldobyear_pwd').value!='')
				 {
					 alert("Please Select Date in the Date of Issuing PWD cert.");
					document.getElementById('seldobday_pwd').focus();
					return false;
				 }
				   
				 
				  if(document.getElementById('seldobday_pwd').value!='' && document.getElementById('seldobmon_pwd').value=='' && document.getElementById('seldobyear_pwd').value!='')
				 {
					 alert("Please Select Month in the Date of Issuing PWD cert.");
					document.getElementById('seldobmon_pwd').focus();
					return false;
				 }
				 
				 
				 if(document.getElementById('seldobday_pwd').value!='' && document.getElementById('seldobmon_pwd').value!='' && document.getElementById('seldobyear_pwd').value!='')
					 {
						$dobday=document.getElementById('seldobday_pwd').value;
						$dobmon=document.getElementById('seldobmon_pwd').value
						$dobyear=document.getElementById('seldobyear_pwd').value
					   curDate=currentDate.split(":");
						var d1 = new Date($dobyear,$dobmon,$dobday);
						var d2 = new Date(curDate[0],curDate[1],curDate[2]);
									dateDiff=DateDiff.inDays(d1, d2);
									if(dateDiff <0){
										 alert('Date of Issuing PWD cert. Cannot be Greater Than Current Date');
										 document.getElementById('seldobyear_pwd').focus();
										 return false;
									} 
					 }
				 
				 
				 
			  if(document.getElementById('issue_by').value=='')
			  {
				  alert("Please Enter Issued by");
			     document.getElementById('issue_by').focus();
			     return false;	
			  }
			    
		   }
		   
		   
		//Ex-service validation   
		   
		 if(document.getElementById('exservice').value=='')		 
		   {
			alert("Please Select Whether Ex-Serviceman?");
			document.getElementById('exservice').focus();
			return false;	
		   }  
		 if(document.getElementById('exservice').value=='Yes')		 
		   {
				 if(document.getElementById('exservice_force').value=='')
				  {
					  alert("Please Select served in which force");
					 document.getElementById('exservice_force').focus();
					 return false;	
				  }
				  
			   if(document.getElementById('selfrommon_ex').value=="")
				{
					alert("Please Select period of Service  From Month");
					document.getElementById('selfrommon_ex').focus();
					return false;
				}	
				
				 if(document.getElementById('selfromyr_ex').value=="")
				{
					alert("Please Select period of Service From Year");
					document.getElementById('selfromyr_ex').focus();
					return false;
				}	
						
				
				 if(document.getElementById('seltomon_ex').value=="")
				{
					alert("Please Select period of Service To Month");
					document.getElementById('seltomon_ex').focus();
					return false;
				}	
				
				 if(document.getElementById('seltoyr_ex').value=="")
				{
					alert("Please Select period of Service To Year");
					document.getElementById('seltoyr_ex').focus();
					return false;
				}	
				    
			    
				
		   }
		    
		   
		if(document.getElementById('domi_jk').value=='')
		{			
			alert("Please Select Domiciled in JK");
			document.getElementById('domi_jk').focus();
			return false;	
		}
		
		
		
		
		//Age calculation and  age condition check start 
					 
					  
						 
					 if( (document.getElementById('seldobyear').value!='') && (document.getElementById('seldobmon').value!='') && (document.getElementById('seldobday').value!='') )
						{		
							var BirthDate=document.getElementById('seldobday').value+'/'+document.getElementById('seldobmon').value+'/'+document.getElementById('seldobyear').value;
							if (isDate(BirthDate)==false){
								alert("Invalid Date Of Birth.");
								document.getElementById('seldobday').focus();
								return false;
							}else{
								
								var asOnDate = new Date(2013,06,30);			
								var varBDate = new Date(document.getElementById('seldobyear').value,document.getElementById('seldobmon').value,document.getElementById('seldobday').value);
								var dife = datediff(asOnDate, varBDate);
								 //alert(dife[0]+"years "+dife[1]+"months "+dife[2]+"days" );
								
								 
							//************************************************OFFICERS validation start	********************************************/
							if(get_radio_value(document.reg_frm.emp_iocl)=='No' && document.getElementById('post_apply').value=='officers'){	
							
							//alert('officer validation'+document.getElementById('handicap').value+'-'+document.getElementById('disable_percentage').value);
								 
								if((dife[0] >= 26 || dife[0] <= 16) && document.getElementById('txtccategory').value==1 && document.getElementById('exservice').value=='No' && document.getElementById('handicap').value=='No' && document.getElementById('domi_jk').value=='No')
								{ //GEN 
								
								   
								     if((dife[0] >= 26 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
									  {
									   alert('You are not eligible to apply due to age criterion.');										 
										  document.getElementById('seldobyear').focus();
										  return false;
									  }
								}else if((dife[0] >= 29 || dife[0] <= 16) && document.getElementById('txtccategory').value==4 && document.getElementById('exservice').value=='No' && document.getElementById('handicap').value=='No' && document.getElementById('domi_jk').value=='No')
								{ //OBC 
									if((dife[0] >= 29 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
									  {
									     alert('You are not eligible to apply due to age criterion.');										 
										  document.getElementById('seldobyear').focus();
										  return false;
									  }
								
								}else if((dife[0] >= 31 || dife[0] <= 16) && (document.getElementById('txtccategory').value==2 || document.getElementById('txtccategory').value==3 ) && document.getElementById('exservice').value=='No' && document.getElementById('handicap').value=='No' && document.getElementById('domi_jk').value=='No')
								{ //SC/ST  
									if((dife[0] >= 31 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
									  {
									    alert('You are not eligible to apply due to age criterion.');										 
										  document.getElementById('seldobyear').focus();
										  return false;
									  }
								
								}else if((dife[0] >= 26 || dife[0] <= 16) && document.getElementById('txtccategory').value==1 && document.getElementById('handicap').value=='Yes' && document.getElementById('disable_percentage').value < 40)
								{ //PWD + GEN + PWD % 40 
								    
									if((dife[0] >= 26 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
									  {
									     alert('Not Eligible Under PWD Category.You are being Considered under your respective Category(Gen/SC/ST/OBC).');										 
										  document.getElementById('seldobyear').focus();
										  return false;
										  
									  }
								}else if((dife[0] > 35 || dife[0] <= 16) && document.getElementById('txtccategory').value==1 && document.getElementById('handicap').value=='Yes' && document.getElementById('disable_percentage').value >= 40)
								{ //PWD + GEN + PWD % 40  Greater
								    
									if((dife[0] > 35 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
									  {
									     alert('You are not eligible to apply due to age criterion.');										 
										  document.getElementById('seldobyear').focus();
										  return false;
										  
									  }
								}else if((dife[0] >= 29 || dife[0] <= 16) && document.getElementById('txtccategory').value==4 && document.getElementById('handicap').value=='Yes' && document.getElementById('disable_percentage').value < 40)
								{ //PWD + OBC + PWD % 40 
								    
									if((dife[0] >= 29 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
									  {
									     alert('Not Eligible Under PWD Category.You are being Considered under your respective Category(Gen/SC/ST/OBC).');										 
										  document.getElementById('seldobyear').focus();
										  return false;
										  
									  }
									  
									  
								}else if((dife[0] >35 || dife[0] <= 16) && document.getElementById('txtccategory').value==4 && document.getElementById('handicap').value=='Yes' && document.getElementById('disable_percentage').value >= 40)
								{ //PWD + OBC + PWD % 40 Greater
								    
									if((dife[0] > 35 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
									  {
									     alert('You are not eligible to apply due to age criterion.');										 
										  document.getElementById('seldobyear').focus();
										  return false;
										  
									  }
								}else if((dife[0] >= 31 || dife[0] <= 16) && (document.getElementById('txtccategory').value==2 || document.getElementById('txtccategory').value==3 ) && document.getElementById('handicap').value=='Yes' && document.getElementById('disable_percentage').value < 40)
								{ //PWD + OBC + PWD % 40 
								    
									if((dife[0] >= 31 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
									  {
									     alert('Not Eligible Under PWD Category.You are being Considered under your respective Category(Gen/SC/ST/OBC).');										 
										  document.getElementById('seldobyear').focus();
										  return false;
										  
									  }
									  
								}else if((dife[0] > 35 || dife[0] <= 16) && (document.getElementById('txtccategory').value==2 || document.getElementById('txtccategory').value==3 ) && document.getElementById('handicap').value=='Yes' && document.getElementById('disable_percentage').value >= 40)
								{ //PWD + OBC + PWD % 40  greater
								    
									if((dife[0] > 35 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
									  {
									     alert('You are not eligible to apply due to age criterion.');										 
										  document.getElementById('seldobyear').focus();
										  return false;
										  
									  }	  
								
								/*}else if((dife[0] >= 36 || dife[0] <= 16) && document.getElementById('handicap').value=='Yes' && document.getElementById('disable_percentage').value < 40)
								{ //PWD
								    
									if((dife[0] >= 36 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
									  {
									     alert('You are not eligible to apply due to age criterion.');										 
										  document.getElementById('seldobyear').focus();
										  return false;
										  
									  }*/
									  
									  
								
								
								/*}else if((dife[0] >= 31 || dife[0] <= 16) && document.getElementById('handicap').value=='No' && document.getElementById('domi_jk').value=='Yes' && document.getElementById('exservice').value=='No'){ //domil JK
										
										if((dife[0] >= 31 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										  {
											alert('You are not eligible to apply due to age criterion.');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
										   }*/
									
									
									}else if((dife[0] >= 26 || dife[0] <= 16) && document.getElementById('txtccategory').value==1 && document.getElementById('handicap').value=='No' && document.getElementById('exservice').value=='Yes' && document.getElementById('txtexser').value < 60  && document.getElementById('domi_jk').value=='No'){ //EXserver + Less 60 month + GEN
										
										if((dife[0] >= 26 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										  {
											alert('You are not eligible to apply due to age criterion.');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
										   }
									}else if((dife[0] > 30 || dife[0] <= 16) && document.getElementById('txtccategory').value==1 && document.getElementById('handicap').value=='No' && document.getElementById('exservice').value=='Yes' && document.getElementById('txtexser').value >= 60  && document.getElementById('domi_jk').value=='No'){ //EXserver + Greater 60 month + GEN
										
										if((dife[0] > 30 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										  {
											alert('You are not eligible to apply due to age criterion.');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
										   }
										   
									 }else if((dife[0] >= 29 || dife[0] <= 16) && document.getElementById('txtccategory').value==4 && document.getElementById('handicap').value=='No' && document.getElementById('exservice').value=='Yes' && document.getElementById('txtexser').value < 60  && document.getElementById('domi_jk').value=='No'){ //EXserver + Less 60 month + OBC
										
										if((dife[0] >= 29 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										  {
											alert('You are not eligible to apply due to age criterion.');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
										   }
										   
									  }else if((dife[0] > 33 || dife[0] <= 16) && document.getElementById('txtccategory').value==4 && document.getElementById('handicap').value=='No' && document.getElementById('exservice').value=='Yes' && document.getElementById('txtexser').value >= 60  && document.getElementById('domi_jk').value=='No'){ //EXserver + Greater 60 month + OBC
										
										if((dife[0] > 33 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										  {
											alert('You are not eligible to apply due to age criterion.');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
										   }
									
									  }else if((dife[0] >= 31 || dife[0] <= 16) && (document.getElementById('txtccategory').value==2 || document.getElementById('txtccategory').value==3 ) && document.getElementById('handicap').value=='No' && document.getElementById('exservice').value=='Yes' && document.getElementById('txtexser').value < 60  && document.getElementById('domi_jk').value=='No'){ //EXserver + LESS 60 month + SC/ST
										
										if((dife[0] >= 31 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										  {
											alert('You are not eligible to apply due to age criterion.');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
										   }
									  
									  }else if((dife[0] > 35 || dife[0] <= 16) && (document.getElementById('txtccategory').value==2 || document.getElementById('txtccategory').value==3 ) && document.getElementById('handicap').value=='No' && document.getElementById('exservice').value=='Yes' && document.getElementById('txtexser').value >= 60  && document.getElementById('domi_jk').value=='No'){ //EXserver + Greater 60 month + SC/ST
										
										if((dife[0] > 35 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										  {
											alert('You are not eligible to apply due to age criterion.');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
										   }
									 
									
									  /*}else if((dife[0] >= 31 || dife[0] <= 16) && document.getElementById('handicap').value=='No' && document.getElementById('exservice').value=='Yes' && document.getElementById('txtexser').value < 60  && document.getElementById('domi_jk').value=='No'){ //Ex-serviceman
										 
										   if((dife[0] >= 31 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
											{
											 alert('You are not eligible to apply due to age criterion.');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
											}*/
										  
									  }else if((dife[0] > 30 || dife[0] <= 16) && document.getElementById('txtccategory').value==1 && document.getElementById('handicap').value=='No' && document.getElementById('domi_jk').value=='Yes' && document.getElementById('exservice').value=='No'){ //domil JK
										
										if((dife[0] > 30 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										  {
											alert('You are not eligible to apply due to age criterion.');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
										   }
										   
									  }else if((dife[0] > 33 || dife[0] <= 16) && document.getElementById('txtccategory').value==4 && document.getElementById('handicap').value=='No' && document.getElementById('domi_jk').value=='Yes' && document.getElementById('exservice').value=='No'){ //domil JK
										
										if((dife[0] > 33 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										  {
											alert('You are not eligible to apply due to age criterion.');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
										   }
									  }else if((dife[0] > 35 || dife[0] <= 16) && (document.getElementById('txtccategory').value==2 || document.getElementById('txtccategory').value==3 ) && document.getElementById('handicap').value=='No' && document.getElementById('domi_jk').value=='Yes' && document.getElementById('exservice').value=='No'){ //domil JK
										
										if((dife[0] > 35 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										  {
											alert('You are not eligible to apply due to age criterion.');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
										   }
								 
									  }
								 
								 
								 
								//document.getElementById('txtage').innerHTML= dife[0]+"years "+dife[1]+"months "+dife[2]+"days";
								//document.getElementById('calage').value= dife[0]+"years "+dife[1]+"months "+dife[2]+"days";
								
									/*if(dife[0]<20 || dife[0]>40){
										alert("Age should be minimum 20 years. For maximum age limit, please go through the 'Seeking age relaxation' section.");
										document.getElementById('seldobyear').focus();
										return false;
									}*/
							
						//****************************************************OFFICERS validation End	****************************************************/
						
						//***********************************************ASST OFFICERS validation Start	******************************************************/
							}else if(get_radio_value(document.reg_frm.emp_iocl)=='No' && document.getElementById('post_apply').value=='asst'){	   
			
						
									if((dife[0] >= 30 || dife[0] <= 16) && document.getElementById('txtccategory').value==1 && document.getElementById('handicap').value=='No' && document.getElementById('domi_jk').value=='No' && document.getElementById('exservice').value=='No') //GEN 
									  {
										if((dife[0] >= 30 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										  {
										   alert('You are not eligible to apply due to age criterion.');
										  //alert('You are not eligible to apply');
										   document.getElementById('seldobyear').focus();
										  return false;
										  }
									  
									  
									  }else if((dife[0] >= 33 || dife[0] <= 16) && document.getElementById('txtccategory').value==4 && document.getElementById('handicap').value=='No' && document.getElementById('domi_jk').value=='No' && document.getElementById('exservice').value=='No'){  //OBC
										 if((dife[0] >= 33 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										  {
											 alert('You are not eligible to apply due to age criterion.');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
										  }
										  
									  }else if((dife[0] >= 35 || dife[0] <= 16) &&  (document.getElementById('txtccategory').value==2 || document.getElementById('txtccategory').value==3 ) && document.getElementById('handicap').value=='No' && document.getElementById('domi_jk').value=='No' && document.getElementById('exservice').value=='No'){ //SC/ST
										
										if((dife[0] >= 35 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										 {
											 alert('You are not eligible to apply due to age criterion.');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false;
										 }
										 
									  }else if((dife[0] >= 30 || dife[0] <= 16) && document.getElementById('txtccategory').value==1 && document.getElementById('handicap').value=='Yes' && document.getElementById('disable_percentage').value < 40){ 
									  //PWD + Lesser % of PWD+ GEN
										 
										 if((dife[0] >= 30 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										 {
											 alert('Not Eligible Under PWD Category.You are being Considered under your respective Category(Gen/SC/ST/OBC).');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
										 }
										 
									 }else if((dife[0] > 39 || dife[0] <= 16) && document.getElementById('txtccategory').value==1 && document.getElementById('handicap').value=='Yes' && document.getElementById('disable_percentage').value >= 40){ 
									 //PWD +greater % of PWD+ GEN
										 
										 if((dife[0] > 39 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										 {
											 alert('You are not eligible to apply due to age criterion.');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
										 }
									 
									 }else if((dife[0] >= 33 || dife[0] <= 16) && document.getElementById('txtccategory').value==4 && document.getElementById('handicap').value=='Yes' && document.getElementById('disable_percentage').value < 40){ //PWD
									//PWD + Lesser % of PWD+ OBC
										 if((dife[0] >= 33 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										 {
											 alert('Not Eligible Under PWD Category.You are being Considered under your respective Category(Gen/SC/ST/OBC).');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
										 }
										 
									  }else if((dife[0] > 39 || dife[0] <= 16) && document.getElementById('txtccategory').value==4 && document.getElementById('handicap').value=='Yes' && document.getElementById('disable_percentage').value >= 40){ 
									  //PWD +greater % of PWD+ OBC
										 
										 if((dife[0] > 39 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										 {
											 alert('You are not eligible to apply due to age criterion.');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
										 }
										 
									  }else if((dife[0] >= 35 || dife[0] <= 16) && (document.getElementById('txtccategory').value==2 || document.getElementById('txtccategory').value==3 ) && document.getElementById('handicap').value=='Yes' && document.getElementById('disable_percentage').value < 40){ //PWD +SC + PWD 40% Lesser
										 
										 if((dife[0] >= 35 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										 {
											 alert('Not Eligible Under PWD Category.You are being Considered under your respective Category(Gen/SC/ST/OBC).');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
										 }
										 
									 }else if((dife[0] > 39 || dife[0] <= 16) && (document.getElementById('txtccategory').value==2 || document.getElementById('txtccategory').value==3 ) && document.getElementById('handicap').value=='Yes' && document.getElementById('disable_percentage').value >= 40){ 
									 //PWD +SC + PWD 40% Greater
										 
										 if((dife[0] > 39 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										 {
											 alert('You are not eligible to apply due to age criterion.');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
										 }
										  
									  /*}else if((dife[0] >= 40 || dife[0] <= 16) && document.getElementById('handicap').value=='Yes' && document.getElementById('disable_percentage').value < 40){ //PWD
										 
										 if((dife[0] >= 40 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										 {
											 alert('You are not eligible to apply due to age criterion.');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
										 }*/
										  
									 
										 
										 
										 
										 }else if((dife[0] >= 30 || dife[0] <= 16) && document.getElementById('txtccategory').value==1 && document.getElementById('handicap').value=='No' && document.getElementById('exservice').value=='Yes' && document.getElementById('txtexser').value < 60  && document.getElementById('domi_jk').value=='No'){ //EXserver + Less 60 month + GEN
										
										if((dife[0] >= 30 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										  {
											alert('You are not eligible to apply due to age criterion.');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
										   }
										   
									 }else if((dife[0] > 34 || dife[0] <= 16) && document.getElementById('txtccategory').value==1 && document.getElementById('handicap').value=='No' && document.getElementById('exservice').value=='Yes' && document.getElementById('txtexser').value >= 60  && document.getElementById('domi_jk').value=='No'){ //EXserver + Greater 60 month + GEN
										
										if((dife[0] > 34 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										  {
											alert('You are not eligible to apply due to age criterion.');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
										   }
										   
									 }else if((dife[0] >= 33 || dife[0] <= 16) && document.getElementById('txtccategory').value==4 && document.getElementById('handicap').value=='No' && document.getElementById('exservice').value=='Yes' && document.getElementById('txtexser').value < 60  && document.getElementById('domi_jk').value=='No'){ //EXserver + Less 60 month + OBC
										
										if((dife[0] >= 33 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										  {
											alert('You are not eligible to apply due to age criterion.');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
										   }
									 }else if((dife[0] > 37 || dife[0] <= 16) && document.getElementById('txtccategory').value==4 && document.getElementById('handicap').value=='No' && document.getElementById('exservice').value=='Yes' && document.getElementById('txtexser').value >= 60  && document.getElementById('domi_jk').value=='No'){ //EXserver + Greater 60 month + OBC
										 
										if((dife[0] > 37 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										  {
											alert('You are not eligible to apply due to age criterion.');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
										   } 
									  }else if((dife[0] >= 35 || dife[0] <= 16) && (document.getElementById('txtccategory').value==2 || document.getElementById('txtccategory').value==3 ) && document.getElementById('handicap').value=='No' && document.getElementById('exservice').value=='Yes' && document.getElementById('txtexser').value < 60  && document.getElementById('domi_jk').value=='No'){ //EXserver + Less 60 month + SC/ST
										
										if((dife[0] >= 35 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										  {
											alert('You are not eligible to apply due to age criterion.');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
										   }
										}else if((dife[0] > 39 || dife[0] <= 16) && (document.getElementById('txtccategory').value==2 || document.getElementById('txtccategory').value==3 ) && document.getElementById('handicap').value=='No' && document.getElementById('exservice').value=='Yes' && document.getElementById('txtexser').value >= 60  && document.getElementById('domi_jk').value=='No'){ //EXserver + Greater 60 month + SC/ST
										
										if((dife[0] > 39 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										  {
											alert('You are not eligible to apply due to age criterion.');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
										   } 
										 
										 
								     }else if((dife[0] > 34 || dife[0] <= 16) && document.getElementById('txtccategory').value==1 && document.getElementById('handicap').value=='No' && document.getElementById('domi_jk').value=='Yes' && document.getElementById('exservice').value=='No'){ //domil JK + GEN
										 
										 if((dife[0] > 34 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										 {
											 alert('You are not eligible to apply due to age criterion.');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
										 }
										 
									}else if((dife[0] > 37 || dife[0] <= 16) && document.getElementById('txtccategory').value==4 && document.getElementById('handicap').value=='No' && document.getElementById('domi_jk').value=='Yes' && document.getElementById('exservice').value=='No'){ //domil JK + GEN
										 
										 if((dife[0] > 37 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										 {
											 alert('You are not eligible to apply due to age criterion.');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
										 }
									}else if((dife[0] > 39 || dife[0] <= 16) && (document.getElementById('txtccategory').value==2 || document.getElementById('txtccategory').value==3 ) && document.getElementById('handicap').value=='No' && document.getElementById('domi_jk').value=='Yes' && document.getElementById('exservice').value=='No'){ //domil JK + GEN
										 
										 if((dife[0] > 39 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										 {
											 alert('You are not eligible to apply due to age criterion.');
											  //alert('You are not eligible to apply');
											  document.getElementById('seldobyear').focus();
											  return false; 
										 }
										  
									  /*}else if((dife[0] >= 35 || dife[0] <= 16) && document.getElementById('handicap').value=='No' && document.getElementById('exservice').value=='Yes' && document.getElementById('txtexser').value < 60 && document.getElementById('domi_jk').value=='No'){ //Ex-serviceman
										 
										 if((dife[0] >= 35 && (dife[1]>=0 || dife[2]>=0)) || (dife[0] <= 15 && (dife[1]<=11 || dife[2]<=31)))
										 {
										 alert('You are not eligible to apply due to age criterion.');
										  //alert('You are not eligible to apply');
										  document.getElementById('seldobyear').focus();
										  return false;
										 }*/
										  
									  }
							 	  
							 
						  }
						  
						  	//************************************ASST OFFICERS validation End******************************************************/
											
							
							
						}
					 
					 }
		
					if(document.getElementById('marital_status').value=='')
						{			
							alert("Please Select Marital Status");
							document.getElementById('marital_status').focus();
							return false;	
						}
						
				  
					if(document.getElementById('father_fname').value=='')
						{			
							alert("Please Enter your Father's / Husband's First Name");
							document.getElementById('father_fname').focus();
							return false;	
						}
					if(document.getElementById('marital_status').value!='Unmarried')
					{
						  
					if(document.getElementById('relationship').value=='')
						{			
							alert("Please Select Your Relationship");
							document.getElementById('relationship').focus();
							return false;	
						}
					}
					
					
					/*if(document.getElementById('marital_status').value=='Unmarried')
					{
						
						 
						
					if(document.getElementById('relationship2').value=='')
						{			
							alert("Please Select Your Relationship");
							document.getElementById('relationship2').focus();
							return false;	
						}
					}
					*/
					if(document.getElementById('disc_applied').value=='')
						{			
							alert("Please Select Discipline Applied For");
							document.getElementById('disc_applied').focus();
							return false;	
						}
						
						
						if(document.getElementById('disc_code').value=='')
						{			
							alert("Please Enter Discipline Code");
							document.getElementById('disc_code').focus();
							return false;	
						}
						
						
						
					//if(get_radio_value(document.reg_frm.emp_iocl)=='No')
					//{	
						//Education Qualification Details Start
						 
						if(document.getElementById('name_degree').value=='')
						{			
							alert("Please Select Name of Degree");
							document.getElementById('name_degree').focus();
							return false;	
						}
						
						if(document.getElementById('other_degree').value=='Others')
						{			
							alert("Please Enter the Name of Degree");
							document.getElementById('other_degree').focus();
							return false;	
						}
						
						
						if(document.getElementById('course_name').value=='')
						{			
							alert("Please Select the Name of Course");
							document.getElementById('course_name').focus();
							return false;	
						}
						
						if(document.getElementById('regular_course').value=='')
							{			
								alert("Please Select Whether Full time Regular Course");
								document.getElementById('regular_course').focus();
								return false;	
							}
						
					if(get_radio_value(document.reg_frm.emp_iocl)=='No')
  					  {
						if(document.getElementById('regular_course').value=='No')
							{			
								alert('Candidates with full time regular course are only eligible to apply');
								document.getElementById('regular_course').focus();
								return false;	
							}
					  }
							
						if(document.getElementById('post_apply').value=='officers')
						{	
							if(document.getElementById('complete_course').value=='')
							{			
								alert("Please Select whether Completed");
								document.getElementById('complete_course').focus();
								return false;	
							}
						
							if(document.getElementById('complete_course').value=='No')
							{ 
							if(document.getElementById('seldobmon_course').value=='')
								{			
									alert("Please select Expected month of declaration of result");
									document.getElementById('seldobmon_course').focus();
									return false;	
								}
							}
						}
						
					 
					 //officers Start for education qualification
						if(document.getElementById('post_apply').value=='officers')
                        { 
							if(document.getElementById('complete_course').value=='Yes')
							{
							
							if(document.getElementById('seldobmon_pass').value=='' && document.getElementById('seldobyear_pass').value=='')
							{			
								alert("Please Select the Month & Year of Passing");
								document.getElementById('seldobmon_pass').focus();
								return false;	
							}
							
							if(document.getElementById('seldobmon_pass').value!='' && document.getElementById('seldobyear_pass').value=='')
							{			
								alert("Please Select the Year of Passing");
								document.getElementById('seldobyear_pass').focus();
								return false;	
							}
							
							if(document.getElementById('seldobmon_pass').value=='' && document.getElementById('seldobyear_pass').value!='')
							{			
								alert("Please Select the Month of Passing");
								document.getElementById('seldobmon_pass').focus();
								return false;	
							}
						  if(document.getElementById('seldobmon_pass').value!='' && document.getElementById('seldobyear_pass').value!='')
							{
							   if(document.getElementById('result_mark').value=='')
								{			
									alert("Please Enter the % of Marks");
									document.getElementById('result_mark').focus();
									return false;	
								}
								
								if(document.getElementById('result_mark').value!='')
								{
								   
								  if(document.getElementById('result_mark').value > 100)
								   {			   
									   
									alert("Invaild % of Marks");
									 document.getElementById('result_mark').value='';
									document.getElementById('result_mark').focus();
									return false;	
								   }
								  
								  
								  var x=trim(document.getElementById('result_mark').value);
									 var anum=/(^\d+$)|(^\d+\.\d+$)/;
									//   var anum=/(^\d+$)/;
									  if (anum.test(x)){    
										//return true;
									  }else{
										  alert("Invaild % of Marks,Please Enter Numeric value only");
										   document.getElementById('result_mark').value='';
									      document.getElementById('result_mark').focus();
										  return false;             
									  }
								  
								  
								}
								
								//% of mark calculation start
							  if(get_radio_value(document.reg_frm.emp_iocl)=='No')
								{
									if((document.getElementById('txtccategory').value==1||document.getElementById('txtccategory').value==4))
									 {
										 
										 
											 if(document.getElementById('result_mark').value < 65 && document.getElementById('handicap').value=='No'){
											   alert('You are not eligible to apply, Your % Mark should be greater than or equal to 65');
											   document.getElementById('result_mark').focus();
											   return false;
										 
										    }else{
										
										 if(document.getElementById('result_mark').value < 65 && document.getElementById('handicap').value=='Yes' && document.getElementById('disable_percentage').value < 40){
											   alert('You are not eligible to apply, Your % Mark should be greater or equal to 65');
											   document.getElementById('result_mark').focus();
											   return false;
											 }
										 
										 }
										 
									}else if(document.getElementById('txtccategory').value==2||document.getElementById('txtccategory').value==3){
									 
									     if(document.getElementById('result_mark').value <= 0 && document.getElementById('handicap').value=='No' ){
										   //alert('You are not eligible to apply, Your % Mark should be greater or equal to 30');
										   alert('You are not eligible to apply');
										   document.getElementById('result_mark').focus();
										   return false;
										   } else if(document.getElementById('result_mark').value <= 0 && document.getElementById('handicap').value=='Yes' && document.getElementById('disable_percentage').value < 40 ){
											 //alert('You are not eligible to apply, Your % Mark should be greater or equal to 30');
											  alert('You are not eligible to apply');
										     document.getElementById('result_mark').focus();  
											 return false;
											   
										   }
									 
								 }
								 	
								}
								//% of Mark calculation end
								
							}
							if(document.getElementById('duration_year').value=='')
							{			
								alert("Please Enter Year in the Course Duration");
								document.getElementById('duration_year').focus();
								return false;	
							}
							
							if(document.getElementById('duration_month').value=='')
							{			
								alert("Please Enter Month in the Course Duration");
								document.getElementById('duration_month').focus();
								return false;	
							}
							
							if(document.getElementById('duration_year').value!='' && document.getElementById('duration_month').value!='')
							 {
								yeartomonth = parseInt(document.getElementById('duration_year').value) * 12;
								
								$totalmonth =parseInt(document.getElementById('duration_month').value)+ yeartomonth;
								 
								if($totalmonth < 36)
								{
								 	alert("You are not eligible to apply, Your course duration should be minimum 3 years.");
									document.getElementById('duration_year').focus();
									return false;
								}
								   
							 }
							
							
						 }
							
					}
					//officers End for education qualification	
						
					//*******************************************************Asst officer Start for education qualification****************************************************/
						if(document.getElementById('post_apply').value=='asst')
                        { 
							if(document.getElementById('seldobmon_pass').value=='' && document.getElementById('seldobyear_pass').value=='')
							{			
								alert("Please Select the Month & Year of Passing");
								document.getElementById('seldobmon_pass').focus();
								return false;	
							}
							
							if(document.getElementById('seldobmon_pass').value!='' && document.getElementById('seldobyear_pass').value=='')
							{			
								alert("Please Select the Year of Passing");
								document.getElementById('seldobyear_pass').focus();
								return false;	
							}
							
							if(document.getElementById('seldobmon_pass').value=='' && document.getElementById('seldobyear_pass').value!='')
							{			
								alert("Please Select the Month of Passing");
								document.getElementById('seldobmon_pass').focus();
								return false;	
							}
						  
						  if(document.getElementById('seldobmon_pass').value!='' && document.getElementById('seldobyear_pass').value!='')
							{
							  if(document.getElementById('result_mark').value=='')
								{			
									alert("Please Enter the % of Marks");
									document.getElementById('result_mark').focus();
									return false;	
								}
							
							
							//percentage of mark calculation start
							  if(get_radio_value(document.reg_frm.emp_iocl)=='No')
							  { 
								if((document.getElementById('txtccategory').value==1||document.getElementById('txtccategory').value==4) )
								 {
									 
									  
										 if(document.getElementById('result_mark').value < 60 && document.getElementById('handicap').value=='No'){
										   alert('You are not eligible to apply, Your % Mark should be greater than or equal to 60');
										   document.getElementById('result_mark').focus();
										   return false;
									 
									     }else{
									 
									     if(document.getElementById('result_mark').value < 60 && document.getElementById('handicap').value=='Yes' && document.getElementById('disable_percentage').value < 40 ){
										   alert('You are not eligible to apply, Your % Mark should be greater or equal to 60');
										   document.getElementById('result_mark').focus();
										   return false;
										   }
									 
									    }
									 
								 }else if(document.getElementById('txtccategory').value==2||document.getElementById('txtccategory').value==3){/*
									 
									     if(document.getElementById('result_mark').value <= 0 && document.getElementById('handicap').value=='No' ){
										   //alert('You are not eligible to apply, Your % Mark should be greater or equal to 30');
										   alert('You are not eligible to apply');
										   document.getElementById('result_mark').focus();
										   return false;
										   } else if(document.getElementById('result_mark').value <= 0 && document.getElementById('handicap').value=='Yes' && document.getElementById('disable_percentage').value < 40 ){
											 //alert('You are not eligible to apply, Your % Mark should be greater or equal to 30');
											 alert('You are not eligible to apply');
										     document.getElementById('result_mark').focus();  
											   return false;
										   }
									 
								 */}
								  
								 
							  }
							  
							  //percentage of mark Calculation End
							}
						 
							
							
							if(document.getElementById('duration_year').value=='')
							{			
								alert("Please Enter Year in the Course Duration");
								document.getElementById('duration_year').focus();
								return false;	
							}
							
							if(document.getElementById('duration_month').value=='')
							{			
								alert("Please Enter Month in the Course Duration");
								document.getElementById('duration_month').focus();
								return false;	
							}
							
							if(document.getElementById('duration_year').value!='' && document.getElementById('duration_month').value!='')
							 {
								yeartomonth = parseInt(document.getElementById('duration_year').value) * 12;
								
								$totalmonth =parseInt(document.getElementById('duration_month').value)+ yeartomonth;
								 
								if($totalmonth < 24)
								{
								 	alert("You are not eligible to apply, Your course duration should be minimum 2 years.");
									document.getElementById('duration_year').focus();
									return false;
								}
								   
							 }
							
							
							
						}
					//*******************************************************Asst officer End for education qualification*******************************************************/
						//Education Qualification Details End
					 
						
					
							
			 
						
						if(document.getElementById('college_name').value=='')
							{			
								alert("Please Enter the College / Institution Name");
								document.getElementById('college_name').focus();
								return false;	
							}
						/*if(document.getElementById('univer_name').value=='')
							{			
								alert("Please Enter the Name of Affiliate University");
								document.getElementById('univer_name').focus();
								return false;	
							}*/
					 if(document.getElementById('post_apply').value=='officers')
					  {
						if(document.getElementById('course_approve').value=='')
							{			
								alert("Please Select Course Approved by AICTE");
								document.getElementById('course_approve').focus();
								return false;	
							}
					   }
					 
						 
						
						 
						   
 //Experience Details validation Start
if(document.getElementById('post_apply').value=='asst')
 {  
  if(get_radio_value(document.reg_frm.emp_iocl)=='No')
	{
						
		if(document.getElementById('seldobmon_pass').value!='' && document.getElementById('seldobyear_pass').value!='')
		 {
				 		
						     var experience1_check=0;
							   //Experience Details							    
							   if(document.getElementById('exp_orgname').value !='' || document.getElementById('exp_orgdesi').value !='' || document.getElementById('selfrommon1').value !='' || document.getElementById('selfromyr1').value !='' || document.getElementById('seltomon1').value !='' || document.getElementById('seltoyr1').value !='' || document.getElementById('exp_orgduty').value !='' || document.getElementById('exp_reason').value !='')
							   {
									experience1_check=1;   
							   }
							   
							   var experience2_check=0;
							   //Experience Details
							   if(document.getElementById('exp_orgname2').value !='' || document.getElementById('exp_orgdesi2').value !='' || document.getElementById('selfrommon2').value !='' || document.getElementById('selfromyr2').value !='' || document.getElementById('seltomon2').value !='' || document.getElementById('seltoyr2').value !='' || document.getElementById('exp_orgduty2').value !='' || document.getElementById('exp_reason2').value !='')
							   {
									experience2_check=1;   
							   }
							   
							   var experience3_check=0;
							   //Experience Details
							   if(document.getElementById('exp_orgname3').value !='' || document.getElementById('exp_orgdesi3').value !='' || document.getElementById('selfrommon3').value !='' || document.getElementById('selfromyr3').value !='' || document.getElementById('seltomon3').value !='' || document.getElementById('seltoyr3').value !='' || document.getElementById('exp_orgduty3').value !='' || document.getElementById('exp_reason3').value !='')
							   {
									experience3_check=1;   
							   }
							   
							   var experience4_check=0;
							   //Experience Details
							   if(document.getElementById('exp_orgname4').value !='' || document.getElementById('exp_orgdesi4').value !='' || document.getElementById('selfrommon4').value !='' || document.getElementById('selfromyr4').value !='' || document.getElementById('seltomon4').value !='' || document.getElementById('seltoyr4').value !='' || document.getElementById('exp_orgduty4').value !='' || document.getElementById('exp_reason4').value !='')
							   {
									experience4_check=1;   
							   }
							   
							   
							   
	    //if(experience1_check==1 || )
	      //{
		    if(document.getElementById('exp_orgname').value=="")
			{
				alert("Please Enter Current Organisation name");
				document.getElementById('exp_orgname').focus();
				return false;
			}	
			
			if(document.getElementById('exp_orgdesi').value=="")
			{
				alert("Please Enter Current Designation");
				document.getElementById('exp_orgdesi').focus();
				return false;
			}	
			
			
			 if(document.getElementById('selfrommon1').value=="")
			{
				alert("Please Select Current Organisation  From Month");
				document.getElementById('selfrommon1').focus();
				return false;
			}	
			
			 if(document.getElementById('selfromyr1').value=="")
			{
				alert("Please Select Current Organisation From Year");
				document.getElementById('selfromyr1').focus();
				return false;
			}	
					
			
			 if(document.getElementById('seltomon1').value=="")
			{
				alert("Please Select Current Organisation To Month");
				document.getElementById('seltomon1').focus();
				return false;
			}	
			
			 if(document.getElementById('seltoyr1').value=="")
			{
				alert("Please Select Current Organisation To Year");
				document.getElementById('seltoyr1').focus();
				return false;
			}	
			
			if(document.getElementById('exp_orgduty').value=="")
			{
				alert("Please Enter Current Organisation Nature of Job");
				document.getElementById('exp_orgduty').focus();
				return false;
			}
			
			if(document.getElementById('exp_reason').value=="")
			{
				alert("Please Enter Reasons for leaving");
				document.getElementById('exp_reason').focus();
				return false;
			}	
		  
	   //}
		
		if(experience2_check==1)
	   {
		 
			  if(document.getElementById('exp_orgname2').value=="")
			{
				alert("Please Enter Pervious Organisation name 1");
				document.getElementById('exp_orgname2').focus();
				return false;
			}	
			 
			 if(document.getElementById('exp_orgdesi2').value=="")
			{
				alert("Please Enter Pervious Designation");
				document.getElementById('exp_orgdesi2').focus();
				return false;
			}	
			
			
			 if(document.getElementById('selfrommon2').value=="")
			{
				alert("Please Select Pervious Organisation 1 From Month");
				document.getElementById('selfrommon2').focus();
				return false;
			}	
			
			 if(document.getElementById('selfromyr2').value=="")
			{
				alert("Please Select Pervious Organisation 1 From Year");
				document.getElementById('selfromyr2').focus();
				return false;
			}	
					
			
			 if(document.getElementById('seltomon2').value=="")
			{
				alert("Please Select Pervious Organisation 1 To Month");
				document.getElementById('seltomon2').focus();
				return false;
			}	
			
			 if(document.getElementById('seltoyr2').value=="")
			{
				alert("Please Select Pervious Organisation 1 To Year");
				document.getElementById('seltoyr2').focus();
				return false;
			}	
			 
			  if(document.getElementById('exp_orgduty2').value=="")
			{
				alert("Please Enter Pervious Organisation 1 Nature of Job");
				document.getElementById('exp_orgduty2').focus();
				return false;
			}	
		 
		 if(document.getElementById('exp_reason2').value=="")
			{
				alert("Please Enter Reasons for leaving 1");
				document.getElementById('exp_reason2').focus();
				return false;
			}	
		 
	   }
	   
	   
	   if(experience3_check==1)
	   {
		 
			 if(document.getElementById('exp_orgname3').value=="")
			{
				alert("Please Enter Pervious Organisation name 2");
				document.getElementById('exp_orgname3').focus();
				return false;
			}	
			 
			 if(document.getElementById('exp_orgdesi3').value=="")
			{
				alert("Please Enter Pervious Organisation 2 Designation");
				document.getElementById('exp_orgdesi3').focus();
				return false;
			}	
			
			
			 if(document.getElementById('selfrommon3').value=="")
			{
				alert("Please Select Pervious Organisation 2 From Month");
				document.getElementById('selfrommon3').focus();
				return false;
			}	
			
			 if(document.getElementById('selfromyr3').value=="")
			{
				alert("Please Select Pervious Organisation 2 From Year");
				document.getElementById('selfromyr3').focus();
				return false;
			}	
					
			
			 if(document.getElementById('seltomon3').value=="")
			{
				alert("Please Select Pervious Organisation 2 To Month");
				document.getElementById('seltomon3').focus();
				return false;
			}	
			
			 if(document.getElementById('seltoyr3').value=="")
			{
				alert("Please Select Pervious Organisation 2 To Year");
				document.getElementById('seltoyr3').focus();
				return false;
			}	
			 
			  if(document.getElementById('exp_orgduty3').value=="")
			{
				alert("Please Enter Pervious Organisation 2 Nature of Job");
				document.getElementById('exp_orgduty3').focus();
				return false;
			}	
		   
		    if(document.getElementById('exp_reason3').value=="")
			{
				alert("Please Enter Reasons for leaving 2");
				document.getElementById('exp_reason3').focus();
				return false;
			}	
		 
	   }
	   
	   
	   if(experience4_check==1)
	   {
		 
			if(document.getElementById('exp_orgname4').value=="")
			{
				alert("Please Enter Pervious Organisation name 3");
				document.getElementById('exp_orgname4').focus();
				return false;
			}	
			
			if(document.getElementById('exp_orgdesi4').value=="")
			{
				alert("Please Enter Pervious Organisation 3 Designation");
				document.getElementById('exp_orgdesi4').focus();
				return false;
			}	
			
			
			 if(document.getElementById('selfrommon4').value=="")
			{
				alert("Please Select Pervious Organisation 3 From Month");
				document.getElementById('selfrommon4').focus();
				return false;
			}	
			
			 if(document.getElementById('selfromyr4').value=="")
			{
				alert("Please Select Pervious Organisation 3 From Year");
				document.getElementById('selfromyr4').focus();
				return false;
			}	
					
			
			 if(document.getElementById('seltomon4').value=="")
			{
				alert("Please Select Pervious Organisation 3 To Month");
				document.getElementById('seltomon4').focus();
				return false;
			}	
			
			 if(document.getElementById('seltoyr4').value=="")
			{
				alert("Please Select Pervious Organisation 3 To Year");
				document.getElementById('seltoyr4').focus();
				return false;
			}	
			 
			  if(document.getElementById('exp_orgduty4').value=="")
			{
				alert("Please Enter Pervious Organisation 3 Nature of Job");
				document.getElementById('exp_orgduty4').focus();
				return false;
			}	
			
			 if(document.getElementById('exp_reason4').value=="")
			{
				alert("Please Enter Reasons for leaving 3");
				document.getElementById('exp_reason4').focus();
				return false;
			}	
		 
		 
	   }
							   
	}
 }
 
}

if(document.getElementById('post_apply').value=='asst' && get_radio_value(document.reg_frm.emp_iocl)=='No')
	{
		 
	/*if(document.getElementById('txtexp1').value==''){
		if(document.getElementById('selfrommon1').value !='' && document.getElementById('selfromyr1').value !='' && document.getElementById('seltomon1').value !='' && document.getElementById('seltoyr1').value !=''){	
			//alert('inside');
			yearsDiff();
		}
	}*/
      var total_exp=0;
	  //alert(document.getElementById('txtexp1').value);
	 var txtexp11 = trim(document.getElementById('txtexp1').value);
	 var txtexp12 = trim(document.getElementById('txtexp2').value);
	 var txtexp13 = trim(document.getElementById('txtexp3').value);
	 var txtexp14 = trim(document.getElementById('txtexp4').value);
	  
	 // total_exp=document.getElementById('txtexp1').value + parseInt(document.getElementById('txtexp2').value) + parseInt(document.getElementById('txtexp3').value) + parseInt(document.getElementById('txtexp4').value);
	   //total_exp2 = trim(document.getElementById('txtexp1').value) + trim(document.getElementById('txtexp2').value) + trim(document.getElementById('txtexp3').value)+ trim(document.getElementById('txtexp4').value);
	   //alert('trim' + total_exp2);
	   total_exp=parseInt(txtexp11) + parseInt(txtexp12) + parseInt(txtexp13) + parseInt(txtexp14);
	  //alert('hiiiiiiii'+total_exp);
	  if(total_exp < 36)
	   {
		   alert("You are not eligible to apply, Your Experience should be minimum 3 years");
		   document.getElementById('selfromyr1').focus();
		   return false;
	   }
	}
//Experience Details validation End
						   
						   if(document.getElementById('exam_center').value=='')
							{			
								alert("Please Select Choice for Interview Centre");
								document.getElementById('exam_center').focus();
								return false;	
							}
							
							if(document.getElementById('mobile').value=='')
							{			
								alert("Please Enter Your Mobile No. in the Contact No");
								document.getElementById('mobile').focus();
								return false;	
							}
							if(trim(document.getElementById('mobile').value)!=''){
								if(trim(document.getElementById('mobile').value).length < 10){
									alert('Mobile No. Should Be 10 Digits')
									document.getElementById('mobile').focus();
									return false;
								}
							}

							
							
							if(document.getElementById('mobile').value !='')
							{	
								
								if((trim(document.getElementById('mobile').value).substr(0,1)!=9) && (trim(document.getElementById('mobile').value).substr(0,1)!=8) && (trim(document.getElementById('mobile').value).substr(0,1)!=7))
								{
									alert("Mobile No. should start with 7 or 8 or 9.");
									document.getElementById('mobile').focus();
									return false;
								}
								 
							}
							
							/*if(document.getElementById('std_no').value=='')
							{			
								alert("Please Enter STD Code in the Contact No");
								document.getElementById('std_no').focus();
								return false;	
							}
							if(document.getElementById('phone_no').value=='')
							{			
								alert("Please Enter Landline No. in the Contact No");
								document.getElementById('phone_no').focus();
								return false;	
							}*/
						
						  if(document.getElementById('email').value=='')
							{			
								alert("Please Enter Your Email Id");
								document.getElementById('email').focus();
								return false;	
							}
						    if(!isEmailId(trim(document.getElementById('email').value)))
								{
									alert("Invaild Email ID");
									document.getElementById('email').focus();
									return false;
								}
							
							if(document.getElementById('alter_email').value!=''){
							if(!isEmailId(trim(document.getElementById('alter_email').value)))
								{
									alert("Invaild Alternate Email ID");
									document.getElementById('alter_email').focus();
									return false;
								}
							}
						  
						  if(document.getElementById('email').value!='' && document.getElementById('email_exist').value!='')
							{			
							  if(document.getElementById('email_exist').value=='Yes')
							   {								
								alert("Email Id already Exists" );
								document.getElementById('email').focus();
								return false;	
							   }
							}
						//Communication Address Validation Start
						
						  if(document.getElementById('address_1').value=='')
							{			
								alert("Please Enter Address line1 in the Communication Address");
								document.getElementById('address_1').focus();
								return false;	
							}
						 if(document.getElementById('address_2').value=='')
							{			
								alert("Please Enter Address line2 in the Communication Address");
								document.getElementById('address_2').focus();
								return false;	
							}
							
						if(document.getElementById('city').value=='')
							{			
								alert("Please Enter City / Town in the Communication Address");
								document.getElementById('city').focus();
								return false;	
							}
												 
						 if(document.getElementById('add_state').value=='')
							{			
								alert("Please Select State in the Communication Address");
								document.getElementById('add_state').focus();
								return false;	
							}
							
							if(document.getElementById('add_pin').value=='')
							{			
								alert("Please Enter Pincode in the Communication Address");
								document.getElementById('add_pin').focus();
								return false;	
							}
							
							if(trim(document.getElementById('add_pin').value)!=''){
								if(trim(document.getElementById('add_pin').value).length < 6){
									alert('Pincode Should Be 6 Digits')
									document.getElementById('add_pin').focus();
									return false;
								}
							  }
						
						// Communication Address Validation End
						
						if(document.reg_frm.chksameaddr.checked == true){
							same_addr();
						}
											
						//permentant Address Validation Start
						
						  if(document.getElementById('per_address_1').value=='')
							{			
								alert("Please Enter Address line1 in the Permanent Address");
								document.getElementById('per_address_1').focus();
								return false;	
							}
						 if(document.getElementById('per_address_2').value=='')
							{			
								alert("Please Enter Address line2 in the Permanent Address");
								document.getElementById('per_address_2').focus();
								return false;	
							}
							
						if(document.getElementById('per_city').value=='')
							{			
								alert("Please Enter City / Town in the Permanent Address");
								document.getElementById('per_city').focus();
								return false;	
							}
												 
						 if(document.getElementById('per_add_state').value=='')
							{			
								alert("Please Select State in the Permanent Address");
								document.getElementById('per_add_state').focus();
								return false;	
							}
							
							if(document.getElementById('per_add_pin').value=='')
							{			
								alert("Please Enter Pincode in the Permanent Address");
								document.getElementById('per_add_pin').focus();
								return false;	
							}
							 
						   if(trim(document.getElementById('per_add_pin').value)!=''){
								if(trim(document.getElementById('per_add_pin').value).length < 6){
									alert('Permanent Address Pincode Should Be 6 Digits')
									document.getElementById('per_add_pin').focus();
									return false;
								}
							  }
						// permentant Address Validation End
						if(document.getElementById('near_railway_station').value=='')
							{			
								alert("Please Enter Nearest Railway station");
								document.getElementById('near_railway_station').focus();
								return false;	
							}
							
					 
				if(get_radio_value(document.reg_frm.emp_iocl)=='Yes')
					{
						
						//Employee of IOCL
						if(document.getElementById('emp_no').value=='')
							{			
								alert("Please Enter Employee Number");
								document.getElementById('emp_no').focus();
								return false;	
							}
							
						if(document.getElementById('cur_design').value=='')
							{			
								alert("Please Enter Designation");
								document.getElementById('cur_design').focus();
								return false;	
							}
							
							 
					 if(document.getElementById('seldobday_emp').value=='' && document.getElementById('seldobmon_emp').value=='' && document.getElementById('seldobyear_emp').value=='')
					 {
						 alert("Please Select Date of Joining IOCL ");
						document.getElementById('seldobday_emp').focus();
						return false;
					 }		
				 if(document.getElementById('seldobday_emp').value!='' && document.getElementById('seldobmon_emp').value=='' && document.getElementById('seldobyear_emp').value=='')
					 {
						 alert("Please Select Month and Year in the Date of Joining IOCL ");
						document.getElementById('seldobmon_emp').focus();
						return false;
					 }
					 
					 if(document.getElementById('seldobday_emp').value!='' && document.getElementById('seldobmon_emp').value!='' && document.getElementById('seldobyear_emp').value=='')
					 {
						 alert("Please Select Year in the Date of Joining IOCL ");
						document.getElementById('seldobyear_emp').focus();
						return false;
					 }
					 
					 if(document.getElementById('seldobday_emp').value=='' && document.getElementById('seldobmon_emp').value!='' && document.getElementById('seldobyear_emp').value!='')
					 {
						 alert("Please Select Date in the Date of Joining IOCL ");
						document.getElementById('seldobday_emp').focus();
						return false;
					 }
					  if(document.getElementById('seldobday_emp').value!='' && document.getElementById('seldobmon_emp').value=='' && document.getElementById('seldobyear_emp').value!='')
					 {
						 alert("Please Select Month in the Date of Joining IOCL ");
						document.getElementById('seldobmon_emp').focus();
						return false;
					 }		
					 
					 if(document.getElementById('seldobday_emp').value!='' && document.getElementById('seldobmon_emp').value!='' && document.getElementById('seldobyear_emp').value!='')
						 {
							$dobday=document.getElementById('seldobday_emp').value;
							$dobmon=document.getElementById('seldobmon_emp').value
							$dobyear=document.getElementById('seldobyear_emp').value
						   curDate=currentDate.split(":");
							var d1 = new Date($dobyear,$dobmon,$dobday);
							var d2 = new Date(curDate[0],curDate[1],curDate[2]);
										dateDiff=DateDiff.inDays(d1, d2);
										if(dateDiff <0){
											 alert('Date of Joining IOCL Cannot be Greater Than Current Date');
											 document.getElementById('seldobyear_emp').focus();
											 return false;
										} 
						 }
							
							
						 
						if(document.getElementById('division').value=='')
							{			
								alert("Please Enter Division");
								document.getElementById('division').focus();
								return false;	
							}
						 
						if(document.getElementById('place_post').value=='')
							{			
								alert("Please Enter Place of Posting(City Name)");
								document.getElementById('place_post').focus();
								return false;	
							}
					}
					
					document.reg_frm.action="registration_preview.php";
					document.reg_frm.submit();
	
 }


function same_addr()
{

	//if checked take the values of correspondence address controls and put it in permamnent address controls and disable them
	//else keep them blank and enable them
//alert(document.reg_frm.chksameaddr.checked);
	if(document.reg_frm.chksameaddr.checked == true)
	{
		 	 
		document.reg_frm.per_address_1.value=document.reg_frm.address_1.value;
		document.reg_frm.per_address_2.value=document.reg_frm.address_2.value;	 
		document.reg_frm.per_city.value=document.reg_frm.city.value; 
		document.reg_frm.per_add_state.value=document.reg_frm.add_state.value;		 
		document.reg_frm.per_add_pin.value=document.reg_frm.add_pin.value;	  
		/*document.reg_frm.per_address_1.disabled=true;
		document.reg_frm.per_address_2.disabled=true;		 
		document.reg_frm.per_city.disabled=true;		 
		document.reg_frm.per_add_state.disabled=true;
		document.reg_frm.per_add_pin.disabled=true;*/
				
	}
	else
	{
		
		/*document.reg_frm.per_address_1.disabled=false;
		document.reg_frm.per_address_2.disabled=false;		 
		document.reg_frm.per_city.disabled=false;		 
		document.reg_frm.per_add_state.disabled=false;
		document.reg_frm.per_add_pin.disabled=false;*/
		

		document.reg_frm.per_address_1.value="";
		document.reg_frm.per_address_2.value="";
		 document.reg_frm.per_city.value="";	
		document.reg_frm.per_add_state.value="";
		document.reg_frm.per_add_pin.value="";
		
		
	}
}

function chkonfeb()
{
	
	
	if(document.getElementById('seldobmon').value ==02 && document.getElementById('seldobday').value ==30 )
	{
	
	alert("Invalid Date Format");
	document.getElementById('seldobday').value="";
	document.getElementById('seldobmon').value="";
	return false;
		
	}
	
	if(document.getElementById('seldobmon').value ==02 && document.getElementById('seldobday').value ==31 )
	{
	
	alert("Invalid Date Format");
	document.getElementById('seldobday').value="";
	document.getElementById('seldobmon').value="";
	return false;
		
	}
	 
}


function chkonfeb_caste()
{
	
	
	if(document.getElementById('seldobmon_caste').value ==02 && document.getElementById('seldobday_caste').value ==30 )
	{
	
	alert("Invalid Date Format");
	document.getElementById('seldobday_caste').value="";
	document.getElementById('seldobmon_caste').value="";
	return false;
		
	}
	
	if(document.getElementById('seldobmon_caste').value ==02 && document.getElementById('seldobday_caste').value ==31 )
	{
	
	alert("Invalid Date Format");
	document.getElementById('seldobday_caste').value="";
	document.getElementById('seldobmon_caste').value="";
	return false;
		
	}
	
	
}



function chkonfeb_pwd()
{
	
	
	if(document.getElementById('seldobmon_pwd').value ==02 && document.getElementById('seldobday_pwd').value ==30 )
	{
	
	alert("Invalid Date Format");
	document.getElementById('seldobday_pwd').value="";
	document.getElementById('seldobmon_pwd').value="";
	return false;
		
	}
	
	if(document.getElementById('seldobmon_pwd').value ==02 && document.getElementById('seldobday_pwd').value ==31 )
	{
	
	alert("Invalid Date Format");
	document.getElementById('seldobday_pwd').value="";
	document.getElementById('seldobmon_pwd').value="";
	return false;
		
	}
	
	
}





function isDate(dtStr){
	var daysInMonth = DaysArray(12)
	var pos1=dtStr.indexOf(dtCh)
	var pos2=dtStr.indexOf(dtCh,pos1+1)
	var strDay=dtStr.substring(0,pos1)
	var strMonth=dtStr.substring(pos1+1,pos2)
	var strYear=dtStr.substring(pos2+1)
	strYr=strYear
	if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1)
	if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1)
	for (var i = 1; i <= 3; i++) {
		if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1)
	}
	month=parseInt(strMonth)
	day=parseInt(strDay)
	year=parseInt(strYr)
	if (pos1==-1 || pos2==-1){
		alert("The date format should be : dd"+dtCh+"mm"+dtCh+"yyyy")
		return false
	}
	if (strMonth.length<1 || month<1 || month>12){
		alert("Please enter a valid month")
		return false
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
		alert("Please enter a valid day")
		return false
	}
	if (strYear.length != 4 || year==0){
		alert("Please enter a valid 4 digit year")
		return false
	}
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
		alert("Please enter a valid date")
		return false
	}
return true
}

function isDatechk(dtStr){

	var daysInMonth = DaysArray(12)
	var pos1=dtStr.indexOf(dtCh)
	var pos2=dtStr.indexOf(dtCh,pos1+1)
	var strMonth=dtStr.substring(0,pos1)
	var strDay=dtStr.substring(pos1+1,pos2)
	var strYear=dtStr.substring(pos2+1)
	strYr=strYear
	
	if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1)
	if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1)
	for (var i = 1; i <= 3; i++) {
		if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1)
	}
	month=parseInt(strMonth)
	day=parseInt(strDay)
	year=parseInt(strYr)	
		
		//alert(month+"~"+day+"~"+year+";"+pos1)
	if (pos1==-1 || pos2==-1){		
		return false;
	}
	if (strMonth.length<1 || month<1 || month>12){		
		return false;
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){		
		return false;
	}
	if (strYear.length != 4 || year==0 ){		
		return false;
	}	
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){		
		return false;
	}
		
return true;
}



function validateDate(dt){
  if(dt.value!='DD/MM/YYYY'){
  	if (isDate(dt.value)==false){
		dt.value="";
  		dt.focus();
  		return false;
  	}
  }
    return true;
 }

function stripCharsInBag(s, bag){
	var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not in bag, append to returnString.
    for (i = 0; i < s.length; i++){   
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1) returnString += c;
    }
    return returnString;
}
function daysInFebruary (year){
	// February has 29 days in any year evenly divisible by four,
    // EXCEPT for centurial years which are not also divisible by 400.
    return (((year % 4 == 0) && ( (!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28 );
}
function DaysArray(n) {
	for (var i = 1; i <= n; i++) {
		this[i] = 31
		if (i==4 || i==6 || i==9 || i==11) {this[i] = 30}
		if (i==2) {this[i] = 29}
   } 
   return this
}





function CompareDates(str1,str2)
{
   var yr1   = parseInt(str1.substring(0,4),10);
   var mon1  = parseInt(str1.substring(5,7),10);
   var dt1   = parseInt(str1.substring(8,10),10);  
  
   var yr2   = parseInt(str2.substring(0,4),10);
   var mon2  = parseInt(str2.substring(5,7),10);
   var dt2   = parseInt(str2.substring(8,10),10);
  
   var date1 = new Date(yr1, mon1, dt1);
   var date2 = new Date(yr2, mon2, dt2);

   if(date2 < date1)    
      return false;
   else
     return true;
} 
var dtCh= "/";
function isInteger(s){
	var i;
    for (i = 0; i < s.length; i++){   
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
    // All characters are numbers.
    return true;
}

function jsfCheckDateLength (date) {
	var strDate = date.toString();
	if ( strDate.length == 1) strDate = "0"+strDate;
	return strDate;
}



//date validations added by kishore
function jsfGetLongDate(dd,mm,yy){
	dd=dd.toString()
	mm=mm.toString()
	yy=yy.toString()
	return parseInt(yy+mm+dd)
}

function jsfGetFormDate (date) {
	var re = /^(0?\d{1,2})[\/-]0?\d{1,2}[\/-]\d{4}/g
	var arr= re.exec(date);
	var ret = false;
	for (i in arr) {
		if ( i==1) ret = true;
	}
	if (ret) return jsfCheckDateLength(arr[1]);
	return 0;
}

function jsfGetFormMonth (date) {
	var re = /^0?\d{1,2}[\/-](0?\d{1,2})[\/-]\d{4}/g
	var arr= re.exec(date);
	var ret = false;
	for (i in arr) {
		if ( i==1) ret = true;
	}
	if (ret) return jsfCheckDateLength( arr[1] );
	return 0;
}
function jsfGetFormYear (date) {
	var re = /^0?\d{1,2}[\/-]0?\d{1,2}[\/-](\d{4})/g
	var arr= re.exec(date);
	var ret = false;
	for (i in arr) {
		if ( i==1) ret = true;
	}
	if (ret) return arr[1];
	return 0;
}

//Date diff calc starts


function diffDates(frommon,fromyr, tomon, toyr){

var fday = 01;
var fmon = frommon;
var fyear = fromyr;
	
var tday = 01;
var tmon = tomon;
var tyear = toyr;

		var tdate = new Date(tyear,tmon-1,tday);
		var fdate = new Date(fyear,fmon-1,fday);
		
	if(fdate < tdate)
	return false;
	else
	return true;
	
}
//Date diff calc ends

//DATE diff calc for experience start
function diffDates_experience(frommon,fromyr, tomon, toyr){

var fday = 01;
var fmon = frommon;
var fyear = fromyr;
var totaldiff='';
var tday = 01;
var tmon = tomon;
var tyear = toyr;

		var tdate = new Date(tyear,tmon,tday);
		var fdate = new Date(fyear,fmon,fday);
		
	 var dife_ex = datediff(tdate, fdate);
	 //alert('Year'+dife_ex[0]+'month'+dife_ex[1]);
	 totaldiff =  (dife_ex[0]*12)+ dife_ex[1];
	return totaldiff;
	 
	
}
//DATE diff calc for experience End

//DATE diff calc for experience start
function diffDates_experience_current(frommon,fromyr, tomon, toyr){

var fday = 01;
var fmon = frommon;
var fyear = fromyr;
var totaldiff='';
var tday = 01;
var tmon = tomon;
var tyear = toyr;
var asOnDate = new Date(2013,06,30);

		//var tdate = new Date(tyear,tmon,tday);
		var fdate = new Date(fyear,fmon,fday);
		
	 var dife_ex = datediff(asOnDate, fdate);
	 //alert('Year'+dife_ex[0]+'month'+dife_ex[1]);
	 totaldiff =  (dife_ex[0]*12)+ dife_ex[1];
	return totaldiff;
	 
	
}
//DATE diff calc for experience End




function datediff(date1, date2){
  var y1 = date1.getFullYear(), m1 = date1.getMonth(), d1 = date1.getDate(),
  y2 = date2.getFullYear(), m2 = date2.getMonth(), d2 = date2.getDate();

  if(d1 < d2){
    m1--;
    d1 += DaysInMonth(y2, m2);
  }
  if(m1 < m2){
    y1--;
    m1 += 12;
  }
  return [y1 - y2, m1 - m2, d1 - d2];
}


function DaysInMonth(Y, M) {
    with (new Date(Y, M, 1, 12)) {
        setDate(0);
        return getDate();
    }
}

function yearsDiff_exser(){
	
 if(document.getElementById('selfromyr_ex').value!="" && document.getElementById('seltoyr_ex').value!="" && document.getElementById('selfrommon_ex').value!="" && document.getElementById('seltomon_ex').value!="")
	{		
		 
	
	  //DOB compare with exservice date start
	  if(document.getElementById('selfromyr_ex').value < document.getElementById('seldobyear').value)
	  {
		   alert("Period of service cannot be prior to date of birth");
			document.getElementById('selfromyr_ex').value="";
			document.getElementById('seltoyr_ex').value="";
			document.getElementById('selfrommon_ex').value="";
			document.getElementById('seltomon_ex').value="";	
		  
	  }else if(document.getElementById('selfromyr_ex').value == document.getElementById('seldobyear').value)
	  {
		 if((document.getElementById('selfrommon_ex').value) <= (document.getElementById('seldobmon').value))
			{
				alert("Period of service cannot be prior to date of birth");
				document.getElementById('selfromyr_ex').value="";
				document.getElementById('seltoyr_ex').value="";
				document.getElementById('selfrommon_ex').value="";
				document.getElementById('seltomon_ex').value="";	
				
			}
	  }
	  //DOB compare with experience End
	   
	 
	}	
	
	if(document.getElementById('selfromyr_ex').value!="" && document.getElementById('seltoyr_ex').value!="" && document.getElementById('selfrommon_ex').value!="" && document.getElementById('seltomon_ex').value!="")
	{ 
	 
	 //Start my code
		if(document.getElementById('selfromyr_ex').value > document.getElementById('seltoyr_ex').value)
		{
			alert("Period of service cannot be prior to date of birth");
			document.getElementById('selfromyr_ex').value="";
			document.getElementById('seltoyr_ex').value="";
			document.getElementById('selfrommon_ex').value="";
			document.getElementById('seltomon_ex').value="";	
			
		}
		else if(document.getElementById('selfromyr_ex').value == document.getElementById('seltoyr_ex').value)
		{
			//alert(parseInt(document.getElementById('selfrommon1').value));
			//alert(parseInt(document.getElementById('seltomon1').value));
			if((document.getElementById('selfrommon_ex').value) >= (document.getElementById('seltomon_ex').value))
			{
				alert("Period of service cannot be prior to date of birth");
				document.getElementById('selfromyr_ex').value="";
				document.getElementById('seltoyr_ex').value="";
				document.getElementById('selfrommon_ex').value="";
				document.getElementById('seltomon_ex').value="";	
				
			}
			else
			{
				textto_exser=diffDates_experience(document.getElementById('selfrommon_ex').value, document.getElementById('selfromyr_ex').value, document.getElementById('seltomon_ex').value, document.getElementById('seltoyr_ex').value);		
				document.getElementById('txtexser').value = textto_exser;
			}
		}			
		else
		{
			textto_exser=diffDates_experience(document.getElementById('selfrommon_ex').value, document.getElementById('selfromyr_ex').value, document.getElementById('seltomon_ex').value, document.getElementById('seltoyr_ex').value);		
			 document.getElementById('txtexser').value = textto_exser;
		}
		//end of my code
	}
	
	
	
}


function yearsDiff(){

	if(document.getElementById('selfromyr3').value!="" && document.getElementById('seltoyr3').value!="" && document.getElementById('selfrommon3').value!="" && document.getElementById('seltomon3').value!="")
	{		
		//textto=(document.getElementById('seltoyr3').value - document.getElementById('selfromyr3').value)+"/"+Math.abs((document.getElementById('selfrommon3').value - document.getElementById('seltomon3').value));
	    
	
	  //DOB compare with experience start
	  if(document.getElementById('selfromyr3').value < document.getElementById('seldobyear').value)
	  {
		   alert("Experience cannot be prior to date of birth");
			document.getElementById('selfromyr3').value="";
			document.getElementById('seltoyr3').value="";
			document.getElementById('selfrommon3').value="";
			document.getElementById('seltomon3').value="";	
		  
	  }else if(document.getElementById('selfromyr3').value == document.getElementById('seldobyear').value)
	  {
		 if((document.getElementById('selfrommon3').value) <= (document.getElementById('seldobmon').value))
			{
				alert("Experience cannot be prior to date of birth");
				document.getElementById('selfromyr3').value="";
				document.getElementById('seltoyr3').value="";
				document.getElementById('selfrommon3').value="";
				document.getElementById('seltomon3').value="";	
				
			}
	  }
	  //DOB compare with experience End
	  //Year of Passing compare with experience start
	  if(document.getElementById('selfromyr3').value < document.getElementById('seldobyear_pass').value)
	  {
		    alert("Period of Experience can't be prior to completion of post graduate degree");
		   //alert("From Year cannot be greater than to Month & Year of passing");
			document.getElementById('selfromyr3').value="";
			document.getElementById('seltoyr3').value="";
			document.getElementById('selfrommon3').value="";
			document.getElementById('seltomon3').value="";	
		  
	  }else if(document.getElementById('selfromyr3').value == document.getElementById('seldobyear_pass').value)
	  {
		 if((document.getElementById('selfrommon3').value) < (document.getElementById('seldobmon_pass').value))
			{
				 alert("Period of Experience can't be prior to completion of post graduate degree");
				//alert("From Month cannot be greater than or equal to Month & Year of passing");
				document.getElementById('selfromyr3').value="";
				document.getElementById('seltoyr3').value="";
				document.getElementById('selfrommon3').value="";
				document.getElementById('seltomon3').value="";	
				
			}
	  }
	  //Year of Passing compare with experience End
	 
	}
	   
	if(document.getElementById('selfromyr3').value!="" && document.getElementById('seltoyr3').value!="" && document.getElementById('selfrommon3').value!="" && document.getElementById('seltomon3').value!="")
	{ 
	 
	 //Start my code
		if(document.getElementById('selfromyr3').value > document.getElementById('seltoyr3').value)
		{
			alert("From date should be prior to To date");
			document.getElementById('selfromyr3').value="";
			document.getElementById('seltoyr3').value="";
			document.getElementById('selfrommon3').value="";
			document.getElementById('seltomon3').value="";	
			
		}
		else if(document.getElementById('selfromyr3').value == document.getElementById('seltoyr3').value)
		{
			//alert(parseInt(document.getElementById('selfrommon1').value));
			//alert(parseInt(document.getElementById('seltomon1').value));
			if((document.getElementById('selfrommon3').value) >= (document.getElementById('seltomon3').value))
			{
				alert("From date should be prior to To date");
				document.getElementById('selfromyr3').value="";
				document.getElementById('seltoyr3').value="";
				document.getElementById('selfrommon3').value="";
				document.getElementById('seltomon3').value="";	
				
			}
			else
			{
				textto=diffDates_experience(document.getElementById('selfrommon3').value, document.getElementById('selfromyr3').value, document.getElementById('seltomon3').value, document.getElementById('seltoyr3').value);		
				document.getElementById('txtexp3').value = textto;
			}
		}			
		else
		{
			//textto=expcalc(document.getElementById('selfrommon3').value, document.getElementById('selfromyr3').value, document.getElementById('seltomon3').value, document.getElementById('seltoyr3').value);		
			textto=diffDates_experience(document.getElementById('selfrommon3').value, document.getElementById('selfromyr3').value, document.getElementById('seltomon3').value, document.getElementById('seltoyr3').value);		
			document.getElementById('txtexp3').value = textto;
		}
		//end of my code
	}
	else{
		//document.getElementById('txtservice3').value="";
	}
	//employer 4
	if(document.getElementById('selfromyr4').value!="" && document.getElementById('seltoyr4').value!="" && document.getElementById('selfrommon4').value!="" && document.getElementById('seltomon4').value!="")
	{		
		//textto=(document.getElementById('seltoyr3').value - document.getElementById('selfromyr3').value)+"/"+Math.abs((document.getElementById('selfrommon3').value - document.getElementById('seltomon3').value));
			//my code
		
	//DOB compare with experience start 
	 if(document.getElementById('selfromyr4').value < document.getElementById('seldobyear').value)
	  {
		   alert("Experience cannot be prior to date of birth");
			document.getElementById('selfromyr4').value="";
			document.getElementById('seltoyr4').value="";
			document.getElementById('selfrommon4').value="";
			document.getElementById('seltomon4').value="";	
		  
	  }else if(document.getElementById('selfromyr4').value == document.getElementById('seldobyear').value)
	  {
		 if((document.getElementById('selfrommon4').value) <= (document.getElementById('seldobmon').value))
			{
				alert("Experience cannot be prior to date of birth");
				document.getElementById('selfromyr4').value="";
				document.getElementById('seltoyr4').value="";
				document.getElementById('selfrommon4').value="";
				document.getElementById('seltomon4').value="";	
				
			}
	  }
	  //DOB compare with experience End
	  //Month & Year of passing compare with experience start 
	 if(document.getElementById('selfromyr4').value < document.getElementById('seldobyear_pass').value)
	  {
		    alert("Period of Experience can't be prior to completion of post graduate degree");
		   //alert("From Year cannot be greater than to Month & Year of passing");
			document.getElementById('selfromyr4').value="";
			document.getElementById('seltoyr4').value="";
			document.getElementById('selfrommon4').value="";
			document.getElementById('seltomon4').value="";	
		  
	  }else if(document.getElementById('selfromyr4').value == document.getElementById('seldobyear_pass').value)
	  {
		 if((document.getElementById('selfrommon4').value) < (document.getElementById('seldobmon_pass').value))
			{
				 alert("Period of Experience can't be prior to completion of post graduate degree");
				//alert("From Month cannot be greater than or equal to Month & Year of passing");
				document.getElementById('selfromyr4').value="";
				document.getElementById('seltoyr4').value="";
				document.getElementById('selfrommon4').value="";
				document.getElementById('seltomon4').value="";	
				
			}
	  }
	  //Month & Year of passing compare with experience End 
	 
	}
	
	if(document.getElementById('selfromyr4').value!="" && document.getElementById('seltoyr4').value!="" && document.getElementById('selfrommon4').value!="" && document.getElementById('seltomon4').value!="")
	{
		if(document.getElementById('selfromyr4').value > document.getElementById('seltoyr4').value)
		{
			alert("From date should be prior to To date");
			document.getElementById('selfromyr4').value="";
			document.getElementById('seltoyr4').value="";
			document.getElementById('selfrommon4').value="";
			document.getElementById('seltomon4').value="";	
			
		}
		else if(document.getElementById('selfromyr4').value == document.getElementById('seltoyr4').value)
		{
			//alert(parseInt(document.getElementById('selfrommon1').value));
			//alert(parseInt(document.getElementById('seltomon1').value));
			if((document.getElementById('selfrommon4').value) >= (document.getElementById('seltomon4').value))
			{
				alert("From date should be prior to To date");
				document.getElementById('selfromyr4').value="";
				document.getElementById('seltoyr4').value="";
				document.getElementById('selfrommon4').value="";
				document.getElementById('seltomon4').value="";	
				
			}
			else
			{
				textto=expcalc(document.getElementById('selfrommon4').value, document.getElementById('selfromyr4').value, document.getElementById('seltomon4').value, document.getElementById('seltoyr4').value);		
				//document.getElementById('txtservice4').value=textto;
				document.getElementById('txtexp4').value = textto;
			}
		}			
		else
		{
			textto=expcalc(document.getElementById('selfrommon4').value, document.getElementById('selfromyr4').value, document.getElementById('seltomon4').value, document.getElementById('seltoyr4').value);		
			//document.getElementById('txtservice4').value=textto;
			document.getElementById('txtexp4').value = textto;
		}
		//end of my code
	}


	if(document.getElementById('selfromyr1').value!="" && document.getElementById('seltoyr1').value!="" && document.getElementById('selfrommon1').value!="" && document.getElementById('seltomon1').value!="")
		{		
			
			
			//DOB compare with experience start
				  if(document.getElementById('selfromyr1').value < document.getElementById('seldobyear').value)
				  {
					   alert("Experience cannot be prior to date of birth");
						document.getElementById('selfromyr1').value="";
						document.getElementById('seltoyr1').value="";
						document.getElementById('selfrommon1').value="";
						document.getElementById('seltomon1').value="";	
					  
				  }else if(document.getElementById('selfromyr1').value == document.getElementById('seldobyear').value)
				  {
					 if((document.getElementById('selfrommon1').value) <= (document.getElementById('seldobmon').value))
						{
							alert("Experience cannot be prior to date of birth");
							document.getElementById('selfromyr1').value="";
							document.getElementById('seltoyr1').value="";
							document.getElementById('selfrommon1').value="";
							document.getElementById('seltomon1').value="";	
							
						}
				  }
	  
	        //DOB compare with experience End
			//Month & Year of passing compare with experience start
				  if(document.getElementById('selfromyr1').value < document.getElementById('seldobyear_pass').value)
				  {
					    alert("Period of Experience can't be prior to completion of post graduate degree");
					   //alert("From Year cannot be greater than to Month & Year of passing");
						document.getElementById('selfromyr1').value="";
						document.getElementById('seltoyr1').value="";
						document.getElementById('selfrommon1').value="";
						document.getElementById('seltomon1').value="";	
					  
				  }else if(document.getElementById('selfromyr1').value == document.getElementById('seldobyear_pass').value)
				  {
					 if((document.getElementById('selfrommon1').value) < (document.getElementById('seldobmon_pass').value))
						{
							 alert("Period of Experience can't be prior to completion of post graduate degree");
							//alert("From Month cannot be greater than or equal to Month & Year of passing");
							document.getElementById('selfromyr1').value="";
							document.getElementById('seltoyr1').value="";
							document.getElementById('selfrommon1').value="";
							document.getElementById('seltomon1').value="";	
							
						}
				  }
	  
	        //Month & Year of passing compare with experience End
		}
		
		if(document.getElementById('selfromyr1').value!="" && document.getElementById('seltoyr1').value!="" && document.getElementById('selfrommon1').value!="" && document.getElementById('seltomon1').value!="")
		{
			 // alert('hii');
			//textto=(document.getElementById('seltoyr1').value - document.getElementById('selfromyr1').value)+"/"+Math.abs((document.getElementById('selfrommon1').value - document.getElementById('seltomon1').value));
			//my code
			if(document.getElementById('selfromyr1').value > document.getElementById('seltoyr1').value)
			{
				alert("From date should be prior to To date");
				document.getElementById('selfromyr1').value="";
				document.getElementById('seltoyr1').value="";
				document.getElementById('selfrommon1').value="";
				document.getElementById('seltomon1').value="";	
				//document.getElementById('txtservice1').value="";
			}
			else if(document.getElementById('selfromyr1').value == document.getElementById('seltoyr1').value)
			{
				//alert(parseInt(document.getElementById('selfrommon1').value));
				//alert(parseInt(document.getElementById('seltomon1').value));
				if((document.getElementById('selfrommon1').value) >= (document.getElementById('seltomon1').value))
				{
					alert("From date should be prior to To date");
					document.getElementById('selfromyr1').value="";
					document.getElementById('seltoyr1').value="";
					document.getElementById('selfrommon1').value="";
					document.getElementById('seltomon1').value="";	
					//document.getElementById('txtservice1').value="";
				}
				else
				{
					if(document.getElementById('seltomon1').value==12 && document.getElementById('seltoyr1').value==2012){
				  textto=diffDates_experience_current(document.getElementById('selfrommon1').value, document.getElementById('selfromyr1').value, document.getElementById('seltomon1').value, document.getElementById('seltoyr1').value);	
				}else{ 
				 textto=diffDates_experience(document.getElementById('selfrommon1').value, document.getElementById('selfromyr1').value, document.getElementById('seltomon1').value, document.getElementById('seltoyr1').value);	
				//document.getElementById('txtservice1').value=textto;
				}
					document.getElementById('txtexp1').value = textto;
				}
			}			
			else
			{
				if(document.getElementById('seltomon1').value==12 && document.getElementById('seltoyr1').value==2012){
				  textto=diffDates_experience_current(document.getElementById('selfrommon1').value, document.getElementById('selfromyr1').value, document.getElementById('seltomon1').value, document.getElementById('seltoyr1').value);	
				}else{ 
				 textto=diffDates_experience(document.getElementById('selfrommon1').value, document.getElementById('selfromyr1').value, document.getElementById('seltomon1').value, document.getElementById('seltoyr1').value);	
				//document.getElementById('txtservice1').value=textto;
				}
				document.getElementById('txtexp1').value = textto;
			}
			//end of my code
		}
		
		
		if(document.getElementById('selfromyr2').value!="" && document.getElementById('seltoyr2').value!="" && document.getElementById('selfrommon2').value!="" && document.getElementById('seltomon2').value!="")
		{
			
			
			//DOB compare with experience start
				  if(document.getElementById('selfromyr2').value < document.getElementById('seldobyear').value)
				  {
					   alert("Experience cannot be prior to date of birth");
						document.getElementById('selfromyr2').value="";
						document.getElementById('seltoyr2').value="";
						document.getElementById('selfrommon2').value="";
						document.getElementById('seltomon2').value="";	
					  
				  }else if(document.getElementById('selfromyr2').value == document.getElementById('seldobyear').value)
				  {
					 if((document.getElementById('selfrommon2').value) <= (document.getElementById('seldobmon').value))
						{
							alert("Experience cannot be prior to date of birth");
							document.getElementById('selfromyr2').value="";
							document.getElementById('seltoyr2').value="";
							document.getElementById('selfrommon2').value="";
							document.getElementById('seltomon2').value="";	
							
						}
				  }
			  //DOB compare with experience End
			  
			  //Month & Year of passing compare with experience start
				  if(document.getElementById('selfromyr2').value < document.getElementById('seldobyear_pass').value)
				  {
					   //alert("From Year cannot be greater than to Month & Year of passing");
					   alert("Period of Experience can't be prior to completion of post graduate degree");
						document.getElementById('selfromyr2').value="";
						document.getElementById('seltoyr2').value="";
						document.getElementById('selfrommon2').value="";
						document.getElementById('seltomon2').value="";	
					  
				  }else if(document.getElementById('selfromyr2').value == document.getElementById('seldobyear_pass').value)
				  {
					 if((document.getElementById('selfrommon2').value) < (document.getElementById('seldobmon_pass').value))
						{
							//alert("From Month cannot be greater than or equal to Month & Year of passing");
							 alert("Period of Experience can't be prior to completion of post graduate degree");
							document.getElementById('selfromyr2').value="";
							document.getElementById('seltoyr2').value="";
							document.getElementById('selfrommon2').value="";
							document.getElementById('seltomon2').value="";	
							
						}
				  }
			  //Month & Year of passing compare with experience End
		}
		
		if(document.getElementById('selfromyr2').value!="" && document.getElementById('seltoyr2').value!="" && document.getElementById('selfrommon2').value!="" && document.getElementById('seltomon2').value!="")
		{
			
			//my code
			if(document.getElementById('selfromyr2').value > document.getElementById('seltoyr2').value)
			{
				alert("From date should be prior to To date");
				document.getElementById('selfromyr2').value="";
				document.getElementById('seltoyr2').value="";
				document.getElementById('selfrommon2').value="";
				document.getElementById('seltomon2').value="";
				//document.getElementById('txtservice2').value="";
			}
			else if(document.getElementById('selfromyr2').value == document.getElementById('seltoyr2').value)
			{
				//alert(parseInt(document.getElementById('selfrommon1').value));
				//alert(parseInt(document.getElementById('seltomon1').value));
				if((document.getElementById('selfrommon2').value) >= (document.getElementById('seltomon2').value))
				{
					alert("From date should be prior to To date");
					document.getElementById('selfromyr2').value="";
					document.getElementById('seltoyr2').value="";
					document.getElementById('selfrommon2').value="";
					document.getElementById('seltomon2').value="";
					//document.getElementById('txtservice2').value="";
				}
				else
				{
					textto=diffDates_experience(document.getElementById('selfrommon2').value, document.getElementById('selfromyr2').value, document.getElementById('seltomon2').value, document.getElementById('seltoyr2').value);		
					//document.getElementById('txtservice2').value=textto;
					 document.getElementById('txtexp2').value = textto;
				}
			}			
			else
			{
				textto=diffDates_experience(document.getElementById('selfrommon2').value, document.getElementById('selfromyr2').value, document.getElementById('seltomon2').value, document.getElementById('seltoyr2').value);		
				//document.getElementById('txtservice2').value=textto;
				 document.getElementById('txtexp2').value = textto;
			}
			//end of my code
		
		}else{
			
			//document.getElementById('txtservice2').value="";
			}

}

	
function chkEmpYear(fld)//for a row, to date and from date check
{ 

	if(fld=='emp4from')
	{
		if(document.getElementById('selfromyr3').value != "" && document.getElementById('selfromyr4').value != "" )
		{
			if((document.getElementById('selfromyr4').value == document.getElementById('selfromyr3').value)  && (document.getElementById('selfrommon4').value > document.getElementById('selfrommon3').value))
			{
				alert("From Month should not be greater than the third employer From Month");
				document.getElementById('selfromyr4').value="";
				document.getElementById('seltoyr4').value="";
				document.getElementById('selfrommon4').value="";
				document.getElementById('seltomon4').value="";
				document.getElementById('txtservice4').value="";
				return false;
			}
			else if(document.getElementById('selfromyr4').value > document.getElementById('selfromyr3').value)
			{
				alert("From Year should not be greater than the third employer From Year");
				document.getElementById('selfromyr4').value="";
				document.getElementById('seltoyr4').value="";
				document.getElementById('selfrommon4').value="";
				document.getElementById('seltomon4').value="";
				document.getElementById('txtservice4').value="";
				return false;
			}
		}
	}
	else if(fld=='emp4to')
	{
		if(document.getElementById('selfromyr3').value != "" && document.getElementById('seltoyr4').value != "" )
		{
			if((document.getElementById('seltoyr4').value == document.getElementById('selfromyr3').value)  && (document.getElementById('seltomon4').value > document.getElementById('selfrommon3').value))
			{
				alert("To Month should not be greater than the third employer From Month");
				document.getElementById('selfromyr4').value="";
				document.getElementById('seltoyr4').value="";
				document.getElementById('selfrommon4').value="";
				document.getElementById('seltomon4').value="";
				document.getElementById('txtservice4').value="";
				return false;
			}
			else if(document.getElementById('seltoyr4').value > document.getElementById('selfromyr3').value)
			{
				alert("To Year should not be greater than the third employer From Year");
				document.getElementById('selfromyr4').value="";
				document.getElementById('seltoyr4').value="";
				document.getElementById('selfrommon4').value="";
				document.getElementById('seltomon4').value="";
				document.getElementById('txtservice4').value="";
				return false;
			}
		}
	}
	
	//end of emp 4 check
	if(fld=='emp3from')
	{
		if(document.getElementById('selfromyr2').value != "" && document.getElementById('selfromyr3').value != "" )
		{
			if((document.getElementById('selfromyr3').value == document.getElementById('selfromyr2').value)  && (document.getElementById('selfrommon3').value > document.getElementById('selfrommon2').value))
			{
				alert("From Month should not be greater than the second employer From Month");
				document.getElementById('selfromyr3').value="";
				document.getElementById('seltoyr3').value="";
				document.getElementById('selfrommon3').value="";
				document.getElementById('seltomon3').value="";
				document.getElementById('txtservice3').value="";
				return false;
			}
			else if(document.getElementById('selfromyr3').value > document.getElementById('selfromyr2').value)
			{
				alert("From Year should not be greater than the second employer From Year");
				document.getElementById('selfromyr3').value="";
				document.getElementById('seltoyr3').value="";
				document.getElementById('selfrommon3').value="";
				document.getElementById('seltomon3').value="";
				document.getElementById('txtservice3').value="";
				return false;
			}
		}
	}
	if(fld=='emp3to')
	{
		if(document.getElementById('selfromyr2').value != "" && document.getElementById('seltoyr3').value != "" )
		{
			if((document.getElementById('seltoyr3').value == document.getElementById('selfromyr2').value)  && (document.getElementById('seltomon3').value > document.getElementById('selfrommon2').value))
			{
				alert("To Month should not be greater than the second employer From Month");
				document.getElementById('selfromyr3').value="";
				document.getElementById('seltoyr3').value="";
				document.getElementById('selfrommon3').value="";
				document.getElementById('seltomon3').value="";
				document.getElementById('txtservice3').value="";
				return false;
			}
			else if(document.getElementById('seltoyr3').value > document.getElementById('selfromyr2').value)
			{
				alert("To Year should not be greater than the second employer From Year");
				document.getElementById('selfromyr3').value="";
				document.getElementById('seltoyr3').value="";
				document.getElementById('selfrommon3').value="";
				document.getElementById('seltomon3').value="";
				document.getElementById('txtservice3').value="";
				return false;
			}
		}
	}
	//end of emp 3 check
	if(fld=='emp2from')
	{
		if(document.getElementById('selfromyr1').value != "" && document.getElementById('selfromyr2').value != "" )//this check is to ensure that employee 1 and employee 2 details are filled
		{
			if((document.getElementById('selfromyr2').value == document.getElementById('selfromyr1').value)  && (document.getElementById('selfrommon2').value > document.getElementById('selfrommon1').value))
			{
				alert("From Month should not be greater than the first employer From Month");
				document.getElementById('selfromyr2').value="";
				document.getElementById('seltoyr2').value="";
				document.getElementById('selfrommon2').value="";
				document.getElementById('seltomon2').value="";
				document.getElementById('txtservice2').value="";
				return false;
			}
			else if(document.getElementById('selfromyr2').value > document.getElementById('selfromyr1').value)
			{
				alert("From Year should not be greater than the first employer From Year");
				document.getElementById('selfromyr2').value="";
				document.getElementById('seltoyr2').value="";
				document.getElementById('selfrommon2').value="";
				document.getElementById('seltomon2').value="";
				
				return false;
			}
		}
	}
	else if(fld=='emp2to')
	{
		if(document.getElementById('selfromyr1').value != "" && document.getElementById('seltoyr2').value != "" )
		{
			if((document.getElementById('seltoyr2').value == document.getElementById('selfromyr1').value)  && (document.getElementById('seltomon2').value > document.getElementById('selfrommon1').value))
			{
				alert("To Month should not be greater than the first employer From Month");
				document.getElementById('selfromyr2').value="";
				document.getElementById('seltoyr2').value="";
				document.getElementById('selfrommon2').value="";
				document.getElementById('seltomon2').value="";
				
				return false;
			}
			else if(document.getElementById('seltoyr2').value > document.getElementById('selfromyr1').value)
			{
				alert("To Year should not be greater than the first employer From Year");
				document.getElementById('selfromyr2').value="";
				document.getElementById('seltoyr2').value="";
				document.getElementById('selfrommon2').value="";
				document.getElementById('seltomon2').value="";
				
				return false;
			}
		}
	}
	//end of emp 2 check
}



function expcalc(frommon,fromyr, tomon, toyr)
{
var calday = 01;
var calmon = frommon;
var calyear = fromyr;
	
var curday = 01;
var curmon = tomon;
var curyear = toyr;

		var curd = new Date(curyear,curmon-1,curday);
		var cald = new Date(calyear,calmon-1,calday);
		
		var diff =  Date.UTC(curyear,curmon,curday,0,0,0) - Date.UTC(calyear,calmon,calday,0,0,0);

		var dife = datediff(curd,cald);
		return dife[0]+"/"+dife[1];		

}



function dob_cast_check(){

	if(document.getElementById('seldobyear_caste').value!="" && document.getElementById('seldobmon_caste').value!="" && document.getElementById('seldobday_caste').value!="")
	{	 
	  //DOB compare with Date of Issuing Caste cert. start
	  if(document.getElementById('seldobyear_caste').value < document.getElementById('seldobyear').value)
	  {
		   alert("Caste certificate issue date should be after date of birth");
			document.getElementById('seldobday_caste').value="";
				document.getElementById('seldobmon_caste').value="";
				document.getElementById('seldobyear_caste').value="";
		  
	  }else if(document.getElementById('seldobyear_caste').value == document.getElementById('seldobyear').value)
	  {
		 if((document.getElementById('seldobmon_caste').value) <= (document.getElementById('seldobmon').value))
			{
				alert("Caste certificate issue date should be after date of birth");
				document.getElementById('seldobday_caste').value="";
				document.getElementById('seldobmon_caste').value="";
				document.getElementById('seldobyear_caste').value="";
				 
				
			}
	  }
	  //DOB compare with Date of Issuing Caste cert. End
	}
 
}

function dob_pwd_check(){

	if(document.getElementById('seldobyear_pwd').value!="" && document.getElementById('seldobmon_pwd').value!="" && document.getElementById('seldobday_pwd').value!="")
	{	 
	  //DOB compare with PWD Date of Issue start
	  if(document.getElementById('seldobyear_pwd').value < document.getElementById('seldobyear').value)
	  {
		   alert("Date of issue of PWD certificate should be after the date of birth");
			document.getElementById('seldobday_pwd').value="";
				document.getElementById('seldobmon_pwd').value="";
				document.getElementById('seldobyear_pwd').value="";
		  
	  }else if(document.getElementById('seldobyear_pwd').value == document.getElementById('seldobyear').value)
	  {
		 if((document.getElementById('seldobmon_pwd').value) <= (document.getElementById('seldobmon').value))
			{
				alert("Date of issue of PWD certificate should be after the date of birth");
				document.getElementById('seldobday_pwd').value="";
				document.getElementById('seldobmon_pwd').value="";
				document.getElementById('seldobyear_pwd').value="";
				 
				
			}
	  }
	  //DOB compare with PWD Date of Issue End
	}
	
	
}

function dob_emp_check(){

	if(document.getElementById('seldobyear_emp').value!="" && document.getElementById('seldobmon_emp').value!="" && document.getElementById('seldobday_emp').value!="")
	{	 
	  //DOB compare with PWD Date of Issue start
	  if(document.getElementById('seldobyear_emp').value < document.getElementById('seldobyear').value)
	  {
		   alert("Date of joining IOCL should be after date of birth");
			document.getElementById('seldobday_emp').value="";
				document.getElementById('seldobmon_emp').value="";
				document.getElementById('seldobyear_emp').value="";
		  
	  }else if(document.getElementById('seldobyear_emp').value == document.getElementById('seldobyear').value)
	  {
		 if((document.getElementById('seldobmon_emp').value) <= (document.getElementById('seldobmon').value))
			{
				alert("Date of joining IOCL should be after date of birth");
				document.getElementById('seldobday_emp').value="";
				document.getElementById('seldobmon_emp').value="";
				document.getElementById('seldobyear_emp').value="";
				 
				
			}
	  }
	  //DOB compare with PWD Date of Issue End
	}
 
}

function dob_pass_check(){

	if(document.getElementById('seldobyear_pass').value!="" && document.getElementById('seldobmon_pass').value!="" )
	{	 
	  //DOB compare with Month & Year of Passing start
	  if(document.getElementById('seldobyear_pass').value < document.getElementById('seldobyear').value)
	  {
		   alert("Month and Year of passing should be after the date of birth");
			 
				document.getElementById('seldobmon_pass').value="";
				document.getElementById('seldobyear_pass').value="";
		  
	  }else if(document.getElementById('seldobyear_pass').value == document.getElementById('seldobyear').value)
	  {
		 if((document.getElementById('seldobmon_pass').value) <= (document.getElementById('seldobmon').value))
			{
				alert("Month and Year of passing should be after the date of birth");
				 
				document.getElementById('seldobmon_pass').value="";
				document.getElementById('seldobyear_pass').value="";
				 
				
			}
	  }
	  //DOB compare with Month & Year of Passing End
	}
	
	
}


