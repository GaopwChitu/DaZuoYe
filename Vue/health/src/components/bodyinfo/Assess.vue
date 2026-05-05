<template>
  <div class="container">
    <div class="box first-box">
      <div class="title">身体信息</div>
      <div class="content" style="margin-left: 15%">
        <div class="info">
          <div class="label">体重：</div>
          <div class="value">
            {{ bodyInfo.weight }}<span class="unit">kg</span>
          </div>
        </div>
        <div class="info">
          <div class="label">身高：</div>
          <div class="value">
            {{ bodyInfo.height }}<span class="unit">m</span>
          </div>
        </div>
        <div class="info">
          <div class="label">BMI：</div>
          <div class="value">{{ this.bmiM }}</div>
        </div>
        <div class="info">
          <div class="label">血糖：</div>
          <div class="value">
            {{ bodyInfo.bloodSugar }} <span class="unit">mmol/L</span>
          </div>
        </div>
        <div class="info">
          <div class="label">血压：</div>
          <div class="value">
            {{ bodyInfo.bloodPressure }}<span class="unit">mmHg</span>
          </div>
        </div>
        <div class="info">
          <div class="label">胆固醇：</div>
          <div class="value">
            {{ bodyInfo.bloodLipid }} <span class="unit">mmol/l</span>
          </div>
        </div>
        <div class="info">
          <div class="label">心率：</div>
          <div class="value">
            {{ bodyInfo.heartRate }} <span class="unit">次/分钟</span>
          </div>
        </div>
        <div class="info">
          <div class="label">视力：</div>
          <div class="value">
            {{ bodyInfo.vision }} <span class="unit">度</span>
          </div>
        </div>
      </div>
      <div class="img">
        <el-image
          :src="'https://iconfont.alicdn.com/p/illus/preview_image/wcwEhOY9RUN5/a8473b97-4658-486d-a5f0-9ef41fa19a16.png'"
          class="image_info"></el-image>
      </div>
    </div>

    <div class="box">
      <div class="title">疾病分析</div>
      <div id="diseaseChart" class="content">
        <div class="info">
          <div class="label_vision">可能的疾病：</div>
          <div class="value">{{ this.risk }}<span class="unit"></span></div>
        </div>
        <div class="info">
          <div class="label_vision" style="color: red">注意：</div>
          <div class="value">
            {{
              "以上风险只是根据您上传的身体数据进行最基本的分析，并不能作为真正的结果，不管有没有风险，都需要保持运动，如有不舒服的地方请马上就医。"
            }}<span class="unit"></span>
          </div>
        </div>
      </div>
      <div class="img">
        <el-image
          :src="'https://iconfont.alicdn.com/p/illus/preview_image/zrJg50KPJKBZ/09bec066-766e-4eaf-aded-fb4cb519ba8f.png'"
          class="image" style="width: 150px; height: auto; margin-top: 10px"></el-image>
      </div>
    </div>

    <div class="box">
      <div class="title">基础能量消耗状况</div>
      <el-progress type="circle" :percentage="Number(this.Standard_hight)" style="margin-left: 100px; margin-top: 30px"
        :show-text="true"></el-progress>
      <el-progress type="circle" :percentage="Number(this.BMR)" color="red" style="margin-left: 100px; margin-top: 30px"
        :show-text="true"></el-progress>
      <div style="padding-left: 80px; margin-top: 20px">
        到达身体年龄的百分比
      </div>
      <div style="padding-left: 340px; margin-top: -20px">基本能量消耗</div>
    </div>

    <div class="box">
      <div class="title">肥胖分析</div>
      <div class="content">
        <div style="display: flex; justify-content: right">
          <el-progress :percentage="percentage" :show-text="false" style="width: 70%; margin-top: 20px"></el-progress>
        </div>
        <div class="info" style="margin-top: 30px">
          <div class="label_vision">根据计算：</div>
          <div class="value">{{ determineHealthRisk }}</div>
        </div>
        <div class="info">
          <div class="label_vision">肥胖可能的风险：</div>
          <div class="value">{{ Disease_risk }}</div>
        </div>
      </div>
      <div class="img">
        <el-image
          :src="'https://iconfont.alicdn.com/p/illus/preview_image/zrJg50KPJKBZ/49b681a7-4ad0-4bf4-b982-b57eac2e335a.png'"
          class="image" style="width: 150px; height: auto; margin-top: 10px"></el-image>
      </div>
    </div>

    <div class="box">
      <div class="title">生活习惯分析</div>
      <div class="content">
        <div class="info">
          <div class="label_vision">您的习惯如下：</div>
        </div>
        <div class="value" style="margin-left: 20px">{{ this.habits }}</div>
        <div class="info" style="padding-top: 25px">
          <div class="label_vision">建议：</div>
          <div class="value">
            阅读运动知识，更好地了解运动的正确姿势和方法，通过了解运动的原理和科学知识，我们可以更好地制定运动计划，减少运动中的风险和不适，避免受伤和疾病的发生。
          </div>
        </div>
      </div>
      <div class="img">
        <el-image
          :src="'https://iconfont.alicdn.com/p/illus/preview_image/zrJg50KPJKBZ/f33096cb-6bb6-4fe3-96a6-a9a5bfa52664.png'"
          class="image" style="width: 150px; height: auto"></el-image>
      </div>
    </div>

    <div class="box">
      <div class="title">视力分析</div>
      <div class="content">
        <div class="info">
          <div class="label_vision">您的视力为：</div>
          <div class="value">
            {{ bodyInfo.vision }}<span class="unit"></span>
          </div>
        </div>
        <div class="info">
          <div class="label_vision">近视等级：</div>
          <div class="value">{{ visionType }}<span class="unit"></span></div>
        </div>
        <div class="info">
          <div class="label_vision">建议：</div>
          <div class="value">
            {{ visionSuggestion }}<span class="unit"></span>
          </div>
        </div>
      </div>
      <div class="img">
        <el-image
          :src="'https://iconfont.alicdn.com/p/illus/preview_image/ONt16UXciymo/dd2e4737-456e-4e9e-aff7-94bd9f84c99a.png'"
          class="image" style="width: 150px; height: auto"></el-image>
      </div>
    </div>

    <div class="box">
      <div class="title">体型判断</div>
      <div class="content">
        <div class="info">
          <div class="label_vision">您的体型属于：</div>
          <div class="value">{{ bodyType }}<span class="unit"></span></div>
        </div>
        <div class="info">
          <div class="label_vision">建议：</div>
          <div class="value">{{ bodyTypeSuggestion }}</div>
        </div>
      </div>
      <div class="img">
        <el-image
          :src="'https://iconfont.alicdn.com/p/illus/preview_image/zrJg50KPJKBZ/7a99752f-e718-4e8b-966f-0d2eebdd3ce8.png'"
          class="image" style="width: 150px; height: auto"></el-image>
      </div>
    </div>

    <div class="boxScore">
      <div class="titleScore">健康评分</div>
      <div>{{ this.score }}</div>
    </div>

    <div class="box"></div>
  </div>
</template>

<script>
export default {
  name: "Assess",
  data() {
    return {
      bodyInfo: "",
      bmi: null,
      risk: "",
      Standard_hight: null,
      metabolic_rate: null,
      BMR: null,
      habits: "",
      score: 100,
      habits_count: [],
    };
  },

  computed: {
    bmiM() {
      // 从bodyInfo中获取身高和体重的值，并转换为 Number 类型
      const weight = Number(this.bodyInfo.weight);
      // 计算BMI值
      const bmiValue = weight / (this.bodyInfo.height * this.bodyInfo.height);
      // 返回计算结果并保留两位小数
      this.bmi = bmiValue.toFixed(2);
      return bmiValue.toFixed(2);
    },

    percentage() {
      const bmi = this.bmi;
      const percentage = Math.round((bmi / 35) * 100);
      return Math.min(100, Math.max(0, percentage)); // 确保结果在0到100之间
    },

    visionType() {
      const vision = this.bodyInfo.vision;
      if (vision >= 600) {
        return "高度近视";
      } else if (vision >= 300 && vision <= 600) {
        return "中度近视";
      } else if (vision > 0 && vision <= 300) {
        return "轻度近视";
      } else if (vision === 0) {
        return "没有近视";
      }
    },

    visionSuggestion() {
      const visionType = this.visionType;
      if (visionType === "高度近视") {
        return "积极治疗，建议就医";
      } else if (visionType === "中度近视") {
        return "注意保护眼睛，建议定期检查视力";
      } else if (visionType === "轻度近视") {
        return "加强锻炼，注意用眼卫生";
      } else if (visionType === "没有近视") {
        return "很好，保持生活习惯，注意保护眼睛";
      }
    },

    bodyType() {
      if (this.bmiM >= 28) {
        return "肥胖型";
      } else if (this.bmiM > 24 && this.bmiM <= 28) {
        return "超重体型";
      } else if (this.bmiM >= 0 && this.bmiM <= 24) {
        return "正常体型";
      }
    },

    determineHealthRisk() {
      if (this.bmiM >= 28) {
        return "您的体重太大了，请马上减肥";
      } else if (this.bmiM > 24 && this.bmiM <= 28) {
        return "您的体重过大，请及时减肥";
      } else if (this.bmiM >= 0 && this.bmiM <= 24) {
        return "您的体重正常，请保持健康生活";
      }
    },
    Disease_risk() {
      if (this.bmiM >= 28) {
        return "心脏病、中风、高血压和高胆固醇，增加心脏病，还有糖尿病、呼吸系统疾病、关节炎等风险";
      } else if (this.bmiM > 24 && this.bmiM <= 28) {
        return "容易导致高血压、高胆固醇、心脏病、中风、患糖尿病的风险，胰岛素分泌异常以及呼吸系统疾病";
      } else if (this.bmiM >= 0 && this.bmiM <= 24) {
        return "风险不大，但是要保证摄入足够的蛋白质、碳水化合物和脂肪";
      }
    },

    bodyTypeSuggestion() {
      if (this.bodyType === "肥胖型") {
        return "控制饮食，增加运动量，并寻求专业医师的指导。";
      } else if (this.bodyType === "超重体型") {
        return "注意饮食健康，控制摄入量，并加强有氧运动，提高身体代谢率。";
      } else if (this.bodyType === "正常体型") {
        return "保持良好的生活习惯，适当参加运动，均衡饮食，保持身体健康。";
      }
    },
  },

  methods: {
    async getBodyInfo() {
      const user = JSON.parse(window.sessionStorage.getItem("user"));
      try {
        const res = await this.$http.get("bodyinfo", {
          params: {
            id: user.id,
            username: user.username,
            password: user.password,
            email: user.email,
            role: user.role,
            state: user.state,
          }
        });
        this.bodyInfo = res.data.data.bodyList[0];
      } catch (error) {
        console.log("我真的服了，获取BodyInfo错误");
      }
    },
    habits_customs() {
      let habits = [];
      this.habits_count = habits;
      // 判断膳食习惯
      if (this.bodyInfo.foodTypes === "蔬菜") {
        habits.push("爱吃蔬菜");
      }
      if (this.bodyInfo.foodTypes === "水果") {
        habits.push("爱吃水果");
      }
      if (this.bodyInfo.foodTypes === "肉类") {
        habits.push("爱吃肉");
      }
      if (this.bodyInfo.foodTypes === "鱼类") {
        habits.push("爱吃鱼");
      }
      if (this.bodyInfo.foodTypes === "豆类") {
        habits.push("爱吃豆类");
      }
      if (this.bodyInfo.foodTypes === "谷物") {
        habits.push("爱吃五谷");
      }

      if (this.bodyInfo.bloodSugar > 7) {
        habits.push("摄入的糖分和生活习惯不好");
      } else {
        habits.push("血糖水平正常");
      }

      if (this.bodyInfo.bloodPressure > 5.2) {
        habits.push("高胆固醇饮食");
      } else {
        habits.push("低胆固醇饮食");
      }

      if (this.bodyInfo.heartRate > 100) {
        habits.push("经常紧张焦虑和压力");
      } else {
        habits.push("心情还不错");
      }

      if (this.bodyInfo.vision > 50) {
        habits.push("熬夜过多过度劳累");
      } else {
        habits.push("准时睡觉");
      }

      if (this.bodyInfo.sleepDuration < 8) {
        habits.push("睡眠不足");
      } else {
        habits.push("睡眠充足");
      }

      if (this.bodyInfo.sleepQuality === "好") {
        habits.push("熬夜过多过度劳累");
      } else if (this.bodyInfo.sleepQuality === "一般") {
        habits.push("需要注意睡眠质量");
      } else if (this.bodyInfo.sleepQuality === "差") {
        habits.push("需要改善睡眠质量");
      }
      if (this.bodyInfo.smoking === true) {
        habits.push("吸烟");
      } else {
        habits.push("不吸烟");
      }

      if (this.bodyInfo.drinking === true) {
        habits.push("饮酒");
      } else {
        habits.push("未饮酒");
      }
      if (this.bodyInfo.exercise === true) {
        habits.push("积极锻炼");
      } else {
        habits.push("缺乏运动");
      }

      if (this.bodyInfo.waterConsumption < 1000) {
        habits.push("饮水不足");
      } else {
        habits.push("饮水充足");
      }

      this.habits = habits.join("，");
    },

    diseaserisk() {
      if (this.bodyInfo.bloodPressure >= 90) {
        this.risk += "高血压，";
      }
      if (this.bodyInfo.bloodLipid > 3) {
        this.risk += "高血脂，";
      }
      if (this.bodyInfo.bloodSugar > 6.1) {
        this.risk += "糖尿病，";
      }
      if (this.bodyInfo.drinking > 3) {
        this.risk += "酗酒，";
      }
      if (this.bodyInfo.exercise < 3) {
        this.risk += "缺乏运动，";
      }
      if (this.bodyInfo.heartRate > 100) {
        this.risk += "心率过快，";
      }
      if (this.bodyInfo.sleepDuration < 7 || this.bodyInfo.sleepQuality < 3) {
        this.risk += "睡眠不足，";
      }
      if (this.bodyInfo.smoking > 0) {
        this.risk += "肺炎，";
      }
      if (this.bodyInfo.vision <= 300) {
        this.risk += "近视，";
      }
      if (this.bodyInfo.waterConsumption < 1500) {
        this.risk += "结石";
      }
    },

    compareAgeAndHeight() {
      const height = this.bodyInfo.height;
      const sex = this.bodyInfo.sex;
      let Standardhight = null;
      if (sex === "男") {
        Standardhight = (height - 80) * 0.7 + 160;
        this.Standard_hight = ((Standardhight / height) * 1).toFixed(2);
      } else {
        Standardhight = (height - 70) * 0.6 + 160;
        this.Standard_hight = ((Standardhight / height) * 1).toFixed(2);
      }
    },

    supersession() {
      const height = this.bodyInfo.height;
      const weight = this.bodyInfo.weight;
      const age = this.bodyInfo.age;
      const BMR1 = (88.36 + 13.4 * weight + 4.8 * height - 5.7 * age).toFixed(
        2
      );
      const reference = 1200; // 假设BMR的参考值为每天所需热量的1200卡路里

      this.BMR = Math.round((BMR1 / reference) * 100); // 计算BMR占参考值的百分比
    },

    scoreCom() {
      if (this.bodyInfo.vision > 30) {
        this.score = this.score - 25;
      }
      if ((this.risk.match(/,/g) || []).length > 6) {
        console.log((this.risk.match(/,/g) || []).length);
        this.score = this.score - 25;
      }

      if (this.bmi > 24) {
        this.score = this.score - 25;
      }
      if (this.Standard_hight < 80) {
        this.score = this.score - 25;
      }
    },
  },

  watch: {
    bodyInfo: {
      deep: true,
      handler() {
        this.diseaserisk();
        this.compareAgeAndHeight();
        this.supersession();
        this.habits_customs();
        this.scoreCom();
      },
    },
  },

  created() {
    this.getBodyInfo();
  },

  mounted() { },
};
</script>

<style scoped>
.label_vision {
  font-size: 16px;
  font-weight: bold;
  color: #666;
}

.titleScore {
  font-size: 20px;
  font-weight: bold;
  margin-bottom: 10px;
}

.boxScore {
  width: 270px;
  height: 270px;
  background-color: #ffdffa;
  border-radius: 50%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  font-family: Arial, sans-serif;
  font-size: 40px;
  font-weight: bold;
  color: #333333;
  margin-left: 130px;
}

.container {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: repeat(3, 1fr);
  gap: 20px;
  height: 100vh;
  padding: 20px;
  box-sizing: border-box;
}

.box {
  background-color: #fff;
  box-shadow: 0 0 10px rgba(76, 122, 184, 0.3);
  border-radius: 10px;
  float: left;
  position: relative;
}

.first-box {
  grid-row: 1 / 3;
}

.content {
  padding: 20px;
  box-sizing: border-box;
  display: inline-block;
  position: absolute;
  width: 70%;
  height: auto;
}

.content_fp {
  text-align: center;
  padding: 20px;
  box-sizing: border-box;
}

.img {
  position: absolute;
  left: 50%;
  width: 50%;
  height: 50%;
}

.image_info {
  position: absolute;
  width: 100%;
  height: 70%;
  margin-top: 350px;
  margin-left: -120px;
}

.title {
  font-size: 25px;
  font-weight: bold;
  margin-bottom: 10px;
  margin-top: 5px;
  text-shadow: 2px 2px 4px rgba(148, 28, 138, 0.5);
  color: #1e90ff;
  text-align: center;
}

.info {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
  position: relative;
  margin-left: 20px;
  /* 调整左侧信息区域的间距 */
}

.info::after {
  content: "";
  position: absolute;
  bottom: -5px;
  left: 0;
  width: 100%;
  height: 1px;
  background-color: #ddd;
}

.label {
  width: 80px;
  font-size: 25px;
  font-weight: bold;
  color: #555;
}

.value {
  font-size: 14px;
  color: #333;
  display: flex;
  align-items: center;
}

.image {
  width: 100px;
  height: auto;
  float: right;
  /* 图片向右浮动 */
  margin-left: 20px;
  /* 给图片和左侧元素之间添加间距 */
}

.weight {
  font-size: 20px;
  font-weight: bold;
  margin-right: 10px;
}

.height {
  font-size: 20px;
  font-weight: bold;
  margin-right: 10px;
}

.bmi {
  font-size: 24px;
  font-weight: bold;
  color: #f00;
}

.unit {
  font-size: 20px;
  font-weight: normal;
  margin-left: 5px;
  color: #555;
}
</style>
