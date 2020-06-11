import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { ModelModule } from '../model/model.module';
import { BrowserModule } from '@angular/platform-browser';
import { BaseComponent } from './base.component';
import { NavbarComponent } from './navbar/navbar.component';
import { RouterModule } from '@angular/router';


@NgModule({
    imports: [ModelModule,BrowserModule, FormsModule,RouterModule],   
    declarations: [BaseComponent, NavbarComponent],
    exports: [BaseComponent]
})
export class BaseModule {}