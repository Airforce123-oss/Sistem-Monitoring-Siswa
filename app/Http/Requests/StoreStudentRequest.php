<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreStudentRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return auth()->check();
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'no_induk' => ['required', 'exists:no_induks,id'],
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email', 'max:255', 'unique:students,email'],
            'class_id' => ['required', 'exists:classes,id'],
            'section_id' => ['required', 'exists:sections,id'],
            'gender_id' => 'required', 'exists:genders,id',
            'religion_id' => ['required', 'exists:religions,id'],

        ];
    }

    public function attributes()
    {
        return [
            'no_induk' => 'no induk',
            'name' => 'name',
            'email' => 'email',
            'class_id' => 'class',
            'section_id' => 'section',
            'gender_id' => 'gender',
            'religion_id' => 'religion',
        ];
    }
}