<template>
  <!-- 顶部通道 热门分类 -->
  <div class="header-channel">
    <!-- 左边部分 -->
    <div class="header-channel-left">
      <div class="channel-left-item">
        <div class="channel-left-icon bg-orange">
          <SvgIcon name="dynamic" class="icon" color="#fff"></SvgIcon>
        </div>
        <div class="channel-left-item-title">动态</div>
      </div>
      <div class="channel-left-item">
        <div class="channel-left-icon bg-pink">
          <SvgIcon name="flame" class="icon" color="#fff"></SvgIcon>
        </div>
        <div class="channel-left-item-title">热门</div>
      </div>
      <div class="channel-left-item">
        <div class="channel-left-icon bg-green">
          <SvgIcon name="channel" class="icon" color="#fff"></SvgIcon>
        </div>
        <div class="channel-left-item-title">频道</div>
      </div>
    </div>
    <!-- 中间部分 -->
    <div class="header-channel-right">
      <div class="channel-right-box-left">
        <!--   v-for="item in 24" 就是遍历24次      -->
        <div class="right-box-left-item">
          美食
        </div>
        <div class="right-box-left-item" v-for="item in 23">
          番剧
        </div>
      </div>
    <!--  右边部分  -->
      <div class="channel-right-box-right">
        <!--   用一个reactive对象存储多个子组件的name、iconName，然后遍历item，并生成对应组件  -->
        <div class="right-box-right-item" v-for="sideMavigationItem in sideMavigation">
          <SvgIcon :name="sideMavigationItem.iconName" class="icon" color="#61666D"></SvgIcon>
          <span class="channel-text">{{ sideMavigationItem.title }}</span>
        </div>
      </div>
    </div>

  </div>
</template>

<script lang="ts" setup>
import { reactive } from 'vue';

const sideMavigation = reactive([
  { iconName: "columnInformation", title: "专栏" },
  { iconName: "liveStreamPlayer", title: "直播" },
  { iconName: "flag", title: "活动" },
  { iconName: "classroom", title: "课堂" },
  { iconName: "chatList", title: "消息列表" },
  { iconName: "music", title: "歌曲" },
])


</script>

<style scoped lang="scss">
@import "./static/css/homeHeaderChannel.scss";
</style>