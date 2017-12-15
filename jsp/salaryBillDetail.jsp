<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>工资条</title>
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
              <label class="weui-form-preview__label">实发工资金额合计</label>
              <em class="weui-form-preview__value">¥{{ formData.f_3 }}</em>
            </div>
          </div>
          <div class="weui-form-preview__bd">
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">薪资类别</label>
              <span class="weui-form-preview__value">{{ formData.xzlb }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">人员类别</label>
              <span class="weui-form-preview__value">{{ formData.rylbmc }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">人员编码</label>
              <span class="weui-form-preview__value">{{ formData.psncode }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">姓名</label>
              <span class="weui-form-preview__value">{{ formData.psnname }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">归属部门</label>
              <span class="weui-form-preview__value">{{ formData.deptname }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">归属期间</label>
              <span class="weui-form-preview__value">{{ formData.cnestperiod }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">归属年度</label>
              <span class="weui-form-preview__value">{{ formData.cnestyear }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">岗位基本工资</label>
              <span class="weui-form-preview__value">¥{{ formData.f_15 }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">岗位津贴</label>
              <span class="weui-form-preview__value">¥{{ formData.f_30 }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">职务津贴</label>
              <span class="weui-form-preview__value">¥{{ formData.f_31 }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">技术保密费</label>
              <span class="weui-form-preview__value">¥{{ formData.f_32 }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">加班津贴</label>
              <span class="weui-form-preview__value">¥{{ formData.f_33 }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">业绩奖</label>
              <span class="weui-form-preview__value">¥{{ formData.f_26 }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">中餐补贴</label>
              <span class="weui-form-preview__value">¥{{ formData.f_40 }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">住宿补贴</label>
              <span class="weui-form-preview__value">¥{{ formData.f_41 }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">离职补贴</label>
              <span class="weui-form-preview__value">¥{{ formData.f_42 }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">高温补贴</label>
              <span class="weui-form-preview__value">¥{{ formData.f_43 }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">其他</label>
              <span class="weui-form-preview__value">¥{{ formData.f_44 }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">合计</label>
              <span class="weui-form-preview__value">¥{{ formData.f_52 }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">社保</label>
              <span class="weui-form-preview__value">¥{{ formData.f_46 }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">公积金</label>
              <span class="weui-form-preview__value">¥{{ formData.f_47 }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">本次扣税</label>
              <span class="weui-form-preview__value">¥{{ formData.f_4 }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">房租水电</label>
              <span class="weui-form-preview__value">¥{{ formData.f_49 }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">借款</label>
              <span class="weui-form-preview__value">¥{{ formData.f_50 }}</span>
            </div>
            <div class="weui-form-preview__item">
              <label class="weui-form-preview__label">其他扣项</label>
              <span class="weui-form-preview__value">¥{{ formData.f_51 }}</span>
            </div>
          </div>

          <!-- 明细 s-->
          <!-- 明细 e-->
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
            userId: '--',
            billId: '--',
            xzlb: '--',
            rylbmc: '--',
            pk_corp: '--',
            psncode: '--',
            psnname: '--',
            deptname: '--',
            cnestperiod: '--',
            cnestyear: '--',
            f_15: '--',
            f_30: '--',
            f_31: '--',
            f_32: '--',
            f_33: '--',
            f_26: '--',
            f_40: '--',
            f_41: '--',
            f_42: '--',
            f_43: '--',
            f_44: '--',
            f_52: '--',
            f_46: '--',
            f_47: '--',
            f_4: '--',
            f_49: '--',
            f_50: '--',
            f_51: '--',
            f_3: '--'
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

            $.getJSON('/modules/wechat/salary/getBillDetail', {
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