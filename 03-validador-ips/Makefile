LEX = flex
CC ?= gcc
CFLAGS ?= -Wall -Wextra -O2
LIBS ?=

TARGET := validador_ips
SRC := validador_ips.l

all: $(TARGET)

$(TARGET): lex.yy.c
	$(CC) $(CFLAGS) -o $@ $< $(LIBS)

lex.yy.c: $(SRC)
	$(LEX) $(SRC)

clean:
	rm -f $(TARGET) lex.yy.c

.PHONY: all clean
