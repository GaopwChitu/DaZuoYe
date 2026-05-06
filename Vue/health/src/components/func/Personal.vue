<template>
  <div>
    <!-- <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/home' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>个人中心</el-breadcrumb-item>
    </el-breadcrumb> -->

    <el-card>
      <el-form ref="editFormRef" :model="editForm" :rules="formRules" label-width="160px">
        <!-- 个人信息表单区域 -->
        <template v-if="!isPasswordMode">
          <el-form-item label="用户名：" prop="username">
            <el-input v-model="editForm.username" style="width: 360px"></el-input>
          </el-form-item>

          <el-form-item label="性别：" prop="sex">
            <el-select v-model="editForm.sex" placeholder="请选择" filterable clearable style="width: 360px">
              <el-option label="男" value="男"></el-option>
              <el-option label="女" value="女"></el-option>
              <el-option label="沃尔玛购物袋" value="沃尔玛购物袋"></el-option>
              <el-option label="武装直升机" value="武装直升机"></el-option>
              <el-option label="不被定义" value="不被定义"></el-option>
              <el-option label="小南娘" value="小南娘"></el-option>
            </el-select>
          </el-form-item>

          <el-form-item label="电话号码：" prop="phone">
            <el-input v-model="editForm.phone" style="width: 360px"></el-input>
          </el-form-item>

          <el-form-item label="地址" prop="address">
            <el-input v-model="editForm.address" style="width: 360px"></el-input>
          </el-form-item>

          <el-form-item label="密码：">
            <el-input v-model="editForm.password" show-password style="width: 360px" disabled></el-input>
            <el-button type="primary" style="margin-left: 20px" @click="switchToPassword">修改密码</el-button>
          </el-form-item>
        </template>

        <!-- 修改密码表单区域 -->
        <template v-else>
          <el-form-item label="新密码：" prop="newPassword">
            <el-input v-model="editForm.newPassword" show-password style="width: 360px"></el-input>
          </el-form-item>

          <el-form-item label="确认密码：" prop="passwordConfirm">
            <el-input v-model="editForm.passwordConfirm" show-password style="width: 360px"></el-input>
          </el-form-item>
        </template>

        <el-form-item>
          <el-button v-if="isPasswordMode" @click="switchToInfo">返回</el-button>
          <el-button type="primary" @click="submitForm" style="float: right">
            {{ isPasswordMode ? '确认修改密码' : '保存个人信息' }}
          </el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script>
export default {
  name: "Personal",
  data() {
    return {
      editForm: {
        id: "",
        username: "",
        sex: "",
        phone: "",
        address: "",
        password: "",
        newPassword: "",
        passwordConfirm: ""
      },
      isPasswordMode: false,

      // 基础规则，后续用watch动态改必填和星号
      formRules: {
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" }
        ],
        sex: [
          { required: true, message: "请选择性别", trigger: "change" }
        ],
        phone: [
          { required: true, message: "请输入手机号", trigger: "blur" }
        ],
        newPassword: [],
        passwordConfirm: []
      }
    };
  },

  watch: {
    // 监听模式切换，动态改校验规则、控制星号*
    isPasswordMode(val) {
      if (val) {
        // 密码模式：新密码、确认密码 必填 + 出星号
        this.formRules.newPassword = [
          { required: true, message: "请输入新密码", trigger: "blur" },
          { min: 6, max: 20, message: "密码为6~20位", trigger: "blur" }
        ];
        this.formRules.passwordConfirm = [
          { required: true, message: "请确认新密码", trigger: "blur" },
          { validator: this.validatePass, trigger: "blur" }
        ];
      } else {
        // 个人信息模式：清空密码校验，无星号、不必填
        this.formRules.newPassword = [];
        this.formRules.passwordConfirm = [];
        // 清空密码输入
        this.editForm.newPassword = "";
        this.editForm.passwordConfirm = "";
      }
      // 重置表单校验状态
      this.$nextTick(() => {
        this.$refs.editFormRef.clearValidate();
      });
    }
  },

  created() {
    this.loadUserInfo();
  },

  methods: {
    // 密码自定义校验
    validatePass(rule, value, callback) {
      if (value !== this.editForm.newPassword) {
        return callback(new Error("两次输入密码不一致"));
      }
      callback();
    },

    // 加载用户信息
    loadUserInfo() {
      const user = JSON.parse(window.sessionStorage.getItem("user"));
      this.editForm = {
        ...user,
        newPassword: "",
        passwordConfirm: ""
      };
    },

    // 切到密码模式
    switchToPassword() {
      this.isPasswordMode = true;
    },

    // 切回个人信息模式
    switchToInfo() {
      this.isPasswordMode = false;
      // 重置为原始用户信息，清空临时修改
      this.loadUserInfo();
    },

    // 统一提交：只用同一个 edituser 接口
    async submitForm() {
      await this.$refs.editFormRef.validate(async valid => {
        if (!valid) return;

        // ===================== 关键修复代码 =====================
        const submitData = { ...this.editForm };
        // 密码模式：把 newPassword 赋值给 password，后端就能识别更新
        if (this.isPasswordMode && submitData.newPassword) {
          submitData.password = submitData.newPassword;
        }
        // ========================================================

        // 调用你的接口
        const { data: res } = await this.$http.put("edituser", submitData);

        if (res !== "success") {
          return this.$message.error("修改失败");
        }
        this.$message.success("修改成功");

        if (this.isPasswordMode) {
          sessionStorage.clear();
          localStorage.clear();
          this.$router.push("/login");
        } else {
          sessionStorage.setItem("user", JSON.stringify(this.editForm));
        }
      });
    }
  }
};
</script>

<style scoped>
.el-breadcrumb {
  margin-bottom: 15px;
  font-size: 17px;
}
</style>