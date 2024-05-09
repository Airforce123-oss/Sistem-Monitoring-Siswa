import Vue from "vue";
import VueRouter from "vue-router";

// Import halaman-halaman Vue yang akan Anda gunakan dalam aplikasi
import dataSiswa from "./resources/js/Pages/Admin/DataSiswa.vue";
//import HalamanKedua from './views/HalamanKedua.vue';

Vue.use(VueRouter);

const routes = [
    // { path: '/', component: HalamanPertama },
    { path: "/admin/dataSiswa", component: dataSiswa },
];

const router = new VueRouter({
    routes,
});

export default router;
