<template>
  <div class="box_Detail">
    <div class="box1">
      <el-image fit="contain" :src="detailInfo.sportType === '瑜伽'
        ? 'https://img2.baidu.com/it/u=2510084494,3174869554&fm=253&fmt=auto&app=120&f=JPEG?w=1422&h=800'
        : detailInfo.sportType === '跑步'
          ? 'https://img0.baidu.com/it/u=1104443773,2462974808&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500'
          : detailInfo.sportType === '太极拳'
            ? 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F8622319%2Fc755f97cda1646b7b61cf07e8b8ff530.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvODYyMjMxOS9jNzU1Zjk3Y2RhMTY0NmI3YjYxY2YwN2U4YjhmZjUzMC5qcGc%3D%2Fsign%2F2f5cc377ac0b52301613d472737f32d6.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1685467561&t=1e67f20bf6624a35af02cdd0af9853d6'
            : detailInfo.sportType === '越野跑'
              ? 'https://img0.baidu.com/it/u=1104443773,2462974808&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500'
              : detailInfo.sportType === '快跑'
                ? 'https://img0.baidu.com/it/u=1104443773,2462974808&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500'
                : detailInfo.sportType === '慢跑'
                  ? 'https://img0.baidu.com/it/u=1104443773,2462974808&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500'
                  : detailInfo.sportType === '羽毛球'
                    ? 'https://dingyue.ws.126.net/KDl0ByjLstLLrx3NJHNFWHWwWAPFmjJ9ZfWPGF6I1=6VH1534509561915compressflag.jpg'
                    : detailInfo.sportType === '爬山'
                      ? 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F2363585%2F4155d213815a40ff853ea65eb2b2bb5b.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvMjM2MzU4NS80MTU1ZDIxMzgxNWE0MGZmODUzZWE2NWViMmIyYmI1Yi5qcGc%3D%2Fsign%2F8a0187eb2f2c035dfd34168dda72cbf0.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1685467756&t=34c700d3fc2bf0a700ab2809b9878138'
                      : detailInfo.sportType === '游泳'
                        ? 'https://image.zsbtv.com.cn/images/2021/3/1/2021311614593116132_198.jpg'
                        : detailInfo.sportType === '滑冰'
                          ? 'https://img2.baidu.com/it/u=969030030,3125151998&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500'
                          : detailInfo.sportType === '跆拳道'
                            ? 'https://img.wifiwx.com/material/news/img/2018/11/ecdc969d7d62b41b4ef79aa75cbb8b93.jpg'
                            : detailInfo.sportType === '体操'
                              ? 'https://img2.baidu.com/it/u=3179170246,2455220037&fm=253&fmt=auto&app=120&f=JPEG?w=1422&h=800'
                              : detailInfo.sportType === '拔河'
                                ? 'https://img0.baidu.com/it/u=327984275,2262431634&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500'
                                : 'https://p5.toutiaoimg.com/origin/pgc-image/09530a0e2471422f9854cc7436c4ad97?from=pc'
        " class="image"></el-image>

      <div class="info1">
        <div class="info-item">
          <h1>运动详情</h1>
        </div>
        <div class="info-item" style="">
          运动种类：{{ detailInfo.sportType }}
        </div>
        <div class="info-item">适宜时间：{{ detailInfo.suitableTime }}</div>
        <div class="info-item">
          运动心率：{{ detailInfo.suitableHeartRate }}
        </div>
        <div class="info-item">
          适宜频率：{{ detailInfo.suitableFrequency }}
        </div>
        <div class="info-item">推荐速度：{{ detailInfo.recommendedSpeed }}</div>
      </div>
    </div>
    <div class="box2">
      <div class="button1">
        <button class="buttonDetail" @click="showBox('forbiddenDiseases')">
          禁忌疾病
        </button>
        <button class="buttonDetail" @click="showBox('methodIntroduction')">
          方法介绍
        </button>
        <button class="buttonDetail" @click="showBox('attentionItems')">
          注意事项
        </button>
      </div>
    </div>
    <div class="box3">
      <div class="card" v-if="showForbiddenDiseases">
        <div class="card-header">{{ detailInfo.sportType }}禁忌疾病</div>
        <div class="card-body">{{ detailInfo.disease }}</div>
      </div>

      <div class="card" v-if="showMethodIntroduction">
        <div class="card-header">{{ detailInfo.sportType }}方法介绍</div>
        <div class="card-body">{{ detailInfo.method }}</div>
      </div>

      <div class="card" v-if="showAttentionItems">
        <div class="card-header">{{ detailInfo.sportType }}注意事项</div>
        <div class="card-body">{{ detailInfo.notes }}</div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "SportInfo",
  data() {
    return {
      detailInfo: {},
      showForbiddenDiseases: true,
      showMethodIntroduction: false,
      showAttentionItems: false,

      images: [
        "https://empic.dfcfw.com/761946027478720513/w1420h947/art",
        "https://p8.itc.cn/q_70/images03/20210802/1597066766af4684946b5940f8cb36e6.jpeg",
        "https://img0.baidu.com/it/u=3800145789,2403607566&fm=253&fmt=auto&app=138&f=JPEG?w=720&h=368",
        "https://hbimg.b0.upaiyun.com/308b8599b4dc85e102ac4ad060305b323b38321317c81-Rd5GPN_fw658",
        "https://img1.baidu.com/it/u=2566321546,3281625737&fm=253&fmt=auto&app=120&f=JPEG?w=1080&h=721",
        "https://img0.baidu.com/it/u=1391336833,3009778727&fm=253&fmt=auto&app=138&f=JPEG?w=754&h=498",
        "https://hbimg.b0.upaiyun.com/f014e055fde5e39abbd7bd943a5252b10140996d928b-XWH37L_fw658",
        "https://img2.baidu.com/it/u=3306297078,533482255&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
        "https://img1.baidu.com/it/u=1374909886,1526528659&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
        "https://img2.baidu.com/it/u=71595488,1424943733&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
        "https://dingyue.ws.126.net/KDl0ByjLstLLrx3NJHNFWHWwWAPFmjJ9ZfWPGF6I1=6VH1534509561915compressflag.jpg",
        "https://img-baofun.zhhainiao.com/fs/c542ba4785c2e077f683c55a7c40ec15.jpg",
        "https://img2.baidu.com/it/u=3157243463,1027468323&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
      ],
    };
  },
  mounted() {
    const detailInfo = this.$route.query;
    this.detailInfo = detailInfo;
  },
  methods: {
    showBox(box) {
      if (box === "forbiddenDiseases") {
        this.showForbiddenDiseases = true;
        this.showMethodIntroduction = false;
        this.showAttentionItems = false;
      } else if (box === "methodIntroduction") {
        this.showForbiddenDiseases = false;
        this.showMethodIntroduction = true;
        this.showAttentionItems = false;
      } else if (box === "attentionItems") {
        this.showForbiddenDiseases = false;
        this.showMethodIntroduction = false;
        this.showAttentionItems = true;
      }
    },

    home() {
      this.$router.push({ path: window.sessionStorage.getItem("activePath") });
    },
  },
};
</script>

<style scoped>
.box_Detail {
  height: 100%;
  width: 100%;
  background-color: rgb(240, 239, 239);
  overflow: auto;
  /* 添加滚动条 */
}

.section {
  margin-top: 20px;
}

.section-title {
  font-weight: bold;
  font-size: 18px;
  margin-bottom: 5px;
}

.section-content {
  font-size: 16px;
  line-height: 1.5;
}

.box1 {
  height: 50%;
  width: 100%;
  background-color: rgb(255, 255, 255);
  margin: 10.01px 10.01px 0;
  display: flex;
  flex-direction: row;
}

/* 设置 info 的宽度为 100%，并让它内部的子元素垂直排列 */
.info1 {
  width: 50%;
  display: flex;
  flex-direction: column;
  align-items: flex-end;
  margin-bottom: 100px;
  margin-left: auto;
  /* 将 .info1 推到 .box1 的右侧 */
  margin-right: 10%;
}

/* 为每个 info-item 添加虚线分割线 */
.info-item {
  display: block;
  margin-bottom: 10px;
  border-bottom: 1px dashed #ccc;
  width: 50%;
  text-align: center;
  line-height: 60px;
  /* 设置行间距为 20px */
}

.buttonDetail {
  padding: 10px 20px;
  border: none;
  background-color: #e9cba3;
  color: #fff;
  font-size: 16px;
  cursor: pointer;
  margin-right: 50px;
  margin-top: 14px;
}

.button1 {
  margin-left: 30px;
}

button:hover {
  background-color: #0056b3;
}

.left-align {
  text-align: left;
}

.box2 {
  height: 7%;
  width: 97%;
  background-color: rgb(255, 255, 255);
  margin: 50px auto 0;
  flex: 1;
  /* 平均分配剩余空间 */
}

.box3 {
  height: 40%;
  width: 97%;
  background-color: rgb(255, 255, 255);
  margin: 50px auto 0;
  flex: 1;
  /* 平均分配剩余空间 */
}

.card {
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  margin-bottom: 20px;
}

.card-header {
  background-color: #f8f9fa;
  border-bottom: 1px solid #dee2e6;
  font-size: 30px;
  font-weight: bold;
  padding: 10px;
}

.card-body {
  padding: 10px;
  font-size: 25px;
}
</style>
