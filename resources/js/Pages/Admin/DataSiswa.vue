<template>
    <h1>Data Induk Siswa</h1>
    <button>Tambah Data Siswa</button>
    <p>Show 10 entries</p>
</template>
<script setup>
import { onMounted } from "vue";
import { initFlowbite } from "flowbite";

onMounted(() => {
    initFlowbite();
});
</script>
