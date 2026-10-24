import { HttpClient, HttpParams, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { AppConfig } from '../../config/app.config';

@Injectable({
  providedIn: 'root',
})
export class OrderService {
  private baseUrl = `${AppConfig.API_URL}/orders`;

  constructor(private http: HttpClient) {}

  getAllOrders(): Observable<any[]> {
    return this.http.get<any[]>(`${this.baseUrl}/all`);
  }

  getOrdersByUser(userId: string): Observable<any[]> {
    return this.http.get<any[]>(`${this.baseUrl}/user/${userId}`);
  }

  updateStatus(orderId: number, status: string): Observable<any> {
    const params = new HttpParams().set('status', status);

    return this.http.put(`${this.baseUrl}/${orderId}/status`, {}, {
      params: params,
      responseType: 'text' as 'json' 
    });
  }
}