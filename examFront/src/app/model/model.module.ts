import { DemandRepository } from './demandService.repository';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { RestService } from './rest.service';
import { AuthService } from './auth.service';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

@NgModule({
    imports: [HttpClientModule],
    providers: [RestService,DemandRepository,AuthService]
})
export class ModelModule { }