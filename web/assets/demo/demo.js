// -------------------------------
// Demos
// -------------------------------

$(document).ready(
	function() {

    //Create an expression that excludes execution if parent matches certain class
    jQuery.expr[':'].noparents = function(a,i,m){
    	return jQuery(a).parents(m[3]).length < 1;
    };

    //Exclude tab-right and tab-left from having tabdrop option,
    //But include in all others.
   $('.nav-tabs').filter(':noparents(.tab-right, .tab-left)').tabdrop();

	prettyPrint(); //Apply Code Prettifier

	$('.popovers').popover({container: 'body', trigger: 'hover', placement: 'top'}); //bootstrap's popover
	$('.tooltips').tooltip(); //bootstrap's tooltip
	$(".bootstrap-switch").bootstrapSwitch();

	// Custom Checkboxes
	$('.icheck input').iCheck({
		checkboxClass: 'icheckbox_minimal-blue',
		radioClass: 'iradio_minimal-blue'
	});


    //Demo JSTree

    $('#jstree-demo').jstree({
        "types" : {
            "default" : {
                "icon" : "fa fa-folder icon-state-warning icon-lg"
            },
            "file" : {
                "icon" : "fa fa-file icon-state-warning icon-lg"
            }
        },
        "plugins": ["types"]
    });

	$('#jstree-demo').jstree();

	  //Project Switcher Demo
	  $('.project-switcher-dropdown>li>a').click(function() {
	  	$('.project-switcher>a.btn>span').text($(this).text());
	  });

	  //Sparklines

	  $("#currentbalance").sparkline([12700,8573,10145,21077,15380,14399,19158,17002,19201,10042], {
	  	type: 'bar',
	  	barColor: Utility.getBrandColor('inverse'),
	  	barSpacing: 2,
	  	height: '20',
	  	barWidth: 3
	  });

	  $("#salesvolume").sparkline([162700,82573,120145,91077,215380,204399,119158,140121,111312,121310], {
	  	type: 'bar',
	  	barColor: Utility.getBrandColor('inverse'),
      barSpacing: 2,
      height: '20',
      barWidth: 3
	  });

    $("#infobar-revenuestats").sparkline([15700,4573,12145,11077,25380,24399,29158,17002,11201,13042], {
      type: 'bar',
      barColor: Utility.getBrandColor('inverse'),
      barSpacing: 2,
      height: '20',
      barWidth: 3
    });

    $("#infobar-unitssold").sparkline([1532,3573,2141,6077,4280,5399,6158,3002,2201,1151], {
      type: 'bar',
      barColor: Utility.getBrandColor('inverse'),
      barSpacing: 2,
      height: '20',
      barWidth: 3
    });

    $("#infobar-orders").sparkline([704,579,144,442,383,399,555,805,401,943], {
      type: 'bar',
      barColor: Utility.getBrandColor('inverse'),
      barSpacing: 2,
      height: '20',
      barWidth: 3
    });

	//Demo Background Pattern

	$(".demo-blocks").click(function(){
		$('.layout-boxed').css('background',$(this).css('background'));
		return false;
	});

});

