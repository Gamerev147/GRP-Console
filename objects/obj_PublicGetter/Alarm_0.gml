/// @description Upload

//map to hold header info
var umap = ds_map_create();

//add header to map
ds_map_add(umap, "Host", base_url);
ds_map_add(umap, "User-Agent", "grpmos");
ds_map_add(umap, "Content-Type", "application/x-www-form-urlencoded");
ds_map_add(umap, "Accept", "*/*");

//send the request
ConsoleLog("Requesting access from public database...", 0);

http_request(uploader_url + "public_getter.php", "POST", umap, "");


//clean
ds_map_destroy(umap);

