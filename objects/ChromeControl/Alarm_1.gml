/// @description Tab

var st = instance_create_layer(display_get_gui_width()-24, bdocky, "ui_layer", obj_BrowserTab);
st.my_url = chromium_get_url();
st.title = string_copy(gui_url, 1, 24);
ds_list_add(browserTabs, st);
