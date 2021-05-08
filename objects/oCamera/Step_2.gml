// We position the camera in the end step event because we should do so after all
// movement has completed.

#macro view view_camera[0]

camera_set_view_size(view, VIEW_WIDTH, VIEW_HEIGHT);
camera_set_view_pos(view, 0, 0);
