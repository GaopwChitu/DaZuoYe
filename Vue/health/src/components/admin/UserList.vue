<template>
	<div>
		<!-- 面包屑导航 -->
		<!-- <el-breadcrumb separator-class="el-icon-arrow-right">
			<el-breadcrumb-item :to="{ path: '/home' }">首页</el-breadcrumb-item>
			<el-breadcrumb-item>权限管理</el-breadcrumb-item>
			<el-breadcrumb-item>用户列表</el-breadcrumb-item>
		</el-breadcrumb> -->
		<el-card>
			<!-- 搜索区 -->
			<el-row :gutter="25">
				<el-col :span="10">
					<!-- 搜索 -->
					<el-input placeholder="请输入用户名" v-model="queryInfo.username" clearable @clear="getUserList">
						<el-button slot="append" icon="el-icon-search" @click="getUserList"></el-button>
					</el-input>
				</el-col>
				<!-- 添加 -->
				<el-col :span="4">
					<el-button type="primary" @click="addDialogVisible = true">添加用户</el-button>
				</el-col>
				<!-- 用户列表 -->
				<el-table :data="userList" border stripe>
					<el-table-column type="index"></el-table-column>
					<el-table-column label="姓名" prop="username"></el-table-column>
					<el-table-column label="性别" prop="sex"></el-table-column>
					<el-table-column label="密码" prop="password"></el-table-column>
					<el-table-column label="邮箱" prop="email"></el-table-column>
					<el-table-column label="电话号码" prop="phone"></el-table-column>
					<el-table-column label="地址" prop="address"></el-table-column>
					<el-table-column label="角色" prop="role"></el-table-column>
					<el-table-column label="状态" prop="state">
						<!-- 作用于插槽 -->
						<template slot-scope="scope">
							<!-- scope.row封存着每一行的数据 -->
							<el-switch v-model="scope.row.state" @change="userStateChanged(scope.row)"></el-switch>
						</template>
					</el-table-column>

					<el-table-column label="操作">
						<template slot-scope="scope">
							<!-- 修改 -->
							<el-tooltip content="修改信息" placement="top-start" :enterable="false">
								<el-button type="primary" icon="el-icon-edit" size="mini"
									@click="showEditDialog(scope.row.id)"></el-button>
							</el-tooltip>
							<!-- 权限 -->
							<el-tooltip content="分配权限" placement="top-start" :enterable="false">
								<el-button type="warning" icon="el-icon-setting" size="mini"
									@click="showChangeDialog(scope.row.id)"></el-button>
							</el-tooltip>
							<!-- 删除 -->
							<el-tooltip content="删除" placement="top-start" :enterable="false">
								<el-button type="danger" icon="el-icon-delete" size="mini"
									@click="deleteUser(scope.row.id)"></el-button>
							</el-tooltip>
						</template>
					</el-table-column>
				</el-table>
			</el-row>
			<div>
				<!-- 分页 -->
				<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"
					:current-page="queryInfo.pageNum" :page-sizes="[5, 10, 20, 100]" :page-size="queryInfo.pageSize"
					layout="total, sizes, prev, pager, next, jumper" :total="total">
				</el-pagination>
			</div>
		</el-card>
		<!-- 新增用户 -->
		<el-dialog title="添加用户" :visible.sync="addDialogVisible" width="50%" @close="addDialogClosed">
			<!-- 内容主体区域 -->
			<el-form :model="addForm" :rules="addFormRules" ref="addFormRef" label-width="70px">
				<!-- 用户名 -->
				<el-form-item label="用户名" prop="username">
					<el-input v-model="addForm.username"></el-input>
				</el-form-item>
				<!-- 性别 -->
				<el-form-item label="性别：" prop="sex">
					<el-select v-model="addForm.sex" placeholder="请选择" filterable>
						<el-option label="男" value="男"></el-option>
						<el-option label="女" value="女"></el-option>
						<el-option label="沃尔玛购物袋" value="沃尔玛购物袋"></el-option>
						<el-option label="武装直升机" value="武装直升机"></el-option>
						<el-option label="不被定义" value="不被定义"></el-option>
						<el-option label="小南娘" value="小南娘"></el-option>
					</el-select>
				</el-form-item>
				<!-- 密码 -->
				<el-form-item label="密码" prop="password">
					<el-input v-model="addForm.password"></el-input>
				</el-form-item>
				<!-- 邮箱 -->
				<el-form-item label="邮箱" prop="email">
					<el-input v-model="addForm.email"></el-input>
				</el-form-item>
				<!-- 电话号码 -->
				<el-form-item label="电话号码" prop="phone">
					<el-input v-model="addForm.phone"></el-input>
				</el-form-item>
				<!-- 地址 -->
				<el-form-item label="地址" prop="address">
					<el-input v-model="addForm.address"></el-input>
				</el-form-item>
			</el-form>
			<!-- 内容底部区域 -->
			<span slot="footer" class="dialog-footer">
				<el-button @click="addDialogVisible = false">取 消</el-button>
				<el-button type="primary" @click="addUser">确 定</el-button>
			</span>
		</el-dialog>
		<!-- 修改用户对话框 -->
		<el-dialog title="修改用户信息" :visible.sync="editDialogVisible" width="50%" @close="editDialogClosed">
			<el-form :model="editForm" :rules="editFormRules" ref="editFormRef" label-width="70px">
				<!-- 用户名 -->
				<el-form-item label="用户名" prop="username">
					<el-input v-model="editForm.username" disabled></el-input>
				</el-form-item>
				<!-- 性别 -->
				<el-form-item label="性别：" prop="sex">
					<el-select v-model="editForm.sex" placeholder="请选择" filterable>
						<el-option label="男" value="男"></el-option>
						<el-option label="女" value="女"></el-option>
						<el-option label="沃尔玛购物袋" value="沃尔玛购物袋"></el-option>
						<el-option label="武装直升机" value="武装直升机"></el-option>
						<el-option label="不被定义" value="不被定义"></el-option>
						<el-option label="小南娘" value="小南娘"></el-option>
					</el-select>
				</el-form-item>
				<!-- 密码 -->
				<el-form-item label="密码" prop="password">
					<el-input v-model="editForm.password"></el-input>
				</el-form-item>
				<!-- 邮箱 -->
				<el-form-item label="邮箱" prop="email">
					<el-input v-model="editForm.email"></el-input>
				</el-form-item>
				<!-- 电话号码 -->
				<el-form-item label="电话号码" prop="phone">
					<el-input v-model="editForm.phone"></el-input>
				</el-form-item>
				<!-- 地址 -->
				<el-form-item label="地址" prop="address">
					<el-input v-model="editForm.address"></el-input>
				</el-form-item>
			</el-form>

			<span slot="footer" class="dialog-footer">
				<el-button @click="editDialogVisible = false">取 消</el-button>
				<el-button type="primary" @click="editUserInfo">确 定</el-button>
			</span>
		</el-dialog>

		<!-- 修改用户权限对话框 -->
		<el-dialog title="修改用户权限" :visible.sync="changeDialogVisible" width="50%" @close="changeDialogClosed">
			<el-form :model="changeForm" ref="changeFormRef" label-width="70px">
				<!-- 用户名 -->
				<el-form-item label="用户名" prop="username">
					<el-input v-model="changeForm.username" disabled></el-input>
				</el-form-item>
				<!-- 权限 -->
				<el-form-item label="权限" prop="role">
					<el-radio-group v-model="changeForm.role">
						<el-radio label="管理员">管理员</el-radio>
						<el-radio label="用户">用户</el-radio>
					</el-radio-group>
				</el-form-item>
			</el-form>
			<span slot="footer" class="dialog-footer">
				<el-button @click="changeDialogVisible = false">取 消</el-button>
				<el-button type="primary" @click="changeUserInfo">确 定</el-button>
			</span>
		</el-dialog>
	</div>
</template>
<script>
export default {
	name: "UserList",
	data() {
		return {
			queryInfo: {
				username: "",
				pageNum: 1,
				pageSize: 10,
			},
			userList: [],
			total: 0,
			addDialogVisible: false,
			// 添加表单
			addForm: {
				username: "",
				password: "",
				email: "",
				phone: "",
				address: "",
			},
			// 表单验证规则
			addFormRules: {
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
			},

			editDialogVisible: false,
			editForm: {},
			// 修改用户表单验证规则
			editFormRules: {
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
			},

			changeDialogVisible: false,
			changeForm: {},
		}
	},

	created() {
		this.getUserList();
	},

	methods: {
		async getUserList() {
			const { data: res } = await this.$http.get("alluser", { params: this.queryInfo });
			this.userList = res.rows;
			this.total = res.total;
		},
		handleSizeChange(newSize) {
			this.queryInfo.pageSize = newSize;
			this.getUserList();
		},
		handleCurrentChange(newPage) {
			this.queryInfo.pageNum = newPage;
			this.getUserList();
		},
		async userStateChanged(userInfo) {
			const { data: res } = await this.$http.put(`userstate?id=${userInfo.id}&state=${userInfo.state}`);
			if (res != "success") {
				userInfo.id = !userInfo.id;
				return this.$message.error("操作失败");
			}
			this.$message.success("操作成功");
		},
		addDialogClosed() {
			this.$refs.addFormRef.resetFields();
		},
		addUser() {
			this.$refs.addFormRef.validate(async valid => {
				if (!valid) return;
				const { data: res } = await this.$http.post("adduser", this.addForm);
				if (res != "success") {
					return this.$message.error("操作失败");
				}
				this.$message.success("操作成功")
				this.addDialogVisible = false;
				this.getUserList();
			})
		},
		async deleteUser(id) {
			const confirmResult = await this.$confirm("此操作将永久删除用户信息，是否继续？", "提示", {
				confirmButtonText: "确定",
				cancelButtonText: "取消",
				type: "warning",
			}).catch(err => err)
			if (confirmResult != "confirm") {
				return this.$message.info("已取消删除");
			}
			const { data: res } = await this.$http.delete("deleteuser?id=" + id);
			if (res != "success") {
				return this.$message.error("删除失败");
			}
			this.$message.success("删除成功");
			this.getUserList();
		},
		// 展示修改框
		async showEditDialog(id) {
			const { data: res } = await this.$http.get("getedituser?id=" + id);
			this.editForm = res;
			this.editDialogVisible = true;
		},
		// 关闭窗口
		editDialogClosed() {
			this.$refs.editFormRef.resetFields();
		},
		// 确认修改
		editUserInfo() {
			this.$refs.editFormRef.validate(async valid => {
				if (!valid) return;
				// 发起请求
				const { data: res } = await this.$http.put("edituser", this.editForm);
				if (res != "success") return this.$message.error("编辑失败");
				this.$message.success("编辑成功");
				//隐藏
				this.editDialogVisible = false;
				this.getUserList();
			});
		},

		// 展示修改权限框
		async showChangeDialog(id) {
			const { data: res } = await this.$http.get("getedituser?id=" + id);
			this.changeForm = res;
			this.changeDialogVisible = true;
		},
		// 关闭窗口
		changeDialogClosed() {
			this.$refs.changeFormRef.resetFields();
		},
		// 确认修改
		changeUserInfo() {
			this.$refs.changeFormRef.validate(async valid => {
				if (!valid) return;
				// 发起请求
				const { data: res } = await this.$http.put("changeRights", this.changeForm);
				if (res != "success") return this.$message.error("编辑失败");
				this.$message.success("编辑成功");
				//隐藏
				this.changeDialogVisible = false;
				this.getUserList();
			});
		},
	}
}
</script>
<style lang="less" scoped>
.el-breadcrumb {
	margin-bottom: 15px;
	font-size: 17px;
}
</style>