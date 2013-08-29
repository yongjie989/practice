var active_object;
var newImage;
var active_font;

document.onselectstart = function() {return false;};

function disableF5(e){ 
    if ((e.which || e.keyCode) == 116) 
        e.preventDefault(); 
};
$(document).bind("keydown", disableF5);

function change_page(page){
    $("#photos_page").hide();
    $("#text_page").hide();
    $("#material_page").hide();
    $("#mask_page").hide();
    $("#background_page").hide();
    $(page).show();
    
    
};
$(document).ready(function() {
	var activate_detail;
	$("#NewPage").click(function(){
		activate_detail = $("#NewPage_Detail");
		activate_detail.show();
		$("#toolbar_setup_panel").slideDown();
		
	});
	$("#close_toolbar_setup_panel_btn").click(function(){
		activate_detail.hide();	
		$("#toolbar_setup_panel").slideUp();
	});
    
    
    
    $('#fontSelect').fontSelector({
        'hide_fallbacks' : true,
        'initial' : 'Courier New,Courier New,Courier,monospace',
        'selected' : function(style) { 
            active_font = style;
            console.log(style); 
            },
        'fonts' : [
			'王漢宗新潮體,王漢宗新潮體',
            '華康鋼筆體,華康鋼筆體W2',
            '華康細圓體,細圓體',
            '標楷體,標楷體',
            '新細明體,細明體',
            '微軟正黑體,微軟正黑體',
            'Arial,Arial,Helvetica,sans-serif',
            'Arial Black,Arial Black,Gadget,sans-serif',
            'Comic Sans MS,Comic Sans MS,cursive',
            'Courier New,Courier New,Courier,monospace',
            'Georgia,Georgia,serif',
            'Impact,Charcoal,sans-serif',
            'Lucida Console,Monaco,monospace',
            'Lucida Sans Unicode,Lucida Grande,sans-serif',
            'Palatino Linotype,Book Antiqua,Palatino,serif',
            'Tahoma,Geneva,sans-serif',
            'Times New Roman,Times,serif',
            'Trebuchet MS,Helvetica,sans-serif',
            'Verdana,Geneva,sans-serif',
            'Gill Sans,Geneva,sans-serif'
            ]
    });
});

function delete_object(){
    canvas.remove( canvas.getActiveObject() );
};

function add_text(){
    var mytext = $("#add_text").val();
    var new_text = new fabric.Text(mytext, {
        fontFamily: active_font,
        fontSize: 40,
        left: 100,
        top: 100
    });
    
    canvas.add(new_text);
};

function enlarge_object(){
    var o = canvas.getActiveObject();
    var new_width = o.getWidth() * 1.2;
    var new_height = o.getHeight() * 1.2;
    
    o.scaleX = 1.0;
    o.scaleY = 1.0;
    
    o.set({width:new_width, height: new_height});
    o.adjustPosition();
    canvas.renderAll();
};
function decrease_object(){
    var o = canvas.getActiveObject();
    console.log('width:'+ o.getWidth());
    var new_width = o.getWidth() * 0.8;
    var new_height = o.getHeight() * 0.8;
    console.log('width:'+ new_width);

    o.scaleX = 1.0;
    o.scaleY = 1.0;
    
    o.set({width:new_width, height: new_height});
    o.adjustPosition();
    canvas.renderAll();
};
/*
canvas.getObjects();
canvas.getObjects()[2];
canvas.getActiveObject();選取中的物件.

//取得圖片檔名
var ac = canvas.getActiveObject();
ac._originalImage.attributes.src.value;

//刪除選擇的物件
canvas.remove( canvas.getActiveObject() )

//移到最後層
canvas.sendToBack ( canvas.getActiveObject() )
//移到下一層
canvas.sendBackwards( canvas.getActiveObject() )
//移到上一層
canvas.bringToFront( canvas.getActiveObject() )
//移到最上層
canvas.bringForward( canvas.getActiveObject() )

//重新校正位置
//o.adjustPosition()

//取得圖片原本的大小
o.getOriginalSize().width
o.getOriginalSize().height
*/
var canvas = new fabric.Canvas('c');
var circle = new fabric.Circle({
    radius: 20, fill: 'green', left: 100, top: 100, angle: 45
});

var triangle = new fabric.Triangle({
  width: 20, height: 30, fill: 'blue', left: 50, top: 50
});

canvas.add(circle, triangle);


function handleDragStart(e) {
    [].forEach.call(images, function (img) {
        img.classList.remove('img_dragging');
    });
    this.classList.add('img_dragging');
}

function handleDragOver(e) {
    if (e.preventDefault) {
        e.preventDefault(); 
    }

    e.dataTransfer.dropEffect = 'copy';
    return false;
}

function handleDragEnter(e) {
    this.classList.add('over');
}

function handleDragLeave(e) {
    this.classList.remove('over');
}

function handleDrop(e) {
    if (e.stopPropagation) {
        e.stopPropagation();
    }

    var img = document.querySelector('#photos_page img.img_dragging');

    console.log('event: ', e);

    newImage = new fabric.Image(img, {
        width: img.width,
        height: img.height,
        left: e.layerX,
        top: e.layerY
    });
    canvas.add(newImage);

    return false;
}

function handleDragEnd(e) {
    [].forEach.call(images, function (img) {
        img.classList.remove('img_dragging');
    });
}

if (Modernizr.draganddrop) {
    var images = document.querySelectorAll('#photos_page img');
    [].forEach.call(images, function (img) {
        img.addEventListener('dragstart', handleDragStart, false);
        img.addEventListener('dragend', handleDragEnd, false);
    });
    var canvasContainer = document.getElementById('mycanvas_base');
    canvasContainer.addEventListener('dragenter', handleDragEnter, false);
    canvasContainer.addEventListener('dragover', handleDragOver, false);
    canvasContainer.addEventListener('dragleave', handleDragLeave, false);
    canvasContainer.addEventListener('drop', handleDrop, false);
} else {
    alert("This browser doesn't support the HTML5 Drag and Drop API.");
}
