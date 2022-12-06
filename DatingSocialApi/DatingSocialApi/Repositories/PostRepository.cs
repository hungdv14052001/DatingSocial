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
    public class PostRepository : BaseRespository<Post>
    {
        private IMapper _mapper;
        public PostRepository(ApiOption apiConfig, DatabaseContext databaseContext, IMapper mapper) : base(apiConfig, databaseContext)
        {
            this._mapper = mapper;
        }
    }
}
