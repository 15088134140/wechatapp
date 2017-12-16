var proxy = require('http-proxy-middleware');
var express = require('express');
var app = express();

var tData = {
	result: 'Y',
	rsData: null
}
 
app.use(express.static('public'));
app.use('/modules', proxy({
	target: 'http://182.61.28.147:8080',
	changeOrigin: true,
	pathRewrite: {
    '^/modules' : '/modules'
  }
}));
 
// app.get('/modules/wechat/skd/BillDetail', function (req, res) {
// 	tData.rsData = {
// 		djbh: 'No2323',
// 		djrq: '2017-12-15',
// 		shrq: '2017-12-15',
// 		kfName: '张三',
// 		deptname: '部门',
// 		ywyUserCode: '业务员编码',
// 		ywyName: '业务员',
// 		sumBbje: '金额合计',
// 		scomment: '备注',
// 		details: [{
// 			zy: '摘要',
// 			bbje: '金额'
// 		},{
// 			zy: '摘要',
// 			bbje: '金额'
// 		}]
// 	}
//  	res.send(tData);
// });

// app.get('/modules/wechat/salary/getBillDetail', function (req, res) {
// 	tData.rsData = {
// 		userId: '用户ID',
// 		billId: 'billId',
// 		xzlb: '薪资类别',
// 		rylbmc: '人员类型名称',
// 		pk_corp: '公司PK',
// 		psncode: '人员编码',
// 		psnname: '姓名',
// 		deptname: '归属部门',
// 		cnestperiod: '归属期间',
// 		cnestyear: '归属年度',
// 		f_15: '岗位基本工资',
// 		f_30: '岗位津贴',
// 		f_31: '职务津贴',
// 		f_32: '技术保密费',
// 		f_33: '加班津贴',
// 		f_26: '业绩奖',
// 		f_40: '中餐补贴',
// 		f_41: '住宿补贴',
// 		f_42: '离职补贴',
// 		f_43: '高温补贴',
// 		f_44: '其他',
// 		f_52: '合计',
// 		f_46: '社保',
// 		f_47: '公积金',
// 		f_4: '本次扣税',
// 		f_49: '房租水电',
// 		f_50: '借款',
// 		f_51: '其他扣项',
// 		f_3: '实发合计'
// 	}
//  	res.send(tData);
// })
 
var server = app.listen(8080, function () {
 
  var host = server.address().address
  var port = server.address().port
 
  console.log("应用实例，访问地址为 http://%s:%s", host, port)
 
})