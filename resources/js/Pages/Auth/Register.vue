<script setup>
import GuestLayout from "@/Layouts/GuestLayout.vue";
import InputError from "@/Components/InputError.vue";
import InputLabel from "@/Components/InputLabel.vue";
import PrimaryButton from "@/Components/PrimaryButton.vue";
import TextInput from "@/Components/TextInput.vue";
import { Head, Link, useForm } from "@inertiajs/vue3";

const form = useForm({
    name: "",
    email: "",
    password: "",
    password_confirmation: "",
});

const submit = () => {
    form.post(route("register"), {
        onFinish: () => form.reset("password", "password_confirmation"),
    });
};
</script>

<template>

<!-- versi ada gambarnya -->

<div class="bg-[#9CF09C] flex items-center justify-center min-h-screen">
        <div class="bg-white shadow-md rounded-lg flex max-w-4xl w-full">
            <div
                class="w-1/2 bg-white rounded-l-lg flex items-center justify-center"
            >
                <img
                    src="/images/barunawati.webp"
                    class="w-1/2 h-3/2 object-cover"
                    alt="Gambar Barunawati"
                />
            </div>
            <div class="w-1/2 p-8">
                <h2 class="text-2xl font-bold text-center">SELAMAT DATANG</h2>
                <Link
                   class="text-center text-gray-500 mb-6 "
                   :href="route('login')"
                   >
                    Sign In
                </Link>

                <form @submit.prevent="submit">
                    <div class="mb-4">
                        <InputLabel for="name" class="block text-gray-700" value="Full Name"
                        />
                        <TextInput
                            id="name"
                            type="text"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                            v-model="form.name"
                            required
                            autofocus
                            autocomplete="FullName"
                            placeholder="Masukkan Nama Lengkap"
                        />
                        <InputError class="mt-2" :message="form.errors.name" />
                        <span class="profile-views"
                            ><i class="fas fa-user-circle"></i
                        ></span>
                    </div>

                    <div class="mb-4">
                        <inputLabel for="email" class="block text-gray-700" value="Email"
                        />
                        <TextInput
                            id="email"
                            type="email"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                            v-model="form.email"
                            required
                            autofocus
                            autocomplete="username"
                            placeholder="Masukkan Email"
                        />
                        <!-- mt-1 block w-full -->
                        <InputError class="mt-2" :message="form.errors.email" />
                    </div>

                    <div class="mb-4">
                        <InputLabel for="password" class="block text-gray-700" value="Password"
                        />
                        <TextInput
                            id="password"
                            type="password"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                            v-model="form.password"
                            required
                            autocomplete="current-password"
                            placeholder="Masukkan Password"
                        />
                        <!-- mt-1 block w-full -->
                        <InputError class="mt-2" :message="form.errors.password" />
                    </div>

                    <div class="mb-4">
                        <InputLabel for="password" class="block text-gray-700" value="Konfirmasi Password"
                        />
                        <TextInput
                            id="password"
                            type="password"
                            class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                            v-model="form.password_confirmation"
                            required
                            autocomplete="current-password"
                            placeholder="Masukkan Password"
                        />
                        <!-- mt-1 block w-full -->
                        <InputError class="mt-2" :message="form.errors.password_confirmation" />
                    </div>
          
                    <div class="flex items-center justify-between mb-6">
                        <label class="flex items-center">
                            <Checkbox
                                name="remember"
                                v-model:checked="form.remember"
                                class="form-checkbox text-blue-500"
                            />
                            <span class="ml-2 text-gray-700">Remember me</span>
                        </label>
                        <a href="#" class="text-sm text-blue-500"
                            >Forgot Password?</a
                        >
                    </div>
                    <PrimaryButton
                        class="w-full bg-green-400 text-white py-2 rounded-lg hover:bg-blue-600 ms-4 flex items-center justify-center"
                        style="text-align: center; text-transform: none"
                        :class="{ 'opacity-25': form.processing }"
                        :disabled="form.processing"
                    >
                        Register
                    </PrimaryButton>
                </form>
            </div>
        </div>
    </div>


</template>
