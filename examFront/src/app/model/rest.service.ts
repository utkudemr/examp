import { Demand } from './demand.model';
import { Register } from './register.model';
import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { NgForm } from '@angular/forms';
import { JwtHelperService } from '@auth0/angular-jwt';
import { parse } from 'querystring';

@Injectable()
export class RestService {

  baseUrl: string = "https://localhost:44335/api/";
  token: string = null;
  decodedToken:any;
  helper = new JwtHelperService();
  constructor(private http: HttpClient) { }

  getadmin(demandType:boolean): Observable<Demand[]> {
    debugger;
    var token=localStorage.getItem('token');
    return this.http.get<Demand[]>(this.baseUrl + `demand/getadmin/${demandType}`, {
      headers: new HttpHeaders({
        'Authorization': 'Bearer ' + this.token,
      })
    });
  }

  getuser(): Observable<Demand[]> {
    debugger;
    var token=localStorage.getItem('token');
    return this.http.get<Demand[]>(this.baseUrl + 'demand/getuser', {
      headers: new HttpHeaders({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + token,
      })
    });
  }

 
  addDemand(demand: Demand): Observable<Demand> {
    debugger;
    var token=localStorage.getItem('token');
    return this.http.post<Demand>(this.baseUrl + "demand/add", {
      aciklama: demand.aciklama,
      name: demand.name,
      surname:demand.surname,
      file:demand.file
    }, {
      headers: new HttpHeaders({
        'Authorization': 'Bearer ' + token,
      })
    })
  }
  updateDemand(demand: Demand): Observable<Demand> {
    debugger;
    console.log(demand);
    var token=localStorage.getItem('token');
    return this.http.post<Demand>(this.baseUrl + "demand/update", {
      state:demand.state,
      id:demand.id,
      UserId:demand.UserId,
      Adminaciklama:demand.adminaciklama,
    }, {
      headers: new HttpHeaders({
        'Authorization': 'Bearer ' + token,
      })
    })
  }

  
  authentication(username: string, password: string): Observable<object> {
    debugger;
    return this.http.post<any>(this.baseUrl + 'auth/login', {
      email: username,
      password: password
    }).pipe(map(response => {
      debugger;
     
      if(response.success)
      {
        debugger;
        this.saveToken(response.data.token)
        this.token=response.data.token;
        this.decodedToken=this.helper.decodeToken(response.data.token);
        var adssad=this.getCurrentUserClaim();
      }
      return response.success;
    }));
  }

  register(registerUser:Register): Observable<boolean> 
  {
    debugger;
    return this.http.post<any>(this.baseUrl + 'auth/register', {
      email: registerUser.email,
      password: registerUser.password,
      firstname:registerUser.firstname,
      lastname:registerUser.lastname,
      phonenumber:registerUser.phoneNumber,
    }).pipe(map(response => {
      debugger;
      if(response)
      {
        
      }
      return response;
    }));
  }

  saveToken(token)
  {
    localStorage.setItem('token',token);
  }

  logout()
  {
    localStorage.removeItem('token');
  }
  isLoggedIn() {
    return this.helper.isTokenExpired();
  }

  getCurrentUserId()
  {
    return this.helper.decodeToken(localStorage.getItem('token')).id;
  }
  getToken()
  {
    return this.helper.decodeToken(localStorage.getItem('token'));
  }
  getCurrentUserClaim()
  {
    var str='http://schemas.microsoft.com/ws/2008/06/identity/claims/role';
    var asdsad=this.helper.decodeToken(localStorage.getItem('token'));
    var claimNu= this.helper.decodeToken(localStorage.getItem('token'))[str];
    return claimNu;
  }


}
