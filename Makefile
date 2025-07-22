# Makefile

# Compiler and flags
CC      := gcc
CFLAGS  := -Wall -Wextra -g -Iinclude
LDLIBS  := -lcurl -lz -lrt -pthread

# Directories
SRCDIR  := src
INCDIR  := include

# List only the source files your paster2.c depends on
SOURCES := \
    paster2.c \
    zutil.c    \
    lab_png.c  \
    crc.c

# Full paths to sources and objects
SRCS    := $(addprefix $(SRCDIR)/, $(SOURCES))
OBJS    := $(SRCS:.c=.o)

# Final executable
TARGET  := paster2

.PHONY: all clean

all: $(TARGET)

# Link step: only your own objects
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ $(LDLIBS)

# Compile rule for .c → .o
$(SRCDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	# delete every .o under this project
	find . -type f -name '*.o' -delete
	# remove executable and output
	rm -f paster2 all.png

