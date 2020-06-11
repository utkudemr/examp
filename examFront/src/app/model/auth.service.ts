import { Register } from './register.model';
import { Injectable } from "@angular/core";
import { RestService } from './rest.service';

@Injectable()
export class AuthService{
   
    constructor(private restService:RestService) {

        
    }

    authenticate(username:string,password:string)
    {
        return this.restService.authentication(username,password);
    }

    register(registerModule:Register)
    {
        return this.restService.register(registerModule);
    }

    get authenticated():boolean{
        return this.restService.getToken()!=null;
    }
    clear(){
        this.restService.logout();
    }
}