///@description
buffer_seek(buff, buffer_seek_start, 0);
buffer_write(buff, buffer_u8, PING);
buffer_write(buff, buffer_u32, current_time);

network_send_packet(client, buff, buffer_tell(buff));