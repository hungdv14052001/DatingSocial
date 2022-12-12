using AutoMapper;
using DatingSocialApi.Common;
using DatingSocialApi.Database;
using DatingSocialApi.Models;
using DatingSocialApi.Request;
using DatingSocialApi.Respositories;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;

namespace DatingSocialApi.Repositories
{
    public class FriendUserRepository : BaseRespository<FriendUser>
    {
        private IMapper _mapper;
        public FriendUserRepository(ApiOption apiConfig, DatabaseContext databaseContext, IMapper mapper) : base(apiConfig, databaseContext)
        {
            this._mapper = mapper;
        }

        /// <summary>
        /// Get friend id list of user
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public List<int> GetFriendIdList(int userId)
        {
            try
            {
                return Model.Where(row => row.UserId == userId).Select(row => row.FriendId).ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
