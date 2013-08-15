<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>會員登入</title>
	<script type="text/javascript" src="Scripts/jquery-1.10.2.min.js"></script>
	<link rel="stylesheet" type="text/css" href="Styles/ui-lightness/jquery-ui-1.10.3.custom.css" />
    <script type="text/javascript" src="Scripts/jquery-ui-1.10.3.custom.js"></script>
    <script type="text/javascript" src="Scripts/Member.js"></script>
	<link rel="stylesheet" type="text/css" href="Styles/doitwell.css" />
	<link rel="stylesheet" type="text/css" href="Styles/member.css" />
	<script type="text/javascript">
	    $(document).ready(function () {
	        $("#submit_button").button().css({ "font-size": "12px" });
	    });
    </script>

</head>
<body>

<div id="user_login_form">
	<div id="system_message" class="ui-state-error ui-corner-all"></div>
	<div style="border: 1px solid #cccccc;width:100px;padding:5px;" align="center">
	<span style="color: #1c94c4;">會員登入</span>
	</div>
	<div style="border: 2px dotted #cccccc;width:300px;padding:20px;">
	<form id="front_user_login_form">
    <table summary="user login" >
        <tr>
            <td align="right" valign="bottom"><label>帳號</label></td>
            <td>
                <table>
                    <tr>
                        <td><input type="text" name="user_name" size="20" /></td>
                    </tr>
                </table>                

            </td>            
        </tr>
        <tr>
            <td align="right" valign="bottom"><label>密碼</label></td>
            <td>
                <input type="password" name="password" size="20" />
            </td>
        </tr>
        <tr>
            <td align="right" valign="bottom"></td>
            <td>
            	<input type="button" id="login_button" name="login_button" value="送出" />
            </td>
        </tr>
    </table>
    </form>
    </div>
</div>

</body>
</html>