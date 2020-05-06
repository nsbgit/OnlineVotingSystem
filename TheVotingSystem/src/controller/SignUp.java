package controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logic.LAdminRegistration;
import logic.SystemDateAndTime;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dto.AdminRegistrationInformation;

/**
 * Servlet implementation class SignUp
 */
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 AdminRegistrationInformation adminRegistrationInformation;
		  int databaseUpdateChecker;
		  HttpSession session;
		adminRegistrationInformation = new AdminRegistrationInformation();
		
		adminRegistrationInformation.setFirstName(request.getParameter("firstName"));
		adminRegistrationInformation.setLastName(request.getParameter("lastName"));
		adminRegistrationInformation.setOrganisationName(request.getParameter("organisationName"));
		adminRegistrationInformation.seteMail(request.getParameter("eMail"));
		adminRegistrationInformation.setUserID(request.getParameter("userID"));
		adminRegistrationInformation.setPassword(request.getParameter("password"));
		adminRegistrationInformation.setOrganisationAddress(request.getParameter("organisationAddress"));
		adminRegistrationInformation.setAgree(request.getParameter("agree"));
		adminRegistrationInformation.setRegistrationDate(SystemDateAndTime.getDate());
		adminRegistrationInformation.setRegistrationDay(SystemDateAndTime.getDay());
		adminRegistrationInformation.setRegistrationTime(SystemDateAndTime.getTimeIn12HrsFormat());				
		 try
	        {
	            //PrintWriter out = response.getWriter();
	            Date d=new Date();
	            SimpleDateFormat sys=new SimpleDateFormat("ddMMyyyyhhmmss");
	            String id=sys.format(d);			           
	            String file_name=id;
	            FileItemFactory factory = new DiskFileItemFactory();
	            ServletFileUpload upload1 = new ServletFileUpload(factory);
	            List items = null;
	            String finalimage="";
	             if(false)
	             {

	             }
	             else
	             {
	             boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	             if(!isMultipart)
	             {

	             }
	             else
	             {
	             try
	                {
	                    items = upload1.parseRequest(request);

	                }
	                catch (FileUploadException e)
	                {
	                    e.printStackTrace();
	                }
	                Iterator itr = items.iterator();
	                while (itr.hasNext())
	                {
	                    FileItem item = (FileItem) itr.next();
	                    if (item.isFormField())
	                    {
	                    	
	                       
	                    	 String name = item.getFieldName();
	                    	 //System.out.println(name);
	                    	//System.out.println(item.getString());
	                    	 item.getString();

	                     }
	                    else
	                    {
	                        //try
	                        //{
	                            String itemName = item.getName();
	                            String reg = "[.*]";
	                            String replacingtext = "";

	                            Pattern pattern = Pattern.compile(reg);
	                            Matcher matcher = pattern.matcher(itemName);
	                            StringBuffer buffer = new StringBuffer();

	                            while (matcher.find())
	                            {
	                                matcher.appendReplacement(buffer, replacingtext);
	                            }
	                            int IndexOf = itemName.indexOf(".");
	                            String domainName = itemName.substring(IndexOf);
	                            String filePath = getServletContext().getRealPath("/");
	                            finalimage =file_name+domainName;
	                            File savedFile = new File(filePath+"/upload/admin/"+finalimage);
	                        try
	                        {
	                            item.write(savedFile);
	                            
	                            adminRegistrationInformation.setFileName(finalimage);		
								databaseUpdateChecker = new LAdminRegistration().insert(adminRegistrationInformation);
								
								session = request.getSession();
								
								if (databaseUpdateChecker != 0) {
									session.setAttribute("registrationMsg", "Hurray!!! Your information is successfully submitted");
								} else {
									session.setAttribute("registrationMsg", "Sorry!!! Submission failed");
								}
								
								try {
									response.sendRedirect("mainToAdminSection/adminSignUp.jsp");
								} catch (IOException e) {
									e.printStackTrace();
								}
								
		
	                        }
    catch (Exception ex)
    {
        ex.printStackTrace();
    }

}
}
}
}

}
catch(Exception ex)
{
ex.printStackTrace();
}
	}

}
