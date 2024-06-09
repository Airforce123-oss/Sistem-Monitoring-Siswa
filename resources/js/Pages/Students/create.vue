<script setup>
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import { onMounted } from "vue";
import { initFlowbite } from "flowbite";
import { Head, Link, useForm } from "@inertiajs/vue3";
import { watch, ref } from "vue";
import axios from "axios";
import InputError from "@/Components/InputError.vue";

defineProps({
    classes: {
        type: Object,
    },
});

let sections = ref({});

const form = useForm({
    name: "",
    email: "",
    class_id: "",
    section_id: "",
});

watch(
    () => form.class_id,
    (newValue) => {
        getSections(newValue);
    }
);

const getSections = (class_id) => {
    axios.get("/api/sections?class_id=" + class_id).then((response) => {
        sections.value = response.data;
    });
};

const createStudent = () => {
    form.post(route("students.store"));
};

onMounted(() => {
    initFlowbite();
});
</script>

<template>
    <Head title="Students" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Students
            </h2>
        </template>
        <div class="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
            <div class="lg:grid lg:grid-cols-12 lg:gap-x-5">
                <div class="space-y-6 sm:px-6 lg:px-0 lg:col-span-12">
                    <form @submit.prevent="createStudent">
                        <div class="shadow sm:rounded-md sm:overflow-hidden">
                            <div class="bg-white py-6 px-4 space-y-6 sm:p-6">
                                <div>
                                    <h3
                                        class="text-lg leading-6 font-medium text-gray-900"
                                    >
                                        Informasi Siswa
                                    </h3>
                                    <p class="mt-1 text-sm text-gray-500">
                                        Gunakan Form ini untuk mengisi data siswa
                                    </p>
                                </div>

                                <div class="grid grid-cols-6 gap-6">
                                    <div class="col-span-6 sm:col-span-3">
                                        <label
                                            for="name"
                                            class="block text-sm font-medium text-gray-700"
                                            >Nama</label
                                        >
                                        <input
                                            v-model="form.name"
                                            type="text"
                                            id="name"
                                            class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
                                            :class="{
                                                'text-red-900 focus:ring-red-500 focus:border-red-500 border-red-300':
                                                    form.errors.name,
                                            }"
                                        />
                                        <InputError
                                            class="mt-2"
                                            :message="form.errors.name"
                                        />
                                    </div>

                                    <div class="col-span-6 sm:col-span-3">
                                        <label
                                            for="email"
                                            class="block text-sm font-medium text-gray-700"
                                            >Alamat Email</label
                                        >
                                        <input
                                            v-model="form.email"
                                            type="email"
                                            id="email"
                                            autocomplete="email"
                                            class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
                                            :class="{
                                                'text-red-900 focus:ring-red-500 focus:border-red-500 border-red-300':
                                                    form.errors.email,
                                            }"
                                        />
                                        <InputError
                                            :message="
                                                form.errors.currents_password
                                            "
                                            class="mt-2"
                                        />
                                        <InputError
                                            class="mt-2"
                                            :message="form.errors.email"
                                        />
                                    </div>

                                    <div class="col-span-6 sm:col-span-3">
                                        <label
                                            for="class_id"
                                            class="block text-sm font-medium text-gray-700"
                                            ></label
                                        >
                                        <select
                                            v-model="form.class_id"
                                            id="class_id"
                                            class="mt-1 block w-full bg-white border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
                                            :class="{
                                                'text-red-900 focus:ring-red-500 focus:border-red-500 border-red-300':
                                                    form.errors.class_id,
                                            }"
                                        >
                                            <option value="">
                                                Pilih Kelas
                                            </option>
                                            <option
                                                v-for="item in classes.data"
                                                :key="item.id"
                                                :value="item.id"
                                            >
                                                {{ item.name }}
                                            </option>
                                        </select>
                                        <InputError
                                            class="mt-2"
                                            :message="form.errors.class_id"
                                        />
                                    </div>

                                    <div class="col-span-6 sm:col-span-3">
                                        <label
                                            for="section_id"
                                            class="block text-sm font-medium text-gray-700"
                                            >Section</label
                                        >
                                        <select
                                            v-model="form.section_id"
                                            id="section_id"
                                            class="mt-1 block w-full bg-white border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
                                            :class="{
                                                'text-red-900 focus:ring-red-500 focus:border-red-500 border-red-300':
                                                    form.errors.section_id,
                                            }"
                                        >
                                            <option value="">
                                                Pilih Section
                                            </option>
                                            <option
                                                v-for="section in sections.data"
                                                :key="section.id"
                                                :value="section.id"
                                            >
                                                {{ section.name }}
                                            </option>
                                        </select>
                                        <InputError
                                            class="mt-2"
                                            :message="form.errors.section_id"
                                        />
                                    </div>
                                </div>
                            </div>
                            <div
                                class="px-4 py-3 bg-gray-50 text-right sm:px-6"
                            >
                                <Link
                                    :href="route('students.index')"
                                    class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-[#8ec3b3] bg-indigo-100 hover:bg-[#4d918f] focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 mr-4"
                                >
                                    Batal
                                </Link>
                                <button
                                    type="submit"
                                    class="bg-[#8ec3b3] border border-transparent rounded-md shadow-sm py-2 px-4 inline-flex justify-center text-sm font-medium text-white hover:bg-[#4d918f] focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                                >
                                    Simpan
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
