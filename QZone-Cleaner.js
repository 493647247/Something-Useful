'use strict';

var cleanerCount = 1;
var CleanerDelay = 1000;

function clickDelete() {
  try {
    document.querySelector('.app_canvas_frame').contentDocument.querySelector('.del_btn').click();
    setTimeout('clickYes();', CleanerDelay);
  } catch (error) {
    console.info('预期内的错误：尝试点击删除按钮时出错，将尝试自动翻页。', error);
    try {
      document.querySelector('.app_canvas_frame').contentDocument.querySelector('#pager_next_0').click();
      console.info('已尝试自动翻页，若无反应请手动翻页。');
    } catch (error) {
      console.error('预期外的错误：自动翻页失败。', error);
    }
  }
}

function clickYes() {
  try {
    document.querySelector('.qz_dialog_layer_sub').click();
    console.info('已删除', cleanerCount++, '条说说。');
    setTimeout('clickDelete();', CleanerDelay);
  } catch (error) {
    console.error('预期外的错误。', error);
  }
}

clickDelete();