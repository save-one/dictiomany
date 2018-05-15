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

//= require jquery
//= require bootstrap-sprockets
//= require_tree .

//カテゴリー
//var noValue = $('#child').html(); //最初の状態を保存

//dictionally
$(document).ready(function(){//後で読み込ませたいときは絶対に必要！！！
//$(window).load(function() {
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

//word
$(document).ready(function(){//後で読み込ませたいときは絶対に必要！！！
//$(window).load(function() {
	$('#parent_word').on('change', function(){

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

var noValue = $('#child_word').html(); //最初の状態を保存
		var cat = $(this).val();//選択されたvalueを取得
		if(cat){
			var item = categories[`${cat}`];//リストから配列を取得

			$('#child_word').html('');//childを空にする
				var option;
				for(var i = 0; i < item.length; i++){
					option = `<option value="${ item[i] }">${ item[i] }</option>`;
					$('#child_word').append(option);
				}
		}else{ //catが空の時
			$('#child_word').html('<option value="">----------</option>');
		}
	});
});

//public
$(document).ready(function(){//後で読み込ませたいときは絶対に必要！！！
//$(window).load(function() {
	$('#parent_public').on('change', function(){

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

var noValue = $('#child_public').html(); //最初の状態を保存
		var cat = $(this).val();//選択されたvalueを取得
		if(cat){
			var item = categories[`${cat}`];//リストから配列を取得

			$('#child_public').html('');//childを空にする
				var option;
				for(var i = 0; i < item.length; i++){
					option = `<option value="${ item[i] }">${ item[i] }</option>`;
					$('#child_public').append(option);
				}
		}else{ //catが空の時
			$('#child_public').html('<option value="">----------</option>');
		}
	});
});

//public-showアクション 追加形式
$(document).ready(function(){//後で読み込ませたいときは絶対に必要！！！
//$(window).load(function() {
	$('#parent_public_s').on('change', function(){

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

var noValue = $('#child_public_s').html(); //最初の状態を保存
		var cat = $(this).val();//選択されたvalueを取得
		if(cat){
			var item = categories[`${cat}`];//リストから配列を取得

			$('#child_public_s').html('');//childを空にする
				var option;
				for(var i = 0; i < item.length; i++){
					option = `<option value="${ item[i] }">${ item[i] }</option>`;
					$('#child_public_s').append(option);
				}
		}else{ //catが空の時
			$('#child_public_s').html('<option value="">----------</option>');
		}
	});
});

//diction編集
$(document).ready(function(){
	$('#parent_edit').on('change', function(){

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

//var noValue = $('#child').html(); //最初の状態を保存
		var cat = $(this).val();//選択されたvalueを取得
		if(cat){
			var item = categories[`${cat}`];//リストから配列を取得

			$('#child_edit').html('');//childを空にする
				var option;
				for(var i = 0; i < item.length; i++){
					option = `<option value="${ item[i] }">${ item[i] }</option>`;
					$('#child_edit').append(option);
				}
		}else{ //catが空の時
			$('#child_edit').html('<option value="">----------</option>');
		}
	});
});

//word編集
$(document).ready(function(){
	$('#word_parent_edit').on('change', function(){

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

//var noValue = $('#child').html(); //最初の状態を保存
		var cat = $(this).val();//選択されたvalueを取得
		if(cat){
			var item = categories[`${cat}`];//リストから配列を取得

			$('#word_child_edit').html('');//childを空にする
				var option;
				for(var i = 0; i < item.length; i++){
					option = `<option value="${ item[i] }">${ item[i] }</option>`;
					$('#word_child_edit').append(option);
				}
		}else{ //catが空の時
			$('#word_child_edit').html('<option value="">----------</option>');
		}
	});
});

//プロフィール画像の編集時、カーソルを合わせると透けるもの
$(function(){
//$(window).load(function() {
	$('#acount_image_edit').hover(function(){
		$(this).css('opacity', '0.7');
	}, function() {
		$(this).css('opacity', '1');
	});
});

//プロフィール画像を変更したいときに出る説明
$(function(){
//$(window).load(function() {
	$('[data-toggle="tooltip"]').tooltip();
});

//
// $(function() {
// 	var setFileInput = $('#acount_image_input'),
// 	setFileImage = $('#acount_image_view');

// 	var selfFile = $(this),
// 	selfInput = $(this).find('input[type=file]'),
// 	prevElm = selfFile.find(setFileImg),
// 	orgPass = prevElm.attr('src');

// 	selfInput.change(function() {
// 		var file = $(this).prop('files'),
// 		fileRdr = new FileReader();

// 		if (!this.files.length) {
// 			prevElm.attr('src', orgPass);
// 			return;
// 		} else {
// 			if (!file.type.match('image.*')){
// 				prevElm.arrt('src', orgPass);
// 				return;
// 			} else {
// 				fileRdr.onload = function() {
// 					prevElm.attr('src', fileRdr.result);
// 				}
// 				fileRdr.readAsDataURL(file);
// 			}
// 		}
// 	});
// });

// $(function() {
// 	$('#user_image').on('change', function() {
// 		var image_new = document.getElementById('user_image');
// 		var image = new Image();
// 		image.src = image_new;
// 		document.body.appendChild(image);
// 	});
// });

//プロフィール画像の変更時のプレビュー表示
$(function() {
	$('form input:file').uploadThumbs();
});

//
// $(function() {
// 	$('#user_search').keyup(function() {
// 		//$('#user_search').find("input[type='submit']").click();
// 		document.getElementById('user_search_submit').click();
// 	});
// });

// $(function() {
// 	$('#user_search').change(function() {
// 		//$('#user_search').find("input[type='submit']").click();
// 		document.getElementById('user_search_submit').click();

// 	});
// });

// $(function() {
// 	$('#user_search').on ('ajax:success', (event, results)
// 		$select = $('#user_search')
// });

// $(function() {
// 	$('#user_select_submit').on('click', function() {
// 		var element = document.getElementById('check_user');
// 		var radio = element.select_user1;
// 		var radioValue = $radio.value;
// 		if (radioValue == 0) {

// 		} else {
// 			$('#test5').html("成功");
// 		}
// 	});
// });




$(function() {
	$('#f-d-button-c').click(function() {
		window.addEventListener('load', function () {
			dojQueryAjax();
		});
	});
});

//唯一の成功例
// function dojQueryAjax() {
// 	var id = gon.diction_id;
// 	$.ajax({
// 		type: "GET",
// 		url: id,
// 		cache: false,
// 		success: function (data) {
			
// 			$('body').html(data);
// 			alert('Ajax通信成功２');
// 		},
// 		error: function() {
// 			alert('Ajax通信エラー');
// 		}
// 	});
// }
// window.addEventListener('load', function () {
// 	setTimeout(dojQueryAjax, 8000);
// });

//お気に入り追加と削除ボタンのクリック後の挙動
//diction
$(function() {
	$('#f-d-button-c').click(function() {
		$(this).css('background-color', '#fa9632')
		.css('border-color', "#fa9632")
		.text("追加しました")
		.attr('disabled', '');
	});
});

$(function() {
	$('#f-d-button-d').click(function() {
		$(this).css('background-color', '#fa9632')
		.css('border-color', "#fa9632")
		.text("削除しました")
		.attr('disabled', '');
	});
});

//meaning
$(function() {
	$('#f-m-button-c').click(function() {
		$(this).css('background-color', '#fa9632')
		.css('border-color', "#fa9632")
		.text("追加しました")
		.attr('disabled', '');
	});
});

$(function() {
	$('#f-m-button-d').click(function() {
		$(this).css('background-color', '#fa9632')
		.css('border-color', "#fa9632")
		.text("削除しました")
		.attr('disabled', '');
	});
});


//削除したら表示を消す
//comment
$(function() {
	$('.comment-destroy').click(function() {
		var num = $('.comment-destroy').index(this);
		//console.log(num);
		$('.comment-list').eq(num).css('display', 'none');
	});
});

//詳細ページでの削除
//diction
$(function() {
	$('#d-destroy-button').click(function() {
		$(this).css('background-color', '#fa9632')
		.css('border-color', "#fa9632")
		.text("削除しました")
		.attr('disabled', '');
	});
});

//word
$(function() {
	$('#w-destroy-button').click(function() {
		$(this).css('background-color', '#fa9632')
		.css('border-color', "#fa9632")
		.text("削除しました")
		.attr('disabled', '');
	});
});

//meaning
$(function() {
	$('#m-destroy-button').click(function() {
		$(this).css('background-color', '#fa9632')
		.css('border-color', "#fa9632")
		.text("削除しました")
		.attr('disabled', '');
	});
});