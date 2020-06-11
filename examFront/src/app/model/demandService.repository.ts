import { Register } from './register.model';
import { Injectable } from "@angular/core";
import { RestService } from './rest.service';
import { Demand } from './demand.model';

@Injectable()
export class DemandRepository{
    private demands: Demand[] = [];
    constructor(private restService:RestService) {
        debugger;
        
    }

    addDemand(demand:Demand)
    {
        debugger;
        return this.restService.addDemand(demand);
    }
    updateDemand(demand:Demand)
    {
        debugger;
        return this.restService.updateDemand(demand);
    }

    getAdmin(demandType:boolean)
    {
        debugger;
        return this.restService.getadmin(demandType);
    }
    getUser()
    {
        debugger;
        return this.restService.getuser();
    }

    register(registerModule:Register)
    {
        return this.restService.register(registerModule);
    }
}