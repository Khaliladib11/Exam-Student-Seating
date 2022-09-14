<%@ Page Title="" Language="C#" MasterPageFile="~/MemberPages/Instructor/Instructor.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="Student_Seating.MemberPages.Instructor.Courses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
         .Courses{
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
            <td style = "text-align:center; vertical-align:middle" colspan="2">Course ID:</td>
            <td style = "text-align:center; vertical-align:middle" colspan="2">Course Name:</td>
            <td style = "text-align:center; vertical-align:middle">
                <asp:Button ID="addCourse_txt" runat="server" Height="30px" Text="Add" Width="100px" OnClick="addCourse_txt_Click" />
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">
                <asp:Button ID="removeCourse_btn" runat="server" Height="30px" Text="Remove" Width="100px" OnClick="removeCourse_btn_Click" />
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">
                <asp:Button ID="modifyCourse_btn" runat="server" Height="30px" Text="Modify" Width="100px" OnClick="modifyCourse_btn_Click" />
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">
                <asp:Button ID="displayCourse_btn" runat="server" Height="30px" Text="Display" Width="100px" OnClick="displayCourse_btn_Click" />
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
           <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "text-align:center; vertical-align:middle" colspan="2">
                <asp:TextBox ID="cid_txt" runat="server" Height="20px" Width="180px"></asp:TextBox>
            </td>
            <td style = "text-align:center; vertical-align:middle" colspan="2">
                <asp:TextBox ID="cname_txt" runat="server" Height="20px" Width="180px"></asp:TextBox>
            </td>
            <td style = "text-align:center; vertical-align:middle" colspan="2">
                <asp:Label ID="errorMsgC_txt" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>
            </td>
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
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "text-align:center; vertical-align:middle" colspan="8" rowspan="6">
                <asp:GridView ID="courseGrid" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="774px">
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
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
