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
                        <td><b>Bill_No</b></td>
                        <td><b>Bill_Type</b></td>
                        <td><b>CIS_Payment_Date</b></td>
                        <td><b>CIS_Payment_Amt</b></td>
                        <td><b>Payment_mode_cd</b></td>
                        <td><b>Payment_mode_desc</b></td>
                        <td><b>Receipt no</b></td>
                        <td><b>Bill month</b></td>
                        <td><b>Bill year</b></td>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <td><b>KNO</b></td>
                        <td><b>Bill_No</b></td>
                        <td><b>Bill_Type</b></td>
                        <td><b>CIS_Payment_Date</b></td>
                        <td><b>CIS_Payment_Amt</b></td>
                        <td><b>Payment_mode_cd</b></td>
                        <td><b>Payment_mode_desc</b></td>
                        <td><b>Receipt no</b></td>
                        <td><b>Bill month</b></td>
                        <td><b>Bill year</b></td>
                    </tr>
                </tfoot>
                <tbody>
                    <%    String fd = request.getParameter("fromdate");
                        String td = request.getParameter("todate");
                        //String fd1 = request.getParameter("fromdate");
                        //String td1 = request.getParameter("todate");
                        String sql2 = "DELETE FROM CIS_PAYMENT_011116_301116";
                        String sql = "INSERT INTO CIS_PAYMENT_011116_301116 SELECT DISTINCT KNO,BILL_NO,BILL_TYPE,PAYMENT_DATE,PAYMENT_AMOUNT,PAYMENT_MODE_CD,PAYMENT_MODE_DESC,RECEIPT_NO,BILL_MONTH,BILL_YEAR FROM RL_KOTA_PMNT_CIS WHERE PAYMENT_DATE BETWEEN TO_DATE(?,'MM/DD/YYYY') AND TO_DATE(?,'MM/DD/YYYY')AND BILL_TYPE IN ('0','a','A','b','B')";
                        //  String sgl2 = "INSERT INTO HCL_PAYMENT_011116_301116 SELECT DISTINCT TO_CHAR(KNO), RECEIVED_AMOUNT, BILL_COLLECTION_DATE   FROM CDF_PAYMENT_WEEKLY_DATA_ARCH WHERE  TO_DATE(BILL_COLLECTION_DATE,'MM/DD/YYYY') BETWEEN TO_DATE(?,'MM/DD/YYYY') AND TO_DATE(?,'MM/DD/YYYY')";
                        String sql1 = "SELECT * FROM CIS_PAYMENT_011116_301116";
                        //String sql4 = "SELECT * FROM HCL_PAYMENT_011116_301116";
                        ps2 = mk.con.prepareStatement(sql2);
                        ps = mk.con.prepareStatement(sql);
                        ps1 = mk.con.prepareStatement(sql1);
                        ps.setString(1, fd);
                        ps.setString(2, td);
                        // ps2.setString(3, fd1);
                        //ps2.setString(4, td1);
                        rs2 = ps2.executeQuery();
                        rs = ps.executeQuery();
                        rs1 = ps1.executeQuery();
                        //rs3 = ps3.executeQuery();
                        // rs4 = ps4.executeQuery();

                        while (rs1.next()) {
                    %>
                    <tr>

                        <td><%=rs1.getString("KNO")%></td>
                        <td><%=rs1.getString("BILL_NO")%></td>
                        <td><%=rs1.getString("BILL_TYPE")%></td>
                        <td><%=rs1.getString("PAYMENT_DATE")%></td>
                        <td><%=rs1.getString("PAYMENT_AMOUNT")%></td>
                        <td><%=rs1.getString("PAYMENT_MODE_CD")%></td>
                        <td><%=rs1.getString("PAYMENT_MODE_DESC")%></td>
                        <td><%=rs1.getString("RECEIPT_NO")%></td>
                        <td><%=rs1.getString("BILL_MONTH")%></td>
                        <td><%=rs1.getString("BILL_YEAR")%></td>
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
                    if (mk.con != null) {
                        mk.con.close();
                    }
                }
            %>
        </div>
    </body>   
</html>
