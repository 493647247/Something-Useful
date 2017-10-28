/**
 * 获取现在距指定时间的间隔
 * @param {Number} year 年
 * @param {Number} month 月
 * @param {Number} date 日
 * @param {Number} hour 时
 * @param {Number} minute 分
 * @param {Number} second 秒
 * @param {Number} ms 毫秒
 */
function getCountDown(year, month, date, hour = 0, minute = 0, second = 0, ms = 0) {
  var d = new Date(new Date(year, month - 1, date, hour, minute, second, ms) - Date.now())
  var left = { days: null, hours: null, minutes: null, seconds: null, ms: null };
  left.days = Math.floor(d / 1000 / 60 / 60 / 24);
  left.hours = Math.floor((d - left.days * 24 * 60 * 60 * 1000) / 1000 / 60 / 60);
  left.minutes = Math.floor((d - left.days * 24 * 60 * 60 * 1000 - left.hours * 60 * 60 * 1000) / 1000 / 60);
  left.seconds = Math.floor((d - left.days * 24 * 60 * 60 * 1000 - left.hours * 60 * 60 * 1000 - left.minutes * 60 * 1000) / 1000);
  left.ms = Math.floor(d - left.days * 24 * 60 * 60 * 1000 - left.hours * 60 * 60 * 1000 - left.minutes * 60 * 1000 - left.seconds * 1000);
  return left;
}