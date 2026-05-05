<template>
  <div class="register_container">
    <div class="register_box">
      <h1>用户注册</h1>
      <el-form :model="registerForm" ref="registerFormRef" :rules="rules" label-width="80px" class="register_form">
        <el-form-item label="用户名" prop="username">
          <el-input v-model="registerForm.username" placeholder="请输入用户名"></el-input>
        </el-form-item>
        <el-form-item label="性别：" prop="sex">
          <el-select v-model="registerForm.sex" placeholder="请选择" filterable clearable>
            <el-option label="男" value="男"></el-option>
            <el-option label="女" value="女"></el-option>
            <el-option label="沃尔玛购物袋" value="沃尔玛购物袋"></el-option>
            <el-option label="武装直升机" value="武装直升机"></el-option>
            <el-option label="不被定义" value="不被定义"></el-option>
            <el-option label="小南娘" value="小南娘"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="密码" prop="password">
          <el-input v-model="registerForm.password" show-password placeholder="请输入密码"></el-input>
        </el-form-item>
        <el-form-item label="确认密码" prop="confirmPassword">
          <el-input v-model="registerForm.confirmPassword" show-password placeholder="请确认密码"></el-input>
        </el-form-item>
        <el-form-item label="邮箱" prop="email">
          <el-input v-model="registerForm.email" placeholder="请输入邮箱"></el-input>
        </el-form-item>
        <el-form-item label="电话号码" prop="phone">
          <el-input v-model="registerForm.phone" placeholder="请输入电话号码"></el-input>
        </el-form-item>
        <el-form-item label="地址" prop="address">
          <el-input v-model="registerForm.address" placeholder="请输入地址"></el-input>
        </el-form-item>
        <el-form-item class="btns">
          <el-button type="primary" @click="submitForm">注册</el-button>
          <el-button type="primary" @click="back">返回</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>
<script>

export default {
  name: "Register",
  data() {
    return {
      registerForm: {
        username: 'a',
        password: '123456',
        confirmPassword: '123456',
        email: '',
        phone: '',
        address: '',
      },
      rules: {
        username: [
          { required: true, message: "用户名为必填项", trigger: "blur" },
          { min: 1, max: 20, message: "长度在 1 到 20 个字符", trigger: "blur" }
        ],
        password: [
          { required: true, message: "密码为必填项", trigger: "blur" },
          { min: 6, max: 20, message: "密码为 6~20 位", trigger: "blur" }
        ],
        confirmPassword: [
          { required: true, message: '请再次输入密码', trigger: 'blur' },
          { validator: this.validateConfirmPassword, trigger: 'blur' }
        ],
        email: [
          { required: true, message: '邮箱为必填项', trigger: 'blur' },
          { type: 'email', message: '邮箱格式不正确', trigger: 'blur' }
        ],
        phone: [
          { required: true, message: '电话号码为必填项', trigger: 'blur' },
          { min: 11, max: 11, message: '请输入正确的电话号码', trigger: 'blur' }
        ],
        address: [
          { required: true, message: '地址为必填项', trigger: 'blur' },
        ],
      }
    }
  },
  methods: {
    async register(registerData) {
      const res = await this.$http.post("register", registerData);
      return res.data;
    },
    submitForm() {
      this.$refs.registerFormRef.validate(valid => {
        if (valid) {
          // 构造请求体
          const requestBody = {
            username: this.registerForm.username,
            password: this.registerForm.password,
            email: this.registerForm.email
          };
          //提交验证给后台
          this.register(this.registerForm).then(response => {
            //成功提示
            console.log(response);
            if (response.code == 20000) {
              this.$message.success("注册成功！5秒后返回登录页面");
              setTimeout(() => {
                this.$router.push("/login");
              }, 5000);
            }
            if (response.code == 20004) this.$message.error(response.message);
          });
        } else {
          return false;
        }
      });
    },

    back() {
      this.$router.push("/login");
    },

    validateConfirmPassword(rule, value, callback) {
      if (value !== this.registerForm.password) {
        callback(new Error('两次输入的密码不一致'))
      } else {
        callback()
      }
    }
  }
}
</script>
<style lang="less" scoped>
.register_container {
  background-color: #99C8B7;
  height: 100%;
}

.register_box {
  width: 500px;
  height: 580px;
  background-color: #fff;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  position: absolute;
  left: 50%;
  top: 45%;
  transform: translate(-50%, -50%);
}

.register_box h1 {
  margin-top: 20px;
  text-align: center;
  font-size: 28px;
  font-weight: 500;
}

.btns {
  display: flex; // 弹性布局
  justify-content: flex-end; // 尾部对齐
}

.register_form {
  position: absolute;
  bottom: 0%;
  width: 100%;
  padding: 0 10px;
  box-sizing: border-box;
}
</style>