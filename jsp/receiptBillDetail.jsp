<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>收款单</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/statics/ydsp/css/borrowBillDetail.css">
  <%@ include file="/WEB-INF/views/modules/wechat/ydsp/ydspInclude.jsp"%>
</head>
<body>
  <div id="app" v-cloak>
    <div class="w-container" flex="box:last dir:top">
      <!-- 主区域 start -->
      <div class="w-main">
        <div class="weui-form-preview">
          <!-- 单据 s -->
          <div class="weui-form-preview__hd">
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">收款单金额合计</label>
              <em class="weui-form-preview__value">¥{{ formData.sumBbje }}</em>
            </div>
          </div>
          <div class="weui-form-preview__bd">
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">单号</label>
              <span class="weui-form-preview__value">{{ formData.djbh }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">日期</label>
              <span class="weui-form-preview__value">{{ formData.djrq }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">客户</label>
              <span class="weui-form-preview__value">{{ formData.kfName }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">部门</label>
              <span class="weui-form-preview__value">{{ formData.deptname }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">业务员</label>
              <span class="weui-form-preview__value">{{ formData.ywyName }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">备注</label>
              <span class="weui-form-preview__value">{{ formData.scomment }}</span>
            </div>
          </div>

          <!-- 明细 s-->
          <div class="weui-form-preview__bd w-borrow-list" v-if="formData.details.length">
            <div class="w-borrow-list-item last-highlight" v-for="item in formData.details">
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">摘要</label>
                <span class="weui-form-preview__value">{{ item.zy }}</span>
              </div>
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">金额</label>
                <span class="weui-form-preview__value">¥{{ item.bbje }}</span>
              </div>
            </div>
          </div>
          <!-- 报销明细 e-->
        </div>
      </div>
      <!-- 主区域 end -->
      <div class="w-footer weui-form-preview__ft">
        <a v-if="!isLoading && !hasError" class="weui-form-preview__btn weui-form-preview__btn_primary w-operation-btn" href="javascript:;" @click="handlePageCloseClick">关闭</a>

        <a v-else-if="hasError" href="javascript:void(0)" class="weui-btn weui-btn_default weui-btn_loading" @click="getDetail"><i class="weui-icon-warn"></i>请求错误，点击这里重试</a>

        <a v-else href="javascript:void(0)" class="weui-btn weui-btn_default weui-btn_loading"><i class="weui-loading"></i>数据加载中</a>
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
          isOperationDlgShow: false,
          billid: '${billid}',
          openId: '${openId}',
          formData: {
            userid: '--',
            vouchid: '--',
            djbh: '--',
            djrq: '--',
            kf: '--',
            kfName: '--',
            deptid: '--',
            deptname: '--',
            ywy: '--',
            ywyName: '--',
            sumBbje: '--',
            scomment: '--',
            details: []
          }
        }
      },

      mounted: function () {
        FastClick.attach(document.body);
        this.getDetail();
      },

      methods: {
        getDetail: function(){
          var vm = this;

          if (this.billid) {
            // url参数正常 请求数据
            vm.isLoading = true;
            vm.hasError = false;

            $.getJSON('/modules/wechat/skd/BillDetail', {
              billid: this.billid,
              openId: this.openId
            }).then(function(rsp) {
              console.log(rsp);
              if (rsp.result === 'Y') {
                vm.formData = rsp.rsData;
                vm.hasError = false; 
              } else {
                vm.hasError = true; 
              }
              vm.isLoading = false;
            }, function() {
              vm.hasError = true;
            });
          } else {
            vm.hasError = true;
          }
        },

        handlePageCloseClick: function() {
          wx.closeWindow();
        }
      }
    });
	</script>
</body>
</html>