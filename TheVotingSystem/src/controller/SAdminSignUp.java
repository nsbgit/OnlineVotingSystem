package controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import logic.RandomPasswordGenerator;
import logic.SystemDateAndTime;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dto.AdminRegistrationInformation;

/**
 * Servlet implementation class SAdminSignUp
 */
public class SAdminSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Date date;
	private SimpleDateFormat simpleDateFormat;
	private String preFileName;
	private FileItemFactory fileItemFactory;
	private ServletFileUpload servletFileUpload;
	private List itemsList;
	private String finalFileName;
	private boolean isMultipart;
	private Iterator iterator;
	private FileItem item;
	private ArrayList<String> fieldValueList;
	private String itemName;
	private String regex;
	private Pattern pattern;
	private Matcher matcher;
	private StringBuffer stringBuffer;
	private String replacingText;
	private int indexOf;
	private String extensionName;
	private String filePath;
	private File savedFile;
	private AdminRegistrationInformation adminRegistrationInformation;
	private int databaseUpdateChecker;
	private HttpSession session;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SAdminSignUp() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.commonMethod(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.commonMethod(request, response);
	}
	
	private void commonMethod(HttpServletRequest request, HttpServletResponse response){
		try {
			adminRegistrationInformation = new AdminRegistrationInformation();
			fieldValueList = new ArrayList<String>();
			/********* auto generate preFileName ***********/
			date = new Date();
			simpleDateFormat = new SimpleDateFormat("ddMMyyyyhhmmss");
			preFileName = simpleDateFormat.format(date);
			/*************************************************/
			
			fileItemFactory = new DiskFileItemFactory();
			servletFileUpload = new ServletFileUpload(fileItemFactory);
			
			
			isMultipart = ServletFileUpload.isMultipartContent(request); // Is there multi type part is contain in page or not (e.g. text(form field), file etc)
			if (isMultipart) {
				try {
					itemsList = servletFileUpload.parseRequest(request); // All data and information from the jsp page bind into the object itemsList
				} catch (FileUploadException e) {
					e.printStackTrace();
				}
				iterator = itemsList.iterator();
				while (iterator.hasNext()) {
					item = (FileItem) iterator.next();
					if (item.isFormField()) {
						fieldValueList.add(item.getString()); // Store all field name of the form filed (e.g. textbox, textarea etc.)
					} else { // Upload file here
						itemName = item.getName(); // get the file name that the client uploaded
						regex = "[.*]";
						replacingText = "";
						pattern = Pattern.compile(regex);
						matcher = pattern.matcher(itemName);
						stringBuffer = new StringBuffer();
						while (matcher.find()) {
							matcher.appendReplacement(stringBuffer, replacingText);
						}
						indexOf = itemName.indexOf(".");
						extensionName = itemName.substring(indexOf); // Extension name is created
						filePath = getServletContext().getRealPath("/"); // Get the path where we have to save the file in the servlet or server
						finalFileName = preFileName + extensionName; // Final file name with extension name is created
						savedFile = new File(filePath + "/upload/admin/" + finalFileName); // It tells where we have to write the file
						
						try {
							item.write(savedFile); // It will write the file byte by byte in the above location
						} catch (Exception e) {
							e.printStackTrace();
						}
						
						adminRegistrationInformation.setFileName(finalFileName);
					}
					
					
				}
				
				/*********** HERE ALL INFORMATION FROM THE FORM FIELD WILL BE STORED IN THE DTO ***************/
				
				adminRegistrationInformation.setFirstName(fieldValueList.get(0));
				adminRegistrationInformation.setLastName(fieldValueList.get(1));
				adminRegistrationInformation.setOrganisationName(fieldValueList.get(2));
				adminRegistrationInformation.seteMail(fieldValueList.get(3));
				adminRegistrationInformation.setUserID(fieldValueList.get(4));
				adminRegistrationInformation.setPassword(RandomPasswordGenerator.createPassword());
				adminRegistrationInformation.setOrganisationAddress(fieldValueList.get(5));
				adminRegistrationInformation.setAgree(fieldValueList.get(6));
				adminRegistrationInformation.setRegistrationDate(SystemDateAndTime.getDate());
				adminRegistrationInformation.setRegistrationDay(SystemDateAndTime.getDay());
				adminRegistrationInformation.setRegistrationTime(SystemDateAndTime.getTimeIn12HrsFormat());	
				
				databaseUpdateChecker = new LAdminRegistration().insert(adminRegistrationInformation);
				
				session = request.getSession();
				
				if (databaseUpdateChecker != 0) {
					session.setAttribute("registrationMsg", "Hurray!!! Successfully submitted and your sign in details has been sent to the registered e-mail address.");
				} else {
					session.setAttribute("registrationMsg", "Sorry!!! Submission failed");
				}
				
				try {
					response.sendRedirect("mainToAdminSection/adminSignUp.jsp");
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				/************************************************************************************************/
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
