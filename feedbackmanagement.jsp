<%-- 
    Document   : userhome
    Created on : AUG 28, 2017, 6:29:22 PM
    Author     : admin
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="MyPackage.DatabaseManager"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Zone</title>
        <link href="admincss/adminstyle.css" rel="stylesheet" type="text/css"/>
         <link href="admincss/adminmenu.css" rel="stylesheet" type="text/css"/>
         
    </head>
    <body>
         
        <form>
             <%
                if(session.getAttribute("adminid")=="" || session.getAttribute("adminid")==null)
                    response.sendRedirect("../login.jsp");
                else
                {
            %>
            <div id="wrapper">
                <div id="header">
                    <div id="logo">
                        <img src="../images/director.jpeg" width="150" height="150"/>
                    </div>
                    <div id="sitetitle">Customer Relationship Management</div>
                </div>
               
                <div id="menu">
                    <ul>
                        <li title="Admin Home"><a href="adminhome.jsp">Home</a></li>
                        <li title="FeedBack Management"><a href="feedbackmanagement.jsp">FeedBack</a></li>
                        <li title="Complaint Management"><a href="complainmanagement.jsp">Complain</a></li>
                        <li title="Upload File"><a href="uploadproduct.jsp">Upload</a></li>
                        <li title="Review Management"><a href="reviewmanagement.jsp">Review</a></li>
                        <li title="Enquiry Management"><a href="enquirymanagement.jsp">Enquiry</a></li>
                         <li title="Change Password"><a href="#">Change Passwd</a></li>
                          <li title="Logout of Current Session"><a href="logout.jsp">Logout</a></li>
                    </ul>
                </div>
                <div id="contain2">
                   <center> <h2 style="color: orange; font-weight: bold;">Feedback Management</h2>
                    <br><br>
                    <table border="1" style="width:700px;">
                        <tr>
                            <th>S.No</th>
                            <th>Name</th>
                            <th>Contact No.</th>
                            <th>Email Address</th>
                            <th>Feedback</th>
                            <th>Feedback Date</th>
                            <th>Delete</th>
                        </tr>
                        <%
                           int n=1;
                           DatabaseManager dm=new DatabaseManager();
                           String q="select * from feedback";
                          ResultSet rs=dm.selectQuery(q);
                          while(rs.next())
                          {
                        %>
                        <tr>
                            <td><%=n%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(5)%></td>
                            <td><%=rs.getString(6)%></td>
                            <td><a href="admincode/delfeedback.jsp?fid=<%=rs.getInt(1)%>">Delete</a></td>
                        </tr>
                        <%
                        n++;}
                        %>
                    </table>
                    </center>
                </div>
                <div id="footer">
                    <div class="subfooter">
                         Copyright&copy; to WonderWorld
                    </div>
                    <div class="subfooter">
                        Developed By: Prashant Singh
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </form>
               
    </body>
</html>
