import { Router, CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import { AuthService } from '../model/auth.service';
import { Injectable } from '@angular/core';

@Injectable()
export class AuthGuard implements    CanActivate{
    constructor(private router:Router,private authService:AuthService) {}

    canActivate(route:ActivatedRouteSnapshot,state:RouterStateSnapshot){
        debugger;
        if(!this.authService.authenticated)
        {
            this.router.navigateByUrl('admin/auth');
            return false;
        }
        else
        {
            
        }
        return true;
        
    }
    
}
@Injectable()
export class LoginGuard implements    CanActivate{
    constructor(private router:Router,private authService:AuthService) {}

    canActivate(route:ActivatedRouteSnapshot,state:RouterStateSnapshot){
        debugger;
        if(this.authService.authenticated)
        {
            this.router.navigateByUrl('admin/main');
            return false;
        }
        else
        {
            
        }
        return true;
        
    }
    
}