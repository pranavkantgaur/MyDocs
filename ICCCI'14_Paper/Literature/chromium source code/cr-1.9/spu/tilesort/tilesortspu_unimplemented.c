/* Copyright (c) 2001, Stanford University
	All rights reserved.

	See the file LICENSE.txt for information on redistributing this software. */
	

#include "tilesortspu.h"
#include "tilesortspu_proto.h"
#include "cr_error.h"    

void TILESORTSPU_APIENTRY tilesortspu_BoundsInfoCR( const CRrecti * bounds, const GLbyte * payload, GLint len, GLint num_opcodes )
{
	(void) bounds;
	(void) payload;
	(void) len;
	(void) num_opcodes;

	crWarning("Unimplemented tilesort function BoundsInfoCR\n");
}

void TILESORTSPU_APIENTRY tilesortspu_FeedbackBuffer( GLsizei size, GLenum type, GLfloat * buffer )
{
	(void) size;
	(void) type;
	(void) buffer;

	crWarning("Unimplemented tilesort function FeedbackBuffer\n");
}

void TILESORTSPU_APIENTRY tilesortspu_InitNames( void )
{

	crWarning("Unimplemented tilesort function InitNames\n");
}

void TILESORTSPU_APIENTRY tilesortspu_LoadName( GLuint name )
{
	(void) name;

	crWarning("Unimplemented tilesort function LoadName\n");
}

void TILESORTSPU_APIENTRY tilesortspu_PassThrough( GLfloat token )
{
	(void) token;

	crWarning("Unimplemented tilesort function PassThrough\n");
}

void TILESORTSPU_APIENTRY tilesortspu_PopName( void )
{

	crWarning("Unimplemented tilesort function PopName\n");
}

void TILESORTSPU_APIENTRY tilesortspu_PushName( GLuint name )
{
	(void) name;

	crWarning("Unimplemented tilesort function PushName\n");
}

GLint TILESORTSPU_APIENTRY tilesortspu_RenderMode( GLenum mode )
{
	(void) mode;

	crWarning("Unimplemented tilesort function RenderMode\n");

	return 0;
}

void TILESORTSPU_APIENTRY tilesortspu_SelectBuffer( GLsizei size, GLuint * buffer )
{
	(void) size;
	(void) buffer;

	crWarning("Unimplemented tilesort function SelectBuffer\n");
}

