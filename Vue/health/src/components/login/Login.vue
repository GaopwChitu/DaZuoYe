<template>
	<div class="login_container">
		<div class="login_box">
			<div class="avatar_box">
				<!-- 头像 -->
				<img src="../../assets/imgs/流萤酱.gif" alt />
			</div>
			<!-- 表单 -->
			<el-form ref="loginFormRef" :model="loginForm" :rules="loginRules" class="login_form" label-width="0px">
				<!-- 用户名栏 -->
				<el-form-item prop="username">
					<el-input v-model="loginForm.username" prefix-icon="iconfont icondenglu"></el-input>
				</el-form-item>
				<!-- 密码栏 -->
				<el-form-item prop="password">
					<el-input v-model="loginForm.password" show-password prefix-icon="iconfont iconmima"
						type="password"></el-input>
				</el-form-item>
				<!-- 登录&重置 按钮 -->
				<el-form-item class="btns">
					<el-button type="primary" @click="login">登录</el-button>
					<el-button type="primary" @click="register">注册</el-button>
					<el-button type="info" @click="resetLoginForm">重置</el-button>
				</el-form-item>
			</el-form>
		</div>
	</div>
</template>

<script>
export default {
	name: "Login",
	data() {
		return {
			// 默认
			loginForm: {
				username: "user1",
				password: "123456"
			},
			// 校验
			loginRules: {
				username: [
					{ required: true, message: "请输入用户名", trigger: "blur" },
					{ min: 1, max: 20, message: "长度在 1 到 20 个字符", trigger: "blur" }
				],
				password: [
					{ required: true, message: "请输入密码", trigger: "blur" },
					{ min: 6, max: 20, message: "密码为 8~20 位", trigger: "blur" }
				]
			}
		};
	},
	methods: {
		// 重置按钮方法
		resetLoginForm() {
			this.$refs.loginFormRef.resetFields();
		},
		// 登录按钮方法
		login() {
			this.$refs.loginFormRef.validate(async valid => {
				if (!valid) return;
				const { data: res } = await this.$http.post("login", this.loginForm);
				if (res.flag == "ok") {
					window.sessionStorage.setItem("user", JSON.stringify(res.user));
					window.sessionStorage.setItem("activePath", "/home");
					this.$message.success("登陆成功");
					this.$router.push("/welcome");
				} else {
					this.$message.error("登录失败");
				}
			});
		},
		register() {
			this.$router.push("/register");
		}
	}
};
</script>

<style lang="less" scoped>
// 根节点样式
.login_container {
	background-color: #99C8B7;
	height: 100%;
}

// 登录框
.login_box {
	width: 450px;
	height: 300px;
	background-color: #fff;
	border-radius: 3px; // 圆角
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	position: absolute; // 绝对定位
	left: 50%;
	top: 40%;
	transform: translate(-50%, -50%); // 根据自己位置 以自己为长度位移

	// 头像框
	.avatar_box {
		width: 130px;
		height: 130px;
		border: 1px solid #eee;
		border-radius: 50%; // 加圆角
		padding: 3px;
		box-shadow: 0 0 10px #ddd; // 盒子阴影
		position: absolute;
		left: 50%;
		transform: translate(-50%, -50%);
		background-color: #eee;

		img {
			width: 100%;
			height: 100%;
			border-radius: 50%; // 加圆角
			background-color: #eee;
		}
	}

	.btns {
		display: flex; // 弹性布局
		justify-content: flex-end; // 尾部对齐
	}

	.login_form {
		position: absolute;
		bottom: 0%;
		width: 100%;
		padding: 0 10px;
		box-sizing: border-box; // 设置边框
	}
}
</style>