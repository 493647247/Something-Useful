'use strict';

(function () {
  var count;
  var delay = 1000;

  function clickDelete() {
    try {
      document.querySelector('.app_canvas_frame').contentDocument.querySelector('.del_btn').click();
      setTimeout('clickYes();', delay);
    } catch (error) {
      console.info('预期内的错误', error);
      document.querySelector('.app_canvas_frame').contentDocument.querySelector('#pager_next_0').click();
      console.info('已尝试点击 下一页，若无反应请手动点击')
    }
  }

  function clickYes() {
    try {
      document.querySelector('.qz_dialog_layer_sub').click();
      console.info('已删除', count++, '条说说');
      setTimeout('clickDelete();', delay);
    } catch (error) {
      console.error('预期外的错误', error);
    }
  }

  clickDelete();
})();