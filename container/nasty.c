#include <unistd.h>
#include <alloca.h>
#include <stdlib.h>

#define MB (1024*1024)

void do_write(int fd, char *buf, int buf_len)  {
	char *buf_ptr = buf;
	int written = 0;
	int remaining = buf_len;
	int ret = 0;
	while (written < buf_len) {
		ret = write(fd, buf_ptr, remaining);
		if (ret < 0) {
			write(2, "write failed\n", 13);
			exit(1);
		}
		remaining -= ret;
		buf_ptr += ret;
		written += ret;
	}
}

int main(int argc, char *argv[]) {
	char *buf = alloca(MB);
	int i;
	for (i = 0; i < MB; i++) {
		buf[i] = '\n';
	}
	while (1) {
		do_write(1, buf, MB);
		do_write(2, buf, MB);
	}
	return 0;
}
