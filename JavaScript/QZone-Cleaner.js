'use strict';

var cleanerCount = 1;
var cleanerDelay = 1000;

function clickDelete() {
  try {
    document.querySelector('.app_canvas_frame').contentDocument.querySelector('.del_btn').click();
    setTimeout('clickYes();', cleanerDelay);
  } catch (error) {
    console.info('预期内的错误：尝试点击删除按钮时出错，将尝试自动翻页。', error);
    try {
      document.querySelector('.app_canvas_frame').contentDocument.querySelector('[title=下一页]').click();
      console.info('已尝试自动翻页，若无反应请手动翻页。');
      setTimeout('clickDelete();', cleanerDelay);
    } catch (error) {
      console.error('预期外的错误：尝试自动翻页时出错。', error);
    }
  }
}

function clickYes() {
  try {
    document.querySelector('.qz_dialog_layer_sub').click();
    console.info('已删除', cleanerCount++, '条说说。');
    setTimeout('clickDelete();', cleanerDelay);
  } catch (error) {
    console.error('预期外的错误：尝试点击是按钮时出错。', error);
  }
}

clickDelete();
