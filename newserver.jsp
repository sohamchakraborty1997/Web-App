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
                PreparedStatement ps1 = null;
                ResultSet rs1 = null;
                PreparedStatement ps2 = null;
                ResultSet rs2 = null;

                try {
                    mk = new MakeConnection();
                    String Name = request.getParameter("KNO");

            %>
            <br /><br />
            <h2 align="center"><font><strong><u>REQUIRED RECORDS</u></strong></font></h2>
            <table id="example" class="display nowrap" cellspacing="0" width="100%" padding="200px">
                <br /><br />
                <thead>
                    <tr>
                        <td><b>KNO</b></td>
                        <td><b>Received_Amt</b></td>
                        <td><b>Bill_collection_Date</b></td>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <td><b>KNO</b></td>
                        <td><b>Received_Amt</b></td>
                        <td><b>Bill_collection_Date</b></td>
                    </tr>
                </tfoot>
                <tbody>
                    <%  String fd = request.getParameter("fromdate");
                        String td = request.getParameter("todate");
                        
                        
                        String sql2 = "DELETE FROM HCL_PAYMENT_011116_301116";
                        String sql = "INSERT INTO HCL_PAYMENT_011116_301116 SELECT DISTINCT KNO, RECEIVED_AMOUNT, BILL_COLLECTION_DATE FROM CDF_PAYMENT_WEEKLY_DATA_ARCH WHERE BILL_COLLECTION_DATE BETWEEN TO_DATE(?,'MM/DD/YYYY') AND TO_DATE(?,'MM/DD/YYYY')";
                        
                        String sql1 = "SELECT * FROM HCL_PAYMENT_011116_301116";
                        

                        ps2 = mk.con.prepareStatement(sql2);
                        ps = mk.con.prepareStatement(sql);
                        ps1 = mk.con.prepareStatement(sql1);

                        ps.setString(1, fd);
                        ps.setString(2, td);
                        
                        rs2 = ps2.executeQuery();
                        rs = ps.executeQuery();
                        rs1 = ps1.executeQuery();
                       

                        while (rs1.next()) {
                    %>
                    <tr>

                        <td><%=rs1.getString("KNO")%></td>
                        <td><%=rs1.getString("RECEIVED_AMOUNT")%></td>
                        <td><%=rs1.getString("BILL_COLLECTION_DATE")%></td>
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
                if (rs1 != null) {
                    rs1.close();
                }
                if (ps1 != null) {
                    ps1.close();
                }
                if (rs1 != null) {
                    rs1.close();
                }
                if (ps1 != null) {
                    ps1.close();}
                    if (mk.con != null) {
                        mk.con.close();
                    }
                }
            %>
        </div>
    </body>   
</html>