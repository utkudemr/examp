import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthComponent } from './auth/auth.component';
import { AdminComponent } from './admin.component';
import { AuthGuard, LoginGuard } from './auth.guard';



const routes: Routes = [
  { path: 'auth', component: AuthComponent,canActivate:[LoginGuard] },
  {
    path: 'main', component: AdminComponent, canActivate: [AuthGuard]},
  { path: '**', redirectTo: 'auth' }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdminRoutingModule { }
