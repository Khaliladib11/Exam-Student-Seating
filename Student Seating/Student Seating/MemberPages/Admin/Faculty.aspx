<%@ Page Title="" Language="C#" MasterPageFile="~/MemberPages/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Faculty.aspx.cs" Inherits="Student_Seating.MemberPages.Admin.Faculty" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <style type="text/css">
      
        .auto-style1 {
            width: 100%;
        }
      
        .auto-style2 {
            height: 22px;
        }
        .auto-style5 {
            height: 20px;
        }
        .auto-style6 {
            height: 23px;
            width: 10%;
        }
        .auto-style7 {
            height: 23px;
        }
        .auto-style8 {
            width: 10%;
        }
        .auto-style9 {
            height: 20px;
            width: 10%;
        }
        .auto-style10 {
            width: 10%;
            height: 27px;
        }
        .auto-style11 {
            height: 27px;
        }
        .faculty{
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
            <td style = "text-align:center; vertical-align:middle" class="auto-style8">&nbsp;</td>
        </tr>
        <tr>
            <td style = "text-align:center; vertical-align:middle" class="auto-style9"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style9"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style5" colspan="2">Faculty ID:*</td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style5" colspan="2">Faculty Name:*</td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style5" colspan="2">Instractor Name:*</td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style9"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style9"></td>
        </tr>
        <tr>
            <td style = "text-align:center; vertical-align:middle" class="auto-style10"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style11"></td>
            <td style = "text-align:center; vertical-align:middle" colspan="2" class="auto-style11">
                <asp:TextBox ID="fctid_txt" runat="server" Height="20px" Width="180px"></asp:TextBox>
            </td>
            <td style = "text-align:center; vertical-align:middle" colspan="2" class="auto-style11">
                <asp:TextBox ID="fctname_txt" runat="server" Height="20px" Width="180px"></asp:TextBox>
            </td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style11" colspan="2">
                <asp:DropDownList ID="InstName_drl" runat="server" Height="20px" Width="180px">
                </asp:DropDownList>
            </td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style10">
                </td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style10"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6" style = "text-align:center; vertical-align:middle"></td>
            <td class="auto-style6" style = "text-align:center; vertical-align:middle">
                &nbsp;</td>
            <td class="auto-style6" style = "text-align:center; vertical-align:middle">
                <asp:Button ID="Add_btn" runat="server" Height="30px" OnClick="Add_btn_Click1" Text="Add" Width="100px" />
            </td>
            <td class="auto-style6" style = "text-align:center; vertical-align:middle">
                <asp:Button ID="Remove_btn" runat="server" Height="30px" Text="Remove" Width="100px" OnClick="Remove_btn_Click" />
            </td>
            <td class="auto-style6" style = "text-align:center; vertical-align:middle">
                <asp:Button ID="Modify_btn" runat="server" Height="30px" Text="Modify" Width="100px" OnClick="Modify_btn_Click" />
            </td>
            <td class="auto-style7" style = "text-align:center; vertical-align:middle">
                <asp:Button ID="Display_btn" runat="server" Height="30px" Text="Display" Width="100px" OnClick="Display_btn_Click1" />
            </td>
            <td class="auto-style7" style = "text-align:center; vertical-align:middle" colspan="2">
                <asp:Label ID="errorMsg_lbl" runat="server" ForeColor="#CC0000" Text="Label" Visible="False"></asp:Label>
            </td>
            <td class="auto-style6" style = "text-align:center; vertical-align:middle"></td>
            <td class="auto-style6" style = "text-align:center; vertical-align:middle"></td>
        </tr>
        <tr>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
            <td class="auto-style9"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="8" rowspan="4"  class="auto-style2" style = "width:10%; text-align:center; vertical-align:middle">
                <asp:GridView ID="gvfaculties" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1064px" OnSelectedIndexChanged="gvfaculties_SelectedIndexChanged">
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
            <td class="auto-style8">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
    </table>
  
   
  
</asp:Content>
