<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>单据详情</title>
  <link rel="stylesheet" type="text/css" href="${ctx}/statics/ydsp/css/borrowBillDetail.css">
  <%@ include file="/WEB-INF/views/modules/wechat/ydsp/ydspInclude.jsp"%>
</head>
<body>
  <div id="app" v-cloak>
    <div class="w-container" flex="box:last dir:top">
      <!-- 主区域 start -->
      <div class="w-main">
        <div class="weui-form-preview">

          <template v-if="billType === 'F'">
            <div class="weui-form-preview__hd">
              <div class="weui-form-preview__item">
                <em class="weui-form-preview__value text-center">{{ formData.customName }}</em>
              </div>
            </div>

            <div class="weui-form-preview__bd">
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">单据编号</label>
                <span class="weui-form-preview__value">{{ formData.vbillno }}</span>
              </div>
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">单据日期</label>
                <span class="weui-form-preview__value">{{ formData.dbilldate }}</span>
              </div>
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">专管部门</label>
                <span class="weui-form-preview__value">{{ formData.deptname }}</span>
              </div>
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">专管人员</label>
                <span class="weui-form-preview__value">{{ formData.psnname }}</span>
              </div>
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">备注</label>
                <span class="weui-form-preview__value">{{ formData.vnote }}</span>
              </div>
            </div>

            <!-- 明细 s-->
            <div class="weui-form-preview__bd w-borrow-list">
              <div class="w-borrow-list-item last-highlight" v-for="item in formData.details">
                <div class="weui-form-preview__item">
                  <label class="weui-form-preview__label">发票号</label>
                  <span class="weui-form-preview__value">{{ item.ckcode }}</span>
                </div>
                <div class="weui-form-preview__item">
                  <label class="weui-form-preview__label">发票日期</label>
                  <span class="weui-form-preview__value">{{ item.ckdate }}</span>
                </div>
                <div class="weui-form-preview__item">
                  <label class="weui-form-preview__label">发票金额</label>
                  <span class="weui-form-preview__value">¥{{ item.res6 }}</span>
                </div>
              </div>
            </div>
            <!-- 明细 e-->
          </template>

          <template v-if="billType === 'D'">
            <div class="weui-form-preview__hd">
              <div class="weui-form-preview__item">
                <!-- <label class="weui-form-preview__label">签回单号</label> -->
                <em class="weui-form-preview__value text-center">{{ formData.customName }}</em>
              </div>
            </div>

            <div class="weui-form-preview__bd">
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">对账单号</label>
                <span class="weui-form-preview__value">{{ formData.vbillno }}</span>
              </div>
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">单据日期</label>
                <span class="weui-form-preview__value">{{ formData.dbilldate }}</span>
              </div>
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">专管部门</label>
                <span class="weui-form-preview__value">{{ formData.deptname }}</span>
              </div>
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">开始对账日期</label>
                <span class="weui-form-preview__value">{{ formData.sdate }}</span>
              </div>
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">截止对账日期</label>
                <span class="weui-form-preview__value">{{ formData.edate }}</span>
              </div>
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label w-highlight">期初应收</label>
                <span class="weui-form-preview__value w-highlight">¥{{ formData.qc_yskje }}</span>
              </div>
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label w-highlight">期末应收</label>
                <span class="weui-form-preview__value w-highlight">¥{{ formData.qm_yskje }}</span>
              </div>
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label w-highlight">账单明细</label>
                <span class="weui-form-preview__value">
                  <a class="w-highlight" :href="formData.detailURl" download>下载/浏览</a>
                </span>
              </div>
            </div>
          </template>

          <!-- 照片 s-->
          <div class="weui-form-preview__bd w-borrow-list">
            <div class="weui-uploader__bd w-borrow-list-item w-photo-list-item" flex="dir:left">
              <div class="w-uploader-item" v-for="localId in formData.imagesURL">
                <i v-if="formData.isSign === 'N'" class="w-uploader-del-img" @click="handleImgDelClick(localId)"></i>
                <img :src="localId" @click="handleImgClick(localId)">
              </div>
              <div v-if="formData.isSign === 'N'" class="weui-uploader__input-box" @click="handleDlgImgChooseClick"></div>
            </div>
          </div>
          <!-- 照片 e-->

        </div>
      </div>
      <!-- 主区域 end -->
      <div class="w-footer weui-form-preview__ft">
        <template v-if="!isLoading && !hasError">
          <template v-if="origin !== 'push'">
            <a v-if="formData.isSign === 'N'" class="weui-form-preview__btn weui-form-preview__btn_primary w-operation-btn" href="javascript:void(0)" @click="handleShowDlgBtnClick">确认签收</a>
            <a v-else class="weui-form-preview__btn weui-form-preview__btn_primary w-operation-btn" href="javascript:void(0)" @click="confirmDlgType = 2">取消签收</a>
          </template>
          <template v-else>
            <a class="weui-form-preview__btn weui-form-preview__btn_primary w-operation-btn" href="javascript:;" @click="handlePageCloseClick">关闭</a>
          </template>
        </template>

        <a v-else-if="hasError" href="javascript:void(0)" class="weui-btn weui-btn_default weui-btn_loading" @click="getDetail"><i class="weui-icon-warn"></i>请求错误，点击这里重试</a>
        <a v-else href="javascript:void(0)" class="weui-btn weui-btn_default weui-btn_loading"><i class="weui-loading"></i>数据加载中</a>
      </div>
    </div>

    <div id="toast" style="display: none;">
      <div class="weui-mask_transparent"></div>
      <div class="weui-toast">
          <i class="weui-icon-success-no-circle weui-icon_toast"></i>
          <p class="weui-toast__content">操作成功</p>
      </div>
    </div>

    <div class="w-js-dialog" v-if="confirmDlgType !== 0">
      <div class="weui-mask"></div>
      <div class="weui-dialog">
        <div class="weui-dialog__bd"> {{ confirmMsg }}</div>
        <div class="weui-dialog__ft">
          <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_default" @click="confirmDlgType = 0">取消</a>
          <a v-if="!opinionData.isLoading" href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary" @click="handleDlgConfirmClick">确认</a>
          <a v-else href="javascript:;" class="weui-dialog__btn weui-dialog__btn_default weui-btn_loading"><i class="weui-loading"></i>请稍等</a>
        </div>
      </div>
    </div>

    <div class="w-js-dialog w-bigimg" v-if="isBigImgDlgShow" @click="isBigImgDlgShow = false">
      <div class="weui-mask"></div>
      <div class="w-bigimg-container">
        <img :src="bigImgUrl" alt="">
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
          confirmDlgType: 0, // 确认框显示
          isBigImgDlgShow: false,
          billId: '${billId}',
          billType: ('${billType}' || 'F'), // F 发票签收单  D 对账单
          origin: '${origin}', // push 推送 list 其它
          openId: '${openId}',
          formData: {
            vbillno: '--',
            dbilldate: '--',
            customName: '--',
            deptname: '--',
            psnname: '--',
            vnote: '--',
            sdate: '--',
            edate: '--',
            qc_yskje: '--',
            qm_yskje: '--',
            details: [],
            imagesURL: []
          },
          opinionData: {
            confirm: 'Y', //'Y'批准 'R'取消
            isLoading: false
          },
          bigImgUrl: '',
          serverIds: []
        }
      },

      mounted: function () {
        FastClick.attach(document.body);
        this.getDetail();
      },

      computed: {
        confirmMsg: function() {
          return [
            '', // 空
            '是否确认签收？', // 确认签收
            '是否确认取消签收？', // 取消签收
          ][this.confirmDlgType];
        }
      },

      methods: {
        getDetail: function(){
          var vm = this;

          if (vm.billId) {
            // url参数正常 请求数据
            vm.isLoading = true;
            vm.hasError = false;

            $.getJSON(vm.billType === 'F' ? '/modules/wechat/sign/BillDetail' : '/modules/wechat/sign/BillDetail', {
              billId: vm.billId,
              billType: vm.billType,
              openId: vm.openId
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

        handleDlgConfirmClick: function(){
          var vm = this, confirm, url, data;

          vm.opinionData.isLoading = true;

          // 处理确认、取消签收 3 4
          confirm = vm.confirmDlgType === 1 ? 'Y' : 'N';
          url = '/modules/wechat/sign/signConfirm';
          data = { openId: vm.openId, billId: vm.billId, confirm: confirm, billType: vm.billType };
          data.imageIds = vm.serverIds.join('##');

          $.post(url, data, function(rsp) {
            console.log('post', rsp);
            vm.opinionData.isLoading = false;
            if (rsp.result === 'Y') {
              vm.opinionData.isLoading = false;
              vm.getDetail();
              vm.confirmDlgType = 0;
              $('#toast').fadeIn(0).fadeOut(2000, function(){
                wx.closeWindow();
              });
            } else {
              vm.opinionData.isLoading = false;
              alert(rsp.msg || '操作失败，请重试！');
            }
          }, 'json');
        },

        handleDlgImgChooseClick: function(){
          var vm = this;

          var syncUpload = function(localIds) {
            var localId = localIds.pop();
            wx.uploadImage({
              localId: localId, // 需要上传的图片的本地ID，由chooseImage接口获得
              isShowProgressTips: 1, // 默认为1，显示进度提示
              success: function(uploadRsp) {
                vm.serverIds.push(uploadRsp.serverId);
                (localIds.length !== 0) && syncUpload(localIds);
              }
            });
          };

          wx.chooseImage({
            count : 9, // 默认9
            sizeType : [ 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
            sourceType : [ 'album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
            success : function(rsp) {
              // 返回选定照片的本地ID列表s，localId可以作为img标签的src属性显示图片
              vm.formData.imagesURL = rsp.localIds;
              syncUpload($.extend([], rsp.localIds));
            }
          });
        },

        handleImgClick: function(imgUrl){
          this.isBigImgDlgShow = true;
          this.bigImgUrl = imgUrl;
        },

        handleImgDelClick: function(imgUrl){
          var pos = this.formData.imagesURL.indexOf(imgUrl);
          pos !== -1 && this.formData.imagesURL.splice(pos, 1);
        },

        handleShowDlgBtnClick: function(){
          if (this.formData.imagesURL && this.formData.imagesURL.length === 0) {
            return alert('请先上传图片！');
          }
          this.confirmDlgType = 1;
        },

        handlePageCloseClick: function() {
          wx.closeWindow();
        }
      }
    });
  </script>
</body>
</html>