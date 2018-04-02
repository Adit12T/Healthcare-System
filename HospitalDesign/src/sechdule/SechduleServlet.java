package sechdule;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SechduleServlet
 */
@WebServlet("/SechduleServlet")
public class SechduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SechduleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		int empid=Integer.parseInt(request.getParameter("eid"));
		String visiting_day[]=request.getParameterValues("visiting_day");
		String start_hr[]=request.getParameterValues("start_hr");
		String start_minute[]=request.getParameterValues("start_minute");
		String start_shift[]=request.getParameterValues("start_shift");
		String end_hr[]=request.getParameterValues("end_hr");
		String end_minute[]=request.getParameterValues("end_minute");
		String end_shift[]=request.getParameterValues("end_shift");
		
		
		
		
		
		String paid_start_time=request.getParameter("pstart_hr")+" : "+request.getParameter("pstart_minute")+" : "+request.getParameter("pstart_shift");
		String paid_end_time=request.getParameter("pend_hr")+" : "+request.getParameter("pend_minute")+" : "+request.getParameter("pend_shift");
		String paid_charge=request.getParameter("paidcharge");
		
		
		/*for (int i = 0; i < visiting_day.length; i++) {
			out.println(visiting_day[i]);
			out.println(start_hr[i]);
			out.println(start_minute[i]);
			out.println(end_hr[i]);
			out.println(end_minute[i]+"<br>");
		}
		*/
		
		SechduleBean bean=new SechduleBean();
		boolean flag=bean.saveSechdule(paid_charge,paid_start_time,paid_end_time,empid, visiting_day, start_hr, start_minute,start_shift, end_hr, end_minute,end_shift);
		if(flag)out.print("<div align='center'><font color ='green'><h3>Success Insert..........</h3></font></div>");
		else out.print("<div align='center'><font color ='red'><h3>Try Again..........</h3></font></div>");
	}

}
