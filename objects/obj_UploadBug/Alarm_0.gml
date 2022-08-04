/// @description Upload

var ufn = filename_name(upload_file);

//map to hold header info
var umap = ds_map_create();

//add header to map
ds_map_add(umap, "Host", base_url);
ds_map_add(umap, "User-Agent", "grpmos");
ds_map_add(umap, "Content-Type", "application/x-www-form-urlencoded");
ds_map_add(umap, "Accept", "*/*");

//load file to buffer
var sbuff = buffer_create(1, buffer_grow, 1);
buffer_load_ext(sbuff, upload_file, 0);

//encode the data
var data_send = buffer_base64_encode(sbuff, 0, buffer_get_size(sbuff));

//send the request
http_request(uploader_url + "bug_report.php", "POST", umap, "name=" + ufn + "&data=" + data_send);


//clean
buffer_delete(sbuff);
ds_map_destroy(umap);

