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
    public class UserHandleController : CustomerBaseController<UserHandleController>
    {
        private readonly UserHandleService _userHandleService;
        public UserHandleController(DatabaseContext databaseContext, IMapper mapper, ApiOption apiConfig)
        {
            _userHandleService = new UserHandleService(apiConfig, databaseContext, mapper);
        }

        /// <summary>
        /// Get achievement list of user
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("GetPostListInHomePage")]
        public MessageData GetPostListInHomePage()
        {
            try
            {
                var res = _userHandleService.GetPostListInHomePage(UserId);
                return new MessageData { Data = res };
            }
            catch (Exception ex)
            {
                return new MessageData() { Code = "error", Des = ex.Message };
            }
        }
    }
}
