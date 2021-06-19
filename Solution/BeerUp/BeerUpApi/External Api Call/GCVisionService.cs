using Google.Api.Gax.ResourceNames;
using Google.Cloud.Vision.V1;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;

namespace BeerUpApi.External_Api_Call
{
    public class GCVisionService
    {
        private readonly string googleProjectId;
        private readonly string googleLocation;
        private readonly string googleProductSetId;
        private ProductSearchClient client;
        private readonly string pathJson;

        public GCVisionService(string googleProjectId, string googleLocation, string googleProductSetId, string credentialGoogleJsonPath)
        {
            this.googleProjectId = googleProjectId;
            this.googleLocation = googleLocation;
            this.googleProductSetId = googleProductSetId;
            this.pathJson = Path.Combine(Directory.GetCurrentDirectory(), "Resources", credentialGoogleJsonPath);
            
            ProductSearchClientBuilder build = new ProductSearchClientBuilder();
            build.CredentialsPath = pathJson;
            this.client = build.Build();

            


        }

        public async Task CreateProductAsync(string productId, string imagePath)
        {
            ProductSetName prodSetName = ProductSetName.FromProjectLocationProductSet(googleProjectId, googleLocation, googleProductSetId);
            ProductName prodName = ProductName.FromProjectLocationProduct(googleProjectId, googleLocation, productId);
            LocationName parent = LocationName.FromProjectLocation(googleProjectId, googleLocation);
            Product product = new Product();
            product.DisplayName = productId;
            product.ProductCategory = "packagedgoods-v1";
            await client.CreateProductAsync(parent, product, productId);
            await client.AddProductToProductSetAsync(prodSetName, prodName);

            ReferenceImage image = new ReferenceImage();
            image.Uri = imagePath;
            await client.CreateReferenceImageAsync(prodName, image, "");

        }

        public async Task DeleteProductAsync(string productId)
        {
            ProductName prodName = ProductName.FromProjectLocationProduct(googleProjectId, googleLocation, productId);
            await client.DeleteProductAsync(prodName);
        }

        public async Task<List<string>> SearchProductAsync(IFormFile file)
        {
            try
            {
                Image image;
                using (MemoryStream ms = new MemoryStream())
                {
                    file.CopyTo(ms);
                    byte[] bytes = ms.ToArray();

                    image = Image.FromBytes(bytes);

                    ProductSetName prodSetName = new ProductSetName(googleProjectId, googleLocation, googleProductSetId);

                    ProductSearchParams searchParams = new ProductSearchParams
                    {
                        ProductCategories = { "packagedgoods-v1" },
                        ProductSetAsProductSetName = prodSetName,
                    };

                    ImageAnnotatorClientBuilder builderImage = new ImageAnnotatorClientBuilder();
                    builderImage.CredentialsPath = pathJson;
                    ImageAnnotatorClient clientImage = builderImage.Build();

                    ProductSearchResults results = await clientImage.DetectSimilarProductsAsync(image, searchParams);



                    List<string> lBieId = new List<string>();

                    if (results != null && results.Results.Count > 0)
                    {
                        foreach (var result in results.Results)
                        {
                            if (result.Score > 0.55)
                            {
                                lBieId.Add(result.Product.DisplayName);
                            }
                        }
                    }
                    return lBieId;
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex}");
            }
        
            

        }

        private List<string> StatusCode(int v1, string v2)
        {
            throw new NotImplementedException();
        }
    }
}
