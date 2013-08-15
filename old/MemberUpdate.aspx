<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>會員註冊</title>
	<script type="text/javascript" src="Scripts/jquery-1.10.2.min.js"></script>
	<link rel="stylesheet" type="text/css" href="Styles/ui-lightness/jquery-ui-1.10.3.custom.css" />
    <script type="text/javascript" src="Scripts/jquery-ui-1.10.3.custom.js"></script>
	<script type="text/javascript" src="Scripts/aj-address.js"></script>
    	<script type="text/javascript" src="Scripts/Member.js"></script>
	<link rel="stylesheet" type="text/css" href="Styles/doitwell.css" />
	<link rel="stylesheet" type="text/css" href="Styles/member.css" />
	<script type="text/javascript">
	    $(document).ready(function () {
	        $("#submit_button").button().css({ "font-size": "12px" });
	    });
    </script>

</head>
<body onload="init_address();">

<div id="user_register_form">
	<div id="system_message" class="ui-state-error ui-corner-all"></div>
	<form id="front_user_register_form">
    <table summary="user register" >
    	<tr>
    		<td></td>
    		<td>
    		<div>
    		<h3>會員註冊</h3>
    		</div>
    		<span class="form_notice_text">(*)星號為必填欄位。</a>
    		</td>    		
    	</tr>
        <tr>
            <td align="right" valign="bottom"><label>*姓名</label></td>
            <td>
                <table>
                    <tr>
                        <td><input type="text" name="real_name" size="20" /></td>
                    </tr>
                </table>                

            </td>            
        </tr>
        <tr>
            <td align="right" valign="bottom"><label>*帳號</label></td>
            <td>
                <input type="text" name="user_name" size="20" />
            </td>
        </tr>
        <tr>
            <td align="right" valign="bottom"><label>*密碼</label></td>
            <td>
                <input type="password" name="password" size="12" />
                <label>*確認密碼</label>
                <input type="password" name="confirm_password" size="12" />
            </td>
        </tr>
        
        <tr>
            <td align="right" valign="bottom"><label>*性別</label></td>
            <td>
                <select name="gender" size="0">
                <option value="" selected="selected"></option>
                <option value="男">男</option>
                <option value="女">女</option>
                </select>
            </td>
        </tr>
        <tr>
            <td align="right" valign="bottom"><label>*生日</label></td>
            <td>
                <table>
                    <tr>
                        <td><label>年</label></td>
                        <td><label>月</label></td>
                        <td><label>日</label></td>
                    </tr>
                    <tr>
                        <td>
                            <select name="birthday_year" size="0">
                                <option selected="selected"></option>
                                <option value="1995">1995</option>
                                <option value="1994">1994</option>
                                <option value="1993">1993</option>
                                <option value="1992">1992</option>
                                <option value="1991">1991</option>
                                <option value="1990">1990</option>
                                <option value="1989">1989</option>
                                <option value="1988">1988</option>
                                <option value="1987">1987</option>
                                <option value="1986">1986</option>
                                <option value="1985">1985</option>
                                <option value="1984">1984</option>
                                <option value="1983">1983</option>
                                <option value="1982">1982</option>
                                <option value="1981">1981</option>
                                <option value="1980">1980</option>
                                <option value="1979">1979</option>
                                <option value="1978">1978</option>
                                <option value="1977">1977</option>
                                <option value="1976">1976</option>
                                <option value="1975">1975</option>
                                <option value="1974">1974</option>
                                <option value="1973">1973</option>
                                <option value="1972">1972</option>
                                <option value="1971">1971</option>
                                <option value="1970">1970</option>
                                <option value="1969">1969</option>
                                <option value="1968">1968</option>
                                <option value="1967">1967</option>
                                <option value="1966">1966</option>
                                <option value="1965">1965</option>
                                <option value="1964">1964</option>
                                <option value="1963">1963</option>
                                <option value="1962">1962</option>
                                <option value="1961">1961</option>
                                <option value="1960">1960</option>
                                <option value="1959">1959</option>
                                <option value="1958">1958</option>
                                <option value="1957">1957</option>
                                <option value="1956">1956</option>
                                <option value="1955">1955</option>
                                <option value="1954">1954</option>
                                <option value="1953">1953</option>
                                <option value="1952">1952</option>
                                <option value="1951">1951</option>
                                <option value="1950">1950</option>
                                <option value="1949">1949</option>
                                <option value="1948">1948</option>
                                <option value="1947">1947</option>
                                <option value="1946">1946</option>
                                <option value="1945">1945</option>
                                <option value="1944">1944</option>
                                <option value="1943">1943</option>
                                <option value="1942">1942</option>
                                <option value="1941">1941</option>
                                <option value="1940">1940</option>
                                <option value="1939">1939</option>
                                <option value="1938">1938</option>
                                <option value="1937">1937</option>
                                <option value="1936">1936</option>
                                <option value="1935">1935</option>
                                <option value="1934">1934</option>
                                <option value="1933">1933</option>
                                <option value="1932">1932</option>
                                <option value="1931">1931</option>
                                <option value="1930">1930</option>
                                <option value="1929">1929</option>
                                <option value="1928">1928</option>
                                <option value="1927">1927</option>
                                <option value="1926">1926</option>
                                <option value="1925">1925</option>
                                <option value="1924">1924</option>
                                <option value="1923">1923</option>
                                <option value="1922">1922</option>
                                <option value="1921">1921</option>
                                <option value="1920">1920</option>
                                <option value="1919">1919</option>
                                <option value="1918">1918</option>
                                <option value="1917">1917</option>
                                <option value="1916">1916</option>
                                <option value="1915">1915</option>
                                <option value="1914">1914</option>
                                <option value="1913">1913</option>
                                <option value="1912">1912</option>
                                <option value="1911">1911</option>
                                <option value="1910">1910</option>
                            </select>
                        </td>
                        <td>
                        <select name="birthday_month" size="0">
                        	<option selected="selected"></option>
                        	<option value="1">1</option>
                        	<option value="2">2</option>
                        	<option value="3">3</option>
                        	<option value="4">4</option>
                        	<option value="5">5</option>
                        	<option value="6">6</option>
                        	<option value="7">7</option>
                        	<option value="8">8</option>
                        	<option value="9">9</option>
                        	<option value="10">10</option>
                        	<option value="11">11</option>
                        	<option value="12">12</option>
                        </select>
                        </td>
                        <td>
                        <select name="birthday_day" size="0">
                        	<option selected="selected"></option>
                        	<option value="1">1</option>
                        	<option value="2">2</option>
                        	<option value="3">3</option>
                        	<option value="4">4</option>
                        	<option value="5">5</option>
                        	<option value="6">6</option>
                        	<option value="7">7</option>
                        	<option value="8">8</option>
                        	<option value="9">9</option>
                        	<option value="10">10</option>
                        	<option value="11">11</option>
                        	<option value="12">12</option>
                        	<option value="13">13</option>
                        	<option value="14">14</option>
                        	<option value="15">15</option>
                        	<option value="16">16</option>
                        	<option value="17">17</option>
                        	<option value="18">18</option>
                        	<option value="19">19</option>
                        	<option value="20">20</option>
                        	<option value="21">21</option>
                        	<option value="22">22</option>
                        	<option value="23">23</option>
                        	<option value="24">24</option>
                        	<option value="25">25</option>
                        	<option value="26">26</option>
                        	<option value="27">27</option>
                        	<option value="28">28</option>
                        	<option value="29">29</option>
                        	<option value="30">30</option>
                        	<option value="31">31</option>
                        </select>
                        </td>         
                    </tr>
                </table>                

            </td>            
        </tr>
    	<tr>
            <td align="right" valign="bottom"><label>*電話</label></td>
            <td>
                <input type="text" name="telephone" size="12" />
            </td>
        </tr>
        <tr>
            <td align="right" valign="bottom"><label>手機</label></td>
            <td>
                <input type="text" name="mobile" size="12" />
            </td>
        </tr>
        <tr>
            <td align="right" valign="bottom"><label>*Email</label></td>
            <td>
                <input type="text" name="email" size="35" />
            </td>
        </tr>
        <tr>
            <td align="right" valign="bottom"><label>*收件地址</label></td>
            <td>
                <input id="zipcode" name="zipcode" type="text" style="width: 30px;" disabled="disabled" />
                <select id="city" name="city"></select>
                <select id="locality" name="locality"></select>
                <input type="text" name="address" size="60" />
            </td>
        </tr>
        <tr>
            <td align="right" valign="bottom"></td>
            <td>
            	<input type="button" id="submit_button" name="submit_button" value="送出" />
            </td>
        </tr>
    </table>
    </form>
</div>

</body>
</html>