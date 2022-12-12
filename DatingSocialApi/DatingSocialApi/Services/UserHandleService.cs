using AutoMapper;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using DatingSocialApi.Common;
using DatingSocialApi.Common.Enum;
using DatingSocialApi.Database;
using DatingSocialApi.Dto;
using DatingSocialApi.Models;
using DatingSocialApi.Repositories;
using DatingSocialApi.Request;
using System;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Collections.Generic;

namespace DatingSocialApi.Services
{
    public class UserHandleService
    {
        private readonly UserRepository _userRepository;
        private readonly PostRepository _postRepository;
        private readonly FriendUserRepository _friendUserRepository;
        private readonly IMapper _mapper;

        public UserHandleService(ApiOption apiOption, DatabaseContext databaseContext, IMapper mapper)
        {
            _userRepository = new UserRepository(apiOption, databaseContext, mapper);
            _postRepository = new PostRepository(apiOption, databaseContext, mapper);
            _friendUserRepository = new FriendUserRepository(apiOption, databaseContext, mapper);
            _mapper = mapper;
        }

        /// <summary>
        ///  Get post list in homepage
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public List<PostDto> GetPostListInHomePage(int userId)
        {
            try
            {
                var friendIdList = _friendUserRepository.GetFriendIdList(userId);
                friendIdList.Add(userId);

                var postList = _postRepository.FindByCondition(row => friendIdList.Contains(row.UserId)).OrderByDescending(row=> row.Id).Take(10).ToList();
                var userIdList = postList.Select(row => row.UserId).ToList();

                var userListByUserIdList = _userRepository.GetUserListByUserIdList(userIdList);

                var postDtoList = postList.Select(row => _mapper.Map<PostDto>(row)).ToList();

                foreach(var postDto in postDtoList)
                {
                    var user = userListByUserIdList.Where(row => row.Id == postDto.UserId).FirstOrDefault();
                    if(user != null)
                    {
                        postDto.Name = user.Name;
                        postDto.Avatar = user.Avatar;
                    }
                }

                return postDtoList;
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}
