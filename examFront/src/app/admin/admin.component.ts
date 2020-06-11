import { Demand } from './../model/demand.model';
import { RestService } from './../model/rest.service';
import { Component, ViewChild, ElementRef } from "@angular/core";
import { AuthService } from '../model/auth.service';
import { Router } from '@angular/router';
import { FormGroup, FormControl, Validators, NgForm } from '@angular/forms';
import { DemandRepository } from '../model/demandService.repository';
import { FileUploader } from 'ng2-file-upload';
import * as jsPDF from 'jspdf';
@Component({
    templateUrl:'admin.component.html'
})
export class AdminComponent {
    @ViewChild('content') content: ElementRef;
    public aciklama: string;
    public myfile: string;
    public surname: string;
    public name: string;
    public claim: string="User";
    public errorMessage: string;
    public demandList:Demand[];
    public adminaciklama:string;
    public state:string;
    public selectedDemand:Demand=new Demand();
    public adminDemandType:boolean=true;
    public adminRewiewForm:boolean=false;
    public inputEnabled:boolean=false;
    public detailForm:boolean=false;
    public isAdmin:boolean=false;
    constructor(private router:Router,private authService:AuthService,private restService:RestService
        ,private demandService:DemandRepository) {
       debugger;
        this.claim=this.restService.getCurrentUserClaim();
        this.claim=="Admin"?this.isAdmin=true:this.isAdmin=false;
        
    }
    
    

    ngOnInit(): void {
      if(this.isAdmin==true)
      {
        this.restService
        .getadmin(this.adminDemandType)
        .subscribe(demands => this.demandList = demands['data']);
      }
      else
      {
        this.restService
        .getuser()
        .subscribe(demands => this.demandList = demands['data']);
      }
     
                
      
      
      
    }
    demandForm=new FormGroup({
        
        aciklama:new FormControl(),
        myfile:new FormControl('',[
          Validators.required,
        ])
      });
      admindemandForm=new FormGroup({
        state:new FormControl('',Validators.required),
        adminaciklama:new FormControl('',Validators.required),
      });
    logout()
    {
        this.authService.clear();
        this.router.navigateByUrl('/admin')
    }

    changeSuit(event)
    {
      debugger;
      var val=event.target.selectedOptions[0].value;
      this.adminDemandType=val;
      val=="null"?this.adminRewiewForm=true:this.adminRewiewForm=false;
      val=="null"?this.inputEnabled=false:this.inputEnabled=true;
      this.selectedDemand=new Demand();
      this.selectedDemand.adminaciklama="";
      this.detailForm=false;
      this.getDemands();
    }
    public downloadAsPDF() {
      debugger;
      const doc = new jsPDF();
  
      const specialElementHandlers = {
        '#editor': function (element, renderer) {
          return true;
        }
      };
  
      const pdfTable = this.content.nativeElement;
  
      doc.fromHTML(pdfTable.innerHTML, 15, 15, {
        width: 40,
        'elementHandlers': specialElementHandlers
      });
  
      doc.save('tableToPdf.pdf');
    }
    viewDetail(demand:Demand)
    {
      debugger;
      this.selectedDemand=demand;
     this.detailForm=true;
      
      var sadsad=demand;
    }

    getDemands(){
      debugger;
      if(this.isAdmin)
      {
        this.demandService.getAdmin(this.adminDemandType).subscribe(a=>{
          if(a)
          {
            debugger;
            this.demandList=a['data'];
            //this.registerMessage="Kayıt işlemi başarılı giriş yapabilirsiniz"
          }
          //this.errorMessage="Kayıt işleminde sunucu tarafında hata";
        })
      }
      else{
        this.demandService.getUser().subscribe(a=>{
          if(a)
          {
            debugger;
            this.demandList=a['data'];
            //this.registerMessage="Kayıt işlemi başarılı giriş yapabilirsiniz"
          }
          //this.errorMessage="Kayıt işleminde sunucu tarafında hata";
      });
      
    }
    return this.demandList;
  }
    demand(form: NgForm)
    {
        debugger;
        if (form.valid) {
            var demand=new Demand();
            demand.id=0;
            demand.file=this.myfile;
            demand.name=this.name;
            demand.surname=this.surname;
            demand.aciklama=this.aciklama;
            this.demandService.addDemand(demand).subscribe(a=>{
              if(a)
              {
                debugger;
                this.getDemands();
                
              }
              this.errorMessage=a['message'];
            })
          } else {
             this.errorMessage = 'Bilgileri eksiksiz girin';
          }
    }



    admindemand(form: NgForm)
    {
        debugger;
        if (form.valid) {
         
        
            var demand=new Demand();
            demand=this.selectedDemand;
            demand.adminaciklama=this.adminaciklama;
            demand.state=  JSON.parse(this.state);
            this.demandService.updateDemand(demand).subscribe(a=>{
              if(a)
              {
                debugger;
                this.detailForm=false;
                this.getDemands();
              }
              this.errorMessage=a['message'];
            })
          } else {
             this.errorMessage = 'Bilgileri eksiksiz girin';
          }
    }
}

