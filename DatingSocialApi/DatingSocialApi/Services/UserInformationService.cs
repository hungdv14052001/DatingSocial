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
    public class UserInformationService
    {
        private readonly UserRepository _userRepository;
        private readonly PostRepository _postRepository;
        public UserInformationService(ApiOption apiOption, DatabaseContext databaseContext, IMapper mapper)
        {
            _userRepository = new UserRepository(apiOption, databaseContext, mapper);
            _postRepository = new PostRepository(apiOption, databaseContext, mapper);
        }

        /// <summary>
        /// Get profile of user
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public User GetProfile(int userId)
        {
            try
            {
                var user = _userRepository.FindAll().Where(row => row.Id == userId).FirstOrDefault();
                if(user == null)
                {
                    throw new Exception("User does not exist!");
                }

                return user;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Get post list of user
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public List<Post> GetPostListByUser(int userId)
        {
            try
            {
                var user = _userRepository.FindAll().Where(row => row.Id == userId).FirstOrDefault();
                if (user == null)
                {
                    throw new Exception("User does not exist!");
                }

                var postList = _postRepository.FindAll().Where(row => row.UserId == userId).ToList();
                return postList;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
