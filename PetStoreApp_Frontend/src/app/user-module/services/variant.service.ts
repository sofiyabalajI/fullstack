// services/variant.service.ts
import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AppConfig } from '../../config/app.config';

@Injectable({
  providedIn: 'root'
})
export class VariantService {
  private http = inject(HttpClient);
  private apiUrl = `${AppConfig.API_URL}/variants/product`;
  private productApi = `${AppConfig.API_URL}/products`;

  getVariantsByProductId(productId: string): Observable<any[]> {
    return this.http.get<any[]>(`${this.apiUrl}/${productId}`);
  }

  getProductById(productId: string): Observable<any> {
    return this.http.get<any>(`${this.productApi}/${productId}`);
  }
}