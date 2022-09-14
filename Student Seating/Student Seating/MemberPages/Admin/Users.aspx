<%@ Page Title="" Language="C#" MasterPageFile="~/MemberPages/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Student_Seating.MemberPages.Admin.Users" %>
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
        .Users{
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
            <td style = "text-align:center; vertical-align:middle">
                <asp:Button ID="display_users_btn" runat="server" Height="30px" Text="Display all users" Width="120px" />
            </td>
            <td style = "text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
           <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
            <td style = "text-align:center; vertical-align:middle" colspan="4" rowspan="12">
                <asp:GridView ID="usersGrid" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="202px" Width="374px" OnSelectedIndexChanged="usersGrid_SelectedIndexChanged">
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
            <td style = "text-align:center; vertical-align:middle" class="auto-style3" colspan="2">Username:</td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style3" colspan="2">
                <asp:TextBox ID="usernames_txt" runat="server" Height="25px" Width="180px"></asp:TextBox>
            </td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
        </tr>
        <tr>
           <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "text-align:center; vertical-align:middle" colspan="2">
                <asp:Button ID="makeInst_btn" runat="server" Height="30px" Text="Make Instructor" Width="120px" OnClick="makeInst_btn_Click1" />
            </td>
            <td style = "text-align:center; vertical-align:middle" colspan="2">
                <asp:Button ID="rmvInst_btn" runat="server" Height="30px" Text="Remove Instractor" Width="120px" OnClick="rmvInst_btn_Click1" />
            </td>
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
            <td style = "text-align:center; vertical-align:middle" colspan="2">
                <asp:Button ID="dltUser_btn" runat="server" Height="30px" Text="Delete User" Width="120px" OnClick="dltUser_btn_Click1" />
            </td>
            <td style = "text-align:center; vertical-align:middle" colspan="2">
                <asp:Label ID="inst_err" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>
            </td>
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
           <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
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
