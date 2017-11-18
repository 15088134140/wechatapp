var proxy = require('http-proxy-middleware');
var express = require('express');
var app = express();
 
app.use(express.static('public'));
app.use('/modules', proxy({
	target: 'http://182.61.28.147:8080',
	changeOrigin: true,
	pathRewrite: {
    '^/modules' : '/modules'
  },
}));
 
app.get('/', function (req, res) {
   res.send('Hello World');
})
 
var server = app.listen(8080, function () {
 
  var host = server.address().address
  var port = server.address().port
 
  console.log("应用实例，访问地址为 http://%s:%s", host, port)
 
})