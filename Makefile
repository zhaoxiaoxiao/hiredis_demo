CC	= gcc
DEBUGFLAG = -g -Wall

INCLUDE	= -I/usr/local/hiredis/include/hiredis
LIBDIRS	= -L/usr/local/hiredis/lib
LIBS	= -lhiredis

OBJS	= hiredis_modular.o
TARGET	= hiredis_demo

default:$(TARGET)

clean:
	rm -f $(TARGET) $(OBJS)

$(TARGET):$(OBJS)
	$(CC) -o $(TARGET) $^ $(LIBDIRS) $(LIBS)

.c.o:
	$(CC) $(DEBUGFLAG) -fPIC -c $< -o $@ $(INCLUDE)
