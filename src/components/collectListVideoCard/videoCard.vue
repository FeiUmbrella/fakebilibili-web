<template>
    <div :class="{ item: true }" @click="jump()">
        <div :class="{ normal: true }" v-show="!isMouseover">
            <div class="head">
                <div class="item-image" :style="{ backgroundImage: `url(${props.cover})` }"></div>
                <div class="classification">
                    <div class="classification-left">
                    </div>
                    <div class="classification-right">
                        <span>{{ formattingSecondTime(props.video_duration) }}</span>
                    </div>
                </div>
            </div>
            <div class="info">
                <!--    当视频的title文字过长时，溢出的省略为...   -->
                <div class="video-title">
                    <VueEllipsis3 :text="props.title" :visibleLine="2" />
                </div>
                <div class="video-information">
                    <span class="video-information-time">收藏时间 :</span>
                    <SvgIcon name="videoTime" class="icon" color="#999"></SvgIcon>
                    <span class="video-information-time"> {{ dayjs(rFC3339ToTime(props.created_at)).format('YYYY-MM-DD')
                    }}</span>
                </div>

            </div>
        </div>
    </div>
</template>

<script setup lang="ts">

import { formattingSecondTime, rFC3339ToTime } from "@/utils/conversion/timeConversion";
import dayjs from "dayjs";
import { defineProps, ref } from "vue";
import { VueEllipsis3 } from 'vue-ellipsis-3';
import { useRouter } from "vue-router";


components: {
    VueEllipsis3
}


const props = defineProps({
    id: {
        type: Number,
        required: true,
    },
    video_duration: {
        type: Number,
        required: true,
    },
    title: {
        type: String,
        required: true,
    },
    cover: {
        type: String,
        required: true,
    },
    created_at: {
        type: String,
        required: true,
    },
}
)

const router = useRouter()
const isMouseover = ref(false)

const jump = () => {
    router.push({ name: "VideoShow", params: { id: props.id } })
}

</script>

<style scoped lang="scss">
@import "./static/style/videoCard.scss";
</style>