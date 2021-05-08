VIEW_WIDTH = 240;
VIEW_HEIGHT = 135;

// Fullscreen is best screen.  :)
window_set_fullscreen(true);

// Window centering needs to happen one step after the setting of the window size,
// otherwise the new window size will not be taken into account after centering the window.
window_set_size(VIEW_WIDTH, VIEW_HEIGHT);
alarm[0] = 1;

// The application surface controls how much the pixels in the window we're actually using.
// We're also going to match the application surface resolution to that of the display
// instead of that of the window.  This will make rotations and scrolling smoother.
var appSurfaceWidth = display_get_width();
var appSurfaceHeight = display_get_height();
var widthScaleFactor = appSurfaceWidth / VIEW_WIDTH;
var heightScaleFactor = appSurfaceHeight / VIEW_HEIGHT;
if (widthScaleFactor < heightScaleFactor) {
	appSurfaceHeight = VIEW_HEIGHT * widthScaleFactor;
} else {
	appSurfaceWidth = VIEW_WIDTH * heightScaleFactor;
}
surface_resize(application_surface, appSurfaceWidth, appSurfaceHeight);

// Make sure the GUI dimensions match that of the window.
display_set_gui_size(VIEW_WIDTH, VIEW_HEIGHT);
