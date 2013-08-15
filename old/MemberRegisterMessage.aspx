<%@ Page Title="" Language="C#" MasterPageFile="~/DoMaster.master" AutoEventWireup="true" CodeFile="MemberRegisterMessage.aspx.cs" Inherits="MemberRegisterMessage" %>
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
    
<div id="user_forgot_form">
	<div id="system_message" class="ui-state-error ui-corner-all"></div>
	<div style="border: 1px solid #cccccc;width:100px;padding:5px;" align="center">
	<span style="color: #1c94c4;">啟用信已送出</span>
	</div>
	<div style="border: 2px dotted #cccccc;width:300px;padding:20px;">

	<span style="color:#666666;font-size:10px;">會員帳號啟用信已送出, 請至您的Email收取。</span>
	<div style="font-size:12px;">請按這裡，<a href="/" >回首頁</a></div>

    </div>
</div>

<div style="padding-bottom:100px;"></div>
</asp:Content>
