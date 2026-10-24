import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { Router, RouterModule } from '@angular/router';
import { UserService } from '../../user-module/services/user.service';

@Component({
  selector: 'app-navbar',
  standalone: true,
  imports: [CommonModule, RouterModule],
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css'],
})
export class NavbarComponent {
  constructor(private router: Router, private userService: UserService) {}

  onLogout(): void {
    this.userService.logoutBackend().subscribe({
      next: () => {
        this.performClientSideCleanup();
      },
      error: (err) => {
        console.error('Backend logout failed or was unreachable:', err);
        this.performClientSideCleanup();
      }
    });
  }

  private performClientSideCleanup(): void {
    this.userService.clearUser();
    // this.cartService.cartItems.set([]);
    localStorage.clear();
    this.router.navigate(['/login']);
  }
}
