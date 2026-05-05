import Vue from 'vue'
import App from './App.vue'
import router from './router'
import './plugins/element.js'
// 导入 全局css
import './assets/style/global.css'
// 导入 iconfont
import './assets/font1/iconfont.css'
import './assets/font2/iconfont.css'
import md5 from 'md5.js'
// md5加密
Vue.prototype.$md5 = md5;
// 导入 axios 处理跨域
import axios from 'axios'
// 挂载axios 到Vue的原型prototype的$http
Vue.prototype.$http = axios
// 设置请求的根路径
axios.defaults.baseURL = "http://localhost:9000/"
// 时间转化
import moment from "moment"
Vue.prototype.$moment = moment;
// echarts
import * as echarts from 'echarts';
Vue.prototype.$echarts = echarts;


Vue.config.productionTip = false;

Vue.config.warnHandler = function (msg, vm, trace) {
  // 过滤特定的警告信息
  if (msg.includes('Invalid prop: custom validator check failed for prop "percentage"')) {
    return;
  }
  // 对于其他警告，继续使用默认处理器
  console.warn(msg + trace);
};

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
