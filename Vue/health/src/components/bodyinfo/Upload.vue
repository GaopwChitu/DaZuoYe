<template>
  <div class="info-upload">
    <h1 class="title">身体信息上传</h1>
    <el-form
      :model="form"
      :rules="rules"
      ref="form"
      label-width="100px"
      class="form"
    >
      <el-row>
        <el-col :xs="24" :sm="12">
          <el-form-item label="姓名" prop="name">
            <el-input
              v-model="form.name"
              :placeholder="'请输入姓名'"
            ></el-input>
          </el-form-item>
        </el-col>

        <el-col :xs="24" :sm="12">
          <el-form-item label="年龄" prop="age">
            <el-input-number v-model="form.age" :min="0"></el-input-number>
          </el-form-item>
        </el-col>
      </el-row>

      <el-row>
        <el-col :xs="24" :sm="12">
          <el-form-item label="性别" prop="gender">
            <el-radio-group v-model="form.gender">
              <el-radio label="男">男</el-radio>
              <el-radio label="女">女</el-radio>
            </el-radio-group>
          </el-form-item>
        </el-col>

        <el-col :xs="24" :sm="12">
          <el-form-item label="身高/m" prop="height">
            <el-input-number v-model="form.height" :min="0" :step="0.1"></el-input-number>
          </el-form-item>
        </el-col>
      </el-row>

      <el-row>
        <el-col :xs="24" :sm="12">
          <el-form-item label="体重/kg" prop="weight">
            <el-input-number v-model="form.weight" :min="0"></el-input-number>
          </el-form-item>
        </el-col>

        <el-col :xs="24" :sm="12">
          <el-form-item label="血糖" prop="bloodSugar">
            <el-input-number
              v-model="form.bloodSugar"
              :min="0"
              :step="0.1"
            ></el-input-number>
          </el-form-item>
        </el-col>
      </el-row>

      <el-row>
        <el-col :xs="24" :sm="12">
          <el-form-item label="血压" prop="bloodPressure">
            <el-input-number
              v-model="form.bloodPressure"
              :min="0"
              :step="0.1"
            ></el-input-number>
          </el-form-item>
        </el-col>

        <el-col :xs="24" :sm="12">
          <el-form-item label="胆固醇" prop="bloodLipid">
            <el-input-number
              v-model="form.bloodLipid"
              :min="0"
              :step="0.1"
            ></el-input-number>
          </el-form-item>
        </el-col>
      </el-row>

      <el-row>
        <el-col :xs="24" :sm="12">
          <el-form-item label="心率/BPM" prop="heartRate">
            <el-input-number
              v-model="form.heartRate"
              :min="0"
            ></el-input-number>
          </el-form-item>
        </el-col>

        <el-col :xs="24" :sm="12">
          <el-form-item label="视力/d" prop="vision">
            <el-input-number v-model="form.vision" :min="0" :step="0.1"></el-input-number>
          </el-form-item>
        </el-col>

        <el-col :xs="24" :sm="12">
          <el-form-item label="睡眠时长/h" prop="sleepDuration">
            <el-input-number
              v-model="form.sleepDuration"
              :min="0"
              :step="0.1"
            ></el-input-number>
          </el-form-item>
        </el-col>

        <el-col :xs="24" :sm="12">
          <el-form-item label="睡眠质量" prop="sleepQuality">
            <el-radio-group v-model="form.sleepQuality">
              <el-radio label="好">好</el-radio>
              <el-radio label="一般">一般</el-radio>
              <el-radio label="差">差</el-radio>
            </el-radio-group>
          </el-form-item>
        </el-col>

        <el-col :xs="24" :sm="12">
          <el-form-item label="是否吸烟" prop="smoking">
            <el-switch v-model="form.smoking"></el-switch>
          </el-form-item>
        </el-col>

        <el-col :xs="24" :sm="12">
          <el-form-item label="是否饮酒" prop="drinking">
            <el-switch v-model="form.drinking"></el-switch>
          </el-form-item>
        </el-col>

        <el-col :xs="24" :sm="12">
          <el-form-item label="是否运动" prop="exercise">
            <el-switch v-model="form.exercise"></el-switch>
          </el-form-item>
        </el-col>

        <el-col :xs="24" :sm="12">
          <el-form-item label="喜好的食物种类" prop="foodTypes">
            <el-select v-model="form.foodTypes" placeholder="请选择">
              <el-option label="蔬菜" value="蔬菜"></el-option>
              <el-option label="水果" value="水果"></el-option>
              <el-option label="肉类" value="肉类"></el-option>
              <el-option label="鱼类" value="鱼类"></el-option>
              <el-option label="豆类" value="豆类"></el-option>
              <el-option label="谷物" value="谷物"></el-option>
            </el-select>
          </el-form-item>
        </el-col>

        <el-col :xs="24" :sm="12">
          <el-form-item label="饮水量/ml" prop="waterConsumption">
            <el-input-number
              v-model="form.waterConsumption"
              :min="0"
            ></el-input-number>
          </el-form-item>
        </el-col>
      </el-row>

      <el-form-item>
        <el-button type="primary" @click="submitForm()">点击上传</el-button>
        <el-button @click="resetForm('form')">重置</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
  
<script>

export default {
  name: "Upload",
  data() {
    return {
      form: {
        id: null,
        name: "",
        age: null,
        gender: "",
        height: "",
        weight: "",
        bloodSugar: "",
        bloodPressure: "",
        bloodLipid: "",
        heartRate: null,
        vision: null,
        sleepDuration: null,
        sleepQuality: "",
        smoking: null,
        drinking: null,
        exercise: null,
        foodTypes: "",
        waterConsumption: null,
      },

      rules: {
        name: [
          { required: true, message: "请输入姓名", trigger: "blur" },
          {
            min: 2,
            max: 10,
            message: "长度在 2 到 10 个字符",
            trigger: "blur",
          },
        ],
        age: [
          { required: true, message: "请输入年龄", trigger: "blur" },
          { type: "number", message: "年龄必须为数字值" },
        ],
        gender: [{ required: true, message: "请选择性别", trigger: "change" }],
        height: [
          { required: true, message: "请输入身高", trigger: "blur" },
          { type: "number", message: "身高必须为数字值" },
        ],
        weight: [
          { required: true, message: "请输入体重", trigger: "blur" },
          { type: "number", message: "体重必须为数字值" },
        ],
        bloodSugar: [
          { required: true, message: "请输入血糖", trigger: "blur" },
          { type: "number", message: "血糖必须为数字值" },
        ],
        bloodPressure: [
          { required: true, message: "请输入血压", trigger: "blur" },
          { type: "number", message: "血压必须为数字值" },
        ],
        bloodLipid: [
          { required: true, message: "请输入血脂", trigger: "blur" },
          { type: "number", message: "血脂必须为数字值" },
        ],

        heartRate: [
          { required: true, message: "请输入心率", trigger: "blur" },
          { type: "number", message: "心率必须为数字值" },
        ],
        vision: [
          { required: true, message: "请输入视力", trigger: "blur" },
          { type: "number", message: "视力必须为数字值" },
        ],
        sleepQuality: [
          {
            required: true,
            message: "请选择睡眠质量",
            trigger: "change",
          },
        ],
        smoking: [
          { required: true, message: "请选择是否吸烟", trigger: "change" },
        ],
        drinking: [
          { required: true, message: "请选择是否饮酒", trigger: "change" },
        ],
        exercise: [
          { required: true, message: "请选择是否运动", trigger: "change" },
        ],
        foodTypes: [
          { required: true, message: "请选择摄入较多的食物种类", trigger: "blur" },
        ],
        waterConsumption: [
          { required: true, message: "请输入饮水量", trigger: "blur" },
          { type: "number", message: "饮水量必须为数字值" },
        ],
      },
    };
  },

  methods: {
    async BodyInformation(data) {
      const res = await this.$http.post(`BodyInformation`,data)
      return res.data;
      },
    async BodyInformationNotes(data) {
      const res = await this.$http.post(`BodyInformationNotes`,data)
      return res.data;
    },
    submitForm() {
      // 如果表单数据中没有 id 属性，则将组件的 id 属性赋值给表单数据的 id 属性
      if (!this.form.id) {
        this.form.id = this.id;
      }

      this.$refs.form.validate((valid) => {
        if (valid) {
          this.BodyInformation(this.form)
            .then((response) => {
              this.$message({
                type: "success",
                message: response.message,
              });
            })
            .catch((error) => {
              console.log("BodyInformation错误")
            });
            
          this.BodyInformationNotes(this.form)
            .then((response) => {
              this.$message({
                type: "success",
                message: response.message,
              });
            })
            .catch((error) => {
              console.log("BodyInformationNotes错误")
            });
        } else {
          return false;
        }
      });
    },

    // 重置表单数据的方法
    resetForm(formName) {
      this.$refs[formName].resetFields();
      console.log(this.id);
      this.$message({
        message: "表单已重置",
        type: "info",
      });
    },

    getUserId() {
      const user = JSON.parse(window.sessionStorage.getItem("user"));
      this.id = user.id;
      console.log(this.id)
    },
  },

  created() {
    this.getUserId();
  },
};
</script>
  
<style scoped>
.info-upload {
  max-width: 800px;
  margin: 0 auto;
  padding: 50px;
  background-color: #f5f5f5;
  border-radius: 10px;
  box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.3);
}

.title {
  font-size: 36px;
  text-align: center;
  color: #555;
}

.form {
  max-width: 600px;
  margin: 0 auto;
}
</style>