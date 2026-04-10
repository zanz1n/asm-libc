BIN := bin
TARGET := $(BIN)/main

SC := as
SFLAGS := -nostdlib

CC := gcc
CFLAGS := -I. -nostdlib -fno-stack-protector

AS_SOURCES := $(wildcard *.s)

SOURCES := $(wildcard *.c)
OBJECTS := $(patsubst %.c, $(BIN)/%.o, $(SOURCES)) $(patsubst %.s, $(BIN)/%.so, $(AS_SOURCES))

build: $(BIN) $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) $^ -o $@

$(BIN)/%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(BIN)/%.so: %.s
	$(SC) $(SFLAGS) -c $< -o $@

$(BIN):
	mkdir $(BIN)

clear: $(BIN)
	rm -rf $(BIN)/*
