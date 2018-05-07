// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .

//カテゴリー
var noValue = $('#child').html(); //最初の状態を保存

$(document).ready(function(){//後で読み込ませたいときは絶対に必要！！！
	$('#parent').on('change', function(){

		var categories = {};
			//optionのvalue:#childに行く配列のリスト
			categories['金融'] = gon.categories1;
			categories['建設・不動産'] = gon.categories2;
			categories['物流・運送'] = gon.categories3;
			categories['IT・メディア'] = gon.categories4;
			categories['エネルギー・資源'] = gon.categories5;
			categories['自動車・機械'] = gon.categories6;
			categories['電機・精密'] = gon.categories7;
			categories['食品'] = gon.categories8;
			categories['小売・卸'] = gon.categories9;
			categories['生活関連'] = gon.categories10;
			categories['衣料・装飾'] = gon.categories11;
			categories['サービス'] = gon.categories12;
			categories['飲食'] = gon.categories13;
			categories['娯楽・レジャー'] = gon.categories14;

var noValue = $('#child').html(); //最初の状態を保存
		var cat = $(this).val();//選択されたvalueを取得
		if(cat){
			var item = categories[`${cat}`];//リストから配列を取得

			$('#child').html('');//childを空にする
				var option;
				for(var i = 0; i < item.length; i++){
					option = `<option value="${ item[i] }">${ item[i] }</option>`;
					$('#child').append(option);
				}
		}else{ //catが空の時
			$('#child').html('<option value="">----------</option>');
		}
	});
});
