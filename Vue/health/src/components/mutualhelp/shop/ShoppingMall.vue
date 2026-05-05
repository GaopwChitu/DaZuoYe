<template>
  <div>
    <el-card>
      <el-row :gutter="20">
        <!--      搜索区域-->
        <el-col :span="7">
          <label>商品名称：</label>
          <el-input placeholder="请输入商品名称" v-model="queryInfo.goodsName" clearable
            style="width: 70%; padding-right: 10px" />
        </el-col>
        <el-col :span="7">
          <label>商家名称：</label>
          <el-input placeholder="请输入商家名称" v-model="queryInfo.shopName" clearable
            style="width: 70%; padding-right: 10px" />
        </el-col>
        <el-col :span="10">
          <el-button type="primary" icon="el-icon-search" @click="search">搜索</el-button>
          <!-- 新增返回按钮 -->
          <el-button type="default" icon="el-icon-back" @click="goBack">返回</el-button>
          <el-button type="primary" icon="el-icon-plus" @click="isAddGoods = true"
            v-show="this.role == '管理员'">添加商品</el-button>
          <el-button type="success" icon="el-icon-s-finance" @click="joinGroup">加入团购</el-button>
        </el-col>
      </el-row>
      <el-table :data="shoppingList" border stripe>
        <el-table-column label="选择" align="center">
          <template v-slot="scope">
            <el-checkbox v-model="scope.row.isCheck"></el-checkbox>
          </template>
        </el-table-column>
        <el-table-column label="商品名称" prop="goodsName" align="center"></el-table-column>
        <el-table-column label="图片" align="center">
          <template v-slot="scope">
            <!-- 优化：图片为空显示 暂无图片，不报错 -->
            <div v-if="!scope.row.goodsImgUrl" style="width:100%;height:100px;line-height:100px;color:#999">
              暂无图片
            </div>
            <el-image v-else style="width: 100%; height: 100px" :src="require('@/' + scope.row.goodsImgUrl)"
              alt=""></el-image>
          </template>
        </el-table-column>
        <el-table-column label="商品单位" prop="goodsUnit" align="center"></el-table-column>
        <el-table-column label="商品单价" prop="goodsPrice" align="center"></el-table-column>
        <el-table-column label="商家" prop="shopName" align="center"></el-table-column>
        <el-table-column label="商品保质期" prop="qualityGuarantee" align="center"></el-table-column>
        <el-table-column label="库存" prop="stock" align="center"></el-table-column>
        <el-table-column label="下单数量" prop="number" align="center">
          <template v-slot="scope">
            <el-input v-model="scope.row.number" type="number" min="1"></el-input>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" v-if="this.role == '管理员'">
          <template v-slot="scope">
            <div style="margin-top: 10px">
              <el-button type="danger" icon="el-icon-delete" size="mini" @click="deleteGoods(scope.row.id)">
              </el-button>
            </div>
          </template>
        </el-table-column>
      </el-table>
      <div>
        <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"
          :current-page="queryInfo.pageNum" :page-sizes="[5, 10, 15, 50]" :page-size="queryInfo.pageSize"
          layout="total,sizes,prev,pager,next,jumper" :total="total">
        </el-pagination>
      </div>

      <el-dialog title="添加商品信息" :visible.sync="isAddGoods" width="50%" @close="insertClosed">
        <el-form :model="addGoodsForm" :rules="addGoodsFormRules" ref="addGoodsFormRef" label-width="160px">
          <el-form-item label="商品图片：">
            <el-upload class="avatar-uploader" action="https://jsonplaceholder.typicode.com/posts/"
              :show-file-list="false" :on-success="handleAvatarSuccess" :before-upload="beforeAvatarUpload">
              <img v-if="imgUrl" :src="imgUrl" class="avatar" alt="">
              <i v-else class="el-icon-plus avatar-uploader-icon"></i>
            </el-upload>
          </el-form-item>
          <el-form-item label="商品名称" prop="goodsName">
            <el-input v-model="addGoodsForm.goodsName" style="width: 80%"></el-input>
          </el-form-item>
          <el-form-item label="商品单位" prop="goodsUnit">
            <el-input v-model="addGoodsForm.goodsUnit" style="width: 80%"></el-input>
          </el-form-item>
          <el-form-item label="商品单价" prop="goodsPrice">
            <el-input v-model="addGoodsForm.goodsPrice" style="width: 80%">
              <i slot="suffix" style="font-style: normal; margin-right: 10px">元</i>
            </el-input>
          </el-form-item>
          <el-form-item label="商家" prop="shopName">
            <el-input v-model="addGoodsForm.shopName" style="width: 80%"></el-input>
          </el-form-item>
          <el-form-item label="保质期" prop="qualityGuarantee">
            <el-input v-model="addGoodsForm.qualityGuarantee" style="width: 80%"></el-input>
          </el-form-item>
          <el-form-item label="存量" prop="stock">
            <el-input v-model="addGoodsForm.stock" style="width: 80%"></el-input>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button @click="isAddGoods = false">取消</el-button>
          <el-button type="primary" @click="addGoods">确定</el-button>
        </span>
      </el-dialog>
    </el-card>
  </div>
</template>

<script>
export default {
  name: "ShoppingMall",
  data() {
    return {
      imgUrl: "",
      role: '',
      addGoodsForm: {},
      queryInfo: {
        shopName: "",
        goodsName: "",
        pageNum: 1,
        pageSize: 10
      },
      imgList: [],
      addOrderForm: {},
      goodsList: [],
      shoppingList: [],
      isAddGoods: false,
      total: 0,
      // 优化后的表单校验：图片不校验，其他字段更严谨
      addGoodsFormRules: {
        goodsName: [
          { required: true, message: "请输入商品名称", trigger: "blur" },
        ],
        goodsUnit: [
          { required: true, message: "请输入商品单位", trigger: "blur" },
        ],
        goodsPrice: [
          { required: true, message: "请输入商品单价", trigger: "blur" },
          { pattern: /^[0-9]+(\.[0-9]{1,2})?$/, message: "请输入合法数字(支持保留两位小数)", trigger: "blur" }
        ],
        shopName: [
          { required: true, message: "请输入商家名称", trigger: "blur" },
        ],
        qualityGuarantee: [
          { required: true, message: "请输入商品保质期", trigger: "blur" },
          { pattern: /^.+$/, message: "保质期不能为空", trigger: "blur" }
        ],
        stock: [
          { required: true, message: "请输入商品库存", trigger: "blur" },
          { pattern: /^[1-9]\d*$/, message: "库存必须是正整数", trigger: "blur" }
        ]
      }
    }
  },
  created() {
    this.getGoodsList()
    const user = JSON.parse(window.sessionStorage.getItem("user"))
    if (user) {
      this.role = user.role;
    }
  },
  methods: {
    goBack() {
      this.$router.push({ path: '/shop' })
    },
    async getGoodsList() {
      const { data: res } = await this.$http.get("/shop/list", { params: this.queryInfo })
      this.shoppingList = res
      if (this.shoppingList && this.shoppingList.length > 0) {
        this.total = this.shoppingList[0].total
      } else {
        this.total = 0
      }
      this.shoppingList.forEach(item => {
        this.$set(item, 'isCheck', false)
        this.$set(item, 'number', 1)
      })
    },
    search() {
      this.queryInfo.pageNum = 1;
      this.getGoodsList()
    },
    handleSizeChange(newSize) {
      this.queryInfo.pageSize = newSize;
      this.getGoodsList()
    },
    handleCurrentChange(newPage) {
      this.queryInfo.pageNum = newPage;
      this.getGoodsList()
    },
    addGoods() {
      this.$refs.addGoodsFormRef.validate(async valid => {
        if (!valid) return;
        const user = JSON.parse(window.sessionStorage.getItem("user"))
        this.addGoodsForm.createId = user.id
        const { data: res } = await this.$http.post("/shop/addGoods", this.addGoodsForm)
        if (res !== "success") {
          return this.$message.error("添加失败！！！")
        }
        this.$message.success("添加成功！！！")
        this.getGoodsList();
        this.isAddGoods = false
      })
    },
    async deleteGoods(id) {
      const confirmResult = await this.$confirm('是否确定删除？', '提示', {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: 'warning'
      }).catch(err => err)
      if (confirmResult !== 'confirm') {
        return this.$message.info("已取消删除");
      }
      const user = JSON.parse(window.sessionStorage.getItem("user"))
      const updateId = user.id;
      const { data: res } = await this.$http.post("/shop/deleteById?id=" + id + "&updateId=" + updateId)
      if (res !== "success") {
        return this.$message.error("删除失败！！！")
      }
      this.$message.success("删除成功！！！")
      this.getGoodsList()
    },
    insertClosed() {
      this.$refs.addGoodsFormRef.resetFields();
      this.imgUrl = ''
    },

    // 加入团购（增加了更严格的校验）
    async joinGroup() {
      const selectList = this.shoppingList.filter(item => item.isCheck === true)
      if (selectList.length === 0) {
        return this.$message.warning("请选择商品！！！");
      }

      const invalid = selectList.some(item => item.number < 1 || isNaN(item.number))
      if (invalid) {
        return this.$message.warning("下单数量必须大于0！")
      }

      const user = JSON.parse(window.sessionStorage.getItem("user"))
      if (!user) {
        return this.$message.error("请先登录！")
      }

      try {
        for (let item of selectList) {
          const orderInfo = {
            userId: user.id,
            createId: user.id,
            orderCustomer: user.username,
            goodsId: item.id,
            goodsName: item.goodsName,
            shopName: item.shopName,
            imgUrl: item.goodsImgUrl,
            number: item.number,
            orderPrice: (item.goodsPrice * 1) * (item.number * 1),
            orderNo: "SP" + Date.now() + Math.floor(Math.random() * 1000),
            orderStatus: "进行中"
          }
          await this.$http.post("/order/insertOrder", orderInfo)
        }
        this.$message.success("全部加入团购成功！")
        this.shoppingList.forEach(item => item.isCheck = false)
        setTimeout(() => {
          this.$router.push("/shop")
        }, 800)
      } catch (err) {
        this.$message.error("加入失败：" + err.message)
        console.error(err)
      }
    },

    joinShoppingCart() {

    },
    handleAvatarSuccess(res, file) {
      this.addGoodsForm.goodsImgUrl = 'assets/imgs/' + file.raw.name
      this.imgUrl = URL.createObjectURL(file.raw)
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === 'image/jpeg' || file.type === 'image/jpg';
      const isLt2M = file.size / 1024 / 1024 < 2;
      if (!isJPG) {
        this.$message.error('上传图片只能是 JPG 格式!');
      }
      if (!isLt2M) {
        this.$message.error('上传图片大小不能超过 2MB!');
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