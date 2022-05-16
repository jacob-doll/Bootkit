GEN_OPTIONS = -DCLEAR_BSS -DGET_MMAP -DSP_OS_CONFIG
DBG_OPTIONS = -DTRACE_CX -DSTATUS=3

USER_OPTIONS = $(GEN_OPTIONS) $(DBG_OPTIONS)

INCLUDES = -Iinclude -I.

CPP = cpp
CPPFLAGS = $(USER_OPTIONS) -nostdinc $(INCLUDES)

CC = gcc
CFLAGS = -m32 -std=c99 -fno-stack-protector -fno-builtin -Wall -Wstrict-prototypes $(CPPFLAGS) -g

AS = as
ASFLAGS = --32

LD = ld
LDFLAGS = -melf_i386 -no-pie

BUILD_DIR = $(shell pwd)/build
TARGET = x86

-include src/boot/x86/build.mk

clean: 
	rm -rf build/