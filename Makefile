CC	= gcc
DEBUGFLAG = -g #-Wall -ggdb -rdynamic

INCLUDE	= -I./hiredis
LIBDIRS	= #-L./hiredis
LIBS	= #-lhiredis

OBJS	= hiredis_modular.o ./hiredis/libhiredis.a
TARGET	= hiredis_demo

default:$(TARGET)

persist-settings:
	-(cd ./hiredis && $(MAKE))

.make-prerequisites:
	@touch $@

.make-prerequisites: persist-settings

$(TARGET):$(OBJS)
	$(CC) -o $(TARGET) $^ $(LIBDIRS) $(LIBS)

%.o: %.c .make-prerequisites
	$(CC) $(DEBUGFLAG) -c $< -o $@ $(INCLUDE)

.PHONY: clean

clean:distclean
	rm -f $(TARGET) $(OBJS)

.PHONY: distclean

distclean: clean
	-(cd ./hiredis && $(MAKE) clean)
	-(rm -f .make-*)

