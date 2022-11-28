using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;

namespace DatingSocialApi.Common.Enum
{
    public enum MovieTypeEnum : byte
    {
        [Description("Action")] Action = 0,
        [Description("Romance")] Romance = 1,
        [Description("Cartoon")] Cartoon = 2,
        [Description("Horror")] Horror = 3,
    }
}
