<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>填写借款单</title>
  <link rel="stylesheet" type="text/css" href="${ctx}/statics/ydsp/css/borrowBillDetail.css">
  <style>
    .weui-panel__hd, .weui-cells__title.canvas-title {
      color: #ff0000;
      font-weight: normal;
    }
    .canvas-container:before {
      display: none;
    }
    .canvas-container {
      width: 100%;
      padding: 0 15px;
      box-sizing: border-box;
      height: 160px;
    }
    .canvas-container canvas {
      background-color: #ccc;
    }

    .weui-cells:before{
      display: none;
    }
  </style>
  <%@ include file="/WEB-INF/views/modules/wechat/ydsp/ydspInclude.jsp"%>
  <script src="${ctx}/statics/ydsp/js/draw.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
  <div id="app" v-cloak>
    <div class="w-container" flex="box:last dir:top">
      <!-- 主区域 start -->
      <div class="w-main">
        <form class="weui-cells weui-cells_form" id="signRegisterForm" style="margin-top: 0;">
          <div class="weui-cell">
            <div class="weui-cell__hd"><label for="" class="weui-label">单据日期</label></div>
            <div class="weui-cell__bd">
              <input class="weui-input" :value="formData.billDate" readonly>
            </div>
          </div>

          <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">借款人</label></div>
            <div class="weui-cell__bd">
              <input class="weui-input" :value="formData.psnname" readonly>
            </div>
          </div>

          <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">借款部门</label></div>
            <div class="weui-cell__bd">
              <input class="weui-input" :value="formData.deptname" readonly>
            </div>
          </div>

          <div class="weui-cell">
            <div class="weui-cell__hd">
              <label for="" class="weui-label">银行账号</label>
            </div>
            <div class="weui-cell__bd">
              <input class="weui-input" :value="formData.bankaccount" readonly>
            </div>
          </div>

          <div class="weui-cell">
            <div class="weui-cell__hd">
              <label for="" class="weui-label">借款余额</label>
            </div>
            <div class="weui-cell__bd">
              <input class="weui-input" :value="formData.sumJkye" readonly>
            </div>
          </div>

          <div class="weui-cell">
            <div class="weui-cell__hd required"><label class="weui-label">借款金额</label></div>
            <div class="weui-cell__bd">
              <input type="number" class="weui-input" placeholder="请输入借款金额" v-model="formData.jkMoney">
            </div>
          </div>

          <div class="weui-cell">
            <div class="weui-cell__hd required"><label class="weui-label">借款事由</label></div>
            <div class="weui-cell__bd">
              <textarea class="weui-textarea" placeholder="请输入借款事由" v-model="formData.content" rows="2"></textarea>
            </div>
          </div>

          <div class="weui-cell no-padding"></div>

          <div class="weui-cells__title canvas-title">确认前在下方灰色区域手写签名<a class="w-highlight fr" href="javascript:;" @click.stop="handleClearClick()">重签</a></div>
          <div class="weui-cell canvas-container">
            <canvas id="canvas"></canvas>
          </div>
        </form>
        <img :src="signBase64" alt="">
      </div>
      <!-- 主区域 end -->
      <div class="w-footer weui-form-preview__ft">
        <template v-if="!isLoading && !hasError">
          <a class="weui-form-preview__btn weui-form-preview__btn_primary w-operation-btn" href="javascript:void(0)" @click="handleConfirmClick()">确认借款</a>
        </template>
        <a v-else-if="hasError" href="javascript:void(0)" class="weui-btn weui-btn_default weui-btn_loading" @click="init()"><i class="weui-icon-warn"></i>请求错误，点击这里重试</a>
        <a v-else href="javascript:void(0)" class="weui-btn weui-btn_default weui-btn_loading"><i class="weui-loading"></i>数据加载中</a>
      </div>
    </div>

    <div id="toast" style="display: none;">
      <div class="weui-mask_transparent"></div>
      <div class="weui-toast">
          <i class="weui-icon-success-no-circle weui-icon_toast"></i>
          <p class="weui-toast__content">提交成功</p>
      </div>
    </div>
  </div>
  <script>
    new Vue({
      el: '#app',
      data: function(){
        return {
          isLoading: false,
          hasError: false,
          billType: '263X-01',
          openId: '100104042005',
          signBase64: '',
          formData: {
            billDate: '',
            pk_bankaccbas: '',
            bankaccount: '',
            pk_psndoc: '',
            psnname: '',
            pk_deptdoc: '',
            deptname: '',
            sumJkye: '',
            jkMoney: '',
            content: '',
          }
        }
      },

      mounted: function () {
        FastClick.attach(document.body);

        this.init();
        this.$nextTick(() => {
          var container = document.querySelector('.canvas-container');
          var canvas = container.querySelector('canvas');
          var width = $(container).width();
          var height = $(container).height();
          draw = new Draw('canvas', width, height);
          console.log('draw', draw);
          draw.init();
        });
      },

      methods: {
        init: function(){
          var vm = this;

          // url参数正常 请求数据
          vm.isLoading = true;
          vm.hasError = false;

          $.getJSON('/modules/wechat/ydsp/xjlc/xjlc_Init', {
            openId: this.openId,
            billType: this.billType,
          }).then(function(rsp) {
            console.log(rsp);
            if (rsp.result === 'Y') {
              var data = rsp.rsData;
              if (data) {
                vm.formData.billDate = data.billDate || new Date().Format('yyyy-MM-dd');

                vm.formData.pk_psndoc = data.psndoc && data.psndoc.pk_psndoc;
                vm.formData.psnname = data.psndoc && data.psndoc.psnname;

                vm.formData.pk_deptdoc = data.deptdoc && data.deptdoc.pk_deptdoc;
                vm.formData.deptname = data.deptdoc && data.deptdoc.deptname;

                vm.formData.pk_bankaccbas = data.account && data.account[0].pk_bankaccbas;
                vm.formData.bankaccount = data.account && data.account[0].accountname;
                vm.formData.sumJkye = data.sumJkye;
              }
              vm.hasError = false;
            } else {
              vm.hasError = true; 
            }
            vm.isLoading = false;
          }, function() {
            vm.hasError = true;
          });
        },

        handleConfirmClick: function(){
          var vm = this;

          if (!vm.formData.jkMoney) {
            return alert('借款金额不能为空！');
          }

          if (!vm.formData.content.trim()) {
            return alert('借款事由不能为空！');
          }

          if (!draw.isStart) {
            return alert('签名不能为空！');
          }
          var billData = Object.assign({}, vm.formData, { 
            content : window.encodeURI(vm.formData.content), 
            signImage: draw.save() 
          });

          vm.isLoading = true;

          $.post('/modules/wechat/ydsp/xjlc/xjlc_Submit', {
            billType: vm.billType,
            openId: vm.openId,
            billData: JSON.stringify(billData)
          }, function(rsp) {
            console.log('post', rsp);
            vm.isLoading = false;
            if (rsp.result === 'Y') {
              $('#toast').fadeIn(0).fadeOut(2000, function(){
                wx.closeWindow();
              });
            } else {
              alert(rsp.msg || '提交失败，请重试！');
            }
          }, 'json');
        },

        handleClearClick: function() {
          draw.clear();
        },

        handleSaveClick: function() {
          var data = draw.save();
          this.signBase64 = data;
          console.log(data)
        }
      }
    });
  </script>
</body>
</html>