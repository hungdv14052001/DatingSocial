using AutoMapper;
using DatingSocialApi.Dto;
using DatingSocialApi.Models;
using DatingSocialApi.Request;

namespace DatingSocialApi.Mapper
{
    public class MappingContext : Profile
    {
        public MappingContext()
        {
            // user request
            CreateMap<UserRegisterRequest, User>();

            // postDto
            CreateMap<Post, PostDto>();
        }
    }
}
