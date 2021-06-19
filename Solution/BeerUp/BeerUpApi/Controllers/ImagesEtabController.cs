using BeerUpApi.External_Api_Call;
using BeerUpApi.ParamAccess;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BeerUpApi.Controllers
{
    [Route("api/[controller]")]
    [Authorize(Policy = "hasEtabAccess")]
    [ApiController]
    public class ImagesEtabController : ControllerBase
    {
        private readonly string bucketName;
        private readonly string credentialGoogleJsonPath;

        public ImagesEtabController(IOptions<BaseParam> param)
        {
            this.bucketName = param.Value.bucketName;
            this.credentialGoogleJsonPath = param.Value.credentialGoogleJsonPath;
        }

        // POST api/<ImagesEtabController>
        [HttpPost]
        public async Task<IActionResult> PostAsync()
        {
            try
            {
                var formCollection = await Request.ReadFormAsync();
                var file = formCollection.Files.First();

                //var folderName = Path.Combine("Resources", "Images", "Etab");
                //var pathToSave = Path.Combine(Directory.GetCurrentDirectory(), folderName);
                if (file.Length > 0)
                {
                    string fileName = Guid.NewGuid().ToString()+ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Trim('"');
                    //var fullPath = Path.Combine(pathToSave, fileName);
                    //var dbPath = Path.Combine(folderName, fileName);
                    //using (var stream = new FileStream(fullPath, FileMode.Create))
                    //{
                    //    file.CopyTo(stream);
                    //}
                    //return Ok(new { dbPath });

                    GCStorageService _gStorage = new GCStorageService(bucketName, credentialGoogleJsonPath);
                    await _gStorage.UploadImageAsync(file, fileName, true);
                    return Ok(new { fileName });
                }
                else
                {
                    return BadRequest();
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex}");
            }
        }


        // DELETE api/<ImagesEtabController>/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAsync(string id)
        {
            //var folderName = Path.Combine("Resources", "Images", "Etab");
            //var pathToSave = Path.Combine(Directory.GetCurrentDirectory(), folderName);
            //var fullPath = Path.Combine(pathToSave, fileName);

            try
            {
                //if (System.IO.File.Exists(fullPath))
                //{
                //    System.IO.File.Delete(fullPath);
                //}
                //else
                //{
                //    return NotFound();
                //}

                GCStorageService _gStorage = new GCStorageService(bucketName, credentialGoogleJsonPath);
                await _gStorage.DeleteImageAsync(id, true);

                return NoContent();


            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex}");
            }
        }
    }
}
