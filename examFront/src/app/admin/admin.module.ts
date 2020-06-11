import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AdminRoutingModule } from './admin-routing.module';
import { AuthComponent } from './auth/auth.component';
import { AdminComponent } from './admin.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AuthGuard, LoginGuard } from './auth.guard';
import { FileUploadModule } from 'ng2-file-upload';

@NgModule({
  declarations: [AdminComponent,AuthComponent],
  imports: [
    
    CommonModule,
    
    ReactiveFormsModule,
    FormsModule,
    AdminRoutingModule
  ],
  providers:[AuthGuard,LoginGuard]
})
export class AdminModule { }
