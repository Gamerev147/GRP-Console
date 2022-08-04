/// @description Get Page

if (async_load[? "result"] == undefined) { exit; }

if async_load[? "id"] == search {
    result=wiki_search_decode(async_load[? "result"]) // put search results in "result"
    search=-1
    
    if ds_list_size(result)>0
    {
        var str=ds_map_find_value(result[| 0], "title");
        firsttitle=str // title of a first page
        for(var i=1; i<ds_list_size(result); i++)
        {
            str+="|"+ds_map_find_value(result[| i], "title")
        } // str - string with page titles separate with |
        
        
        content_get=wiki_content(str) // getting content of this pages
        pageimage_get=wiki_pageimage_size(firsttitle, 470) // getting image from first page
    }
}
else if async_load[? "id"] = content_get // if it is content data of finded pages
{
    content=wiki_content_decode(async_load[? "result"]) // put content data in "content"
}
else if async_load[? "id"] = pageimage_get // if it is info about image on pages
{
    pageimage=wiki_pageimage_decode(async_load[? "result"]) // put data about images in "pageimage"
    if wiki_pageimage_get(pageimage, firsttitle, "status")==true // if status is ok
    {
        sprite_get=sprite_add(wiki_pageimage_get(pageimage, firsttitle, "source"), 1, 0, 0, 0, 0)
        // ^ downloading image
    }
}
