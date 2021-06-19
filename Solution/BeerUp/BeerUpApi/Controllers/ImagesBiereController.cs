using BeerUpApi.External_Api_Call;
using BeerUpApi.ParamAccess;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BeerUpApi.Controllers
{
    [Route("api/[controller]")]
    [Authorize(Policy = "hasBiereAccess")]
    [ApiController]
    public class ImagesBiereController : ControllerBase
    {
        private readonly string credentialGoogleJsonPath;
        private readonly string googleProjectId;
        private readonly string googleLocation;
        private readonly string googleProductSetId;
        private readonly string bucketName;
        private readonly string imageUrl;

        public ImagesBiereController(IOptions<BaseParam> param, IOptions<BaseUrl> url)
        {
            this.bucketName = param.Value.bucketName;
            this.credentialGoogleJsonPath = param.Value.credentialGoogleJsonPath;
            this.googleProjectId = param.Value.googleProjectId;
            this.googleLocation = param.Value.googleLocation;
            this.googleProductSetId = param.Value.googleProductSetId;
            this.imageUrl = url.Value.baseImages;
        }


        // POST api/<ImagesBiereController>
        [HttpPost]
        public async Task<IActionResult> PostAsync()
        {
            try
            {
                var formCollection = await Request.ReadFormAsync();
                var file = formCollection.Files.First();

                //var folderName = Path.Combine("Resources", "Images", "Bieres");
                //var pathToSave = Path.Combine(Directory.GetCurrentDirectory(), folderName);
                if (file.Length > 0)
                {
                    var fileName = ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Trim('"');
                    var bieId = fileName.Substring(0, 36);
                    //var fullPath = Path.Combine(pathToSave, fileName);
                    //var dbPath = Path.Combine(folderName, fileName);
                    //using (var stream = new FileStream(fullPath, FileMode.Create))
                    //{
                    //    file.CopyTo(stream);
                    //}
                    //return Ok(new { dbPath });
                    GCStorageService _gStorage = new GCStorageService(bucketName, credentialGoogleJsonPath);
                    await _gStorage.UploadImageAsync(file, fileName, false);

                    GCVisionService _gVision = new GCVisionService(googleProjectId, googleLocation, googleProductSetId, credentialGoogleJsonPath);
                    string imagePath = imageUrl+"Bieres/" + fileName;
                    await _gVision.CreateProductAsync(bieId, imagePath);

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


        // DELETE api/<ImagesBiereController>/5,5
        [HttpDelete("{fileName, bieId}")]
        public async Task<IActionResult> DeleteAsync(string fileName, string bieId)
        {
            //var folderName = Path.Combine("Resources", "Images", "Bieres");
            //var pathToSave = Path.Combine(Directory.GetCurrentDirectory(), folderName);
            //var fullPath = Path.Combine(pathToSave, id);

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
                await _gStorage.DeleteImageAsync(fileName, false);

                GCVisionService _gVision = new GCVisionService(googleProjectId, googleLocation, googleProductSetId, credentialGoogleJsonPath);
                await _gVision.DeleteProductAsync(bieId);

                return NoContent();
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex}");
            }
        }
    }
}
