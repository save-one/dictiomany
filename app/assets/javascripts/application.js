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




// $(function() {
// 	$('#f-d-button-c').click(function() {
// 		window.addEventListener('load', function () {
// 			dojQueryAjax();
// 		});
// 	});
// });

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
		$('.comment-list').eq(num).fadeOut('slow');
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

//通報後の表示切替
//comment
// $(function() {
// 	$('#report-comment').click(function() {
// 		var button = $('<button>').text("通報しました");
// 		$('#down-icon').hide();
// 	})
// });

//通報時の理由選択フォームの出現に伴うルーティングの変更と対象の表示
$(function() {
	$('.c-report').click(function() {
		var num = $('.c-report').index(this),
		id = $('.c-id-for-report').eq(num).text();
		url = '/comments/' + id + '/reports',
		content = $('.c-content-for-report').eq(num).text();
		// console.log(num);
		// console.log(id);
		// console.log(url);
		$('#new_c_report').attr('action', url);
		content = '・ ' + content;
		$('#this-comment').text(content);
		$('#this-comment-num').text(num);
	});
});

//通報後の表示切替
//comment
// $(function() {
// 	$('#report-c-submit').click(function() {
// 		Push.create('Dictiomany', {
// 		　　body: '通報が完了しました',
// 		// 　　icon: 'icon.png',
// 		　　timeout: 8000, // 通知が消えるタイミング
// 		　　vibrate: [100, 100, 100], // モバイル端末でのバイブレーション秒数
// 		　　onClick: function() {
// 		　　　　// 通知がクリックされた場合の設定
// 		　　　　console.log('click');
// 		　　}
// 		});
// 	});
// });

//通知を許可するか出すもの ユーザに出ることを伝えて拒否されないようにする必要あり
// $(function() {
// 	Push.Permission.request();
// })

//検索時のcategoryの絞り込み用選択ボックスの設定
$(function() {
	$('#refine-category').hierarchySelect({
		width: 200
	});
});

//検索時のcategoryの絞り込み用選択ボックスの設定 header用
$(function() {
	$('#refine-category-header').hierarchySelect({
		width: 200
	});
});

//レスポンシブ時の出現・隠れる用
$(function() {
	$('#refine-category-header2').hierarchySelect({
		width: 200
	});
});

$(function() {
	$('#h-button-js').on('click', function() {
		$('.header-search2').toggle('slow');
		var body = $('body').css('padding-top');
		if (body === '164px') {
			$('body').css('padding-top', '74px');
			$('#side-nav').css('margin-top', '70px');
		}else {
			$('body').css('padding-top', '164px');
			$('#side-nav').css('margin-top', '160px');
		}
	});
});

$(function() {
	$(window).resize(function() {
		var now = window.innerWidth;
		if (now > 767) {
			$('.header-search2').hide();
			$('body').css('padding-top', '74px');
			$('#side-nav').css('margin-top', '70px');
		}
	});
});



//検索時のcategoryの絞り込み用選択ボックスの設定 footer用
$(function() {
	$('#refine-category-footer').hierarchySelect({
		width: 200
	});
});

//word showでの検索フォームの出現の切り替え
$(function() {
	$('#search-drop-button').click(function() {
		$('#search-drop-box').slideToggle();
	});
});

//footer カテゴリ選択により検索に自動的に入るようにする　索引機能
$(function() {
	$('#search-category-select-footer').on('click', function() {
		//console.log('log');
		$('#footer-search-submit').click();
	});
});

//サイドのナビゲーション
$(function() {
	$('#side-nav').hover(function() {
		$(this).find('span').stop().animate({
			'marginRight':'175px'
		}, 500);
	},
	function() {
		$(this).find('span').stop().animate({
			'marginRight':'0px'
		}, 300);
	});
});


//テスト
// $(function() {
// 	$('.panel').slideToggle('slow');
// });

//共有用ユーザ選択
//new
$(function() {
	//キーボードが押されたときにサブミットする
	$('#user_select_form').keyup(function() {
		$('#user_select_form').find("input[type='submit']").click();
	});

	$('#user_select_form').on('ajax:success', function(event, results) {
		var select = $('#user_select_table'),
			trs = select.find("tr");
		// console.log(trs);
		// console.log(event);
		$.each(trs, function() {
			var value = parseInt($(this).find("td").first().text());//数値に変換する
			// console.log(value);//今あるidをひとつづつ取得できてる
			// console.log(event.detail[0]);//結果を取得
			// console.log(results);//中身が何もないのと今のところまだ理解できてないので放置
			// console.log('end');
			//console.log(event.detail[0].indexOf(value) >= 0);

			//indexOfは、あれば添え字を、なければ-1を返すので、下の条件式になる
			if (event.detail[0].indexOf(value) >= 0) {
				$(this).show();
			} else {
				$(this).hide();
			}
		});
	});
});

$(function() {
	$('.select_user_tr').on('click', function() {
		var check = $(this).find("input"),
			checked = check.prop('checked');
		// console.log(check);
		// console.log(checked);
		if (checked === false) {
			$(this).css('background-color', 'lightgrey');
			check.prop('checked', true);
		} else if(checked === true) {
			$(this).css('background-color', '#ffffff');
			check.prop('checked', false);
		}
	});
});

$(function() {
	$('#user_select_button').on('click', function() {
		$('#user_select_close').click();
		$('#user_select_div').html('');
		var users = $('#user_select_table').find("input:checked");
			// names = $("input:checked").parents("tr").find("td[name='user_select_name']").text();
		// console.log(users);
		// console.log(names);
		$.each(users, function() {
			var name = $(this).parents("tr").find('p').html(),
				p = $('<p>').html(name),
				id = $(this).val(),
				input = $('<input>').attr({value: id, form: 'new_diction_form', name: 'select_user[]', type: 'checkbox'}).prop('checked', true).css('display', 'none');
			//console.log(input);

			//console.log(name);
			$('#user_select_div').append(p).append(input);

		});
		
	});
});

//edit
$(function() {
	//キーボードが押されたときにサブミットする
	$('#edit_user_select_form').keyup(function() {
		$('#edit_user_select_form').find("input[type='submit']").click();
	});

	$('#edit_user_select_form').on('ajax:success', function(event, results) {
		var select = $('#edit_user_select_table'),
			trs = select.find("tr");
		// console.log(trs);
		// console.log(event);
		$.each(trs, function() {
			var value = parseInt($(this).find("td").first().text());//数値に変換する
			// console.log(value);//今あるidをひとつづつ取得できてる
			// console.log(event.detail[0]);//結果を取得
			// console.log(results);//中身が何もないのと今のところまだ理解できてないので放置
			// console.log('end');
			//console.log(event.detail[0].indexOf(value) >= 0);

			//indexOfは、あれば添え字を、なければ-1を返すので、下の条件式になる
			if (event.detail[0].indexOf(value) >= 0) {
				$(this).show();
			} else {
				$(this).hide();
			}
		});
	});
});

$(function() {
	$('.edit_select_user_tr').on('click', function() {
		var check = $(this).find("input"),
			checked = check.prop('checked');
		// console.log(check);
		// console.log(checked);
		if (checked === false) {
			$(this).css('background-color', 'lightgrey');
			check.prop('checked', true);
		} else if(checked === true) {
			$(this).css('background-color', '#ffffff');
			check.prop('checked', false);
		}
	});
});

$(function() {
	$('#edit_user_select_button').on('click', function() {
		$('#edit_user_select_close').click();
		$('#edit_user_select_div').html('');
		var users = $('#edit_user_select_table').find("input:checked");
			// names = $("input:checked").parents("tr").find("td[name='user_select_name']").text();
		// console.log(users);
		// console.log(names);
		$.each(users, function() {
			var name = $(this).parents("tr").find('p').html(),
				p = $('<p>').html(name),
				id = $(this).val(),
				input = $('<input>').attr({value: id, form: 'edit_diction_form', name: 'select_user[]', type: 'checkbox'}).prop('checked', true).css('display', 'none');
			//console.log(input);

			//console.log(name);
			$('#edit_user_select_div').append(p).append(input);

		});
		
	});
});

$(function() {
	$('#edit_user_select_button').click();
});

