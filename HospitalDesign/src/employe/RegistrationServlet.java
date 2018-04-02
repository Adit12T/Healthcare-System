package employe;
import database.dbcon;

import java.io.IOException;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import com.mysql.jdbc.EscapeTokenizer;

import employe.RegistrationBean;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id =0;
		int expid=0;
		String name = request.getParameter("name");
		String dob = request.getParameter("dob");
		String gender = request.getParameter("gender");
		String mob = request.getParameter("mob");
		String teno = request.getParameter("teno");
		String address = request.getParameter("add");
		int status1=0;
		
		
	
		String email = request.getParameter("email");
		String bloodgroup = request.getParameter("bloodgroup");
		String city= request.getParameter("city");
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		String dname = request.getParameter( "dname");
		
		String joindate = request.getParameter("joindate");
		
		String image = "abc";
		String emptype=request.getParameter("emptype");
		String mstatus=request.getParameter("mstatus");
		int salary =Integer.parseInt(request.getParameter("salary"));
		String exp = request.getParameter( "exp");

	    String PreSalary=request.getParameter("last_salary");
		String lastpost=request.getParameter("lpt");
		String lastemp=request.getParameter("lem");
		int profid=0;
	
		
		String qtype[]=request.getParameterValues("qua");
		String cname[]=request.getParameterValues("crs");
		String []uname=request.getParameterValues("uni");
		String []clgname=request.getParameterValues("clg");
		String []stream=request.getParameterValues("strm");
		String []passyear=request.getParameterValues("passing");
		String []percentage=request.getParameterValues("percentage");
		
		
		int speid=0;
		String specialization=request.getParameter("specialization");
		String licenceno=request.getParameter("lino");
		String s_date=request.getParameter("joindate");
		int aid=0;
		String bname=request.getParameter("bankname");
		String baccno=request.getParameter("actno");
		String pfno=request.getParameter("pfno");
		String panno=request.getParameter("panno");
		Date d=new Date();
	
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		String datevalue=format.format(d);
		/*
		try {
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List items = null;
			
			try {
				items = upload.parseRequest(request);
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
			
			Iterator itr = items.iterator();
			
			while (itr.hasNext()) {
				
				FileItem item = (FileItem) itr.next();
				String name1 = item.getFieldName();
				if (name1.equals("image")) {
					image = item.getName();
							File savedFile = new File(request.getRealPath("/")
									+ "empimage\\" + image);
							item.write(savedFile);
							System.out.print(savedFile);
							
						}
						
				} 
					}catch (Exception e) {
					e.printStackTrace();
				}
				
		*/
		
		int s1=0;
		
		
		try {
			
			
				RegistrationBean b = new RegistrationBean();
				
				
				
				boolean i = b.saveData(id, name,dob,joindate,teno,mob, mstatus,gender,address,city,state ,country,
						bloodgroup, emptype,email,image,salary ,dname,status1,datevalue,s_date);
				dbcon db = dbcon.getConnection();
				s1=b.getempid(id, name,dob,joindate,teno,mob, mstatus,gender,address,city,state ,country,bloodgroup, emptype,email,image,salary );
				// String sql="select max(emp_id) from employee";
				//ResultSet rs=db.select(sql);
				//System.out.println(rs);
				if(exp.equals("")){
					boolean j=b.saveData1(expid, s1, "fresher", "fresher","N/A", "fresher");	
				}
				else{
					boolean j=b.saveData1(expid, s1, lastemp, lastpost, PreSalary, exp);
				}
				
				boolean k=b.saveData2(profid, s1, qtype, cname, uname, clgname,stream,passyear,percentage);
				if(emptype.equals("doctor"))
				{
				
				
				boolean l=b.saveData3(speid, s1, specialization, licenceno);
				}
				boolean l=b.saveData4(aid, s1, bname, baccno,pfno,panno);
			
				 response.sendRedirect("Employee/EmployeeRegistration.jsp?msg=ss");
		}catch (Exception e) {
			System.out.println(e);
		}
		
	}

}
