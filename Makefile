OUT := xiaomi_adb

# Set compiler
CC := clang

# Compiler flags
CFLAGS := -O0 -g3 -Wall -I./lib `pkg-config --cflags libusb-1.0 libcurl` -I/opt/homebrew/include
LDFLAGS := -L/opt/homebrew/lib `pkg-config --libs libusb-1.0 libcurl`
prefix := /usr/local

SRCS := main.c lib/AES/aes.c lib/BASE64/base64.c lib/JSON/tiny-json.c lib/MD5/md5.c
OBJS := $(SRCS:.c=.o)

default: $(OUT)

$(OUT): $(OBJS)
	$(CC) -o $@ $^ $(LDFLAGS)

clean:
	rm -f $(OUT) $(OBJS)