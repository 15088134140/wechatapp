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
      <div class="w-main">
        <div class="weui-form-preview">

          <!-- 销售订单 -->
          <template v-if="billType === '30'">
            <div class="weui-form-preview__hd">
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">销售订单金额合计</label>
                <em class="weui-form-preview__value">¥{{ formData.ddzje || 0 }}</em>
              </div>
            </div>

            <div class="weui-form-preview__bd">
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">单号</label>
                <span class="weui-form-preview__value">{{ formData.vreceiptcode }}</span>
              </div>
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">客户</label>
                <span class="weui-form-preview__value">{{ formData.ccustomerName }}</span>
              </div>
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">部门</label>
                <span class="weui-form-preview__value">{{ formData.cdeptName }}</span>
              </div>
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">业务员</label>
                <span class="weui-form-preview__value">{{ formData.cemployeeName }}</span>
              </div>
              <template v-if="formData.credits[0]">
                <div class="weui-form-preview__item">
                  <label class="weui-form-preview__label">管控额度</label>
                  <span class="weui-form-preview__value">¥{{ formData.credits[0].gked }}</span>
                </div>
                <div class="weui-form-preview__item">
                  <label class="weui-form-preview__label">管控账期</label>
                  <span class="weui-form-preview__value">{{ formData.credits[0].gkzq }}</span>
                </div>
                <div class="weui-form-preview__item">
                  <label class="weui-form-preview__label">占用额度</label>
                  <span class="weui-form-preview__value">¥{{ formData.credits[0].zyed }}</span>
                </div>
                <div class="weui-form-preview__item">
                  <label class="weui-form-preview__label">超额度</label>
                  <span class="weui-form-preview__value">¥{{ formData.credits[0].ced }}</span>
                </div>
                <div class="weui-form-preview__item">
                  <label class="weui-form-preview__label">账期内应收</label>
                  <span class="weui-form-preview__value">¥{{ formData.credits[0].zqnys }}</span>
                </div>
                <div class="weui-form-preview__item">
                  <label class="weui-form-preview__label">超账期应收</label>
                  <span class="weui-form-preview__value">¥{{ formData.credits[0].czqys }}</span>
                </div>
              </template>
              <!-- <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">自编订单号</label>
                <span class="weui-form-preview__value">{{ formData.zbddh }}</span>
              </div>
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">收货人信息</label>
                <span class="weui-form-preview__value">{{ formData.shrxx }}</span>
              </div>
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">物流公司</label>
                <span class="weui-form-preview__value">{{ formData.wlgs }}</span>
              </div> -->
              <div class="weui-form-preview__item" v-if="formData.vnote">
                <label class="weui-form-preview__label">备注</label>
                <span class="weui-form-preview__value">{{ formData.vnote }}</span>
              </div>
            </div>

            <!-- 明细 s-->
            <div class="weui-form-preview__bd w-borrow-list" v-if="formData.details.length">
              <div v-for="item in formData.details">
                <div :class="['w-borrow-list-item', 'w-has-more', {active: item.isShowOther}]" @click="handleShowOtherClick(item)">
                  <div class="w-borrow-list-item-main">
                    <div class="weui-form-preview__item">
                      <label class="weui-form-preview__label">存货名称</label>
                      <span class="weui-form-preview__value">{{ item.invName }}</span>
                    </div>
                    <div class="weui-form-preview__item">
                      <label class="weui-form-preview__label">主数量</label>
                      <span class="weui-form-preview__value">
                        {{ item.nnumber }} {{ item.cunitName }}
                      </span>
                    </div>
                    <div class="weui-form-preview__item w-highlight">
                      <label class="weui-form-preview__label">价税合计</label>
                      <span class="weui-form-preview__value">¥{{ item.nsummny }}</span>
                    </div>
                    <!-- <div :class="['w-item-loadmore', 'weui-cell_link', {active: item.isShowOther}]" @click="handleShowOtherClick(item)">
                      {{ item.isShowOther ? '收起' : '展开' }}更多
                    </div> -->
                  </div>
                  <div class="w-borrow-list-item-other" v-show="item.isShowOther">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">存货编码</label>
                        <span class="weui-form-preview__value">{{ item.invcode }}</span>
                    </div>
                    <div class="weui-form-preview__item">
                      <label class="weui-form-preview__label">规格</label>
                      <span class="weui-form-preview__value">{{ item.invspec }}</span>
                    </div>
                    <!-- <div class="weui-form-preview__item">
                      <label class="weui-form-preview__label">主单位名称</label>
                      <span class="weui-form-preview__value">{{ item.cunitName }}</span>
                    </div>
                    <div class="weui-form-preview__item">
                      <label class="weui-form-preview__label">辅单位名称</label>
                      <span class="weui-form-preview__value">{{ item.cpackunitName }}</span>
                    </div>
                    <div class="weui-form-preview__item">
                      <label class="weui-form-preview__label">换算率</label>
                      <span class="weui-form-preview__value">{{ item.hsl }}</span>
                    </div> -->
                    <div class="weui-form-preview__item">
                      <label class="weui-form-preview__label">辅数量</label>
                      <span class="weui-form-preview__value">
                      {{ item.npacknumber }} {{ item.cpackunitName }}
                      </span>
                    </div>
                    <div class="weui-form-preview__item">
                      <label class="weui-form-preview__label">税率</label>
                      <span class="weui-form-preview__value">{{ item.ntaxrate }}%</span>
                    </div>
                    <div class="weui-form-preview__item">
                      <label class="weui-form-preview__label">含税净价</label>
                      <span class="weui-form-preview__value">¥{{ item.ntaxnetprice }}</span>
                    </div>
                    <div class="weui-form-preview__item">
                      <label class="weui-form-preview__label">无税金额</label>
                      <span class="weui-form-preview__value">¥{{ item.nmny }}</span>
                    </div>
                    <!-- <div class="weui-form-preview__item">
                      <label class="weui-form-preview__label">税额</label>
                      <span class="weui-form-preview__value">¥{{ item.ntaxmny }}</span>
                    </div> -->
                    <div class="weui-form-preview__item" v-if="item.seka">
                      <label class="weui-form-preview__label">色卡</label>
                      <span class="weui-form-preview__value">{{ item.seka }}</span>
                    </div>
                   <!-- <div class="weui-form-preview__item" v-if="item.tconsigntime">
                      <label class="weui-form-preview__label">计划发货日期</label>
                      <span class="weui-form-preview__value">{{ item.tconsigntime }}</span>
                    </div> -->
                    <div class="weui-form-preview__item" v-if="item.frownote">
                      <label class="weui-form-preview__label">行备注</label>
                      <span class="weui-form-preview__value">{{ item.frownote }}</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- 明细 e-->
          </template>

          <!-- 费用报销单 -->
          <template v-else-if="billType === '264X-01'">
            <div class="weui-form-preview__hd">
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">费用报销金额合计</label>
                <em class="weui-form-preview__value">¥{{ formData.bbje }}</em>
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
                <label class="weui-form-preview__label">承担公司</label>
                <span class="weui-form-preview__value">{{ formData.fydwmc }}</span>
              </div>
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">承担部门</label>
                <span class="weui-form-preview__value">{{ formData.deptname }}</span>
              </div>
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">报销人</label>
                <span class="weui-form-preview__value">{{ formData.psnname }}</span>
              </div>
            </div>

            <!-- 报销明细 s-->
            <div class="weui-form-preview__bd w-borrow-list" v-if="formData.details.length">
              <div class="w-borrow-list-item last-highlight" v-for="item in formData.details">
                <div class="weui-form-preview__item">
                  <label class="weui-form-preview__label">收支项目</label>
                  <span class="weui-form-preview__value">{{ item.szxmmc }}</span>
                </div>
                <div class="weui-form-preview__item" v-if="item.defitem14">
                  <label class="weui-form-preview__label">办公费</label>
                  <span class="weui-form-preview__value">¥{{ item.defitem14 }}</span>
                </div>
                <div class="weui-form-preview__item" v-if="item.defitem15">
                  <label class="weui-form-preview__label">招待费</label>
                  <span class="weui-form-preview__value">¥{{ item.defitem15 }}</span>
                </div>
                <div class="weui-form-preview__item" v-if="item.defitem16">
                  <label class="weui-form-preview__label">交通费</label>
                  <span class="weui-form-preview__value">¥{{ item.defitem16 }}</span>
                </div>
                <div class="weui-form-preview__item" v-if="item.defitem17">
                  <label class="weui-form-preview__label">汽车费</label>
                  <span class="weui-form-preview__value">¥{{ item.defitem17 }}</span>
                </div>
                <div class="weui-form-preview__item" v-if="item.defitem18">
                  <label class="weui-form-preview__label">业务宣传费</label>
                  <span class="weui-form-preview__value">¥{{ item.defitem18 }}</span>
                </div>
                <div class="weui-form-preview__item" v-if="item.defitem19">
                  <label class="weui-form-preview__label">运费</label>
                  <span class="weui-form-preview__value">¥{{ item.defitem19 }}</span>
                </div>
                <div class="weui-form-preview__item" v-if="item.defitem21">
                  <label class="weui-form-preview__label">电话费</label>
                  <span class="weui-form-preview__value">¥{{ item.defitem21 }}</span>
                </div>
                <div class="weui-form-preview__item" v-if="item.defitem6">
                  <label class="weui-form-preview__label">其它费用</label>
                  <span class="weui-form-preview__value">¥{{ item.defitem6 }}</span>
                </div>
                <div class="weui-form-preview__item" v-if="item.defitem49">
                  <label class="weui-form-preview__label">交通费标准</label>
                  <span class="weui-form-preview__value">¥{{ item.defitem49 }}</span>
                </div>
                <div class="weui-form-preview__item" v-if="item.defitem50">
                  <label class="weui-form-preview__label">出差补贴标准</label>
                  <span class="weui-form-preview__value">¥{{ item.defitem50 }}</span>
                </div>
                <div class="weui-form-preview__item">
                  <label class="weui-form-preview__label">金额小计</label>
                  <span class="weui-form-preview__value">¥{{ item.amount }}</span>
                </div>
              </div>
            </div>
            <!-- 报销明细 e-->
          </template>

          <!-- 差旅费报销单 ok-->
          <template v-else-if="billType === '2641'">
            <div class="weui-form-preview__hd">
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">差旅费报销金额合计</label>
                <em class="weui-form-preview__value">¥{{ formData.bbje }}</em>
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
                <label class="weui-form-preview__label">承担公司</label>
                <span class="weui-form-preview__value">{{ formData.fydwmc }}</span>
              </div>
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">承担部门</label>
                <span class="weui-form-preview__value">{{ formData.deptname }}</span>
              </div>
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">报销人</label>
                <span class="weui-form-preview__value">{{ formData.psnname }}</span>
              </div>
            </div>

            <!-- 报销明细 s-->
            <div class="weui-form-preview__bd w-borrow-list" v-if="formData.details.length">
              <div class="w-borrow-list-item last-highlight" v-for="item in formData.details">
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label">收支项目</label>
                    <span class="weui-form-preview__value">{{ item.szxmmc }}</span>
                </div>
                <div class="weui-form-preview__item">
                  <label class="weui-form-preview__label">日期</label>
                  <span class="weui-form-preview__value">{{ item.defitem1 }} 至 {{ item.defitem5 }}</span>
                </div>
                <div class="weui-form-preview__item">
                  <label class="weui-form-preview__label">地点</label>
                  <span class="weui-form-preview__value">{{ item.defitem4 }} 至 {{ item.defitem8 }}</span>
                </div>
                <div class="weui-form-preview__item">
                  <label class="weui-form-preview__label">天数</label>
                  <span class="weui-form-preview__value">{{ item.defitem9 }}天</span>
                </div>
                <div class="weui-form-preview__item" v-if="item.defitem10">
                  <label class="weui-form-preview__label">机票费</label>
                  <span class="weui-form-preview__value">¥{{ item.defitem10 }}</span>
                </div>
                <div class="weui-form-preview__item" v-if="item.defitem11">
                  <label class="weui-form-preview__label">车船费</label>
                  <span class="weui-form-preview__value">¥{{ item.defitem11 }}</span>
                </div>
                <div class="weui-form-preview__item" v-if="item.defitem12">
                  <label class="weui-form-preview__label">市内交通费</label>
                  <span class="weui-form-preview__value">¥{{ item.defitem12 }}</span>
                </div>
                <div class="weui-form-preview__item" v-if="item.defitem13">
                  <label class="weui-form-preview__label">住宿费</label>
                  <span class="weui-form-preview__value">¥{{ item.defitem13 }}</span>
                </div>
                <div class="weui-form-preview__item" v-if="item.defitem2">
                  <label class="weui-form-preview__label">出差补助</label>
                  <span class="weui-form-preview__value">¥{{ item.defitem2 }}</span>
                </div>
                <div class="weui-form-preview__item" v-if="item.defitem3">
                  <label class="weui-form-preview__label">住宿节约补助</label>
                  <span class="weui-form-preview__value">¥{{ item.defitem3 }}</span>
                </div>
                <div class="weui-form-preview__item" v-if="item.defitem6">
                  <label class="weui-form-preview__label">其他费用</label>
                  <span class="weui-form-preview__value">¥{{ item.defitem6 }}</span>
                </div>
                <div class="weui-form-preview__item">
                  <label class="weui-form-preview__label">金额小计</label>
                  <span class="weui-form-preview__value">¥{{ item.amount }}</span>
                </div>
              </div>
            </div>
            <!-- 报销明细 e-->
          </template>

          <!-- 借款单 ok-->
          <template v-else-if="billType === '263X-01'">
            <div class="weui-form-preview__hd">
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">借款单金额合计</label>
                <em class="weui-form-preview__value">¥{{ formData.bbje }}</em>
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
                <label class="weui-form-preview__label">承担公司</label>
                <span class="weui-form-preview__value">{{ formData.fydwmc }}</span>
              </div>
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">承担部门</label>
                <span class="weui-form-preview__value">{{ formData.deptname }}</span>
              </div>
              <div class="weui-form-preview__item">
                <label class="weui-form-preview__label">借款人</label>
                <span class="weui-form-preview__value">{{ formData.psnname }}</span>
              </div>
              <div class="weui-form-preview__item" v-if="formData.sum_jkye">
                <label class="weui-form-preview__label">借款余额</label>
                <span class="weui-form-preview__value">¥{{ formData.sum_jkye }}</span>
              </div>
            </div>
            <!-- 借款项 s-->
            <div class="weui-form-preview__bd w-borrow-list" v-if="formData.details.length">
              <div class="w-borrow-list-item last-highlight" v-for="item in formData.details">
                <div class="weui-form-preview__item">
                  <label class="weui-form-preview__label">事由</label>
                  <span class="weui-form-preview__value">{{ item.defitem2 }}</span>
                </div>
                <div class="weui-form-preview__item">
                  <label class="weui-form-preview__label">金额小计</label>
                  <span class="weui-form-preview__value">¥{{ item.amount }}</span>
                </div>
              </div>
            </div>
            <!-- 借款项 e-->
          </template>

          <!-- 未知类型 -->
          <template v-else>
            <div>
              未知类型
            </div>
          </template>
          
          <!-- 审批流程 s-->
          <div class="weui-form-preview__ft w-step" flex="dir:top">
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
              <!-- <div class="weui-actionsheet__cell" @click="handleOptBtnClick(2)">不批准</div> -->
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
            bbje: "--",
            deptname: "--",
            details: [],
            djbh: "--",
            djrq: "--",
            fydeptid: "--",
            fydwbm: "--",
            fydwmc: "--",
            jkbxr: "--",
            psnname: "--",
            spqks: [],
            credits: []
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
                rsp.rsData.details.forEach(function (item){
                  item.isShowOther = false;
                });
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
                //window.location.href = './borrowBillList.html?pageType=' + vm.pageType;
            	  vm.origin !== 'push' ? vm.goBackList(vm) : wx.closeWindow();
              });
            } else {
              alert(rsp.msg || '审批失败，请重试！');
            }
          }, 'json');
        },

        handleDlgBtnCancelClick: function(){
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