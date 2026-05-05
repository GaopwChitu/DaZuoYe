import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '../components/login/Login.vue'
import Home from '../components/home/Home.vue'
import Welcome from '../components/welcome/Welcome.vue'
import SportInfo from '../components/sportinfo/SportInfo.vue'
import Register from '../components/register/Register.vue'
import UserList from '../components/admin/UserList.vue'
import Sport from '../components/admin/Sport.vue'
import Detail from '../components/admin/Detail.vue'
import Info from '../components/admin/Info.vue'
import Community from '../components/admin/Community.vue'
import SportKnowledge from '../components/func/SportKnowledge.vue'
import HealthKnowledge from '../components/func/HealthKnowledge.vue'
import Personal from '../components/func/Personal.vue'
import Activity from '../components/func/Activity.vue'
import Upload from '../components/bodyinfo/Upload.vue'
import History from '../components/bodyinfo/History.vue'
import Dashboard from '../components/bodyinfo/Dashboard.vue'
import Assess from '../components/bodyinfo/Assess.vue'
import Repast from '../components/mutualhelp/repast/Repast.vue'
import Restaurant from '../components/mutualhelp/repast/Restaurant.vue'
import Medicine from '../components/mutualhelp/medicine/Medicine.vue'
import Appointment from '../components/mutualhelp/medicine/Appointment.vue'
import Pharmacy from '../components/mutualhelp/medicine/Pharmacy.vue'
import PharmacyInfo from '../components/mutualhelp/medicine/PharmacyInfo.vue'
import Shopping from '../components/mutualhelp/shop/Shopping.vue'
import ShoppingMall from '../components/mutualhelp/shop/ShoppingMall.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: "/",
    redirect: "/login"
  },
  {
    path: "/login",
    component: Login
  },
  {
    path: "/register",
    component: Register
  },
  {
    path: "/home",
    component: Home,
    redirect: "/welcome",
    children: [
      { path: "/welcome", component: Welcome },
      { path: "/user_admin", component: UserList },
      { path: "/sport_admin", component: Sport },
      { path: "/detail_admin", component: Detail },
      { path: "/info_admin", component: Info },
      { path: "/community_admin", component: Community },
      { path: "/sport_knowledge", component: SportKnowledge },
      { path: "/sport_info", component: SportInfo },
      { path: "/health_knowledge", component: HealthKnowledge },
      { path: "/personal", component: Personal },
      { path: "/activity", component: Activity },
      { path: "/info_upload", component: Upload },
      { path: "/info_history", component: History },
      { path: "/bodyinfo", component: Dashboard },
      { path: "/assess", component: Assess },
      { path: "/repast", component: Repast },
      { path: "/restaurant", component: Restaurant },
      { path: "/medicine", component: Medicine },
      { path: "/appointment", component: Appointment },
      { path: "/pharmacy", component: Pharmacy },
      { path: "/pharmacy_info", component: PharmacyInfo },
      { path: "/shop", component: Shopping },
      { path: "/shopping_mall", component: ShoppingMall },
    ]
  },
]

const router = new VueRouter({
  routes
})

router.beforeEach((to, from, next) => {
  if (to.path == '/login') return next();
  if (to.path == '/register') return next();
  const userFlag = window.sessionStorage.getItem("user");
  if (!userFlag) return next('/login');
  next();
})

export default router
