<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>审批</title>
  <link rel="stylesheet" type="text/css" href="${ctx}/statics/ydsp/css/borrowBillDetail.css">
  <%@ include file="/WEB-INF/views/modules/wechat/ydsp/ydspInclude.jsp"%>
</head>
<body>
  <div id="app" v-cloak>
    <div class="w-container" flex="box:last dir:top">
      <!-- 主区域 start -->
      <div class="w-main" style="background-color: #f8f8f8;">
        <!-- 销售订单 -->
        <div class="page__hd">
          <h1 class="page__title text-center">客户合同评审表</h1>
        </div>
        <!-- 基本信息 s -->
        <div class="weui-panel weui-panel_access">
          <div class="weui-panel__hd">基本信息</div>
          <div class="weui-panel__bd weui-form-preview__bd">
            <div class="weui-form-preview__item" v-if="formData.vdef41">
              <label class="weui-form-preview__label">客户类型</label>
              <span class="weui-form-preview__value">{{ formData.vdef41 }}</span>
            </div>
            <div class="weui-form-preview__item" v-if="formData.custname">
              <label class="weui-form-preview__label">合作单位</label>
              <span class="weui-form-preview__value">{{ formData.custname }}</span>
            </div>
            <div class="weui-form-preview__item" v-if="formData.vdef21">
              <label class="weui-form-preview__label">法人代表</label>
              <span class="weui-form-preview__value">{{ formData.vdef21 }}</span>
            </div>
            <div class="weui-form-preview__item" v-if="formData.vdef12">
              <label class="weui-form-preview__label">办公地址</label>
              <span class="weui-form-preview__value">{{ formData.vdef12 }}</span>
            </div>
            <div class="weui-form-preview__item" v-if="formData.vdef15">
              <label class="weui-form-preview__label">联系电话</label>
              <span class="weui-form-preview__value">{{ formData.vdef15 }}</span>
            </div>
          </div>
        </div>
        <!-- 基本信息 e -->

        <!-- 业务关键人 s -->
        <div class="weui-panel weui-panel_access">
          <div class="weui-panel__hd">业务关键人</div>
          <div class="weui-panel__bd weui-form-preview__bd">
            <div class="weui-form-preview__item" v-if="formData.vdef22">
              <label class="weui-form-preview__label">姓名</label>
              <span class="weui-form-preview__value">{{ formData.vdef22 }}</span>
            </div>
            <div class="weui-form-preview__item" v-if="formData.vdef23">
              <label class="weui-form-preview__label">职位</label>
              <span class="weui-form-preview__value">{{ formData.vdef23 }}</span>
            </div>
            <div class="weui-form-preview__item" v-if="formData.vdef24">
              <label class="weui-form-preview__label">联系电话</label>
              <span class="weui-form-preview__value">{{ formData.vdef24 }}</span>
            </div>
          </div>
        </div>
        <!-- 业务关键人 e -->

        <!-- 负责业务员 s -->
        <div class="weui-panel weui-panel_access">
          <div class="weui-panel__hd">负责业务员</div>
          <div class="weui-panel__bd weui-form-preview__bd">
            <div class="weui-form-preview__item" v-if="formData.vdef6">
              <label class="weui-form-preview__label">姓名</label>
              <span class="weui-form-preview__value">{{ formData.vdef6 }}</span>
            </div>
            <div class="weui-form-preview__item" v-if="formData.vdef5">
              <label class="weui-form-preview__label">业务部门</label>
              <span class="weui-form-preview__value">{{ formData.vdef5 }}</span>
            </div>
            <div class="weui-form-preview__item" v-if="formData.pk_areacl">
              <label class="weui-form-preview__label">所属地区</label>
              <span class="weui-form-preview__value">{{ formData.pk_areacl }}</span>
            </div>
          </div>
        </div>
        <!-- 负责业务员 e -->

        <!-- 开票信息 s -->
        <div class="weui-panel weui-panel_access">
          <div class="weui-panel__hd">开票信息</div>
          <div class="weui-panel__bd weui-form-preview__bd">
            <div class="weui-form-preview__item" v-if="formData.vdef25">
              <label class="weui-form-preview__label">发票类型</label>
              <span class="weui-form-preview__value">{{ formData.vdef25 }}</span>
            </div>
            <div class="weui-form-preview__item" v-if="formData.taxpayerid">
              <label class="weui-form-preview__label">纳税识别号</label>
              <span class="weui-form-preview__value">{{ formData.taxpayerid }}</span>
            </div>
            <div class="weui-form-preview__item" v-if="formData.vdef27">
              <label class="weui-form-preview__label">开户银行</label>
              <span class="weui-form-preview__value">{{ formData.vdef27 }}</span>
            </div>
            <div class="weui-form-preview__item" v-if="formData.vdef28">
              <label class="weui-form-preview__label">开票银行账号</label>
              <span class="weui-form-preview__value">{{ formData.vdef28 }}</span>
            </div>
          </div>
        </div>
        <!-- 开票信息 e -->

        <!-- 合同信息 s -->
        <div class="weui-panel weui-panel_access">
          <div class="weui-panel__hd">合同信息</div>
          <div class="weui-panel__bd weui-form-preview__bd">
            <div class="weui-form-preview__item" v-if="formData.vdef42">
              <label class="weui-form-preview__label">合同类型</label>
              <span class="weui-form-preview__value">{{ formData.vdef42 }}</span>
            </div>
            <div class="weui-form-preview__item" v-if="formData.vdef29">
              <label class="weui-form-preview__label">是否法人授权</label>
              <span class="weui-form-preview__value">{{ formData.vdef29 }}</span>
            </div>
            <div class="weui-form-preview__item" v-if="formData.vdef30">
              <label class="weui-form-preview__label">合同签回日期</label>
              <span class="weui-form-preview__value">{{ formData.vdef30 }}</span>
            </div>
            <div class="weui-form-preview__item" v-if="formData.vdef31">
              <label class="weui-form-preview__label">信用额度</label>
              <span class="weui-form-preview__value">{{ formData.vdef31 }}</span>
            </div>
            <div class="weui-form-preview__item" v-if="formData.vdef10">
              <label class="weui-form-preview__label">合同账期</label>
              <span class="weui-form-preview__value">{{ formData.vdef10 }}</span>
            </div>
            <div class="weui-form-preview__item" v-if="formData.vdef32">
              <label class="weui-form-preview__label">付款方式</label>
              <span class="weui-form-preview__value">{{ formData.vdef32 }}</span>
            </div>
            <div class="weui-form-preview__item" v-if="formData.vdef33">
              <label class="weui-form-preview__label">清款时间</label>
              <span class="weui-form-preview__value">{{ formData.vdef33 }}</span>
            </div>
            <div class="weui-form-preview__item" v-if="formData.vdef18">
              <label class="weui-form-preview__label">免息天数</label>
              <span class="weui-form-preview__value">{{ formData.vdef18 }}</span>
            </div>
            <div class="weui-form-preview__item" v-if="formData.vdef16">
              <label class="weui-form-preview__label">免息金额</label>
              <span class="weui-form-preview__value">{{ formData.vdef16 }}</span>
            </div>
            <div class="weui-form-preview__item" v-if="formData.vdef34">
              <label class="weui-form-preview__label">月／年销量</label>
              <span class="weui-form-preview__value">{{ formData.vdef34 }}</span>
            </div>
            <div class="weui-form-preview__item" v-if="formData.vdef11">
              <label class="weui-form-preview__label">价格分组</label>
              <span class="weui-form-preview__value">{{ formData.vdef11 }}</span>
            </div>
            <div class="weui-form-preview__item" v-if="formData.vdef35">
              <label class="weui-form-preview__label">成交价格</label>
              <span class="weui-form-preview__value">{{ formData.vdef35 }}</span>
            </div>
            <div class="weui-form-preview__item" v-if="formData.vdef36">
              <label class="weui-form-preview__label">是否有折让</label>
              <span class="weui-form-preview__value">{{ formData.vdef36 }}</span>
            </div>
            <div class="weui-form-preview__item" v-if="formData.vdef38">
              <label class="weui-form-preview__label">交货周期</label>
              <span class="weui-form-preview__value">{{ formData.vdef38 }}</span>
            </div>
            <div class="weui-form-preview__item" v-if="formData.vdef39">
              <label class="weui-form-preview__label">客户情况</label>
              <span class="weui-form-preview__value">{{ formData.vdef39 }}</span>
            </div>
          </div>
        </div>
        <!-- 合同信息 e -->

        <!-- 附件信息 s -->
        <div class="weui-panel weui-panel_access">
          <div class="weui-panel__hd">附件信息</div>
          <div class="weui-panel__bd weui-form-preview__bd">
            <div class="weui-form-preview__item" v-for="(item, index) in formData.ncFile">
              <label class="weui-form-preview__label">
                <a class="w-highlight" :href="item.fileUrl">{{ item.fileName }}</a>
              </label>
              <span class="weui-form-preview__value"> </span>
            </div>
          </div>
        </div>
        <!-- 附件信息 e -->

        <!-- 审批流程 s-->
        <div class="weui-form-preview__ft w-step" flex="dir:top" style="margin-top: 10px;">
          <div class="icon-box w-step-item" flex="dir:left box:first" v-for="item in formData.spqks">
            <div class="w-step-item-left">
              <i :class="getStepClass(item.approveresult)"></i>
            </div>
            <div class="w-step-item-right">
              <div class="icon-box__desc" flex="dir:left main:justify">
                <span>{{ item.checkmanName }}</span><span>{{ item.dealdate }}</span>
              </div>
              <div class="icon-box__title">{{ item.checknote || '未审批' }}</div>
            </div>
          </div>
        </div>
        <!-- 审批流程 s-->
      </div>
      <!-- 主区域 end -->
      <div class="w-footer weui-form-preview__ft">
        <template v-if="!isLoading && !hasError">
          <a v-if="pageType === 'boss' && ischeck === 'N'" class="weui-form-preview__btn weui-form-preview__btn_primary w-operation-btn" href="javascript:void(0)" @click="isOperationShow = true">操作</a>

          <a v-else class="weui-form-preview__btn weui-form-preview__btn_primary w-operation-btn" href="javascript:;" @click="handlePageCloseClick">关闭</a>
        </template>
        <a v-else-if="hasError" href="javascript:void(0)" class="weui-btn weui-btn_default weui-btn_loading" @click="getDetail"><i class="weui-icon-warn"></i>请求错误，点击这里重试</a>
        <a v-else href="javascript:void(0)" class="weui-btn weui-btn_default weui-btn_loading"><i class="weui-loading"></i>数据加载中</a>
      </div>
    </div>

    <div class="w-operation-panel" v-if="isOperationShow">
        <div class="weui-mask" id="iosMask"></div>
        <div class="weui-actionsheet weui-actionsheet_toggle" id="iosActionsheet">
            <div class="weui-actionsheet__menu">
              <div class="weui-actionsheet__cell" @click="handleOptBtnClick('Y')">批准</div>
              <div class="weui-actionsheet__cell" @click="handleOptBtnClick('R')">驳回</div>
            </div>
            <div class="weui-actionsheet__action">
                <div class="weui-actionsheet__cell" @click="isOperationShow = false">关闭</div>
            </div>
        </div>
    </div>

    <div class="w-js-dialog" v-if="isOperationDlgShow">
      <div class="weui-mask"></div>
      <div class="weui-dialog">
          <div class="weui-dialog__hd"><strong class="weui-dialog__title">审批意见</strong></div>
          <div class="weui-dialog__bd"><textarea v-model="opinionData.checkNote" class="weui-textarea" placeholder="请输入意见" rows="2"></textarea></div>
          <div class="weui-dialog__ft">
              <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_default" @click="handleDlgBtnCancelClick">取消</a>
              <a v-if="!opinionData.isLoading" href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary" @click="handleDlgBtnConfirmClick">确认</a>
              <a v-else href="javascript:;" class="weui-dialog__btn weui-dialog__btn_default weui-btn_loading"><i class="weui-loading"></i>审核中</a>
          </div>
      </div>
    </div>

    <div id="toast" style="display: none;">
      <div class="weui-mask_transparent"></div>
      <div class="weui-toast">
          <i class="weui-icon-success-no-circle weui-icon_toast"></i>
          <p class="weui-toast__content">审批成功</p>
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
          isOperationShow: false,
          isOperationDlgShow: false,
          billid: Utils.getQueryString('billid'),
          checkman: Utils.getQueryString('checkman'),
          billType: Utils.getQueryString('pk_billtype'),
          pageType: Utils.getQueryString('pageType'),
          ischeck: Utils.getQueryString('ischeck'),
          origin: Utils.getQueryString('origin'),
          openId: '${openId}',
          formData: {
            ncFile: [],
            spqks: [], // 审批流程
            custcode: "--", // 合作单位编码 
            custname: "--", // 合作单位名称 
            vdef21: "--", // 法人代表 
            vdef12: "--", //办公/ 通信地址 
            vdef15: "--", // 联系电话1 
            vdef22: "--", // 业务关键人 
            vdef23: "--", // 职位 
            vdef24: "--", // 联系电话2 
            vdef6: "--", //负责业务员/ 采购人员 
            vdef5: "--", //业务部门/ 采购部门 
            pk_areacl: "--", // 所属地区 
            vdef9: "--", // 销售人员 
            vdef8: "--", // 销售部门 
            vdef25: "--", // 发票类型 
            taxpayerid: "--", // 纳税识别号 
            vdef27: "--", // 开户银行
            vdef28: "--", // 开票银行账号
            vdef29: "--", // 是否有法人授权委托书
            vdef30: "--", // 合同预计签回日期
            vdef31: "--", // 合同信用额度
            vdef10: "--", // 合同账期
            vdef32: "--", // 付款方式
            vdef33: "--", // 清款时间
            vdef18: "--", // 免息天数
            vdef16: "--", // 免息金额
            vdef34: "--", // 估计月销量／年销量
            vdef11: "--", // 价格分组
            vdef35: "--", // 产品成交价格
            vdef36: "--", // 产品成交价格是否有折让
            vdef37: "--", // 产品成交价格折让备注
            vdef38: "--", // 交货周期
            vdef39: "--", // 客户情况简述（业务员）
            vdef41: "--", // 客户类型
            vdef42: "--"  // 客户合同类型
          },
          opinionData: {
            checkResult: 'Y', //'Y'批准 'R'驳回
            checkNote: '批准',
            isLoading: false,
          }
        }
      },

      mounted: function () {
        FastClick.attach(document.body);
        this.getDetail();
      },

      methods: {
        getStepClass: function(checkResult){
          var className = '';
          switch(checkResult) {
          case 'Y':
            className = 'weui-icon-success';
            break;
          case 'R':
            className = 'weui-icon-download';
            break;
          default:
            className = 'weui-icon-waiting';
          }
          return className;
        },

        getDetail: function(){
          var vm = this;

          if (this.billid && this.pageType) {
            // url参数正常 请求数据
            vm.isLoading = true;
            vm.hasError = false;

            $.getJSON('/modules/wechat/ydsp/BillDetail', {
              billid: this.billid,
              openId: this.openId,
              pk_billtype: this.billType,
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

        goBackList: function(vm) {
          window.location.href = (vm.pageType === 'employee' ? '/modules/wechat/ydsp/WfqdIndex' : '/modules/wechat/ydsp/WddbIndex') + '?openId=' + vm.openId;
        },

        handleOptBtnClick: function(checkResult){
          this.isOperationShow = false;
          this.isOperationDlgShow = true;
          this.opinionData.checkResult = checkResult;
          this.opinionData.checkNote = checkResult === 'Y' ? '批准' : '驳回到制单人';
          console.log('checkResult', checkResult);
        },

        handleDlgBtnConfirmClick: function(){
          var vm = this;
          vm.opinionData.isLoading = true;
          $.post('/modules/wechat/ydsp/Wddb_CZ', {
            billType: vm.billType,
            billID: vm.billid,
            checkman: vm.checkman,
            checkResult: vm.opinionData.checkResult,
            checkNote: vm.opinionData.checkNote,
          }, function(rsp) {
            console.log('post', rsp);
            vm.opinionData.isLoading = false;
            if (rsp.result === 'Y') {
              vm.isOperationDlgShow = false;
              vm.ischeck = 'Y';
              $('#toast').fadeIn(0).fadeOut(2000, function(){
                // originwindow.location.href = './borrowBillList.html?pageType=' + vm.pageType;
                vm.origin !== 'push' ? vm.goBackList(vm) : wx.closeWindow();
              });
            } else {
              alert(rsp.msg || '审批失败，请重试！');
            }
          }, 'json');
        },

        handleDlgBtnCancelClick: function(){
          this.isLoading = false;
          this.isOperationDlgShow = false;
          this.opinionData.checkNote = '批准';
          this.opinionData.checkResult = 'Y';
        },

        handleShowOtherClick: function(item) {
          item.isShowOther = !item.isShowOther;
        },

        handlePageCloseClick: function() {
          this.origin === 'list' ? this.goBackList(this) : wx.closeWindow();
        }
      }
    });
  </script>
</body>
</html>