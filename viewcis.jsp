
<%@page import="java.sql.*"%>
<%@page import="CescAppJavaPackage.*"%>
<html>
    <style>
        table{
            border: 2px dashed black;
            padding: 5px;
        }
    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.2.3/css/buttons.dataTables.min.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.2.3/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
    <script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
    <script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.2.3/js/buttons.html5.min.js"></script>
    <body background="6.jpg">
        <div class="container">

            <%
                MakeConnection mk = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    mk = new MakeConnection();
                    //String Name = request.getParameter("KNO");

            %>
            <br /><br />
            <h2 align="center"><font><strong><u>CIS RECORDS</u></strong></font></h2>
            <br /><br />
            <!--<table id="example" class="display nowrap" cellspacing="0" width="100%" padding="50px">-->
            <table id="example" class="display nowrap" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>KNO</th>
                        <th>Bill_Type</th>
                        <th>Bill_Month</th>
                        <th>Bill_Year</th>
                        <th>CIS_Payment_Amt</th>
                        <th>CIS_Payment_Date</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>KNO</th>
                        <th>Bill_Type</th>
                        <th>Bill_Month</th>
                        <th>Bill_Year</th>
                        <th>CIS_Payment_Amt</th>
                        <th>CIS_Payment_Date</th>
                    </tr>
                </tfoot>
                <tbody>



                    <!-- <tr>
                         <td><b>KNO</b></td>
                         <td><b>Bill_Type</b></td>
                         <td><b>Bill_Month</b></td>
                         <td><b>Bill_Year</b></td>
                         <td><b>CIS_Payment_Amt</b></td>
                         <td><b>CIS_Payment_Date</b></td>
                     </tr> -->



                    <%    String sql = "SELECT DISTINCT a.KNO,a.BILL_TYPE,a.BILL_MONTH,a.BILL_YEAR,a.PAYMENT_AMOUNT,a.PAYMENT_DATE FROM CIS_PAYMENT_011116_301116 a WHERE (a.KNO,a.PAYMENT_AMOUNT,a.PAYMENT_DATE) NOT IN (SELECT  KNO,RECEIVED_AMOUNT,BILL_COLLECTION_DATE FROM HCL_PAYMENT_011116_301116)";
                        ps = mk.con.prepareStatement(sql);

                        rs = ps.executeQuery();
                        while (rs.next()) {
                    %>
                    <tr>
                        <td><%=rs.getString("KNO")%></td>
                        <td><%=rs.getString("BILL_TYPE")%></td>
                        <td><%=rs.getString("BILL_MONTH")%></td>
                        <td><%=rs.getString("BILL_YEAR")%></td>
                        <td><%=rs.getString("PAYMENT_AMOUNT")%></td>
                        <td><%=rs.getString("PAYMENT_DATE")%></td>
                    </tr>

                    <%
                        }
                    %>
                </tbody>
            </table>
            <script>
                $(document).ready(function () {
                    $('#example').DataTable({
                        dom: 'Bfrtip',
                        buttons: [
                            'copyHtml5',
                            'excelHtml5',
                            'csvHtml5',
                            'pdfHtml5'
                        ]
                    });
                });
            </script>
            <%
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) {
                        rs.close();
                    }
                    if (ps != null) {
                        ps.close();
                    }
                    if (mk.con != null) {
                        mk.con.close();
                    }
                }
            %>


        </div>
    </body>
</html>