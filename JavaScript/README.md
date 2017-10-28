# JavaScript

这里集中了一些 JavaScript 小脚本。

## `countDown.js`

获取现在距指定时间的间隔。

### 使用方法

引入 JS 文件后，调用函数 `getCountDown()` 即可。

参数说明：

- `year`：年。
- `month`：月。
- `date`：日。
- `hour`：（可选）时。
- `minute`：（可选）分。
- `second`：（可选）秒。
- `ms`：（可选）毫秒。

返回值说明：

- [Object]
  - `days`：剩余天数。
  - `hours`：剩余小时数。
  - `minutes`：剩余分钟数。
  - `seconds`：剩余秒数。
  - `ms`：剩余毫秒数。 

## `QZone-Cleaner.js`

QQ空间说说自动删除脚本，参考了 [L1Z1M0/qzone-autodelete](https://github.com/L1Z1M0/qzone-autodelete)。

### 使用方法

打开 QQ空间 个人中心，点击二级导航栏中的 说说，将 `QZone-Cleaner.js` 中的内容复制到浏览器的 JavaScript 控制台中运行即可。
