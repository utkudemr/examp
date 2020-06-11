using Business.Abstract;
using Business.BusinessAspects.Autofac;
using Business.Constants;
using Business.ValidationRules.FluentValidation;
using Core.Aspects.Autofac.Validation;
using Core.Utilities.Results;
using DataAccess.Abstract;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Claims;
using Core.Entities.Concrete;
using Microsoft.AspNetCore.Http;

namespace Business.Concrete
{
    public class DemandManager : IDemandService
    {
        private static IDemandDal _demand;
        private static IHttpContextAccessor _httpcontext;
        public DemandManager(IDemandDal demand, IHttpContextAccessor httpcontext)
        {
            _demand = demand;
            _httpcontext = httpcontext;
        }
        [ValidationAspect(typeof(DemandValidator), Priority = 1)]
        [SecuredOperation("Admin,User")]
        public IResult Add(Demand demand)
        {
            var id = _httpcontext.HttpContext.User.Claims.FirstOrDefault(a => a.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier")?.Value;
            var namesurname = _httpcontext.HttpContext.User.Claims.FirstOrDefault(a => a.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name")?.Value;
            var lst = namesurname.Split(' ');
            demand.Name = lst[0];
            demand.Surname = lst[1];
            demand.Createdate = DateTime.Now;
            demand.Reviewdate = null;
            demand.Active = true;
            demand.State=null;
            demand.UserId = int.Parse(id);
            _demand.Add(demand);

            return new SuccessResult(Messages.ProductAdded);
        }

        public IDataResult<Demand> Update(Demand demand)
        {
            var demand_exist = DemandExist(demand.Id);
            if(demand_exist != null)
            {
                demand_exist.Reviewdate = DateTime.Now;
                demand_exist.State = demand.State;
                demand_exist.Adminaciklama = demand.Adminaciklama;
                demand_exist.Active = false;
                _demand.Update(demand_exist);
                return new SuccessDataResult<Demand>(demand_exist,Messages.ProductUpdated);
            }
            return new ErrorDataResult<Demand>(demand_exist, Messages.ProductNotFound);
        }

        [SecuredOperation("Admin")]
        public IDataResult<List<Demand>> GetAdmin(bool? demandType)
        {
            var list = _demand.GetList(a => a.State == demandType).OrderBy(a=>a.Createdate).ToList();
            return new SuccessDataResult<List<Demand>>(list,Messages.ProductAdded);
        }



        public Demand DemandExist(int demandId)
        {
            var demand = _demand.Get(a => a.Id == demandId);
            return demand;
        }

        [SecuredOperation("User")]
        public IDataResult<List<Demand>> GetList()
        {
            var id = _httpcontext.HttpContext.User.Claims.FirstOrDefault(a => a.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier")?.Value;
            var list = _demand.GetList().OrderBy(a => a.Createdate).Where(a=>a.UserId== int.Parse(id)).ToList();
            return new SuccessDataResult<List<Demand>>(list, Messages.ProductAdded);
        }

      
    }
}
