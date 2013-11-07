CC      = gcc
CFLAGS  = -Wall
LIBS    = 

SRCDIR = src
OBJDIR = obj
BINDIR = bin

SRCS = $(notdir $(wildcard $(SRCDIR)/*.cpp))
OBJS = $(patsubst %.cpp, $(OBJDIR)/%.o, $(SRCS))

TARGET = foo

all: $(TARGET)

$(TARGET): $(OBJS)
    $(CC) $(CCFLAGS) $(OBJS) -o $(BINDIR)/$@ $(LIBS)

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
    $(CC) $(CFLAGS) -c -o $@ $<

clean:
    rm -f $(BINDIR)/*
    rm -f $(OBJDIR)/*
