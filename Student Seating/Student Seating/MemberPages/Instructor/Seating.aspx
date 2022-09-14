<%@ Page Title="" Language="C#" MasterPageFile="~/MemberPages/Instructor/Instructor.Master" AutoEventWireup="true" CodeBehind="Seating.aspx.cs" Inherits="Student_Seating.MemberPages.Instructor.Seating" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .Seating{
            color: #4991DC;
            background-color: #ffffff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
           <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "vertical-align:middle" colspan="2">Course ID:</td>
            <td style = " vertical-align:middle" colspan="2">
                <asp:DropDownList ID="course_ddl" runat="server" Height="30px" Width="200px">
                </asp:DropDownList>
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "vertical-align:middle;colspan="2">Student ID:</td>
            <td style = " vertical-align:middle" colspan="2">
                <asp:TextBox ID="stdIdSea_txt" runat="server" Height="30px" Width="180px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "vertical-align:middle" colspan="2">Exam Type:</td>
            <td style = "vertical-align:middle" colspan="2">
                <asp:DropDownList ID="exmtype_ddl" runat="server" Height="30px" Width="200px">
                    <asp:ListItem>Partiel</asp:ListItem>
                    <asp:ListItem>Final</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; vertical-align:middle">
                <asp:Button runat="server" Text="Show Exam" ID="showExam_btn" Height="30px" Width="100px" OnClick="showExam_btn_Click" />
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">
                <asp:Button ID="showHallCourse_btn" runat="server" Height="30px" OnClick="showHallCourse_btn_Click" Text="Cours Halls" Width="100px" />
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "vertical-align:middle" colspan="2">Academic Year:</td>
            <td style = "vertical-align:middle" colspan="2">
                <asp:DropDownList ID="academic_ddl" runat="server" Height="30px" Width="200px">
                </asp:DropDownList>
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "vertical-align:middle" colspan="4" rowspan="11">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="250px" Width="352px">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "vertical-align:middle" colspan="2">Semester:</td>
            <td style = "vertical-align:middle" colspan="2">
                <%--<asp:DropDownList ID="sms_ddl" runat="server" Height="30px" Width="200px">
                    <asp:ListItem>Fall</asp:ListItem>
                    <asp:ListItem>Spring</asp:ListItem>
                </asp:DropDownList>--%>
                <asp:DropDownList ID="sms_ddl" runat="server" Height="30px" Width="200px">
                    <asp:ListItem>Fall</asp:ListItem>
                    <asp:ListItem>Spring</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
           <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; vertical-align:middle">
                <asp:Button ID="StdNb_btn" runat="server" Text="Show Number Of Student" Height="30px" Width="150px" OnClick="StdNb_btn_Click" />
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "vertical-align:middle" colspan="2">Number Of Student:</td>
            <td style = "vertical-align:middle" colspan="2">
                <asp:TextBox ID="nbStd_txt" runat="server" Height="30px" Width="180px" ></asp:TextBox>
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%;vertical-align:middle">
                <asp:Button ID="disStd_btn" runat="server" Text="Distribute" Height="30px" Width="100px" OnClick="disStd_btn_Click" />
            </td>
            <td style = "width:10%;vertical-align:middle">
                <asp:Button ID="shwCrs_btn" runat="server" Text="Show Courses" Height="30px" Width="100px" />
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "text-align:center; vertical-align:middle" colspan="2">
                <asp:Label ID="confirm_txt" runat="server" ForeColor="#009900" Visible="False"></asp:Label>
            </td>
            <td style = "text-align:center; vertical-align:middle" colspan="2">
                <asp:Label ID="error_txt" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "vertical-align:middle" colspan="4" rowspan="11">
                <asp:GridView ID="exam_info" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="202px" Width="453px">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr><tr>
           <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr><tr>
           <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
