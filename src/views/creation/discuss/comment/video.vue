<template>
    <div class="comment-box" v-loading="isLoading" :infinite-scroll-distance="40" v-infinite-scroll="scrollBottom"
        :infinite-scroll-disabled="isTheEnd" :infinite-scroll-immediate="false" ref="scrollRef"
        :style="{ height: scrollHeight + 'px' }">
        <div class="comment-item" v-for="item in commentList" :key="item.id">
            <div class="item-left">
                <div class="avatar"><el-avatar :size="52" :src="item.photo" />
                </div>
                <div class="info">
                    <div class="top">
                        <div class="username"><span>{{ item.username }}</span></div>
                        <div class="time"><span>{{ dayjs(item.created_at).format('YYYY.MM.DD.hh.mm') }}</span></div>
                    </div>
                    <div class="comment-text">
                        <div class="comment-content">评论内容 : </div>
                        <VueEllipsis3 :visibleLine="1" :text="item.comment"  @click="jump(item.videoId,item.comment_id)" style="cursor: pointer">
                        <!--  TODO:我希望在这里用defineProps向播放页传递评论id，据此找到对应评论高亮显示，目前想法是引入播放页面组件，传递数据   -->
                        </VueEllipsis3>
                    </div>
                </div>
            </div>
            <div class="item-right">
                <div class="video-info">
                    <el-image class="item-img" :src="item.cover" fit="cover" />
                    <div class="title">
                        <VueEllipsis3 :visibleLine="1" :text="item.title">
                        </VueEllipsis3>
                    </div>
                </div>
            </div>
        </div>
        <div class="record-empty" v-show="commentList.length == 0 && isLoading == false">
          <el-empty description="还未发布视频,快去发布吧~" />
        </div>
        <div class="load-more" v-show="commentList.length > 0 && isLoadMore" v-loading="true">
        </div>
        <!-- 撑开底部 -->
        <div class="spread-bottom">
        </div>
    </div>
</template>

<script lang="ts" setup>
import { getDiscussVideoList } from '@/apis/contribution';
import globalScss from "@/assets/styles/global/export.module.scss";
import { GetDiscussVideoListReq, GetDiscussVideoListRes } from '@/types/creation/discuss/comment';
import { PageInfo } from '@/types/idnex';
import dayjs from "dayjs";
import Swal from 'sweetalert2';
import { nextTick, onMounted, ref } from 'vue';
import { VueEllipsis3 } from 'vue-ellipsis-3';
import { useRouter } from "vue-router";
import useCommentStore from "@/store/comment";
import video from '@/views/show/video/video.vue'


const commentStore=useCommentStore()
components: {
    VueEllipsis3
}

const commentList = ref(<GetDiscussVideoListRes>[])
const pageInfo = ref(<PageInfo>{
    page: 1,
    size: 9,
})
const scrollHeight = ref(0)
const scrollRef = ref()
//是否首次加载
const isLoading = ref(true)
//是否正在加载更多
const isLoadMore = ref(false)
//是否全部加载完成
const isTheEnd = ref(false)


const loadData = async () => {
    try {
        const response = await getDiscussVideoList(<GetDiscussVideoListReq>{
            page_info: pageInfo.value
        })
        console.log('请求视频的评论的返回结果',response)
        //现在拿到了videoId、commentId、commentUserId，可以跳转到对应视频的播放页面，并找到对应的评论高亮显示了
        // TODO: 现在去找跳转到播放页面的方法
        if (!response.data) return false
        if (response.data.length == 0) isTheEnd.value = true
        //更新commentList内容

        commentList.value = [...commentList.value, ...response.data]
        pageInfo.value.page++
        // console.log(response)

    } catch (err) {
        console.log(err)
        Swal.fire({
            title: "加载数据失败",
            heightAuto: false,
            confirmButtonColor: globalScss.colorButtonTheme,
            icon: "error",
        })
    }
}

//加载底部
const scrollBottom = async () => {
    // //无数据时取消加载更多
    if (isLoading.value == true) return false
    isLoadMore.value = true
    if (commentList.value.length <= 0) return false
    await loadData()
    isLoadMore.value = false

}

const router=useRouter()
//跳转到视频播放页面的方法
const jump = (videoId:number,comment_id:number) => {
  //修改commentStore中的highLightCommentId
  commentStore.highLightCommentId=comment_id
  //跳转到播放页面
  router.push({ name: "VideoShow", params: { id: videoId } })
}


onMounted(async () => {
    await loadData()
    isLoading.value = false
    nextTick(() => {
        scrollHeight.value = document.documentElement.clientHeight - scrollRef.value.offsetTop - 20
    })
})


</script>

<style lang="scss" scoped>
@import "@/assets/styles/views/creation/discuss/comment/video.scss";
@import "@/assets/styles/views/creation/manuscript/article.scss";
</style>