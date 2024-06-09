<script setup>
import GuestLayout from '@/Layouts/GuestLayout.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';

const form = useForm({
    name: '',
    email: '',
    password: '',
    password_confirmation: '',
});

const submit = () => {
    form.post(route('register'), {
        onFinish: () => form.reset('password', 'password_confirmation'),
    });
};
</script>

<template>
    <GuestLayout>
        <Head title="Register" />

        <form @submit.prevent="submit">
            <div>
                <InputLabel for="name" value="Name" />

                <TextInput
                    id="name"
                    type="text"
                    class="mt-1 block w-full"
                    v-model="form.name"
                    required
                    autofocus
                    autocomplete="name"
                />

                <InputError class="mt-2" :message="form.errors.name" />
            </div>

            <div class="mt-4">
                <InputLabel for="email" value="Email" />

                <TextInput
                    id="email"
                    type="email"
                    class="mt-1 block w-full"
                    v-model="form.email"
                    required
                    autocomplete="username"
                />

                <InputError class="mt-2" :message="form.errors.email" />
            </div>

            <div class="mt-4">
                <InputLabel for="password" value="Password" />

                <TextInput
                    id="password"
                    type="password"
                    class="mt-1 block w-full"
                    v-model="form.password"
                    required
                    autocomplete="new-password"
                />

                <InputError class="mt-2" :message="form.errors.password" />
            </div>

            <div class="mt-4">
                <InputLabel for="password_confirmation" value="Confirm Password" />

                <TextInput
                    id="password_confirmation"
                    type="password"
                    class="mt-1 block w-full"
                    v-model="form.password_confirmation"
                    required
                    autocomplete="new-password"
                />

                <InputError class="mt-2" :message="form.errors.password_confirmation" />
            </div>

            <div class="flex items-center justify-end mt-4">
                <Link
                    :href="route('login')"
                    class="underline text-sm text-gray-600 hover:text-gray-900 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                >
                    Already registered?
                </Link>

                <PrimaryButton class="ms-4" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                    Register
                </PrimaryButton>
            </div>
        </form>
    </GuestLayout>

<!-- -----  -->
<div class="bg-[#9CF09C] flex items-center justify-center min-h-screen">
        <div class="bg-white shadow-md rounded-lg flex max-w-4xl w-full">
            <div
                class="w-1/2 bg-white rounded-l-lg flex items-center justify-center"
            >
                <img
                    src="/images/barunawati.webp"
                    class="w-full h-full object-cover"
                    alt="Gambar Barunawati"
                />
            </div>
            <div class="w-1/2 p-8">
                <h2 class="text-2xl font-bold text-center">SELAMAT DATANG</h2>
                <p class="text-center text-gray-500 mb-6">
                    <a href="#" class="text-blue-500">Sign Up</a>
                </p>
                <form @submit.prevent="submit">
                    
                    <div class="mb-4">
                        <label for="email" class="block text-gray-700"
                            >Email</label
                        >
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
                    </div>
                    <div class="mb-4">
                        <label for="password" class="block text-gray-700"
                            >Password</label
                        >
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
                    <!--
                       <button
                        class="w-full bg-blue-500 text-white py-2 rounded-lg hover:bg-blue-600"
                    >
                        Login
                    </button>
                    -->
                    <PrimaryButton
                        class="w-full bg-green-400 text-white py-2 rounded-lg hover:bg-blue-600 ms-4"
                        style="text-align: center"
                        :class="{ 'opacity-25': form.processing }"
                        :disabled="form.processing"
                    >
                        Login
                    </PrimaryButton>
                </form>
            </div>
            
        </div>
    </div>

</template>
