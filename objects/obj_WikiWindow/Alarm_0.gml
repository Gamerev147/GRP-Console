/// @description Search

if cont!=-1 ds_map_destroy(cont) // clear memory
cont=-1
if pageimage!=-1 ds_map_destroy(pageimage) // clear memory
pageimage=-1
if sprite!=-1 sprite_delete(sprite) // clear memory
sprite=-1
    
search=wiki_search(keyboard_string, limit) // start search
if result!=-1
{
    ds_list_destroy(result) // clear memory
    result=-1
}
