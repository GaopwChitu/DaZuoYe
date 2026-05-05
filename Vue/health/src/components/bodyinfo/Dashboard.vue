<template>
  <el-row class="row-bg" :gutter="20">
    <div>
      <el-col :span="6">
        <div class="grid-content bg-purple-dark">
          <div class="col1">
            <div class="col6">身高</div>
            <div class="col6zhi">
              {{ this.bodyInfo.height }}<span class="unit">/m</span>
            </div>
          </div>
          <div>
            <i class="el-icon-user-solid" style="font-size: 80px"></i>
          </div>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content bg-purple-dark">
          <div class="col1">
            <div class="col6">体重</div>
            <div class="col6zhi">
              {{ this.bodyInfo.weight }}<span class="unit">/kg</span>
            </div>
          </div>
          <div>
            <i class="el-icon-odometer" style="font-size: 80px"></i>
          </div>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content bg-purple-dark">
          <div class="col1">
            <div class="col6">BMI</div>
            <div class="col6zhi">{{ this.bmi }}<span class="unit"></span></div>
          </div>
          <div>
            <i class="el-icon-date" style="font-size: 80px"></i>
          </div>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content bg-purple-dark">
          <div class="col1">
            <div class="col6">年龄</div>
            <div class="col6zhi" style="text-align: center; font-size: 30px">
              {{ this.bodyInfo.age }}<span class="unit"></span>
            </div>
          </div>
          <div>
            <i class="el-icon-s-data" style="font-size: 80px"></i>
          </div>
        </div>
      </el-col>
    </div>

    <div class="div2">
      <div class="box1 box">
        <div class="box1 box" ref="myChart"></div>
      </div>

      <div class="box2 box">
        <div id="chart-container" style="width: 100%; height: 100%"></div>
      </div>

      <div class="box3 box">
        <div id="chart-containerLine" style="width: 100%; height: 100%"></div>
      </div>
    </div>
  </el-row>
</template>
<script>
export default {
    name: "Dashboard",
    data() {
        return {
            charts: "",
            bodyInfo: "",
            bmi: null,
            score: null,
            BodyNotesInfo: "",
            vision: [],
            waterConsumption: [],
            bloodSugar: [],
            bloodPressure: [],
            date: [],
            heartRate: [],
        };
    },

    methods: {
        async getBodyInfo() {
            const user = JSON.parse(window.sessionStorage.getItem("user"));
            try {
                const res = await this.$http.get("bodyinfo", {
                    params: {
                        id: user.id,
                    }
                });
                this.bodyInfo = res.data.data.bodyList[0];
            } catch (error) {
                console.log("我真的服了，获取BodyInfo错误");
            }
        },
        async getBodyNotes() {
            try {
                const response = await this.$http.get("bodynotes?id=" + this.bodyInfo.id);
                this.BodyNotesInfo = response.data.data;
                // 遍历 BodyNotesInfo 数组中的每一个元素，将其各个属性值分别添加到对应的数组中,note包含每一条数据的对象
                this.BodyNotesInfo.forEach((note) => {
                    this.vision.push(note.vision);
                    this.waterConsumption.push(note.waterConsumption);
                    this.bloodSugar.push(note.bloodSugar);
                    this.bloodPressure.push(note.bloodPressure);
                    this.heartRate.push(note.heartRate);
                    const formattedDate = new Date(note.date).toLocaleString("en-US", {
                        year: "numeric",
                        month: "2-digit",
                        day: "2-digit",
                    });
                    this.date.push(formattedDate);
                });
            } catch (error) {
                console.log("我真的醉了，获取BodyNotes错误");
            }
        },

        bmiM() {
            // 从bodyInfo中获取身高和体重的值，并转换为 Number 类型
            const weight = Number(this.bodyInfo.weight);
            // 计算BMI值
            const bmiValue = weight / (this.bodyInfo.height * this.bodyInfo.height);
            // 返回计算结果并保留两位小数
            this.bmi = bmiValue.toFixed(2);
            return bmiValue.toFixed(2);
        },

        BarChart() {
            const chartDom = document.getElementById("chart-container");
            const myChart = this.$echarts.init(chartDom);

            const option = {
                color: ["#3398DB"],
                tooltip: {
                    trigger: "axis",
                    axisPointer: {
                        type: "shadow",
                    },
                },
                grid: {
                    left: "3%",
                    right: "4%",
                    bottom: "3%",
                    containLabel: true,
                },
                title: {
                    text: "视力变化趋势图",
                    textStyle: {
                        fontWeight: "normal",
                        fontSize: 25,
                        color: "#666",
                    },
                    left: "center",
                    top: 20,
                    padding: [10, 10, 0, 10],
                },
                xAxis: [
                    {
                        type: "category",
                        data: this.date,
                        axisTick: {
                            alignWithLabel: true,
                        },
                        axisLabel: {
                            interval: 1, //设置X轴文字显示间隔
                            rotate: 45, //设置X轴文字旋转角度
                            textStyle: {
                                fontSize: 12, //设置X轴文字样式
                            },
                        },
                    },
                ],
                yAxis: [
                    {
                        type: "value",
                        axisLabel: {
                            textStyle: {
                                fontSize: 12, //设置Y轴文字样式
                            },
                        },
                    },
                ],
                series: [
                    {
                        name: "视力",
                        type: "bar",
                        barWidth: "60%",
                        data: this.vision,
                        itemStyle: {
                            // 阴影的大小
                            shadowBlur: 5,
                            // 阴影水平方向上的偏移
                            shadowOffsetX: 2,
                            // 阴影垂直方向上的偏移
                            shadowOffsetY: 2,
                            // 阴影颜色
                            shadowColor: "rgba(0, 0, 0, 0.5)",
                            // 柱状图圆角，初始化效果
                            barBorderRadius: 5,
                        },
                    },
                ],
            };

            myChart.setOption(option);
        },

        area() {
            const chartDom = document.getElementById("chart-containerLine");
            const myChart = this.$echarts.init(chartDom);

            const option = {
                title: {
                    text: "血压血糖变化趋势图",
                    textStyle: {
                        fontWeight: "normal",
                        fontSize: 25,
                        color: "#666",
                    },
                    left: "center",
                    top: 20,
                    padding: [10, 10, 0, 10],
                },
                tooltip: {
                    trigger: "axis",
                },
                legend: {
                    data: ["血压", "血糖"],
                },
                xAxis: {
                    type: "category",
                    data: this.date,
                    axisLabel: {
                        interval: 1, //设置X轴文字显示间隔
                        textStyle: {
                            fontSize: 12, //设置X轴文字样式
                        },
                    },
                },
                yAxis: {
                    type: "value",
                },
                series: [
                    {
                        name: "血压",
                        data: this.bloodPressure,
                        type: "line",
                    },
                    {
                        name: "血糖",
                        data: this.bloodSugar,
                        type: "line",
                    },
                ],
            };

            myChart.setOption(option);
        },

        async getMenuList() {
            const { data: res } = await this.$http.get("menus");
            if (res.flag != 200) return this.$message.error("获取列表失败");
            this.menuList = res.menus;
        },
    },
    watch: {
        bodyInfo: {
            deep: true, //监听对象内部属性的变化
            async handler() {
                this.bmiM(); // 计算BMI值
                await this.getBodyNotes(); // 获取身体数据信息
                this.BarChart();
                this.area();

                const chartDom = this.$refs.myChart;
                const myChart = this.$echarts.init(chartDom);

                const option = {
                title: {
                    text: "心率变化趋势图",
                    textStyle: {
                        fontWeight: "normal",
                        fontSize: 25,
                        color: "#666",
                    },
                    left: "center",
                    top: 20,
                },
                xAxis: {
                    type: "category",
                    data: this.date,
                    axisLabel: {
                        fontSize: 12,
                        interval: 2,
                    },
                    axisTick: {
                        show: false,
                    },
                },
                yAxis: {
                    type: "value",
                    axisLine: {
                        show: false,
                    },
                    splitLine: {
                        lineStyle: {
                            type: "dashed",
                            color: "#ddd",
                        },
                    },
                    axisTick: {
                        show: false,
                    },
                },
                tooltip: {
                    trigger: "axis",
                    formatter: function (params) {
                        return params[0].name + "：" + params[0].value;
                    },
                },
                series: [
                    {
                        data: this.heartRate,
                        type: "line",
                        smooth: true,
                        lineStyle: {
                            width: 3,
                            color: "#00bfff",
                        },
                        symbol: "circle",
                        symbolSize: 8,
                        itemStyle: {
                            color: "#00bfff",
                            borderColor: "#fff",
                            borderWidth: 2,
                        },
                        markLine: {
                            data: [
                                {
                                    type: "average",
                                    name: "平均值",
                                },
                            ],
                            label: {
                                position: "insideEndBottom",
                                formatter: "{b}：{c}",
                            },
                            lineStyle: {
                                type: "dashed",
                                color: "green",
                                width: 2,
                            },
                            symbol: "none",
                        },
                        animation: true,
                        animationDuration: 3000,
                        animationEasing: "cubicInOut",
                    },
                ],
                };
                myChart.setOption(option);
            },
        },
    },
    created() {
        this.getBodyInfo();
    },
}
</script>
<style scoped>
.bg-purple-dark {
    background: #ffffff;
    box-shadow: 0px 0px 1px #000000;
}

.unit {
    font-size: 20px;
    font-weight: normal;
    margin-left: 5px;
    color: #555;
}
.grid-content {
    border-radius: 4px;
    min-height: 130px; /* increase the height for better visibility */
    display: flex; /* center content horizontally and vertically */
    justify-content: center;
    align-items: center;
    margin-top: 30px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* 添加四边阴影 */
}

.row-bg {
    padding: 10px;
    background-color: #f9fafc;
}
.div2 {
    margin-top: 15%;
    height: 500px;
    width: 100%;
    background-color: #555;
    display: flex;
    flex-direction: row;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* 添加四边阴影 */
}

.box {
    height: 100%;
    width: 100%;
    flex-grow: 1;
    background: #ffffff;
    box-shadow: 0px 0px 1px #000000;
}
.col6 {
    font-size: 26px;
    font-weight: bold;
    color: #313131;
    text-align: right;
    padding-right: 10px;
    margin-top: -30px;
}

.col6zhi {
    font-size: 20px;
    font-weight: bold;
    color: #746c6c;
    padding-top: 30px;
}

.col1 {
    margin-right: -80%;
    padding-top: 20px;
}
</style>