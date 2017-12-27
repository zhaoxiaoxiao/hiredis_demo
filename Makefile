CC	= gcc
DEBUGFLAG = -g -Wall

INCLUDE	= -I./hiredis
LIBDIRS	= -L./hiredis
LIBS	= -lhiredis

OBJS	= hiredis_modular.o
TARGET	= hiredis_demo

default:$(TARGET)

persist-settings:distclean
	-(cd ./hiredis && $(MAKE))

.make-prerequisites:
	@touch $@

.make-prerequisites: persist-settings

$(TARGET):$(OBJS)
	$(CC) -o $(TARGET) $^ $(LIBDIRS) $(LIBS)

%.o: %.c .make-prerequisites
	$(CC) $(DEBUGFLAG) -fPIC -c $< -o $@ $(INCLUDE)

clean:
	rm -f $(TARGET) $(OBJS)

.PHONY: clean

distclean: clean
	-(cd ./hiredis && $(MAKE) distclean)
	-(rm -f .make-*)

.PHONY: distclean