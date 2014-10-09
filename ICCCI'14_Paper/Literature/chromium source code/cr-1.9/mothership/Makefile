# Copyright (c) 2001, Stanford University
# All rights reserved.
#
# See the file LICENSE.txt for information on redistributing this software.
#
TOP=..
include $(TOP)/arch.mk

TOP = ..
SUBDIRS = client reset quit server status

ifndef WINDOWS
ifeq ($(USE_DMX), 1)
SUBDIRS += dmx_config
endif
endif

include $(TOP)/cr.mk
