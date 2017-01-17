<%-- 
    Document   : html
    Created on : Dec 14, 2016, 10:48:22 AM
    Author     : Soham
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div id="img">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" type="text/css" href="csssheet.css"/>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
            <title>Payment Analysis</title>
        <img src="rpsg.png" width="350" height="100" alt="rpsg" />
        <link rel="stylesheet" type="text/css" href="csssheet.css"/>
        <br />
    </head>
    <br />
    <br />
    <br />
    <body>
        <div class="container">
            <h1 align="center"><u>Payment Analysis</u></h1>
            <br />
            <form name="html1" action="server.jsp" method="POST">
                <div class="form-group">
                    <table border="0">
                        <tbody>
                            <tr>
                                <td>From Date:</td>
                                <td><input type="text" name="fromdate" class="form-control" placeholder="MM/DD/YYYY" value="" size="25" /></td>
                            </tr>
                            <tr>
                                <td>&nbsp;&nbsp;To Date:</td>
                                <td><input type="text" class="form-control" placeholder="MM/DD/YYYY" name="todate" value="" size="25" /></td>
                            </tr>
                        </tbody>
                    </table>
                    <br />
                    <button type="submit" class="btn btn-primary" value="Upload" name="upload">Upload to CIS</button>
                    &nbsp;
                    <button type="reset" class="btn btn-primary" value="Clear" name="clear">Clear</button>
                </div>
            </form>
            <br />
            <form name="html5" action="newserver.jsp" method="POST">
                <div class="form-group">
                    <table border="0">
                        <tbody>
                            <tr>
                                <td>From Date:</td>
                                <td><input type="text" name="fromdate" class="form-control" placeholder="MM/DD/YYYY" value="" size="25" /></td>
                            </tr>
                            <tr>
                                <td>&nbsp;&nbsp;To Date:</td>
                                <td><input type="text" class="form-control" placeholder="MM/DD/YYYY" name="todate" value="" size="25" /></td>
                            </tr>
                        </tbody>
                    </table>
                    <br />
                    <button type="submit" class="btn btn-primary" value="Upload" name="upload">Upload to HCL</button>
                    &nbsp;
                    <button type="reset" class="btn btn-primary" value="Clear" name="clear">Clear</button>
                </div>
            </form>
            <form name="html2" action="viewcis.jsp" method="POST">
                <div class="form-group">
                    <h2><u>View CIS Only</u></h2>
                    <br />
                    <button type="submit" class="btn btn-success" value="View CIS" name="viewcis">View</button>
                </div>
            </form>
            <form name="html3" action="viewhcl.jsp" method="POST">
                <div class="form-group">
                    <h2><u>View HCL Only</u></h2>
                    <br />
                    <button type="submit" class="btn btn-success" value="View CIS" name="viewhcl" value="View HCL" name="viewhcl">View</button>
                </div>
            </form>
            <form name="html4" action="commonview.jsp" method="POST">
                <div class="form-group">
                    <h2><u>View CIS & HCL </u></h2>
                    <br />
                    <button type="submit" class="btn btn-success" value="View Both" name="view">View</button>
                </div>
            </form>
            <br />
            <br />
            <br />
            <footer>
                <p align="right">Last Visited <%=new java.util.Date()%></p>
            </footer>
        </div>    
    </body>
</div>
</html>