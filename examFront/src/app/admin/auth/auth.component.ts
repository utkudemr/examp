
import { Component, OnInit } from '@angular/core';
import { NgForm, FormGroup, FormControl, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/model/auth.service';
import { Register } from 'src/app/model/register.model';

@Component({
  selector: 'app-auth',
  templateUrl: './auth.component.html',
  styleUrls: ['./auth.component.css']
})
export class AuthComponent implements OnInit {

  public username: string;
  public password: string;
  public errorMessage: string;
  public email: string;
  public name: string;
  public surname: string;
  public phoneNumber: string;
  public registerPassword: string;

  constructor(private router: Router,private authService:AuthService) { }

  ngOnInit() {
  }
  loginForm=new FormGroup({
        
    username:new FormControl('',[
      Validators.required,
      Validators.email
    ]),
    password:new FormControl('',[
      Validators.required,
    ])
  });
  registerForm=new FormGroup({
        
    email:new FormControl('',Validators.required),
    name:new FormControl('',Validators.required),
    surname:new FormControl('',Validators.required),
    registerPassword:new FormControl('',Validators.required),
    phoneNumber:new FormControl('',[
      Validators.required,
    ])
  });
  login(form: NgForm) {
    if (form.valid) {
      this.authService.authenticate(this.username,this.password).subscribe(a=>{
        if(a)
        {
          debugger;
          this.router.navigateByUrl('admin/main');
        }
        else
        {
          this.errorMessage=a['Message'];
        }
      
      })
    } else {
      this.errorMessage = 'Bilgileri eksiksiz girin';
    }
  }

  register(form: NgForm) {
    if (form.valid) {
       var rg=new Register();
       rg.email=this.email;
       rg.firstname=this.name;
       rg.lastname=this.surname;
       rg.password=this.registerPassword;
       rg.phoneNumber=this.phoneNumber;
      this.authService.register(rg).subscribe(a=>{
        if(a)
        {
          debugger;
          this.errorMessage="Kayıt başarılı giriş yapabilirsiniz."
        }
        else
        {
          this.errorMessage="Hatalı username veya parola"
        }
       
      })
    } else {
      this.errorMessage = 'Bilgileri eksiksiz girin';
    }
  }

}
