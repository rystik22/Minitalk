NAMEC = client
NAMES = server
BONUS_NAMEC = client_bonus
BONUS_NAMES = server_bonus
PRINTF = libftprintf.a

SRCC_FILES = client.c
SRCS_FILES = server.c
BONUSC_FILES = client_bonus.c
BONUSS_FILES = server_bonus.c

OBJC = ${SRCC_FILES:.c=.o}
OBJS = ${SRCS_FILES:.c=.o}
OBJBC = ${BONUSC_FILES:.c=.o}
OBJBS = ${BONUSS_FILES:.c=.o}

CC = cc
CFLAGS = -Wall -Werror -Wextra
INCLUDE = -I include
RM = rm -rf

all: $(NAMEC) $(NAMES)

$(NAMEC): $(OBJC)
		@make -C printf
		$(CC) $(CFLAGS) $(OBJC) $(INCLUDE) printf/$(PRINTF) -o $(NAMEC)

$(NAMES): $(OBJS)
		@make -C printf
		$(CC) $(CFLAGS) $(OBJS) $(INCLUDE) printf/$(PRINTF) -o $(NAMES)

bonus: $(BONUS_NAMEC) $(BONUS_NAMES)

$(BONUS_NAMEC): $(OBJBC)
		@make -C printf
		$(CC) $(CFLAGS) $(OBJBC) $(INCLUDE) printf/$(PRINTF) -o $(BONUS_NAMEC)

$(BONUS_NAMES): $(OBJBS)
		@make -C printf
		$(CC) $(CFLAGS) $(OBJBS) $(INCLUDE) printf/$(PRINTF) -o $(BONUS_NAMES)

clean:
		@make clean -C printf
		${RM} ${OBJC} ${OBJS} ${OBJBC} ${OBJBS}

fclean: clean
		@make fclean -C printf
		${RM} $(NAMEC) $(NAMES) $(BONUS_NAMEC) $(BONUS_NAMES)

re: fclean all

.PHONY: all bonus clean fclean re
