CC	= gcc
CFLAGS	= -Wall -O2 -g -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
PROGS	= ktee splice-cp splice-in splice-out splice-net splice-test4c splice-test4s

all: depend $(PROGS)

%.o: %.c
	$(CC) -o $*.o -c $(CFLAGS) $<

depend:
	@$(CC) -MM $(CFLAGS) *.c 1> .depend

clean:
	-rm -f *.o $(PROGS) .depend

ifneq ($(wildcard .depend),)
include .depend
endif
