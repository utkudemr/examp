
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { RouterModule } from '@angular/router';
import { BaseModule } from './base/base.module';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    BaseModule,
    RouterModule.forRoot([
      
      { path: 'admin', loadChildren : './admin/admin.module#AdminModule'},
      { path: '**', redirectTo: "/admin/auth"}
    ])
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
