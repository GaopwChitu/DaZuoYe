<template>
    <el-container class="home-container">
        <!-- header -->
        <el-header>
            <div>
                <img src="../../assets/imgs/流萤酱.gif" alt class="logo_img" />
                <span>亚健康管理平台</span>
            </div>
            <el-button type="info" @click="logout">退出</el-button>
        </el-header>
        <!-- mainbody -->
        <el-container>
            <!-- 侧边栏 -->
            <el-aside :width="isCollapse ? '64px' : '200px'">
                <div class="toggle-button" @click="toggleCollapse">
                    |||
                </div>
                <el-menu background-color="#7BC0BB" text-color="#fff" active-text-color="#E36814" :collapse="isCollapse"
                    :collapse-transition="false" :router="true" :default-active="activePath">
                    <!-- 一级菜单 -->
                    <el-menu-item :index="'/home'" @click="saveNavState('/home')">
                        <!-- <i class="el-icon-s-home"></i> -->
                        <span slot="title">首页</span>
                    </el-menu-item>

                    <el-submenu :index="item.id + ''" v-for="item in menuList" :key="item.id">
                        <template slot="title">
                            <!-- <i :class="iconsObject[item.id]"></i> -->
                            <span>{{ item.title }}</span>
                        </template>

                        <!-- 二级菜单 -->
                        <el-menu-item :index="it.path" v-for="it in item.sList" :key="it.id"
                            @click="saveNavState(it.path)">
                            <template slot="title">
                                <!-- <i :class="iconsObject[it.id]"></i> -->
                                <span>{{ it.title }}</span>
                            </template>
                        </el-menu-item>

                    </el-submenu>

                </el-menu>
            </el-aside>

            <el-main>
                <router-view></router-view>
            </el-main>

        </el-container>

    </el-container>

</template>
<script>
export default {
    name: "Home",
    data() {
        return {
            menuList: [],
            isCollapse: false,
            // iconsObject: {
            //   '100':'el-icon-user-solid',
            //   '200':'iconfont iconsport',
            //   '101':'iconfont icondenglu',
            //   '102':'iconfont iconmima',
            //   '103':'iconfont iconsport',
            //   '104':'iconfont iconshangpin',
            //   '201':'iconfont iconshu',
            //   '202':'iconfont iconkaluli',
            //   '203':'iconfont iconshiwu',
            //   '204':'iconfont icondenglu',
            // },
            activePath: '',
        }
    },
    created() {
        this.getMenuList();
        this.activePath = window.sessionStorage.getItem("activePath")
    },
    methods: {
        //退出
        logout() {
            window.sessionStorage.clear();
            this.$router.push("/login");
        },
        //获取 menuList
        async getMenuList() {
            const user = JSON.parse(window.sessionStorage.getItem("user"));
            const { data: res } = await this.$http.get("menus", {
                params: {
                    id: user.id,
                }
            });
            if (res.flag != 200) return this.$message.error("获取列表失败");
            this.menuList = res.menus;
        },
        // 侧边栏伸缩
        toggleCollapse() {
            this.isCollapse = !this.isCollapse;
        },
        // 保存当前路径
        saveNavState(activePath) {
            window.sessionStorage.setItem("activePath", activePath);
            this.activePath = activePath;
        },
    },
}
</script>
<style lang='less' scoped>
.home-container {
    height: 100%;
}

.el-header {
    background-color: #69ABB2;
    display: flex;
    justify-content: space-between; // 左右贴边
    padding-left: 0%; // 左边界
    align-items: center; // 水平
    color: #fff;
    font-size: 20px;

    >div {
        //左侧div加布局
        display: flex;
        align-items: center;

        span {
            margin-left: 15px;
        }
    }
}

.el-aside {
    background-color: #99C8B7;

    .el-menu {
        border-right: none;
    }
}

.el-main {
    background-color: white;
}

.logo_img {
    width: 64px;
    height: 100%;
}

.toggle-button {
    background-color: #7BC0BB;
    font-size: 10px;
    line-height: 24px;
    color: #fff;
    text-align: center;
    letter-spacing: 0.2em;
    cursor: pointer;
}
</style>