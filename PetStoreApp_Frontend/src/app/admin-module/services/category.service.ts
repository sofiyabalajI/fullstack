import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AppConfig } from '../../config/app.config';

@Injectable({ providedIn: 'root' })
export class CategoryService {
  private baseUrl = `${AppConfig.API_URL}/categories`;

  constructor(private http: HttpClient) {}

  getAll(): Observable<any[]> {
    return this.http.get<any[]>(this.baseUrl);
  }

  saveCategory(categoryData: any, image: File | null, id?: number): Observable<any> {
    const formData = new FormData();

    formData.append('category', JSON.stringify(categoryData));

    if (image) {
      formData.append('image', image);
    }

    if (id) {
      return this.http.put(`${this.baseUrl}/${id}`, formData, { responseType: 'text' });
    }
    return this.http.post(this.baseUrl, formData, { responseType: 'text' });
  }

  delete(id: number): Observable<any> {
    return this.http.delete(`${this.baseUrl}/${id}`, { responseType: 'text' });
  }
}
