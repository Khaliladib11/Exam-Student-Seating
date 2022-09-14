<%@ Page Title="" Language="C#" MasterPageFile="~/MemberPages/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AcademicSemester.aspx.cs" Inherits="Student_Seating.MemberPages.Admin.AcademicSemester" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        width: 100%;
    }
        .auto-style2 {
            width: 84px;
        }
        .auto-style3 {
            width: 10%;
            height: 20px;
        }
        .auto-style4 {
            height: 20px;
        }
        .AcademicSemester{
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
        <td class="auto-style2" style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
    </tr>
    <tr>
        <td style = "text-align:center; vertical-align:middle" class="auto-style3"></td>
        <td style = "text-align:center; vertical-align:middle" class="auto-style3"></td>
        <td style = "text-align:center; vertical-align:middle" class="auto-style4" colspan="2">Academic Year</td>
        <td style = "text-align:center; vertical-align:middle" class="auto-style4"></td>
        <td style = "text-align:center; vertical-align:middle" class="auto-style4">
            <asp:Button ID="displayAcad_btn" runat="server" Height="30px" OnClick="displayAcad_btn_Click" Text="Display" Width="100px" />
        </td>
        <td style = "text-align:center; vertical-align:middle" class="auto-style3"></td>
        <td style = "text-align:center; vertical-align:middle" class="auto-style3"></td>
        <td style = "text-align:center; vertical-align:middle" class="auto-style3"></td>
        <td style = "text-align:center; vertical-align:middle" class="auto-style3"></td>
    </tr>
    <tr>
        <td style = "text-align:center; vertical-align:middle" class="auto-style3"></td>
        <td style = "text-align:center; vertical-align:middle" class="auto-style3"></td>
        <td style = "text-align:center; vertical-align:middle" class="auto-style4" colspan="2">
            <asp:TextBox ID="academic_txt" runat="server" Height="20px" Width="180px"></asp:TextBox>
        </td>
        <td style = "text-align:center; vertical-align:middle" class="auto-style3"></td>
        <td style = "text-align:center; vertical-align:middle" colspan="5" rowspan="13">
            <asp:GridView ID="academicGrid" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="241px" Width="456px">
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
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "text-align:center; vertical-align:middle" colspan="2" rowspan="3">
            <asp:Button ID="addAcademic_txt" runat="server" Height="30px" Text="Add" Width="100px" OnClick="addAcademic_txt_Click" />
        </td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
    </tr>
    <tr>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
    </tr>
    <tr>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
    </tr>
    <tr>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">
            <asp:Label ID="regularExpree_err" runat="server" ForeColor="#CC0000"></asp:Label>
        </td>
        <td class="auto-style2" style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
    </tr>
    <tr>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td class="auto-style2" style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
    </tr>
    <tr>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td class="auto-style2" style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
    </tr>
    <tr>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td class="auto-style2" style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
    </tr>
    <tr>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td class="auto-style2" style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
    </tr>
    <tr>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td class="auto-style2" style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
    </tr>
    <tr>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td class="auto-style2" style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
    </tr>
    <tr>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td class="auto-style2" style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
    </tr>
    <tr>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td class="auto-style2" style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
    </tr>
</table>

</asp:Content>
