<%@ Page Title="" Language="C#" MasterPageFile="~/MemberPages/Instructor/Instructor.Master" AutoEventWireup="true" CodeBehind="Exam.aspx.cs" Inherits="Student_Seating.MemberPages.Instructor.Exam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 10%;
            height: 20px;
        }
        .auto-style3 {
            height: 20px;
        }
        .auto-style4 {
            width: 10%;
            height: 32px;
        }
        .Exam{
             color: #4991DC;
            background-color: #ffffff;
        }
        .auto-style5 {
            width: 10%;
            height: 34px;
        }
        .auto-style6 {
            width: 10%;
            height: 29px;
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
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = " vertical-align:middle" colspan="2">Type:</td>
            <td style = " vertical-align:middle" colspan="2">
                <asp:DropDownList ID="exmType_ddl" runat="server" Height="20px" Width="180px">
                    <asp:ListItem Value="partiel">Partiel</asp:ListItem>
                    <asp:ListItem Value="final">Final</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%;  vertical-align:middle">
                <asp:Button ID="displayExm_btn" runat="server" Height="30px" Text="Display" Width="100px" OnClick="displayExm_btn_Click" />
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
             <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
            <td style = " vertical-align:middle" class="auto-style3" colspan="2">Start Time:</td>
            <td style = " vertical-align:middle" class="auto-style3" colspan="2">
                <asp:TextBox ID="strtTime_txt" runat="server" Height="20px" Width="180px"></asp:TextBox>
             </td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
            <td style = "text-align:center; vertical-align:middle" colspan="3" rowspan="12">
                <asp:GridView ID="exmGrid" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="314px" Width="610px">
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
            <td style = " vertical-align:middle" colspan="2">End Time:</td>
            <td style = " vertical-align:middle" colspan="2">
                <asp:TextBox ID="endTime_txt" runat="server" Height="20px" Width="180px"></asp:TextBox>
             </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
            <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
            <td style = " vertical-align:middle" class="auto-style3" colspan="2">Course:</td>
            <td style = " vertical-align:middle" class="auto-style3" colspan="2">
                <asp:DropDownList ID="courseExm_ddl" runat="server" Height="20px" Width="180px">
                </asp:DropDownList>
            </td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
        </tr>
        <tr>
             <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = " vertical-align:middle" colspan="2">Date:</td>
            <td style = " vertical-align:middle" colspan="3" rowspan="6">
                <asp:Calendar ID="date_clndr" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px">
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                </asp:Calendar>
             </td>
        </tr>
        <tr>
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
        </tr>
        <tr>
            <td style = "text-align:center; vertical-align:middle" class="auto-style5"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style5"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style5"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style5"></td>
        </tr>
        <tr>
            <td style = "text-align:center; vertical-align:middle" class="auto-style6"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style6"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style6"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style6"></td>
        </tr>
        <tr>
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
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
             <td style = "text-align:center; vertical-align:middle" class="auto-style4"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style4"></td>
            <td style = " vertical-align:middle" class="auto-style4">
                <asp:Button ID="addExam_btn" runat="server" Height="30px" Text="Add" Width="100px" OnClick="addExam_btn_Click" />
             </td>
            <td style = " vertical-align:middle" class="auto-style4">
                &nbsp;</td>
            <td style = " vertical-align:middle" class="auto-style4">
                &nbsp;</td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style4"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style4"></td>
        </tr>
        <tr>
             <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "text-align:center; vertical-align:middle" colspan="3">
                <asp:Label ID="exm_conf" runat="server" ForeColor="#009900" Visible="False"></asp:Label>
                <asp:Label ID="exm_err" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>
             </td>
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
    </table>
    
</asp:Content>
