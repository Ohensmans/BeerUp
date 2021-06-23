using System;
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace Repo.Modeles.ModelesBeerUp
{
    public partial class Horaire
    {

        public Guid HorId { get; set; }

        public Guid EtaId { get; set; }

        public string HorJour { get; set; }

        [JsonConverter(typeof(JsonTimeSpanConverter))]
        [DataType(DataType.Time)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = @"{0:hh\:mm}")]
        public TimeSpan HorDebut { get; set; }

        [JsonConverter(typeof(JsonTimeSpanConverter))]
        [DataType(DataType.Time)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = @"{0:hh\:mm}")]
        public TimeSpan HorFin { get; set; }
        [JsonIgnore]
        public virtual Etablissement Eta { get; set; }
    }
}
