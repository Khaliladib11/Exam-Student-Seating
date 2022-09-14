<%@ Page Title="" Language="C#" MasterPageFile="~/MemberPages/Instructor/Instructor.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Student_Seating.MemberPages.Instructor.Registration" %>
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
        .Registration{
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
            <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
            <td style = " vertical-align:middle" class="auto-style3" colspan="2">Student ID:</td>
            <td style = " vertical-align:middle" class="auto-style3" colspan="2">
                <asp:TextBox ID="regstd_txt" runat="server" Height="30px" Width="180px"></asp:TextBox>
            </td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style2">
                <asp:Button ID="stdCourse_btn" runat="server" Height="30px" OnClick="stdCourse_btn_Click" Text="Registered course" Width="150px" />
            </td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = " vertical-align:middle" colspan="2">Course Name:</td>
            <td style = " vertical-align:middle" colspan="2">
                <asp:TextBox ID="regcrs_txt" runat="server" Height="30px" Width="180px"></asp:TextBox>
            </td>
            <td style = "vertical-align:middle" colspan="4" rowspan="13">
                <asp:GridView ID="stdCrsGrid" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="285px" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Width="393px">
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
            <td style = " vertical-align:middle" colspan="2">Academic Year:</td>
            <td style = " vertical-align:middle" colspan="2">
                <asp:DropDownList ID="regyrs_ddl" runat="server" Height="30px" Width="180px">
                </asp:DropDownList>
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = " vertical-align:middle" colspan="2">Semseter:</td>
            <td style = " vertical-align:middle" colspan="2">
                <asp:DropDownList ID="regsms_ddl" runat="server" Height="30px" Width="180px">
                    <asp:ListItem>Fall</asp:ListItem>
                    <asp:ListItem>Spring</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%;  vertical-align:middle">
                <asp:Button ID="addReg_btn" runat="server" Text="Add" Height="30px" OnClick="addReg_btn_Click" Width="100px" />
            </td>
            <td style = "width:10%;  vertical-align:middle">
                &nbsp;</td>
            <td style = "width:10%; vertical-align:middle">
                <asp:Button ID="removeReg_btn" runat="server" Text="Remove" Height="30px" OnClick="removeReg_btn_Click" Width="100px" />
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "text-align:center; vertical-align:middle" colspan="3">
                <asp:Label ID="reg_err" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">
                <asp:Label ID="reg_conf" runat="server" ForeColor="#009900" Visible="False"></asp:Label>
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = " vertical-align:middle" colspan="4" rowspan="8">
                <asp:GridView ID="courseRegGrid" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="133px" Width="378px" OnSelectedIndexChanged="courseRegGrid_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                    </Columns>
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
