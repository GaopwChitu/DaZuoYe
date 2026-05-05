<template>
  <div>
    <el-card>
      <el-row :gutter="20">
        <el-col :span="8">
          <label>药名：</label>
          <el-input placeholder="请输入药名" v-model="queryInfo.drugName" clearable
            style="width: 60%; padding-right: 10px" />
        </el-col>
        <el-col :span="12">
          <el-button type="primary" icon="el-icon-search" @click="search">搜索</el-button>
          <el-button type="default" icon="el-icon-back" @click="goBack">返回</el-button>
          <el-button type="primary" icon="el-icon-plus" @click="isAddDrug = true"
            v-show="role == '管理员'">添加药品</el-button>
          <el-button type="success" icon="el-icon-s-finance" @click="onPurchase">立即购买</el-button>
        </el-col>
      </el-row>

      <el-tabs v-model="editableTabsValue" type="card" style="margin-top: 20px"
        @tab-click="getDrugList(editableTabsValue)">
        <el-tab-pane v-for="item in tabList" :key="item.drugType" :label="item.drugType" :name="item.drugType">
          <el-table :data="drugList" border stripe>
            <el-table-column label="选择" align="center">
              <template v-slot="scope">
                <el-checkbox v-model="scope.row.isCheck"
                  @change="checkDrug(scope.row.isCheck, scope.row)"></el-checkbox>
              </template>
            </el-table-column>
            <el-table-column label="药名" prop="drugName" align="center"></el-table-column>
            <el-table-column label="图片" align="center">
              <template v-slot="scope">
                <el-image style="width: 100%; height: 100px" :src="scope.row.photo" alt=""></el-image>
              </template>
            </el-table-column>
            <el-table-column label="存量" prop="drugNumber" align="center"></el-table-column>
            <el-table-column label="单位" prop="unit" align="center"></el-table-column>
            <el-table-column label="单价" prop="price" align="center"></el-table-column>
            <el-table-column label="有效期" prop="termOfValidity" align="center"></el-table-column>
            <el-table-column label="说明" prop="explain" align="center"></el-table-column>
            <el-table-column label="下单数量" prop="orderNumber" align="center">
              <template v-slot="scope">
                <el-input v-model="scope.row.orderNumber"></el-input>
              </template>
            </el-table-column>

            <!-- 新增：删除药品按钮 -->
            <el-table-column label="操作" align="center" v-show="role == '管理员'">
              <template v-slot="scope">
                <el-button type="danger" icon="el-icon-delete" size="mini" @click="deleteDrug(scope.row.id)">删除
                </el-button>
              </template>
            </el-table-column>
          </el-table>

          <div style="margin-top:15px;text-align:center">
            <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"
              :current-page="queryInfo.pageNum" :page-sizes="[5, 10, 15, 50]" :page-size="queryInfo.pageSize"
              layout="total,sizes,prev,pager,next,jumper" :total="total">
            </el-pagination>
          </div>
        </el-tab-pane>
      </el-tabs>
    </el-card>

    <!-- 添加药品弹窗 -->
    <el-dialog title="添加药品" :visible.sync="isAddDrug" width="50%" @close="addClosed">
      <el-form :model="addDrugForm" :rules="addDrugFormRules" ref="addDrugFormRef" label-width="160px">
        <el-form-item label="照片：">
          <el-upload class="avatar-uploader" action="https://jsonplaceholder.typicode.com/posts/"
            :show-file-list="false" :on-success="handleAvatarSuccess" :before-upload="beforeAvatarUpload">
            <img v-if="imgUrl" :src="imgUrl" class="avatar">
            <i v-else class="el-icon-plus avatar-uploader-icon"></i>
          </el-upload>
        </el-form-item>
        <el-form-item label="药名：" prop="drugName">
          <el-input v-model="addDrugForm.drugName" size="medium" style="width: 70%"></el-input>
        </el-form-item>
        <el-form-item label="药的种类：" prop="drugTypeId">
          <el-select v-model="addDrugForm.drugTypeId" filterable clearable placeholder="请选择药品类型">
            <el-option v-for="item in tabList" :key="item.drugTypeId" :label="item.drugType" :value="item.drugTypeId">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="药的数量：" prop="drugNumber">
          <el-input v-model="addDrugForm.drugNumber" size="medium" style="width: 70%"></el-input>
        </el-form-item>
        <el-form-item label="单位：" prop="unit">
          <el-input v-model="addDrugForm.unit" size="medium" style="width: 70%"></el-input>
        </el-form-item>
        <el-form-item label="单价：" prop="price">
          <el-input v-model="addDrugForm.price" size="medium" style="width: 70%">
            <i slot="suffix" style="font-style: normal; margin-right: 10px">¥</i>
          </el-input>
        </el-form-item>
        <el-form-item label="有效期：" prop="termOfValidity">
          <el-input v-model="addDrugForm.termOfValidity" size="medium" style="width: 70%"></el-input>
        </el-form-item>
        <el-form-item label="说明：" prop="explain">
          <el-input v-model="addDrugForm.explain" size="medium" style="width: 70%"></el-input>
        </el-form-item>
      </el-form>

      <span slot="footer" class="dialog-footer">
        <el-button @click="isAddDrug = false">取 消</el-button>
        <el-button type="primary" @click="onConfirm">确 认</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "PharmacyInfo",
  data() {
    return {
      checkList: [],
      drugList: [],
      isAddDrug: false,
      queryInfo: {
        pageNum: 1,
        pageSize: 10,
        drugName: '',
        drugType: '',
        pharmacyId: ''
      },
      total: 0,
      role: '',
      editableTabsValue: "感冒药",
      tabList: [],
      imgUrl: "",

      // 添加药品表单
      addDrugForm: {
        drugName: "",
        photo: "",
        drugTypeId: "",
        drugNumber: "",
        unit: "",
        price: 0,
        termOfValidity: "",
        explain: ""
      },
      // 表单校验
      addDrugFormRules: {
        drugName: [{ required: true, message: "请输入药名", trigger: "blur" }],
        drugTypeId: [{ required: true, message: "请选择药品类型", trigger: "change" }],
        drugNumber: [{ required: true, message: "请输入药品数量", trigger: "blur" }],
        unit: [{ required: true, message: "请输入单位", trigger: "blur" }],
        price: [{ required: true, message: "请输入单价", trigger: "blur" }]
      },
      // 购买订单
      addMedicineForm: {
        businessNo: "",
        businessType: "",
        businessContent: "",
        businessOrganization: "",
        businessStatus: "",
        price: "",
        createId: ""
      }
    }
  },
  created() {
    this.role = JSON.parse(window.sessionStorage.getItem("user"))?.role || ''
    console.log("role: ", this.role)
    this.getDrugTypeList()
    this.getDrugList("感冒药")
  },
  methods: {
    // 返回
    goBack() {
      this.$router.push({ path: '/pharmacy' })
    },

    // 立即购买
    async onPurchase() {
      if (this.checkList.length <= 0) {
        return this.$message.warning("请选择商品！")
      }
      this.addMedicineForm.businessStatus = "1"
      this.addMedicineForm.businessType = "0"
      this.addMedicineForm.businessOrganization = this.$route.query.name
      this.addMedicineForm.businessNo = "MY" + Math.floor(Math.random() * 100000000)
      let totalPrice = 0
      let drugNames = ""

      this.checkList.forEach((item, i) => {
        totalPrice += item.price * item.orderNumber
        drugNames += (i > 0 ? "，" : "") + item.drugName
      })

      this.addMedicineForm.price = totalPrice
      this.addMedicineForm.businessContent = `${JSON.parse(window.sessionStorage.getItem("user"))?.username || ''}在${this.addMedicineForm.businessOrganization}购买了：${drugNames}`
      this.addMedicineForm.createId = JSON.parse(window.sessionStorage.getItem("user")).id

      const { data: res } = await this.$http.post("/medical/insertMedical", this.addMedicineForm)
      if (res !== "success") return this.$message.error("购买失败")
      this.$message.success("购买成功")
      this.checkList = []
      this.$router.push("/medicine")
    },

    // 勾选药品
    checkDrug(isCheck, row) {
      if (isCheck) {
        this.checkList.push(row)
      } else {
        this.checkList = this.checkList.filter(item => item.id !== row.id)
      }
    },

    // 获取药品列表
    async getDrugList(editableTabsValue) {
      this.drugList = []
      this.total = 0
      this.queryInfo.drugType = editableTabsValue
      this.queryInfo.pharmacyId = this.$route.query.id || ""

      const { data: res } = await this.$http.get("/medical/drugList", { params: this.queryInfo })
      this.drugList = res || []

      if (this.drugList.length > 0) {
        this.total = this.drugList[0].total || 0
        this.drugList.forEach(item => {
          if (item.photo) item.photo = require('@/' + item.photo)
          item.isCheck = false
          item.orderNumber = 1
        })
      }
    },

    // 获取药品分类
    async getDrugTypeList() {
      const { data: res } = await this.$http.get("/medical/typeList")
      this.tabList = res || []
    },

    // 搜索
    search() {
      this.queryInfo.pageNum = 1
      this.getDrugList(this.editableTabsValue)
    },
    handleSizeChange(s) { this.queryInfo.pageSize = s; this.getDrugList(this.editableTabsValue) },
    handleCurrentChange(p) { this.queryInfo.pageNum = p; this.getDrugList(this.editableTabsValue) },

    // 关闭添加弹窗重置表单
    addClosed() {
      this.$refs.addDrugFormRef.resetFields()
      this.imgUrl = ""
    },

    // 添加药品确认
    onConfirm() {
      this.$refs.addDrugFormRef.validate(async valid => {
        if (!valid) return
        this.addDrugForm.pharmacyId = this.$route.query.id
        this.addDrugForm.createId = JSON.parse(window.sessionStorage.getItem("user")).id

        const { data: res } = await this.$http.post("/medical/insertDrug", this.addDrugForm)
        if (res !== "success") return this.$message.error("添加失败")
        this.$message.success("添加成功")

        // 自动切换到对应分类
        const target = this.tabList.find(t => t.drugTypeId === this.addDrugForm.drugTypeId)
        if (target) this.editableTabsValue = target.drugType

        this.getDrugList(this.editableTabsValue)
        this.isAddDrug = false
      })
    },

    // ==================== 新增：删除药品 ====================
    async deleteDrug(id) {
      this.$confirm('确定要删除该药品吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(async () => {
        const { data: res } = await this.$http.delete(`/medical/deleteDrug/${id}`)
        if (res !== "success") return this.$message.error("删除失败")
        this.$message.success("删除成功")
        this.getDrugList(this.editableTabsValue)
      }).catch(() => {
        this.$message.info('已取消删除')
      })
    },

    // 图片上传
    handleAvatarSuccess(res, file) {
      this.imgUrl = URL.createObjectURL(file.raw)
      this.addDrugForm.photo = 'assets/imgs/' + file.raw.name
    },
    beforeAvatarUpload(file) {
      const isJpg = file.type === 'image/jpeg'
      const isLt2M = file.size / 1024 / 1024 < 2
      if (!isJpg) this.$message.error('只能上传 JPG 图片')
      if (!isLt2M) this.$message.error('图片大小不能超过 2MB')
      return isJpg && isLt2M
    }
  }
}
</script>

<style lang="less" scoped>
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9dd;
  border-radius: 6px;
  cursor: pointer;
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