using AutoMapper;
using DatingSocialApi.Common;
using DatingSocialApi.Database;
using DatingSocialApi.Models;
using DatingSocialApi.Request;
using DatingSocialApi.Respositories;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;

namespace DatingSocialApi.Repositories
{
    public class UserRepository : BaseRespository<User>
    {
        private IMapper _mapper;
        public UserRepository(ApiOption apiConfig, DatabaseContext databaseContext, IMapper mapper) : base(apiConfig, databaseContext)
        {
            this._mapper = mapper;
        }

        /// <summary>
        /// UserLogin function. That return User by user login request
        /// </summary>
        /// <param name="userLoginRequest"></param>
        /// <returns></returns>
        public User UserLogin(UserLoginRequest userLoginRequest)
        {
            try
            {
                var passwordByMD5 = Untill.CreateMD5(userLoginRequest.Password);
                return Model.Where(row => row.Username == userLoginRequest.Username && row.Password == passwordByMD5).FirstOrDefault();
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Check user register
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public bool CheckUserRegister(User user)
        {
            try
            {
                var userlist = Model.Where(row => row.Username == user.Username || row.NumberPhone == user.NumberPhone).ToList();
                if(userlist.Count > 0)
                {
                    return false;
                }
                return true;
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}
