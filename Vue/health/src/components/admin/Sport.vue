<!-- 搜索框和添加按钮，搜索框，以及用户名和手机号的输入框 -->
<template>
  <div>
    <el-card id="search">
      <el-row>
        <el-col :span="23">
          <!-- v-model绑定组件实现双向数据绑定，页面上用户输入的值会同步更新到该属性中 -->
          <el-input
            v-model="searchModel.sportType"
            placeholder="运动类型"
            clearable
          ></el-input>
          <el-button
            @click="getSportList"
            type="primary"
            round
            icon="el-icon-search"
            >查询</el-button
          >
        </el-col>
        <el-col :span="1">
          <el-button
            @click="openEditUi(null)"
            type="primary"
            icon="el-icon-plus"
            circle
          ></el-button>
        </el-col>
      </el-row>
    </el-card>

    <!-- 结果列表 -->
    <el-card>
      <el-table :data="sportList" stripe style="width: 100%">
        <el-table-column
          type="index"
          label="序号"
          width="180"
        ></el-table-column>
        <el-table-column prop="id" label="ID" width="150"></el-table-column>
        <el-table-column
          prop="sportType"
          label="运动类型"
          width="150"
        ></el-table-column>
        <el-table-column
          prop="suitableFrequency"
          label="运动频率"
          width="150"
        ></el-table-column>

        <el-table-column
          prop="suitableTime"
          label="运动时间"
          width="150"
        ></el-table-column>

        <el-table-column
          prop="recommendedSpeed"
          label="运动速度"
          width="150"
        ></el-table-column>

        <el-table-column
          prop="suitableHeartRate"
          label="运动心率"
          width="150"
        ></el-table-column>

        <el-table-column label="操作" width="180">
          <!-- 删除和修改按钮 -->
          <template slot-scope="scope">
            <el-button
              @click="openEditUi(scope.row.id)"
              type="primary"
              icon="el-icon-edit"
              circle
            ></el-button>
            <el-button
              @click="deleteSport(scope.row)"
              type="danger"
              icon="el-icon-delete"
              circle
            ></el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>

    <!-- 分页功能 -->
    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="searchModel.pageNo"
      :page-sizes="[5, 10, 20, 30]"
      :page-size="searchModel.pageSize"
      layout="total, sizes, prev, pager, next, jumper"
      :total="total"
    >
    </el-pagination>

    <!-- 用户编辑信息弹出框 -->
    <el-dialog
      @close="clearForm"
      :title="title"
      :visible.sync="dialogFormVisible"
    >
      <el-form :model="sportForm" ref="sportFormRef" >
        <el-form-item label="运动类型" prop="sportType" :label-width="formLabelWidth">
          <el-input v-model="sportForm.sportType" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item
           label="运动频率" prop="suitableFrequency" :label-width="formLabelWidth">
          <el-input v-model="sportForm.suitableFrequency" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="运动时间" prop="suitableTime" :label-width="formLabelWidth">
          <el-input v-model="sportForm.suitableTime" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item
          label="运动速度" prop="emrecommendedSpeedail" :label-width="formLabelWidth">
          <el-input v-model="sportForm.recommendedSpeed" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item
          label="运动心率" prop="suitableHeartRate" :label-width="formLabelWidth">
          <el-input v-model="sportForm.suitableHeartRate" autocomplete="off"></el-input>
        </el-form-item>

      </el-form>

      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="saveSport">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "Sport",
  data() {
    return {
      sportForm: {}, //初始化为一个空对象
      sportList:[],
      //左边宽度
      formLabelWidth: "135px",
      //设置默认值不可见
      dialogFormVisible: false,
      title: "",
      total: 0,
      searchModel: {
        pageNo: 1,
        // 默认显示数量
        pageSize: 10,
      },
      //表单规则配置

      rules: {
        sportType: [
          { required: true, message: "请输入运动类型", trigger: "blur" }
        ]
      },
    };
  },

  methods: {
    saveSportForm(sport) {
      if (sport.id == null && sport.id == undefined) {
        return this.addSport(sport);
      }
      return this.updateSport(sport);
    },
    async addSport(sport) {
      try {
        const res = await this.$http.post("sport/add", sport);
        return res.data;
      } catch (error) {
        console.log("新增SportForm错误");
      }
    },
    async updateSport(sport) {
      const res = await this.$http.put("sport/update", sport);
      return res.data;
    },
    saveSport() {
      let isOk = true;
      //触发表单的验证
      this.$refs.sportFormRef.validate((valid) => {
        // 这边只有校验失败的时候才会进来,在外面定义一个 isok,校验失败会将他改成 false
        isOk = valid;
      });

      if (isOk) {
        //提交验证给后台
        console.log(this.sportForm)
        this.saveSportForm(this.sportForm).then((response) => {
          //成功提示
          console.log("提交Form成功")
          this.$message({
            message: response.message,
            type: "success",
          });
          //关闭对话框
          this.dialogFormVisible = false;
          //刷新表格数据
          this.getSportList();
        });
      } else {
        console.log("error submit!!");
        return false;
      }
    },

    //清理表单数据
    clearForm() {
      this.sportForm = {
      };
      //清除表单校验的提示信息
      this.$refs.sportFormRef.clearValidate();
    },
    handleSizeChange(pageSize) {
      //数据更新
      this.searchModel.pageSize = pageSize;
      this.getSportList();
    },
    handleCurrentChange(pageNo) {
      this.searchModel.pageNo = pageNo;
      this.getSportList();
    },

    async getSportFormList(searchModel) {
      const res = await this.$http.get("sport/getSportList", {
        params: {
          pageNo: searchModel.pageNo,
          pageSize: searchModel.pageSize,
          sportType: searchModel.sportType,
        }
      })
      return res.data;
    },
    getSportList() {
      this.getSportFormList(this.searchModel).then((response) => {
        // 将查询结果中的 rows 属性赋值给 sportList
        this.sportList = response.data.rows;
        // 将查询结果中的 total 属性赋值给 total
        this.total = response.data.total;
      });
    },

    async getSportById(id) {
      const res = await this.$http.get(`sport/${id}`)
      return res.data;
    },
    openEditUi(id) {
      console.log(id)
      if (id == null) {
        this.title = "新增运动信息";
      } else {
        this.title = "修改运动信息";
        //根据id查询用户数据
        this.getSportById(id).then((response) => {
          this.sportForm = response.data;
          console.log("查询")
          console.log(this.sportForm)
        });
      }
      this.dialogFormVisible = true;
    },
    async deleteSportById(id) {
      const res = await this.$http.delete(`sport/${id}`)
      return res.data;
    },
    deleteSport(sport) {
      this.$confirm(`确认删除 ${sport.sportType} 这个运动信息吗？`, "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          this.deleteSportById(sport.id).then((response) => {
            this.$message({
              type: "success",
              message: response.message,
            });
            this.getSportList();
          });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消删除",
          });
        });
    },
  },

  
  //加载时就查询一次
  created() {
    this.getSportList();
  },
};
</script>
<style>
#search .el-input {
  width: 200px;
  margin-right: 20px;
}
.el-dialog .el-input {
  width: 43%;
}

/* 很美观的CSS样式 */
/* body {
    background: linear-gradient(to right, lightblue, lightpink);
    margin: 0;
    padding: 0;
    font-family: Arial, Helvetica, sans-serif;
  } */

/* 很美观的CSS卡片 */
.el-card {
  width: 80%;
  margin: 20px auto;
  border-radius: 20px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
  overflow: hidden;
}

/* 很美观的CSS表格 */
.el-table {
  width: 100%;
  border-collapse: collapse;
}

/* 很美观的CSS表格标题 */
.el-table-column {
  background-color: lightblue;
  color: white;
  padding: 10px;
  border: 1px solid white;
  text-align: center;
}

/* 很美观的CSS表格数据 */
.el-table-column[type="index"],
.el-table-column[prop="id"],
.el-table-column[prop="username"],
.el-table-column[prop="phone"],
.el-table-column[prop="email"] {
  background-color: white;
  color: black;
  padding: 10px;
  border: 1px solid lightblue;
  text-align: center;
}

/* 很美观的CSS表格数据悬停效果 */
.el-table-column[type="index"]:hover,
.el-table-column[prop="id"]:hover,
.el-table-column[prop="username"]:hover,
.el-table-column[prop="phone"]:hover,
.el-table-column[prop="email"]:hover {
  background-color: lightpink;
  color: white;
}

/* 很美观的CSS按钮悬停效果 */
.el-button:hover {
  transform: scale(1.2);
}

/* 和这个代码一样的CSS */
.el-pagination {
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 20px;
}

/* 和这个代码一样的CSS总数 */
.el-pagination__total {
  color: #606266;
  margin-right: 20px;
}

/* 和这个代码一样的CSS每页显示条数 */
.el-pagination__sizes {
  display: flex;
  align-items: center;
  margin-right: 20px;
}

/* 和这个代码一样的CSS每页显示条数选择器 */
.el-pagination__sizes .el-select {
  width: 100px;
}

/* 和这个代码一样的CSS上一页按钮 */
.el-pagination__prev {
  display: flex;
  align-items: center;
  margin-right: 10px;
}

/* 和这个代码一样的CSS上一页按钮图标 */
.el-pagination__prev .el-icon {
  font-size: 20px;
  color: #409eff;
}

/* 和这个代码一样的CSS页码 */
.el-pagination__pager {
  display: flex;
  align-items: center;
  margin-right: 10px;
}

/* 和这个代码一样的CSS页码按钮 */
.el-pagination__pager button {
  width: 30px;
  height: 30px;
  border-radius: 4px;
  border: none;
  background-color: white;
  color: #606266;
  margin: 2px;
  transition: all 0.3s ease-in-out;
}

/* 和这个代码一样的CSS页码按钮悬停效果 */
.el-pagination__pager button:hover {
  background-color: #409eff;
  color: white;
}

/* 和这个代码一样的CSS当前页码按钮 */
.el-pagination__pager button.is-active {
  background-color: #409eff;
  color: white;
}

/* 和这个代码一样的CSS下一页按钮 */
.el-pagination__next {
  display: flex;
  align-items: center;
  margin-right: 10px;
}

/* 和这个代码一样的CSS下一页按钮图标 */
.el-pagination__next .el-icon {
  font-size: 20px;
  color: #409eff;
}

/* 和这个代码一样的CSS跳转输入框 */
.el-pagination__jump {
  display: flex;
  align-items: center;
}

/* 和这个代码一样的CSS跳转输入框标签 */
.el-pagination__jump label {
  color: #606266;
}

/* 和这个代码一样的CSS跳转输入框输入框 */
.el-pagination__jump input {
  width: 50px;
  height: 30px;
  border-radius: 4px;
  border: none;
}
</style>