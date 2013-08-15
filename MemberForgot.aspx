<%@ Page Title="" Language="C#" MasterPageFile="~/DoMaster.master" AutoEventWireup="true" CodeFile="MemberForgot.aspx.cs" Inherits="MemberForgot" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<script type="text/javascript" src="Scripts/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="Styles/ui-lightness/jquery-ui-1.10.3.custom.css" />
<script type="text/javascript" src="Scripts/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" src="Scripts/aj-address.js"></script>
    <script type="text/javascript" src="Scripts/Member.js"></script>
<link rel="stylesheet" type="text/css" href="Styles/doitwell.css" />
<link rel="stylesheet" type="text/css" href="Styles/member.css" />
<script type="text/javascript">
    $(document).ready(function(){
        $("#submit_button").button().css({"font-size":"12px"});
    });
</script>

<div id="user_forgot_form" style="padding-left:250px;padding-top:80px;">
	<div id="system_message" class="ui-state-error ui-corner-all"></div>
	<div style="border: 1px solid #cccccc;width:100px;padding:5px;" align="center">
	<span style="color: #1c94c4;">忘記密碼</span>
	</div>
	<div style="border: 2px dotted #cccccc;width:300px;padding:20px;">
	<form id="front_user_forgot_form">
	<span style="color:#666666;font-size:10px;">請輸入當時註冊的Email, 我們會將密碼寄到您的信箱</span>
    <table summary="user login" >
        <tr>
            <td align="right" valign="bottom"><label>Email</label></td>
            <td>
                <table>
                    <tr>
                        <td><input type="text" name="email" size="30" /></td>
                    </tr>
                </table>                

            </td>            
        </tr>
        <tr>
            <td align="right" valign="bottom"></td>
            <td>
            	<input type="button" id="send_forgot_button" name="send_forgot_button" value="送出" />
            </td>
        </tr>
    </table>
    </form>
    </div>
</div>
<div style="padding-bottom:100px;"></div>

</asp:Content>

