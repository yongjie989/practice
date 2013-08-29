    $("#update_button").button().css({"font-size":"12px"});
    $("#update_button").click(function(){
                var member_json = {};
                member_json.real_name = $.trim($("#user_register_form").find("input[name=real_name]").val());
                member_json.user_name = $.trim($("#user_register_form").find("input[name=temp_user_name]").val());
                member_json.password = $.trim($("#user_register_form").find("input[name=password]").val());
                member_json.gender = $.trim($("#user_register_form").find("select[name=gender]").val());
                member_json.birthday_year = $.trim($("#user_register_form").find("select[name=birthday_year]").val());
                member_json.birthday_month = $.trim($("#user_register_form").find("select[name=birthday_month]").val());
                member_json.birthday_day = $.trim($("#user_register_form").find("select[name=birthday_day]").val());
                member_json.telephone = $.trim($("#user_register_form").find("input[name=telephone]").val());
                member_json.mobile = $.trim($("#user_register_form").find("input[name=mobile]").val());
                member_json.email = $.trim($("#user_register_form").find("input[name=email]").val());
                member_json.zipcode = $.trim($("#user_register_form").find("input[name=zipcode]").val());
                member_json.city = $.trim($("#user_register_form").find("select[name=city]").val());
                member_json.locality = $.trim($("#user_register_form").find("select[name=locality]").val());
                member_json.address = $.trim($("#user_register_form").find("input[name=address]").val());
                member_json.discount = $.trim($("#user_register_form").find("input[name=discount]").val());
                
                var member_json = jQuery.parseJSON(JSON.stringify(member_json));
                console.log(member_json);
                
                $.ajax({
                    dataType: "json",
                    url: 'HandlerMemberAdm.ashx?action=member_update',
                    data: member_json,
                    success: function(data){
                        console.log(data);
                        if(data.id=='000'){
                            alert(data.message);
                            location.reload();
                            //$('#dg').datagrid('reload');
                            getData();
                            return false;
                        };
                        if(data.id != '000'){
                            $("#system_message").slideDown().html(data.message);
                        };
                    }
                });        
    });
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
        
        function getData(){
            //alert('loading.');
            
            var rows = [];
            $.each( data["Table"], function(k,v){
                //console.log(v.user_name);
                rows.push({
                    real_name : v.real_name,
                    user_name : v.user_name,
                    password : v.password,
                    gender : v.gender,
                    birthday : v.birthday_year+'/'+v.birthday_month+'/'+v.birthday_day,
                    mobile : v.mobile,
                    telephone : v.telephone,
                    email : v.email,
                    city : v.zipcode+' '+v.city,
                    address : v.address,
                    active: (v.active=='Y') ? '<img src="Scripts/themes/icons/safe.png"> 啟用' : '<img src="Scripts/themes/icons/process-stop.png">  關閉',
                    temp_birthday_year: v.birthday_year,
                    temp_birthday_month: v.birthday_month,
                    temp_birthday_day: v.birthday_day,
                    temp_zipcode : v.zipcode,
                    temp_city : v.city,
                    temp_locality : v.locality,
                    discount : v.discount
                });
            });
            
            return rows;
        }
        
        function pagerFilter(data){
            if (typeof data.length == 'number' && typeof data.splice == 'function'){    // is array
                data = {
                    total: data.length,
                    rows: data
                }
            }
            var dg = $(this);
            var opts = dg.datagrid('options');
            var pager = dg.datagrid('getPager');
            pager.pagination({
                onSelectPage:function(pageNum, pageSize){
                    opts.pageNumber = pageNum;
                    opts.pageSize = pageSize;
                    pager.pagination('refresh',{
                        pageNumber:pageNum,
                        pageSize:pageSize
                    });
                    dg.datagrid('loadData',data);
                }
            });
            if (!data.originalRows){
                data.originalRows = (data.rows);
            }
            var start = (opts.pageNumber-1)*parseInt(opts.pageSize);
            var end = start + parseInt(opts.pageSize);
            data.rows = (data.originalRows.slice(start, end));
            return data;
        }
        
        function MemberEdit(){
        var data = $('#dg').datagrid('getSelected');
            if (data){
                init_address();
                console.log(data);
                $("#user_register_form")
                $("#user_register_form").slideDown();
                
                $("#user_register_form").find("input[name=real_name]").val(data.real_name);
                $("#user_register_form").find("input[name=temp_user_name]").val(data.user_name);
                $("#user_name").html(data.user_name);
                $("#user_register_form").find("input[name=password]").val(data.password);
                $("#user_register_form").find("input[name=confirm_password]").val(data.password);
                $("#user_register_form").find("select[name=gender]").val(data.gender);
                $("#user_register_form").find("select[name=birthday_year]").val(data.temp_birthday_year);
                $("#user_register_form").find("select[name=birthday_month]").val(data.temp_birthday_month);
                $("#user_register_form").find("select[name=birthday_day]").val(data.temp_birthday_day);
                $("#user_register_form").find("input[name=telephone]").val(data.telephone);
                $("#user_register_form").find("input[name=mobile]").val(data.mobile);
                $("#user_register_form").find("input[name=email]").val(data.email);
                $("#user_register_form").find("input[name=zipcode]").val(data.temp_zipcode);
                $("#user_register_form").find("select[name=city]").val(data.temp_city);
                $("#user_register_form").find("select[name=city]").trigger("change");
                $("#user_register_form").find("select[name=locality]").val(data.temp_locality);
                $("#user_register_form").find("input[name=address]").val(data.address);
                $("#user_register_form").find("select[name=locality]").trigger("change");
                $("#user_register_form").find("input[name=discount]").val(data.discount);
            }
        }
        
        function MemberOpen(){
        var data = $('#dg').datagrid('getSelected');
            if (data){
                var member_json = {};
                member_json.user_name = data.user_name;
                var member_json = jQuery.parseJSON(JSON.stringify(member_json));
                console.log(member_json);
                
                $.ajax({
                    dataType: "json",
                    url: 'HandlerMemberAdm.ashx?action=member_open',
                    data: member_json,
                    success: function(data){
                            console.log(data);
                            $("#system_message").slideDown().html(data.message);
                            location.reload();
                            return false;
                        }
                });
            }
        };

        function MemberClose(){
        var data = $('#dg').datagrid('getSelected');
            if (data){
                var member_json = {};
                member_json.user_name = data.user_name;
                var member_json = jQuery.parseJSON(JSON.stringify(member_json));
                console.log(member_json);
                
                $.ajax({
                    dataType: "json",
                    url: 'HandlerMemberAdm.ashx?action=member_close',
                    data: member_json,
                    success: function(data){
                            console.log(data);
                            $("#system_message").slideDown().html(data.message);
                            location.reload();
                            return false;
                        }
                });
                
            }
        };

        function MemberDelete(){
        var data = $('#dg').datagrid('getSelected');
            if (data){
                var member_json = {};
                member_json.user_name = data.user_name;
                var member_json = jQuery.parseJSON(JSON.stringify(member_json));
                console.log(member_json);
                
                $.ajax({
                    dataType: "json",
                    url: 'HandlerMemberAdm.ashx?action=member_delete',
                    data: member_json,
                    success: function(data){
                            console.log(data);
                            $("#system_message").slideDown().html(data.message);
                            location.reload();
                            return false;
                        }
                });
                
            }
        };
        
        $(function(){
            $('#dg').datagrid({loadFilter:pagerFilter}).datagrid('loadData', getData());
        });