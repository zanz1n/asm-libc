ifndef VERBOSE
.SILENT:
endif

ARCH := $(shell uname -m)
BIN := bin/$(ARCH)
TARGET := $(BIN)/main

SC := as
SFLAGS := -nostdlib

CC := gcc
CFLAGS := -I. -nostdlib -fno-stack-protector

AS_SOURCES := $(wildcard *.$(ARCH).s)

SOURCES := $(wildcard *.c)
OBJECTS := $(patsubst %.c, $(BIN)/%.o, $(SOURCES)) $(patsubst %.s, $(BIN)/%.so, $(AS_SOURCES))

ifeq ($(ARCH), x86)
SFLAGS += --32
CFLAGS += -m32
else
SFLAGS += --64
CFLAGS += -m64
endif

build: logs $(BIN) $(TARGET)

logs:
	$(info --------------------------------)
	$(info C compiler   : $(CC))
	$(info Assembler    : $(AS))
	$(info Architecture : $(ARCH))
	$(info Build target : $(TARGET))
	$(info --------------------------------)

$(TARGET): $(OBJECTS)
	$(info BUILD: $@)
	$(CC) $(CFLAGS) $^ -o $@

$(BIN)/%.o: %.c
	$(info CC: $< -> $@)
	$(CC) $(CFLAGS) -c $< -o $@

$(BIN)/%.so: %.s
	$(info AS: $< -> $@)
	$(SC) $(SFLAGS) -c $< -o $@

$(BIN):
	mkdir -p $(BIN)

clear: $(BIN)
	rm -rf $(BIN)/*
