ARCH := $(shell uname -m)
BIN := bin/$(ARCH)
TARGET := $(BIN)/main

SC := as
SFLAGS := -nostdlib

CC := gcc
CFLAGS := -I. -nostdlib -fno-stack-protector

AS_SOURCES := $(wildcard *$(ARCH).s)

SOURCES := $(wildcard *.c)
OBJECTS := $(patsubst %.c, $(BIN)/%.o, $(SOURCES)) $(patsubst %.s, $(BIN)/%.so, $(AS_SOURCES))

build: $(BIN) $(TARGET)
ifeq ($(ARCH), x86)
SFLAGS += --32
CFLAGS += -m32
else
SFLAGS += --64
CFLAGS += -m64
endif

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) $^ -o $@

$(BIN)/%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(BIN)/%.so: %.s
	$(SC) $(SFLAGS) -c $< -o $@

$(BIN):
	mkdir -p $(BIN)

clear: $(BIN)
	rm -rf $(BIN)/*
