import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AppConfig } from '../../config/app.config';

@Injectable({
  providedIn: 'root'
})
export class ProductService {
  private apiUrl = `${AppConfig.API_URL}/products/category`;

  constructor(private http: HttpClient) {}

  getProductsByCategory(categoryId: string): Observable<any[]> {
    return this.http.get<any[]>(`${this.apiUrl}/${categoryId}`);
  }
}

