import { Injectable, signal } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { tap } from 'rxjs/operators';
import { UserProfile, UserService } from './user.service';
import { Observable } from 'rxjs';
import { AppConfig } from '../../config/app.config';

export interface OrderDetails {
  fullName: string;
  mobileNumber: string;
  address: string;
  city: string;
  pincode: string;
  state: string;
  country: string;
  cardType: string;
  cardNumber: string;
  expiryDate: string;
}

@Injectable({ providedIn: 'root' })
export class OrderService {
  private checkoutUrl = `${AppConfig.API_URL}/orders/checkout`;
  private userOrdersUrl = `${AppConfig.API_URL}/orders/user`;

  userData : UserProfile | null | undefined;


  constructor(private http: HttpClient, private userService: UserService) {}

  private getHeaders() {
    const token = localStorage.getItem('token');
    return new HttpHeaders({ 'Authorization': `Bearer ${token}` });
  }

  getUserOrders(userId: string) {
    return this.http.get<any[]>(`${this.userOrdersUrl}/${userId}`, { headers: this.getHeaders() });
  }

  getAllVariants(): Observable<any[]> {
  return this.http.get<any[]>(`${AppConfig.API_URL}/variants/search`);
}

  postOrder(userId: string, payload: OrderDetails) {
    return this.http.post(`${this.checkoutUrl}/${userId}`, payload, { headers: this.getHeaders() });
  }


resetOrderSignal(): OrderDetails | null {
  const userData = this.userService.userSignal();
  
  console.log('User data in Service:', userData);

  if (!userData) return null;

  const defaultOrder: OrderDetails = {
    fullName: userData.userName,
    mobileNumber: userData.phNo,
    address: userData.address,
    city: userData.city,
    pincode: userData.pincode,
    state: userData.state,
    country: userData.country,
    cardType: 'Visa',
    cardNumber: '',
    expiryDate: ''
  };
  
  localStorage.setItem('temp_order', JSON.stringify(defaultOrder));
  return defaultOrder;
}
}