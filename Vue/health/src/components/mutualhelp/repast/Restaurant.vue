<template>
  <div>
    <!-- <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/home' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item :to="{ path: '/food' }">餐饮互助</el-breadcrumb-item>
      <el-breadcrumb-item>餐厅</el-breadcrumb-item>
    </el-breadcrumb> -->
    <el-card>
      <el-row :gutter="20">
        <el-col :span="6">
          <label>社区：</label>
          <el-select placeholder="请选择社区" v-model="queryInfo.communityCd" clearable filterable
            style="width: 70%; padding-right: 10px" @change="handleCommunityChange">
            <el-option v-for="item in communities" :key="item.communityCd" :label="item.communityName"
              :value="item.communityCd">
            </el-option>
          </el-select>
        </el-col>
        <el-col :span="6">
          <label>餐厅：</label>
          <el-select placeholder="请选择餐厅" v-model="queryInfo.restaurant" clearable filterable
            style="width: 60%; padding-right: 10px" @change="getFoodList">
            <el-option v-for="item in restaurants" :key="item.restaurant" :label="item.restaurant"
              :value="item.restaurant">
            </el-option>
          </el-select>
          <!-- 👇 新增：删除餐厅按钮（仅管理员可见）-->
          <el-button v-show="this.role == '管理员' && queryInfo.restaurant" type="danger" icon="el-icon-delete" size="mini"
            @click="deleteRestaurant">
            删除
          </el-button>
        </el-col>
        <el-col :span="12">
          <!-- 新增：返回repast页面的按钮 -->
          <el-button type="default" icon="el-icon-back" @click="backToRepast">返回订单列表</el-button>
          <el-button type="primary" icon="el-icon-plus" @click="isMenu = true"
            v-show="this.role == '管理员'">添加餐厅</el-button>
          <el-button type="warning" icon="el-icon-plus" @click="isAddFood = true"
            v-show="this.role == '管理员'">添加菜品</el-button>
          <el-button type="success" icon="el-icon-s-finance" @click="buyFood">购买</el-button>
        </el-col>
      </el-row>

      <el-table :data="foodList" border stripe>
        <el-table-column label="选择" align="center">
          <template v-slot="scope">
            <el-checkbox v-model="scope.row.isCheck"
              @change="checkFoodList(scope.row.isCheck, scope.row)"></el-checkbox>
          </template>
        </el-table-column>
        <el-table-column label="菜名" prop="foodName" align="center"></el-table-column>
        <el-table-column label="图片" align="center">
          <template v-slot="scope">
            <el-image style="width: 100%; height: 100px" :src="scope.row.foodImgUrl || ''" alt="">
              <!-- 缺省占位：没图片时显示 -->
              <div slot="error"
                style="width:100%;height:100px;background:#f5f5f5;display:flex;align-items:center;justify-content:center;color:#999">
                暂无图片
              </div>
            </el-image>
          </template>
        </el-table-column>
        <el-table-column label="价格(元)" prop="foodPrice" align="center"></el-table-column>
        <el-table-column label="下单数量" align="center">
          <template v-slot="scope">
            <el-button size="mini" @click="scope.row.foodNumber--" :disabled="scope.row.foodNumber <= 1">-</el-button>
            <span style="margin: 0 8px">{{ scope.row.foodNumber }}</span>
            <el-button size="mini" @click="scope.row.foodNumber++">+</el-button>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" v-if="role == '管理员'">
          <template v-slot="scope">
            <!--删除-->
            <el-button type="danger" icon="el-icon-delete" size="mini" @click="deleteById(scope.row.id)">
            </el-button>
          </template>
        </el-table-column>
      </el-table>
      <div>
        <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"
          :current-page="queryInfo.pageNum" :page-sizes="[5, 10, 15, 50]" :page-size="queryInfo.pageSize"
          layout="total,sizes,prev,pager,next,jumper" :total="total">
        </el-pagination>
      </div>
    </el-card>
    <el-dialog title="添加餐厅信息" :visible.sync="isMenu" width="50%" @close="addMenuClosed">
      <el-form :model="addMenuForm" :rules="addMenuFormRules" ref="addMenuFormRef" label-width="160px">
        <el-form-item label="社区编号" prop="communityCd">
          <el-select placeholder="请选择社区" v-model="addMenuForm.communityCd" clearable filterable
            style="width: 70%; padding-right: 10px">
            <el-option v-for="item in communities" :key="item.communityCd" :label="item.communityName"
              :value="item.communityCd">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="餐厅名称" prop="restaurant">
          <el-input v-model="addMenuForm.restaurant" style="width: 70%"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="isMenu = false">取消</el-button>
        <el-button type="primary" @click="addMenu">确定</el-button>
      </span>
    </el-dialog>

    <el-dialog title="添加菜品信息" :visible.sync="isAddFood" width="50%" @close="addFoodFormClosed">
      <el-form :model="addFoodForm" :rules="addFoodFormRules" ref="addFoodFormRef" label-width="160px">
        <el-form-item label="社区编号" prop="communityCd">
          <el-select placeholder="请选择社区" v-model="addFoodForm.communityCd" clearable filterable
            style="width: 70%; padding-right: 10px" @change="handleFoodCommunityChange"> <!-- 这里改成这个 -->
            <el-option v-for="item in communities" :key="item.communityCd" :label="item.communityName"
              :value="item.communityCd">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="餐厅名称" prop="restaurant">
          <el-select placeholder="请选择餐厅" v-model="addFoodForm.restaurant" clearable filterable
            style="width: 70%; padding-right: 10px" @change="handleRestaurantSelect">
            <el-option v-for="item in restaurants" :key="item.restaurant" :label="item.restaurant"
              :value="item.restaurant">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="菜品名称" prop="foodName">
          <el-input v-model="addFoodForm.foodName" style="width: 70%"></el-input>
        </el-form-item>
        <el-form-item label="价格(元)" prop="foodPrice">
          <el-input v-model="addFoodForm.foodPrice" style="width: 70%">
            <i slot="suffix" style="font-style: normal; margin-right: 10px">元</i>
          </el-input>
        </el-form-item>
        <el-form-item label="商品图片：">
          <el-upload class="avatar-uploader" action="https://jsonplaceholder.typicode.com/posts/"
            :show-file-list="false" :on-success="handleAvatarSuccess" :before-upload="beforeAvatarUpload">
            <img v-if="imgUrl" :src="imgUrl" class="avatar" alt="">
            <i v-else class="el-icon-plus avatar-uploader-icon"></i>
          </el-upload>
        </el-form-item>

      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="isAddFood = false">取消</el-button>
        <el-button type="primary" @click="addFood">确定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "Restaurant",
  data() {
    return {
      imgUrl: "",
      role: '',
      queryInfo: {
        pageNum: 1,
        pageSize: 5,
        communityCd: '',
        restaurant: ''
      },
      addFoodOrderForm: {
        foodNumber: 0,
        foodPrice: ""
      },
      checkFoods: [],
      communities: [],
      restaurants: [], // 餐厅列表
      foodList: [],
      isMenu: false,
      isAddFood: false,
      addMenuForm: {
        communityCd: '',
        restaurant: ''
      },
      total: 0,
      // ✅ 修复：必须给默认空字符串，否则双向绑定不生效
      addFoodForm: {
        communityCd: '',
        restaurant: '',
        foodName: '',
        foodPrice: '',
        foodImgUrl: ''
      },
      addMenuFormRules: {
        communityCd: [
          { required: true, message: "请输入社区编号", trigger: "blur" }
        ],
        restaurant: [
          { required: true, message: "请输入餐厅名称", trigger: "blur" }
        ]
      },
      addFoodFormRules: {
        communityCd: [
          { required: true, message: "请选择社区", trigger: "change" }
        ],
        restaurant: [
          { required: true, message: "请选择餐厅", trigger: "change" }
        ],
        foodName: [
          { required: true, message: "请输入菜品名称", trigger: "blur" }
        ],
        // ✅ 重点：价格必须是数字 + 必须填写
        foodPrice: [
          { required: true, message: "请输入菜品价格", trigger: "blur" },
          { pattern: /^[0-9]+([.]{1}[0-9]+){0,1}$/, message: "价格必须是数字（可带小数点）", trigger: "blur" }
        ]
      }
    }
  },
  created() {
    this.selectAddress();
    this.role = (JSON.parse(window.sessionStorage.getItem("user"))).role;
  },
  methods: {
    // ==============================
    // 新增：删除当前选中的餐厅
    // ==============================
    async deleteRestaurant() {
      const communityCd = this.queryInfo.communityCd
      const restaurant = this.queryInfo.restaurant
      if (!communityCd) {
        return this.$message.warning('请先选择社区！')
      }
      if (!restaurant) {
        return this.$message.warning('请先选择要删除的餐厅！')
      }
      const confirmResult = await this.$confirm(
        `确定要删除餐厅【${restaurant}】吗？\n删除后该餐厅所有菜品也会被删除！`,
        '提示',
        {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }
      ).catch(err => err)
      if (confirmResult !== 'confirm') {
        return this.$message.info('已取消删除')
      }
      // 调用你的 foodOrder 接口删除餐厅
      const { data: res } = await this.$http.post('/foodOrder/deleteRestaurant', {
        communityCd: communityCd,
        restaurant: restaurant
      })
      if (res !== 'success') {
        return this.$message.error('删除失败！')
      }
      this.$message.success('删除成功！')
      // 删除后清空选择 + 刷新列表
      this.queryInfo.restaurant = ''
      this.foodList = []
      this.selectRestaurant(communityCd)
    },
    // 1. 主页面切换社区 → 清空餐厅
    handleCommunityChange(communityCd) {
      this.queryInfo.restaurant = ''
      this.selectRestaurant(communityCd)
    },
    // 2. 添加菜品弹窗切换社区 → 清空弹窗里的餐厅
    handleFoodCommunityChange(communityCd) {
      this.addFoodForm.restaurant = ''  // 清空弹窗餐厅选择
      this.selectRestaurant(communityCd)
    },
    // ✅ 修复：强制下拉框刷新
    handleRestaurantSelect() {
      this.$nextTick(() => {
        this.addFoodForm.restaurant = this.addFoodForm.restaurant
      })
    },
    // 返回订单列表
    backToRepast() {
      this.$router.push({ path: "/repast" });
    },
    async getFoodList() {
      const { data: res } = await this.$http.get("/foodOrder/foodList", { params: this.queryInfo })
      this.foodList = res
      if (this.foodList.length > 0) {
        this.total = this.foodList[0].total
      }
      for (let i = 0; i < this.foodList.length; i++) {
        // ✅ 强制 Vue 监听这个字段，加减才能生效
        this.$set(this.foodList[i], 'foodNumber', 1)
        this.$set(this.foodList[i], 'isCheck', false) // 勾选也同步修复
        const img = this.foodList[i].foodImgUrl
        this.foodList[i].foodImgUrl = img ? require('@/' + img) : ''
      }
    },
    checkFoodList(isCheck, row) {
      // 先从数组里移除当前项
      let idx = this.checkFoods.findIndex(item => item.id === row.id)
      if (isCheck) {
        if (idx === -1) {
          this.checkFoods.push(row)
        }
      } else {
        if (idx !== -1) {
          this.checkFoods.splice(idx, 1)
        }
      }
    },
    async deleteById(id) {
      const confirmResult = await this.$confirm('是否确定删除？', '提示', {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: 'warning'
      }).catch(err => err)
      if (confirmResult !== 'confirm') {
        return this.$message.info("已取消删除");
      }
      const { data: res } = await this.$http.post("/foodOrder/deleteFoodById?id=" + id);
      if (res !== "success") {
        return this.$message.error("删除失败！");
      }
      this.$message.success("删除成功");
      await this.getFoodList()
    },

    // ======================================
    // ✅ 已优化：添加餐厅后自动刷新下拉列表&去重
    // ======================================
    addMenu() {
      this.$refs.addMenuFormRef.validate(async valid => {
        if (!valid) return;

        const { data: res } = await this.$http.post("/foodOrder/insertRestaurant", this.addMenuForm)

        // ===== 新增：防重复提示 =====
        if (res === "exists") {
          return this.$message.warning("该社区下已存在此餐厅！");
        }

        if (res !== "success") {
          return this.$message.error("添加失败！！！");
        }

        this.$message.success("添加成功！！！");
        this.isMenu = false;

        // 自动刷新餐厅列表
        if (this.addMenuForm.communityCd) {
          this.selectRestaurant(this.addMenuForm.communityCd);
          this.queryInfo.communityCd = this.addMenuForm.communityCd;
        }
      })
    },

    async selectRestaurant(communityCd) {
      const { data: res } = await this.$http.get("/foodOrder/restaurantDrop?communityCd=" + communityCd)
      this.restaurants = res; // 刷新列表
    },

    addMenuClosed() {
      this.$refs.addMenuFormRef.resetFields();
      this.addMenuForm = {}; // 清空表单
    },

    async selectAddress() {
      const { data: res } = await this.$http.get("address");
      this.communities = res.data;
    },
    handleSizeChange(newSize) {
      this.queryInfo.pageSize = newSize;
      this.getFoodList()
    },
    handleCurrentChange(newPage) {
      this.queryInfo.pageNum = newPage;
      this.getFoodList()
    },
    addFoodFormClosed() {
      // ✅ 修复：重置表单 + 清空数据 + 重置餐厅列表
      this.$refs.addFoodFormRef.resetFields()
      this.addFoodForm = {
        communityCd: '',
        restaurant: '',
        foodName: '',
        foodPrice: '',
        foodImgUrl: ''
      }
      this.imgUrl = ''
      this.restaurants = [] // 关键：清空餐厅列表，让它变灰不能选
    },
    addFood() {
      this.$refs.addFoodFormRef.validate(async valid => {
        if (!valid) return;
        const { data: res } = await this.$http.post("/foodOrder/insertFood", this.addFoodForm)
        if (res !== "success") {
          return this.$message.error("添加失败！！！")
        }
        this.$message.success("添加成功！！！")
        this.isAddFood = false
        this.getFoodList();
      })
    },
    async buyFood() {
      this.addFoodOrderForm.foodNames = ''
      this.addFoodOrderForm.foodPrice = 0

      if (!this.checkFoods || this.checkFoods.length <= 0) {
        return this.$message.warning("请选择商品！！！");
      }
      if (!this.queryInfo.restaurant) {
        return this.$message.warning("请选择餐厅！");
      }

      // ✅ 自动获取当前选中社区的名称 → 赋值给 address
      let currentCommunity = this.communities.find(item => item.communityCd === this.queryInfo.communityCd);
      this.addFoodOrderForm.address = currentCommunity ? currentCommunity.communityName : '未知社区';

      this.addFoodOrderForm.foodOrderNo = "CY" + Math.floor(Math.random() * 100000000)
      this.addFoodOrderForm.contactNumber = (JSON.parse(window.sessionStorage.getItem("user"))).phone
      this.addFoodOrderForm.orderPerson = (JSON.parse(window.sessionStorage.getItem("user"))).username
      this.addFoodOrderForm.communityRestaurant = this.queryInfo.restaurant;
      this.addFoodOrderForm.communityId = this.queryInfo.communityCd;

      for (let i = 0; i < this.checkFoods.length; i++) {
        let food = this.checkFoods[i];
        let num = food.foodNumber;
        this.addFoodOrderForm.foodNames += `${num}份${food.foodName};`;
        this.addFoodOrderForm.foodPrice += (food.foodPrice * 1) * (num * 1);
      }

      this.addFoodOrderForm.orderStatus = 1
      const { data: res } = await this.$http.post("/foodOrder/insertFoodOrder", this.addFoodOrderForm)
      if (res !== "success") {
        return this.$message.error("购买失败！！！")
      }
      this.$message.success("购买成功！！！")

      this.checkFoods = []
      this.foodList.forEach(item => item.isCheck = false)
      this.$router.push({ path: "/repast" })
    },
    handleAvatarSuccess(res, file) {
      let newFile = new FormData();
      newFile.append("imgUrl", file.raw.name)
      this.addFoodForm.foodImgUrl = 'assets/imgs/' + newFile.get("imgUrl")
      console.log(this.addFoodForm.foodImgUrl)
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === 'image/jpeg';
      const isLt2M = file.size / 1024 / 1024 < 2;
      if (!isJPG) {
        this.$message.error('上传头像图片只能是 JPG 格式!');
      }
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 2MB!');
      }
      return isJPG && isLt2M;
    }
  }
}
</script>

<style lang="less" scoped>
.el-breadcrumb {
  margin-bottom: 15px;
  font-size: 17px;
}

.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}

.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}

.avatar {
  width: 178px;
  height: 178px;
  display: block;
}
</style>