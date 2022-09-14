<%@ Page Title="" Language="C#" MasterPageFile="~/MemberPages/Instructor/Instructor.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="Student_Seating.MemberPages.Instructor.Student" %>
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
            margin-bottom: 15;
        }
        .auto-style5 {
            margin-bottom: 17;
        }
        .Student{
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
            <td style = " vertical-align:middle" class="auto-style3" colspan="2">ID:</td>
            <td style = " vertical-align:middle" class="auto-style3" colspan="2">
                <asp:TextBox ID="stdID_txt" runat="server" Height="20px" Width="180px"></asp:TextBox>
            </td>
            <td style = " vertical-align:middle" class="auto-style2">
                <asp:Button ID="displayStd_btn" runat="server" Height="30px" Text="Display" Width="100px" OnClick="displayStd_btn_Click"  />
            </td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
            <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = " vertical-align:middle" colspan="2">Fisrt Name:*</td>
            <td style = " vertical-align:middle" colspan="2">
                <asp:TextBox ID="stdFname_txt" runat="server" Height="20px" Width="180px"></asp:TextBox>
            </td>
            <td style = "text-align:center; vertical-align:middle" colspan="5" rowspan="11">
                <asp:GridView ID="stdGrid" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="192px" Width="401px">
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
            <td style = " vertical-align:middle" colspan="2">Last Name:*</td>
            <td style = " vertical-align:middle" colspan="2">
                <asp:TextBox ID="stdLname_txt" runat="server" Height="20px" Width="180px" CssClass="auto-style5"></asp:TextBox>
            </td>
        </tr>
        <tr>
           <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = " vertical-align:middle" colspan="2">Email:</td>
            <td style = " vertical-align:middle" colspan="2">
                <asp:TextBox ID="stdEmail_txt" runat="server" Height="20px" Width="180px" CssClass="auto-style4"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = " vertical-align:middle" colspan="2">Mobile:</td>
            <td style = " vertical-align:middle" colspan="2">
                <asp:TextBox ID="stdMobile_txt" runat="server" Height="20px" Width="180px"></asp:TextBox>
            </td>
        </tr>
        <tr>
           <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "vertical-align:middle" colspan="2">Departement:*</td>
            <td style =  vertical-align:middle" colspan="2">
                <asp:DropDownList ID="deprtStd_ddl" runat="server" Height="20px" Width="180px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%;  vertical-align:middle">
                <asp:Button ID="addstd_txt" runat="server" Text="Add" Height="30px" Width="100px" OnClick="addstd_txt_Click"  />
            </td>
            <td style = "width:10%;  vertical-align:middle">
                <asp:Button ID="removeStd_txt" runat="server" Height="30px" Text="Remove" Width="100px" OnClick="removeStd_txt_Click"  />
            </td>
            <td style = "width:10%;  vertical-align:middle">
                <asp:Button ID="ModifyStd_txt" runat="server" Text="Modify" Height="30px" Width="100px" OnClick="ModifyStd_txt_Click"  />
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">
                <asp:Button ID="clear_btn" runat="server" Height="30px" OnClick="clear_btn_Click" Text="Clear" Width="100px" />
            </td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "text-align:center; vertical-align:middle" colspan="3">
                <asp:Label ID="stdAdd_err" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
            <td style = "text-align:center; vertical-align:middle" colspan="3">
                <asp:Label ID="stdSucc" runat="server" ForeColor="#009900" Visible="False"></asp:Label>
            </td>
            <td style = "width:10%; text-align:center; vertical-align:middle">&nbsp;</td>
        </tr>
        <tr>
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
