
#ifndef __XIAOXIAO_HIREDIS_MODULAR_H__
#define __XIAOXIAO_HIREDIS_MODULAR_H__

#ifdef __cplusplus
extern "C" {
#endif

////char str end of '\0'
int init_hiredis_client(const char *ip,unsigned short po,const char *auth);

void hiredis_fd_release(int h_fd);

int set_key_value(int h_fd,const char *key,const char *value);

int get_key_value(int h_fd,const char *key,char *value,int len);

int hmset_key_value(int h_fd,const char *key,const char *value);

int hgetall_key_value(int h_fd,const char *key,const char *value,int len);

#ifdef __cplusplus
}
#endif
#endif