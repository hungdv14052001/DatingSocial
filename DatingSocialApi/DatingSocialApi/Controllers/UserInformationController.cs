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
    public class UserInformationController : CustomerBaseController<UserInformationController>
    {
        private readonly UserInformationService _userInformationService;
        public UserInformationController(DatabaseContext databaseContext, IMapper mapper, ApiOption apiConfig)
        {
            _userInformationService = new UserInformationService(apiConfig, databaseContext, mapper);
        }

        /// <summary>
        /// Get achievement list of user
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("GetProfile")]
        public MessageData GetProfile(int? userId)
        {
            try
            {
                var id = UserId;
                if(userId != null)
                {
                    id = (int)userId;
                }
                var res = _userInformationService.GetProfile(id);
                return new MessageData { Data = res };
            }
            catch (Exception ex)
            {
                return new MessageData() { Code = "error", Des = ex.Message };
            }
        }

        /// <summary>
        /// Get post list of user
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("GetPostListByUser")]
        public MessageData GetPostListByUser(int? userId)
        {
            try
            {
                var id = UserId;
                if (userId != null)
                {
                    id = (int)userId;
                }
                var res = _userInformationService.GetPostListByUser(id);
                return new MessageData { Data = res };
            }
            catch (Exception ex)
            {
                return new MessageData() { Code = "error", Des = ex.Message };
            }
        }

        /// <summary>
        /// Get friend list
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("GetFriendList")]
        public MessageData GetFriendList(int? userId)
        {
            try
            {
                var id = UserId;
                if (userId != null)
                {
                    id = (int)userId;
                }
                var res = _userInformationService.GetFriendList(id);
                return new MessageData { Data = res };
            }
            catch (Exception ex)
            {
                return new MessageData() { Code = "error", Des = ex.Message };
            }
        }
    }
}
