import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AppConfig } from '../../config/app.config';

@Injectable({ providedIn: 'root' })
export class ProductService {
  private baseUrl = `${AppConfig.API_URL}/products`;

  constructor(private http: HttpClient) {}

  getProductsByCategory(categoryId: number): Observable<any[]> {
    return this.http.get<any[]>(`${this.baseUrl}/category/${categoryId}`);
  }

  addProduct(categoryId: number, productData: any, image: File): Observable<any> {
    const formData = new FormData();
    formData.append('product', JSON.stringify(productData));
    formData.append('image', image);

    console.log(`${this.baseUrl}/category/${categoryId}`);

    return this.http.post(`${this.baseUrl}/${categoryId}`, formData, { responseType: 'text' });
  }

  updateProduct(productId: string, productData: any, image: File | null): Observable<any> {
    const formData = new FormData();
    formData.append('product', JSON.stringify(productData));
    if (image) formData.append('image', image);

    return this.http.put(`${this.baseUrl}/${productId}`, formData, { responseType: 'text' });
  }

  deleteProduct(productId: string): Observable<any> {
    return this.http.delete(`${this.baseUrl}/${productId}`, { responseType: 'text' });
  }
}
