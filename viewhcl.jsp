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
        <div class="container"
             <%
                 MakeConnection mk = null;
                 PreparedStatement ps = null;
                 ResultSet rs = null;

                 try {
                     mk = new MakeConnection();
                     //String Name = request.getParameter("KNO");

             %>
             <br /><br />
            <h2 align="center"><font><strong><u>HCL RECORDS</u></strong></font></h2>
            <table id="example" class="display nowrap" cellspacing="0" width="100%" padding="50px">
                <thead>
                    <tr>
                        <td><b>KNO</b></td>
                        <td><b>HCL_Payment_Amt</b></td>
                        <td><b>HCL_Payment_Date</b></td>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <td><b>KNO</b></td>
                        <td><b>HCL_Payment_Amt</b></td>
                        <td><b>HCL_Payment_Date</b></td>
                    </tr>
                </tfoot>
                <tbody
                    <%    String sql = "SELECT DISTINCT a.KNO,a.RECEIVED_AMOUNT,a.BILL_COLLECTION_DATE FROM HCL_PAYMENT_011116_301116  a WHERE (a.KNO,a.RECEIVED_AMOUNT,a.BILL_COLLECTION_DATE) NOT IN (SELECT KNO,PAYMENT_AMOUNT,PAYMENT_DATE FROM cis_payment_011116_301116)";
                        ps = mk.con.prepareStatement(sql);

                        rs = ps.executeQuery();
                        while (rs.next()) {
                    %>
                    <tr>

                        <td><%=rs.getString("KNO")%></td>
                        <td><%=rs.getString("RECEIVED_AMOUNT")%></td>
                        <td><%=rs.getString("BILL_COLLECTION_DATE")%></td>
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