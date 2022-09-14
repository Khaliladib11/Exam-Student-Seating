<%@ Page Title="" Language="C#" MasterPageFile="~/MemberPages/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Departement.aspx.cs" Inherits="Student_Seating.MemberPages.Admin.Departement" %>
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
            width: 9%;
        }
        .auto-style5 {
            width: 9%;
            height: 20px;
        }
        .auto-style6 {
            width: 10%;
            height: 28px;
        }
        .auto-style7 {
            width: 9%;
            height: 28px;
        }
        .auto-style8 {
            height: 28px;
        }
        .auto-style9 {
            width: 10%;
            height: 32px;
        }
        .auto-style10 {
            width: 9%;
            height: 32px;
        }
        .auto-style11 {
            height: 32px;
        }
        .Departement{
           color: #4991DC;
           background-color: #ffffff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style4">&nbsp;</td>
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
            <td style = "text-align:center; vertical-align:middle" class="auto-style5"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style3" colspan="2">Faculty ID:*<br />
            </td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style3" colspan="2">Departement ID:*<br />
            </td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style3" colspan="2">Departement Name:*</td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
        </tr>
        <tr>
            <td style = "text-align:center; vertical-align:middle" class="auto-style6"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style7"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style8" colspan="2">
                <asp:DropDownList ID="dctid_ddl" runat="server" Height="20px" Width="180px" AutoPostback="true"  OnSelectedIndexChanged="foo_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style8" colspan="2">
                <asp:TextBox ID="dptid_txt" runat="server" Height="20px" Width="180px"></asp:TextBox>
            </td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style8" colspan="2">
                <asp:TextBox ID="dptname_txt" runat="server" Height="20px" Width="180px"></asp:TextBox>
            </td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style6"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style6"></td>
        </tr>
        <tr>
            <td style = "text-align:center; vertical-align:middle" class="auto-style9"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style10"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style9">&nbsp;</td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style9">&nbsp;</td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style9">&nbsp;</td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style9">&nbsp;</td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style11">&nbsp;</td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style11">&nbsp;</td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style9"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style9"></td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style4">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">
                <asp:Button ID="addDpt_btn" runat="server" Height="30px" Text="Add" Width="100px" OnClick="addDpt_btn_Click" />
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">
                <asp:Button ID="removeDpt_btn" runat="server" Height="30px" Text="Remove" Width="100px" OnClick="removeDpt_btn_Click" />
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">
                <asp:Button ID="modifydpt_btn" runat="server" Height="30px" Text="Modify" Width="100px" OnClick="modifydpt_btn_Click" />
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">
                <asp:Button ID="displayDpt_btn" runat="server" Height="30px" OnClick="displayDpt_btn_Click" Text="Display" Width="100px" />
            </td>
            <td style = "text-align:center; vertical-align:middle" colspan="2">
                <asp:Label ID="errorMsgDpt_txt" runat="server" ForeColor="#CC0000" Text="Label" Visible="False"></asp:Label>
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "text-align:center; vertical-align:middle" colspan="9" rowspan="5">
                <asp:GridView ID="depGrid" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="923px">
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
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
