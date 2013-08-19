<%@ Page Title="" Language="C#" MasterPageFile="~/DiwMaster.master" AutoEventWireup="true" CodeFile="ADAdmin.aspx.cs" Inherits="ADAdmin" EnableSessionState="True" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<script type="text/javascript" src="Scripts/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="./Styles/redmond/jquery-ui-1.10.3.custom.css" />
<script type="text/javascript" src="./Scripts/jquery-ui-1.10.3.custom.js"></script>
<link rel="stylesheet" type="text/css" href="./Styles/doitwell.css" />
<link rel="stylesheet" type="text/css" href="./Styles/member.css" />
<script type="text/javascript" src="Scripts/aj-address.js"></script>

<link rel="stylesheet" type="text/css" href="./Scripts/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="./Scripts/themes/icon.css">
<script type="text/javascript" src="./Scripts/jquery.easyui.min.js"></script>
<script type="text/javascript" src="./Scripts/url.js"></script>




<style>
#user_register_form {
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	margin-right: 3px;
    border:1px solid #cccccc;
    width:600px;
    margin-bottom:20px;
    padding:5px;
}

</style>
<body>
<div >
	<div id="system_message" class="ui-state-error ui-corner-all" style="width:500px;margin-left:20px;margin-bottom:10px;padding:5px;display:none;">系統訊息: </div>
    
    <div style="padding-left:20px">
        
        <div id="public_edit">
        
        </div>
        

        <div id="slider_list">
            slider_list
        </div>
        <div id="recommend_list">
            recommend_list
        </div>
        <div id="product_list">
            product_list
        </div>
        
        
        <table id="dg" title="" style="width:1200px;height:500px;" data-options="
        toolbar:toolbar,
        singleSelect:true,
        url:'datagrid_data1.txt',
        method:'get'
        " >
            <thead>
                <tr>
                <th data-options="field:'ads_id',width:80">編號</th>
                <th data-options="field:'kind',width:100">類別</th>
                <th data-options="field:'content',width:80,align:'right'">內容</th>
                <th data-options="field:'image_url',width:80,align:'right'">網址</th>
                <th data-options="field:'status',width:240">狀態</th>
                </tr>
            </thead>
        </table>
    
    </div>
    
<script type="text/javascript">
    
    var global_data;
    
    var toolbar = [{
        text:'啟用帳號',
        iconCls:'icon-pass',
        handler:function(){MemberOpen()}
    },{
        text:'關閉帳號',
        iconCls:'icon-deny',
        handler:function(){MemberClose()}
    },{
        text:'修改帳號',
        iconCls:'icon-edit',
        handler:function(){MemberEdit()}
    }
    ,'-',{
        text:'刪除帳號',
        iconCls:'icon-cancel',
        handler:function(){if(confirm("確定要永久刪除此帳號嗎?")){MemberDelete()}}
    }];
    
    /*
        
    function get_list(k){
        //test
        //var data = jQuery.parseJSON('{"ads_id": 1, "kind": "silder", "content": "xxx", "image_url": "../images", "status": "Y"}');
        
        
        //global_data = data;
        //getData(global_data)
        
        var json = {};
        json.kind = k;
        var json = jQuery.parseJSON(JSON.stringify(json));
        console.log(json);               
        $.ajax({
            dataType: "json",
            url: 'HandlerAdsAdm.ashx?action=get_ads',
            data: json,
            success: function(data){
                //global_data = data;
                //getData(global_data)
            }
        });
    };
    
    function show_block(b){
        $("#slider_list").hide();
        $("#recommend_list").hide();
        $("#product_list").hide();
        
        switch(b){
            case 'slider':
                $("#slider_list").show();
                get_list('slider');
                break;
            case 'recommend':
                $("#recommend_list").show();
                get_list('recommend');
                break;
            case 'product':
                $("#product_list").show();
                get_list('product');
                break;
        }
    };
    
    $(document).ready(function () {
       // $("#update_button").button().css({ "font-size": "12px" });
       
       var get_block = url.parse(location.search);
       show_block(get_block.get.block);
        
    });  
    
    */
    $(function(){
           var pager = $('#dg').datagrid().datagrid('getPager');  
            
        })
        
</script>    
</div>    
</body>
</asp:Content>

