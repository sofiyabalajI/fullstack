import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import {
  ReactiveFormsModule,
  FormBuilder,
  FormGroup,
  Validators,
  AbstractControl,
  ValidationErrors
} from '@angular/forms';
import { RouterModule, Router } from '@angular/router';
import { AppConfig } from '../../config/app.config';

@Component({
  selector: 'app-register',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, RouterModule],
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
  registerForm!: FormGroup;
  private apiUrl = `${AppConfig.API_URL}/regis`;

  constructor(
    private fb: FormBuilder,
    private router: Router,
    private http: HttpClient
  ) { }

  ngOnInit(): void {
    this.initForm();
  }

  private initForm(): void {
    this.registerForm = this.fb.group({
      userName: ['', [Validators.required, Validators.minLength(4)]],
      password: ['', [Validators.required, Validators.minLength(6)]],
      repeatPassword: ['', [Validators.required]],
      email: ['', [Validators.required, Validators.email]],
      phNo: [null, [Validators.required, Validators.pattern(/^[0-9]{10}$/)]],
      address: ['', [Validators.required]],
      city: ['', [Validators.required]],
      pincode: [null, [Validators.required, Validators.pattern(/^[0-9]+$/)]],
      state: ['', [Validators.required]],
      country: ['', [Validators.required]]
    }, {
      validators: this.passwordMatchValidator
    });
  }

  get f() { return this.registerForm.controls; }

  private passwordMatchValidator(control: AbstractControl): ValidationErrors | null {
    const password = control.get('password');
    const repeatPassword = control.get('repeatPassword');

    if (password && repeatPassword && password.value !== repeatPassword.value) {
      repeatPassword.setErrors({ passwordMismatch: true });
      return { passwordMismatch: true };
    } else if (repeatPassword && repeatPassword.hasError('passwordMismatch')) {
      repeatPassword.setErrors(null);
    }
    return null;
  }

  onSubmit(): void {
    if (this.registerForm.valid) {
      const formData = this.registerForm.value;

      const payload = {
        userName: formData.userName,
        password: formData.password,
        email: formData.email,
        phNo: formData.phNo,
        address: formData.address,
        city: formData.city,
        pincode: formData.pincode,
        state: formData.state,
        country: formData.country,
        roles: ["ROLE_USER"]
      };

      this.http.post(this.apiUrl, payload, { responseType: 'text' }).subscribe({
        next: (response) => {
          console.log('Success:', response);
          alert(response);
          this.router.navigate(['/login']);
        },
        error: (err) => {
          console.error('Registration failed:', err);
          alert('Error: ' + err.message);
        }
      });

    } else {
      this.registerForm.markAllAsTouched();
    }
  }
}