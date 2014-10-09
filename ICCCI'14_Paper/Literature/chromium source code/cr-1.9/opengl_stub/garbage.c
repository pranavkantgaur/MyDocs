/**********************************************************************/
/* Window "garbage collection"                                        */
/**********************************************************************/

static Bool WindowExistsFlag;

static int
WindowExistsErrorHandler( Display *dpy, XErrorEvent *xerr )
{
	if (xerr->error_code == BadWindow)
	{
		WindowExistsFlag = GL_FALSE;
	}
	return 0;
}

static GLboolean
WindowExists( Display *dpy, Window w )
{
	XWindowAttributes xwa;
	int (*oldXErrorHandler)(Display *, XErrorEvent *);

	WindowExistsFlag = GL_TRUE;
	oldXErrorHandler = XSetErrorHandler(WindowExistsErrorHandler);
	XGetWindowAttributes(dpy, w, &xwa); /* dummy request */
	XSetErrorHandler(oldXErrorHandler);
	return WindowExistsFlag;
}


static void
CheckWindowCallback(unsigned long key, void *data1, void *data2)
{
	WindowInfo *window = (WindowInfo *) data1;
	CRASSERT(window);
	printf("********* %s\n", __FUNCTION__);
	printf("check key %d drawable %d\n", (int) key, (int) window->drawable);
	if (window->dpy && !WindowExists(window->dpy, window->drawable)) {
		if (window->type == CHROMIUM) {
			printf("Destroying unused window %d\n", (int) window->drawable);
			stub.spu->dispatch_table.WindowDestroy(window->spuWindow);
		}
	}
}


static void
DestroyUnusedWindows(void)
{
	crHashtableWalk(stub.windowTable, CheckWindowCallback, NULL);
}



/**********************************************************************/

