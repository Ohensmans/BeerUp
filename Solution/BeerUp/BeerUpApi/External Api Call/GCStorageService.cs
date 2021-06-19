using BeerUpApi.ParamAccess;
using Google.Apis.Auth.OAuth2;
using Google.Cloud.Storage.V1;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BeerUpApi.External_Api_Call
{
    public class GCStorageService
    {
        private readonly string bucketName;
        private StorageClient client;

        public GCStorageService(string bucketName, string credentialGoogleJsonPath)
        {
            this.bucketName = bucketName;
            
            var pathJson = Path.Combine(Directory.GetCurrentDirectory(), "Resources", credentialGoogleJsonPath);
            var credential = GoogleCredential.FromFile(pathJson);

            this.client = StorageClient.Create(credential);
        }

        public async Task UploadImageAsync(IFormFile file, string fileName, bool isEtab)
        {
            var folderBis = isEtab ? "images/Etabs/" : "images/Bieres/";
            using (var ms = new MemoryStream()) 
            {
                file.CopyTo(ms);
                var obj = await client.UploadObjectAsync(bucketName, folderBis + fileName, "image/", ms);
            }
            
        }

        public async Task DeleteImageAsync(string fileName, bool isEtab)
        {
            var folderBis = isEtab ? "images/Etabs/" : "images/Bieres/";
            await client.DeleteObjectAsync(bucketName, folderBis + fileName);

        }


    }
}
