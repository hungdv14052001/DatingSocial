using AutoMapper;
using AutoMapper.Configuration;
using DatingSocialApi.Common;
using DatingSocialApi.Controllers;
using DatingSocialApi.Database;
using DatingSocialApi.Dto;
using DatingSocialApi.Request;
using DatingSocialApi.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Memory;
using System;
using System.Collections.Generic;
using System.Net.Http;

namespace DatingSocialApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [AllowAnonymous]
    public class UserAuthenticateController : ControllerBase
    {
        private readonly UserAuthenticateService _userAuthenticateService;
        public UserAuthenticateController(DatabaseContext databaseContext, IMapper mapper, ApiOption apiConfig)
        {
            _userAuthenticateService = new UserAuthenticateService(apiConfig, databaseContext, mapper);
        }

        /// <summary>
        /// Get achievement list of user
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [Route("UserLogin")]
        public MessageData UserLogin(UserLoginRequest userLoginRequest)
        {
            try
            {
                var res = _userAuthenticateService.UserLogin(userLoginRequest);
                return new MessageData { Data = res };
            }
            catch (Exception ex)
            {
                return new MessageData() { Code = "error", Des = ex.Message };
            }
        }

        [HttpPost]
        [Route("UserRegister")]
        public MessageData UserRegister(UserRegisterRequest userRegisterRequest)
        {
            try
            {
                var res = _userAuthenticateService.UserRegister(userRegisterRequest);
                return new MessageData { Data = res };
            }
            catch (Exception ex)
            {
                return new MessageData() { Code = "error", Des = ex.Message };
            }
        }
    }
}
