#line 1 "..\\main.c"

 
 
 
 
 
 
 
 
 
#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"
 
 
 





 






 







 




  
 








#line 47 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"


  



    typedef unsigned int size_t;    









 
 

 



    typedef struct __va_list __va_list;






   




 




typedef struct __fpos_t_struct {
    unsigned __int64 __pos;
    



 
    struct {
        unsigned int __state1, __state2;
    } __mbstate;
} fpos_t;
   


 


   

 

typedef struct __FILE FILE;
   






 

#line 136 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"


extern FILE __stdin, __stdout, __stderr;
extern FILE *__aeabi_stdin, *__aeabi_stdout, *__aeabi_stderr;

#line 166 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"
    

    

    





     



   


 


   


 

   



 

   


 




   


 





    


 






extern __declspec(__nothrow) int remove(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int rename(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) FILE *tmpfile(void);
   




 
extern __declspec(__nothrow) char *tmpnam(char *  );
   











 

extern __declspec(__nothrow) int fclose(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) int fflush(FILE *  );
   







 
extern __declspec(__nothrow) FILE *fopen(const char * __restrict  ,
                           const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   








































 
extern __declspec(__nothrow) FILE *freopen(const char * __restrict  ,
                    const char * __restrict  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(2,3)));
   








 
extern __declspec(__nothrow) void setbuf(FILE * __restrict  ,
                    char * __restrict  ) __attribute__((__nonnull__(1)));
   




 
extern __declspec(__nothrow) int setvbuf(FILE * __restrict  ,
                   char * __restrict  ,
                   int  , size_t  ) __attribute__((__nonnull__(1)));
   















 
#pragma __printf_args
extern __declspec(__nothrow) int fprintf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   


















 
#pragma __printf_args
extern __declspec(__nothrow) int _fprintf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   




 
#pragma __printf_args
extern __declspec(__nothrow) int _printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






 
#pragma __printf_args
extern __declspec(__nothrow) int _sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

#pragma __printf_args
extern __declspec(__nothrow) int __ARM_snprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(3)));


#pragma __printf_args
extern __declspec(__nothrow) int snprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   















 

#pragma __printf_args
extern __declspec(__nothrow) int _snprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int fscanf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






























 
#pragma __scanf_args
extern __declspec(__nothrow) int _fscanf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   






 
#pragma __scanf_args
extern __declspec(__nothrow) int _scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int sscanf(const char * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   








 
#pragma __scanf_args
extern __declspec(__nothrow) int _sscanf(const char * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

 
extern __declspec(__nothrow) int vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int _vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int _vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int _vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int __ARM_vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int _vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) int vfprintf(FILE * __restrict  ,
                    const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int vsprintf(char * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int __ARM_vsnprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));

extern __declspec(__nothrow) int vsnprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   







 

extern __declspec(__nothrow) int _vsprintf(char * __restrict  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vfprintf(FILE * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vsnprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   



 

#pragma __printf_args
extern __declspec(__nothrow) int asprintf(char **  , const char * __restrict  , ...) __attribute__((__nonnull__(2)));
extern __declspec(__nothrow) int vasprintf(char **  , const char * __restrict  , __va_list  ) __attribute__((__nonnull__(2)));

#pragma __printf_args
extern __declspec(__nothrow) int __ARM_asprintf(char **  , const char * __restrict  , ...) __attribute__((__nonnull__(2)));
extern __declspec(__nothrow) int __ARM_vasprintf(char **  , const char * __restrict  , __va_list  ) __attribute__((__nonnull__(2)));
   








 

extern __declspec(__nothrow) int fgetc(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) char *fgets(char * __restrict  , int  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   










 
extern __declspec(__nothrow) int fputc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   







 
extern __declspec(__nothrow) int fputs(const char * __restrict  , FILE * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) int getc(FILE *  ) __attribute__((__nonnull__(1)));
   







 




    extern __declspec(__nothrow) int (getchar)(void);

   





 
extern __declspec(__nothrow) char *gets(char *  ) __attribute__((__nonnull__(1)));
   









 
extern __declspec(__nothrow) int putc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   





 




    extern __declspec(__nothrow) int (putchar)(int  );

   



 
extern __declspec(__nothrow) int puts(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int ungetc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   






















 

extern __declspec(__nothrow) size_t fread(void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   











 

extern __declspec(__nothrow) size_t __fread_bytes_avail(void * __restrict  ,
                    size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   











 

extern __declspec(__nothrow) size_t fwrite(const void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   







 

extern __declspec(__nothrow) int fgetpos(FILE * __restrict  , fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) int fseek(FILE *  , long int  , int  ) __attribute__((__nonnull__(1)));
   














 
extern __declspec(__nothrow) int fsetpos(FILE * __restrict  , const fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   










 
extern __declspec(__nothrow) long int ftell(FILE *  ) __attribute__((__nonnull__(1)));
   











 
extern __declspec(__nothrow) void rewind(FILE *  ) __attribute__((__nonnull__(1)));
   





 

extern __declspec(__nothrow) void clearerr(FILE *  ) __attribute__((__nonnull__(1)));
   




 

extern __declspec(__nothrow) int feof(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) int ferror(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) void perror(const char *  );
   









 

extern __declspec(__nothrow) int _fisatty(FILE *   ) __attribute__((__nonnull__(1)));
    
 

extern __declspec(__nothrow) void __use_no_semihosting_swi(void);
extern __declspec(__nothrow) void __use_no_semihosting(void);
    





 











#line 1021 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"



 

#line 12 "..\\main.c"
#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
 
 





 









     
#line 27 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
     











#line 46 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"





 

     

     
typedef   signed          char int8_t;
typedef   signed short     int int16_t;
typedef   signed           int int32_t;
typedef   signed       __int64 int64_t;

     
typedef unsigned          char uint8_t;
typedef unsigned short     int uint16_t;
typedef unsigned           int uint32_t;
typedef unsigned       __int64 uint64_t;

     

     
     
typedef   signed          char int_least8_t;
typedef   signed short     int int_least16_t;
typedef   signed           int int_least32_t;
typedef   signed       __int64 int_least64_t;

     
typedef unsigned          char uint_least8_t;
typedef unsigned short     int uint_least16_t;
typedef unsigned           int uint_least32_t;
typedef unsigned       __int64 uint_least64_t;

     

     
typedef   signed           int int_fast8_t;
typedef   signed           int int_fast16_t;
typedef   signed           int int_fast32_t;
typedef   signed       __int64 int_fast64_t;

     
typedef unsigned           int uint_fast8_t;
typedef unsigned           int uint_fast16_t;
typedef unsigned           int uint_fast32_t;
typedef unsigned       __int64 uint_fast64_t;

     




typedef   signed           int intptr_t;
typedef unsigned           int uintptr_t;


     
typedef   signed     long long intmax_t;
typedef unsigned     long long uintmax_t;




     

     





     





     





     

     





     





     





     

     





     





     





     

     






     






     






     

     


     


     


     

     
#line 216 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     



     






     
    
 



#line 241 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     







     










     











#line 305 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"






 
#line 13 "..\\main.c"
#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"
 
 
 




 
 



 






   














  


 








#line 54 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"


  



    typedef unsigned int size_t;    
#line 70 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"






    



    typedef unsigned short wchar_t;  
#line 91 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"

typedef struct div_t { int quot, rem; } div_t;
    
typedef struct ldiv_t { long int quot, rem; } ldiv_t;
    

typedef struct lldiv_t { long long quot, rem; } lldiv_t;
    


#line 112 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"
   



 

   




 
#line 131 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"
   


 
extern __declspec(__nothrow) int __aeabi_MB_CUR_MAX(void);

   




 

   




 




extern __declspec(__nothrow) double atof(const char *  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) int atoi(const char *  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) long int atol(const char *  ) __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) long long atoll(const char *  ) __attribute__((__nonnull__(1)));
   



 


extern __declspec(__nothrow) double strtod(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
   

















 

extern __declspec(__nothrow) float strtof(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) long double strtold(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
   

 

extern __declspec(__nothrow) long int strtol(const char * __restrict  ,
                        char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   



























 
extern __declspec(__nothrow) unsigned long int strtoul(const char * __restrict  ,
                                       char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   


























 

 
extern __declspec(__nothrow) long long strtoll(const char * __restrict  ,
                                  char ** __restrict  , int  )
                          __attribute__((__nonnull__(1)));
   




 
extern __declspec(__nothrow) unsigned long long strtoull(const char * __restrict  ,
                                            char ** __restrict  , int  )
                                   __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) int rand(void);
   







 
extern __declspec(__nothrow) void srand(unsigned int  );
   






 

struct _rand_state { int __x[57]; };
extern __declspec(__nothrow) int _rand_r(struct _rand_state *);
extern __declspec(__nothrow) void _srand_r(struct _rand_state *, unsigned int);
struct _ANSI_rand_state { int __x[1]; };
extern __declspec(__nothrow) int _ANSI_rand_r(struct _ANSI_rand_state *);
extern __declspec(__nothrow) void _ANSI_srand_r(struct _ANSI_rand_state *, unsigned int);
   


 

extern __declspec(__nothrow) void *calloc(size_t  , size_t  );
   



 
extern __declspec(__nothrow) void free(void *  );
   





 
extern __declspec(__nothrow) void *malloc(size_t  );
   



 
extern __declspec(__nothrow) void *realloc(void *  , size_t  );
   













 

extern __declspec(__nothrow) int posix_memalign(void **  , size_t  , size_t  );
   









 

typedef int (*__heapprt)(void *, char const *, ...);
extern __declspec(__nothrow) void __heapstats(int (*  )(void *  ,
                                           char const *  , ...),
                        void *  ) __attribute__((__nonnull__(1)));
   










 
extern __declspec(__nothrow) int __heapvalid(int (*  )(void *  ,
                                           char const *  , ...),
                       void *  , int  ) __attribute__((__nonnull__(1)));
   














 
extern __declspec(__nothrow) __declspec(__noreturn) void abort(void);
   







 

extern __declspec(__nothrow) int atexit(void (*  )(void)) __attribute__((__nonnull__(1)));
   




 
#line 436 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"


extern __declspec(__nothrow) __declspec(__noreturn) void exit(int  );
   












 

extern __declspec(__nothrow) __declspec(__noreturn) void _Exit(int  );
   







      

extern __declspec(__nothrow) char *getenv(const char *  ) __attribute__((__nonnull__(1)));
   









 

extern __declspec(__nothrow) int  system(const char *  );
   









 

extern  void *bsearch(const void *  , const void *  ,
              size_t  , size_t  ,
              int (*  )(const void *, const void *)) __attribute__((__nonnull__(1,2,5)));
   












 
#line 524 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"


extern  void qsort(void *  , size_t  , size_t  ,
           int (*  )(const void *, const void *)) __attribute__((__nonnull__(1,4)));
   









 

#line 553 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"

extern __declspec(__nothrow) __attribute__((const)) int abs(int  );
   



 

extern __declspec(__nothrow) __attribute__((const)) div_t div(int  , int  );
   









 
extern __declspec(__nothrow) __attribute__((const)) long int labs(long int  );
   



 




extern __declspec(__nothrow) __attribute__((const)) ldiv_t ldiv(long int  , long int  );
   











 







extern __declspec(__nothrow) __attribute__((const)) long long llabs(long long  );
   



 




extern __declspec(__nothrow) __attribute__((const)) lldiv_t lldiv(long long  , long long  );
   











 
#line 634 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"




 
typedef struct __sdiv32by16 { int quot, rem; } __sdiv32by16;
typedef struct __udiv32by16 { unsigned int quot, rem; } __udiv32by16;
    
typedef struct __sdiv64by32 { int rem, quot; } __sdiv64by32;

__value_in_regs extern __declspec(__nothrow) __attribute__((const)) __sdiv32by16 __rt_sdiv32by16(
     int  ,
     short int  );
   

 
__value_in_regs extern __declspec(__nothrow) __attribute__((const)) __udiv32by16 __rt_udiv32by16(
     unsigned int  ,
     unsigned short  );
   

 
__value_in_regs extern __declspec(__nothrow) __attribute__((const)) __sdiv64by32 __rt_sdiv64by32(
     int  , unsigned int  ,
     int  );
   

 




 
extern __declspec(__nothrow) unsigned int __fp_status(unsigned int  , unsigned int  );
   







 























 
extern __declspec(__nothrow) int mblen(const char *  , size_t  );
   












 
extern __declspec(__nothrow) int mbtowc(wchar_t * __restrict  ,
                   const char * __restrict  , size_t  );
   















 
extern __declspec(__nothrow) int wctomb(char *  , wchar_t  );
   













 





 
extern __declspec(__nothrow) size_t mbstowcs(wchar_t * __restrict  ,
                      const char * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   














 
extern __declspec(__nothrow) size_t wcstombs(char * __restrict  ,
                      const wchar_t * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   














 

extern __declspec(__nothrow) void __use_realtime_heap(void);
extern __declspec(__nothrow) void __use_realtime_division(void);
extern __declspec(__nothrow) void __use_two_region_memory(void);
extern __declspec(__nothrow) void __use_no_heap(void);
extern __declspec(__nothrow) void __use_no_heap_region(void);

extern __declspec(__nothrow) char const *__C_library_version_string(void);
extern __declspec(__nothrow) int __C_library_version_number(void);











#line 892 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"





 
#line 14 "..\\main.c"
#line 1 "..\\..\\Library\\Device\\Nuvoton\\M051Series\\Include\\M051Series.h"
 









 


















 













 









 



 
typedef enum IRQn
{
     
    NonMaskableInt_IRQn       = -14,       
    HardFault_IRQn            = -13,       
    SVCall_IRQn               = -5,        
    PendSV_IRQn               = -2,        
    SysTick_IRQn              = -1,        

     
    BOD_IRQn                  = 0,         
    WDT_IRQn                  = 1,         
    EINT0_IRQn                = 2,         
    EINT1_IRQn                = 3,         
    GPIO_P0P1_IRQn            = 4,         
    GPIO_P2P3P4_IRQn          = 5,         
    PWMA_IRQn                 = 6,         
    PWMB_IRQn                 = 7,         
    TMR0_IRQn                 = 8,         
    TMR1_IRQn                 = 9,         
    TMR2_IRQn                 = 10,        
    TMR3_IRQn                 = 11,        
    UART0_IRQn                = 12,        
    UART1_IRQn                = 13,        
    SPI0_IRQn                 = 14,        
    SPI1_IRQn                 = 15,        
    I2C0_IRQn                 = 18,        
    I2C1_IRQn                 = 19,        
    ACMP01_IRQn               = 25,        
    ACMP23_IRQn               = 26,        
    PWRWU_IRQn                = 28,        
    ADC_IRQn                  = 29         

} IRQn_Type;






 

 





#line 1 "..\\..\\Library\\CMSIS\\Include\\core_cm0.h"
 




















 













 












 




 


 

 













#line 89 "..\\..\\Library\\CMSIS\\Include\\core_cm0.h"


 







#line 114 "..\\..\\Library\\CMSIS\\Include\\core_cm0.h"

#line 116 "..\\..\\Library\\CMSIS\\Include\\core_cm0.h"
#line 1 "..\\..\\Library\\CMSIS\\Include\\core_cmInstr.h"
 




















 






 


 



 


 









 







 







 






 








 







 







 









 









 
__attribute__((section(".rev16_text"))) static __inline __asm uint32_t __REV16(uint32_t value)
{
  rev16 r0, r0
  bx lr
}








 
__attribute__((section(".revsh_text"))) static __inline __asm int32_t __REVSH(int32_t value)
{
  revsh r0, r0
  bx lr
}









 



#line 268 "..\\..\\Library\\CMSIS\\Include\\core_cmInstr.h"



#line 619 "..\\..\\Library\\CMSIS\\Include\\core_cmInstr.h"

   

   

#line 117 "..\\..\\Library\\CMSIS\\Include\\core_cm0.h"
#line 1 "..\\..\\Library\\CMSIS\\Include\\core_cmFunc.h"
 




















 






 

 



 


 





 
 






 
static __inline uint32_t __get_CONTROL(void)
{
  register uint32_t __regControl         __asm("control");
  return(__regControl);
}







 
static __inline void __set_CONTROL(uint32_t control)
{
  register uint32_t __regControl         __asm("control");
  __regControl = control;
}







 
static __inline uint32_t __get_IPSR(void)
{
  register uint32_t __regIPSR          __asm("ipsr");
  return(__regIPSR);
}







 
static __inline uint32_t __get_APSR(void)
{
  register uint32_t __regAPSR          __asm("apsr");
  return(__regAPSR);
}







 
static __inline uint32_t __get_xPSR(void)
{
  register uint32_t __regXPSR          __asm("xpsr");
  return(__regXPSR);
}







 
static __inline uint32_t __get_PSP(void)
{
  register uint32_t __regProcessStackPointer  __asm("psp");
  return(__regProcessStackPointer);
}







 
static __inline void __set_PSP(uint32_t topOfProcStack)
{
  register uint32_t __regProcessStackPointer  __asm("psp");
  __regProcessStackPointer = topOfProcStack;
}







 
static __inline uint32_t __get_MSP(void)
{
  register uint32_t __regMainStackPointer     __asm("msp");
  return(__regMainStackPointer);
}







 
static __inline void __set_MSP(uint32_t topOfMainStack)
{
  register uint32_t __regMainStackPointer     __asm("msp");
  __regMainStackPointer = topOfMainStack;
}







 
static __inline uint32_t __get_PRIMASK(void)
{
  register uint32_t __regPriMask         __asm("primask");
  return(__regPriMask);
}







 
static __inline void __set_PRIMASK(uint32_t priMask)
{
  register uint32_t __regPriMask         __asm("primask");
  __regPriMask = (priMask);
}


#line 260 "..\\..\\Library\\CMSIS\\Include\\core_cmFunc.h"


#line 296 "..\\..\\Library\\CMSIS\\Include\\core_cmFunc.h"


#line 615 "..\\..\\Library\\CMSIS\\Include\\core_cmFunc.h"

 

   

#line 118 "..\\..\\Library\\CMSIS\\Include\\core_cm0.h"








 
#line 143 "..\\..\\Library\\CMSIS\\Include\\core_cm0.h"

 






 
#line 159 "..\\..\\Library\\CMSIS\\Include\\core_cm0.h"

 










 


 





 


 
typedef union
{
  struct
  {

    uint32_t _reserved0:27;               





    uint32_t Q:1;                         
    uint32_t V:1;                         
    uint32_t C:1;                         
    uint32_t Z:1;                         
    uint32_t N:1;                         
  } b;                                    
  uint32_t w;                             
} APSR_Type;



 
typedef union
{
  struct
  {
    uint32_t ISR:9;                       
    uint32_t _reserved0:23;               
  } b;                                    
  uint32_t w;                             
} IPSR_Type;



 
typedef union
{
  struct
  {
    uint32_t ISR:9;                       

    uint32_t _reserved0:15;               





    uint32_t T:1;                         
    uint32_t IT:2;                        
    uint32_t Q:1;                         
    uint32_t V:1;                         
    uint32_t C:1;                         
    uint32_t Z:1;                         
    uint32_t N:1;                         
  } b;                                    
  uint32_t w;                             
} xPSR_Type;



 
typedef union
{
  struct
  {
    uint32_t nPRIV:1;                     
    uint32_t SPSEL:1;                     
    uint32_t FPCA:1;                      
    uint32_t _reserved0:29;               
  } b;                                    
  uint32_t w;                             
} CONTROL_Type;

 






 


 
typedef struct
{
  volatile uint32_t ISER[1];                  
       uint32_t RESERVED0[31];
  volatile uint32_t ICER[1];                  
       uint32_t RSERVED1[31];
  volatile uint32_t ISPR[1];                  
       uint32_t RESERVED2[31];
  volatile uint32_t ICPR[1];                  
       uint32_t RESERVED3[31];
       uint32_t RESERVED4[64];
  volatile uint32_t IP[8];                    
}  NVIC_Type;

 






 


 
typedef struct
{
  volatile const  uint32_t CPUID;                    
  volatile uint32_t ICSR;                     
       uint32_t RESERVED0;
  volatile uint32_t AIRCR;                    
  volatile uint32_t SCR;                      
  volatile uint32_t CCR;                      
       uint32_t RESERVED1;
  volatile uint32_t SHP[2];                   
  volatile uint32_t SHCSR;                    
} SCB_Type;

 















 



























 















 









 






 



 






 


 
typedef struct
{
  volatile uint32_t CTRL;                     
  volatile uint32_t LOAD;                     
  volatile uint32_t VAL;                      
  volatile const  uint32_t CALIB;                    
} SysTick_Type;

 












 



 



 









 








 
 






 

 










 









 

 



 




 

 
 










 
static __inline void NVIC_EnableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[0] = (1 << ((uint32_t)(IRQn) & 0x1F));
}







 
static __inline void NVIC_DisableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICER[0] = (1 << ((uint32_t)(IRQn) & 0x1F));
}











 
static __inline uint32_t NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  return((uint32_t) ((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[0] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0));
}







 
static __inline void NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[0] = (1 << ((uint32_t)(IRQn) & 0x1F));
}







 
static __inline void NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICPR[0] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}










 
static __inline void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if(IRQn < 0) {
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[( ((((uint32_t)(IRQn) & 0x0F)-8) >> 2) )] = (((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[( ((((uint32_t)(IRQn) & 0x0F)-8) >> 2) )] & ~(0xFF << ( (((uint32_t)(IRQn) ) & 0x03) * 8 ))) |
        (((priority << (8 - 2)) & 0xFF) << ( (((uint32_t)(IRQn) ) & 0x03) * 8 )); }
  else {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[( ((uint32_t)(IRQn) >> 2) )] = (((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[( ((uint32_t)(IRQn) >> 2) )] & ~(0xFF << ( (((uint32_t)(IRQn) ) & 0x03) * 8 ))) |
        (((priority << (8 - 2)) & 0xFF) << ( (((uint32_t)(IRQn) ) & 0x03) * 8 )); }
}












 
static __inline uint32_t NVIC_GetPriority(IRQn_Type IRQn)
{

  if(IRQn < 0) {
    return((uint32_t)((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[( ((((uint32_t)(IRQn) & 0x0F)-8) >> 2) )] >> ( (((uint32_t)(IRQn) ) & 0x03) * 8 ) ) >> (8 - 2)));  }  
  else {
    return((uint32_t)((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[ ( ((uint32_t)(IRQn) >> 2) )] >> ( (((uint32_t)(IRQn) ) & 0x03) * 8 ) ) >> (8 - 2)));  }  
}





 
static __inline void NVIC_SystemReset(void)
{
  __dsb(0xF);                                                     
 
  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR  = ((0x5FA << 16)      |
                 (1UL << 2));
  __dsb(0xF);                                                      
  while(1);                                                     
}

 



 




 

















 
static __inline uint32_t SysTick_Config(uint32_t ticks)
{
  if (ticks > (0xFFFFFFUL << 0))  return (1);             

  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->LOAD  = (ticks & (0xFFFFFFUL << 0)) - 1;       
  NVIC_SetPriority (SysTick_IRQn, (1<<2) - 1);   
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->VAL   = 0;                                           
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL  = (1UL << 2) |
                   (1UL << 1)   |
                   (1UL << 0);                     
  return (0);                                                   
}



 








   

#line 108 "..\\..\\Library\\Device\\Nuvoton\\M051Series\\Include\\M051Series.h"
#line 1 "..\\..\\Library\\Device\\Nuvoton\\M051Series\\Include\\system_M051Series.h"
 









 






typedef unsigned int uint32_t;
 
 
 











 




 





extern uint32_t SystemCoreClock;     
extern uint32_t CyclesPerUs;         
extern uint32_t PllClock;            

#line 65 "..\\..\\Library\\Device\\Nuvoton\\M051Series\\Include\\system_M051Series.h"












 
extern void SystemInit(void);











 
extern void SystemCoreClockUpdate(void);







 
#line 109 "..\\..\\Library\\Device\\Nuvoton\\M051Series\\Include\\M051Series.h"



#pragma anon_unions











 
extern void SystemInit(void);


 
 
 





 

 




 
typedef struct
{
    volatile uint32_t CR[2];

    volatile uint32_t SR;

} ACMP_T;




 

 















 












 











   
   


 



 
typedef struct
{
    



















 
    volatile const uint32_t ADDR[8];

    



























































 
    volatile uint32_t ADCR;

    



































 
    volatile uint32_t ADCHER;

    












































 
    volatile uint32_t ADCMPR[2];

    








































 
    volatile uint32_t ADSR;

    volatile const  uint32_t RESERVED0[4];

    volatile uint32_t ADTDCR;

} ADC_T;





 
 









 



























 






 


















 





















 


   
   



 



 
typedef struct
{
    








 
    volatile  int32_t DIVIDEND;

    









 
    volatile  int32_t DIVISOR;

    








 
    volatile  int32_t DIVQUO;

    








 
    volatile  int32_t DIVREM;

    














 
    volatile uint32_t DIVSTS;

} HDIV_T;





 







   
   



 



 
typedef struct
{
    



























 
    volatile uint32_t EBICON;

    



















 
    volatile uint32_t EXTIME;

    




 
    volatile uint32_t EBICON2;
} EBI_T;





 
 












 












 








   
   




 





 
typedef struct
{
    



































 
    volatile uint32_t ISPCON;

    









 
    volatile uint32_t ISPADR;

    









 
    volatile uint32_t ISPDAT;

    












 
    volatile uint32_t ISPCMD;

    











 
    volatile uint32_t ISPTRG;

    











 
    volatile const  uint32_t DFBADR;

    











 
    volatile uint32_t FATCON;

    volatile const uint32_t Reserved[9];

    























 
    volatile uint32_t ISPSTA;

} FMC_T;




 
 



















 









 



 



 











   
   

 




 
typedef struct
{
    








 
    volatile const  uint32_t PDID;

    




































 
    volatile uint32_t RSTSRC;

    
































 
    volatile uint32_t IPRSTC1;

    













































 
    volatile uint32_t IPRSTC2;

    




 
    uint32_t RESERVED0[2];

    



















































 
    volatile uint32_t BODCR;

    




 
    volatile uint32_t TEMPCR;

    




 
    uint32_t RESERVED1;

    

















 
    volatile uint32_t PORCR;

    




 
    uint32_t RESERVED2[2];

    




































































 
    volatile uint32_t P0_MFP;

    




































































 
    volatile uint32_t P1_MFP;

    




































































 
    volatile uint32_t P2_MFP;

    
































































 
    volatile uint32_t P3_MFP;

    




























































 
    volatile uint32_t P4_MFP;

    




 
    uint32_t RESERVED3[47];

    


























 
    volatile uint32_t REGWRPROT;

} GCR_T;





 

 





















 












 


















































 





















 



 



 












 









 









 









 









 





   


typedef struct
{
    









































































































 
    volatile const  uint32_t IRQSRC[32];

    















 
    volatile uint32_t NMISEL;

    












 
    volatile uint32_t MCUIRQ;

} GCR_INT_T;




 

 





   


   


 



 
typedef struct
{
    






















































 
    volatile uint32_t  PMD;

    









 
    volatile uint32_t  OFFD;

    














































 
    volatile uint32_t  DOUT;

    






















































 
    volatile uint32_t  DMASK;

    






















 
    volatile uint32_t  PIN;

    














































































 
    volatile uint32_t  DBEN;

    






















































































 
    volatile uint32_t  IMD;

    






















































































































































 
    volatile uint32_t  IEN;

    






























































 
    volatile uint32_t  ISRC;
} GPIO_T;

typedef struct
{
    

































 
    volatile uint32_t  DBNCECON;
} GPIO_DBNCECON_T;





 

 
























 



 



 



 



 



 



 






 



 








   
   


 




 
typedef struct
{
    
































 
    volatile uint32_t I2CON;

    













 
    volatile uint32_t I2CADDR0;

    








 
    volatile uint32_t I2CDAT;

    

















 
    volatile const  uint32_t I2CSTATUS;

    








 
    volatile uint32_t I2CLK;

    


















 
    volatile uint32_t I2CTOC;

    













 
    volatile uint32_t I2CADDR1;

    













 
    volatile uint32_t I2CADDR2;

    













 
    volatile uint32_t I2CADDR3;

    














 
    volatile uint32_t I2CADM0;

    














 
    volatile uint32_t I2CADM1;

    














 
    volatile uint32_t I2CADM2;

    














 
    volatile uint32_t I2CADM3;

    




 
    uint32_t RESERVED0[2];

    




 
    volatile uint32_t I2CWKUPCON;

    




 
    volatile uint32_t I2CWKUPSTS;

} I2C_T;




 

 


















 






 



 



 



 









 



 



 



   
   



 




 
typedef struct
{
    






















 
    volatile uint32_t PPR;

    























 
    volatile uint32_t CSR;

    








































































 
    volatile uint32_t PCR;

    
















 
    volatile uint32_t CNR0;

    
















 
    volatile uint32_t CMR0;

    








 
    volatile const  uint32_t PDR0;

    
















 
    volatile uint32_t CNR1;

    
















 
    volatile uint32_t CMR1;

    








 
    volatile const  uint32_t PDR1;

    
















 
    volatile uint32_t CNR2;

    
















 
    volatile uint32_t CMR2;

    








 
    volatile const  uint32_t PDR2;

    
















 
    volatile uint32_t CNR3;

    
















 
    volatile uint32_t CMR3;

    








 
    volatile const  uint32_t PDR3;

    




 
    volatile const uint32_t RESERVE0;

    


















 
    volatile uint32_t PIER;

    


















 
    volatile uint32_t PIIR;

    




 
    volatile const uint32_t    RESERVE1[2];

    








































































 
    volatile uint32_t CCR0;

    








































































 
    volatile uint32_t CCR2;

    








 
    volatile uint32_t CRLR0;

    








 
    volatile uint32_t CFLR0;

    








 
    volatile uint32_t CRLR1;

    








 
    volatile uint32_t CFLR1;

    








 
    volatile uint32_t CRLR2;

    








 
    volatile uint32_t CFLR2;

    








 
    volatile uint32_t CRLR3;

    








 
    volatile uint32_t CFLR3;

    






















 
    volatile uint32_t CAPENR;

    






















 
    volatile uint32_t POE;

    

























































 
    volatile uint32_t TCON;

    






















 
    volatile uint32_t TSTATUS;

    




 
    volatile const  uint32_t  RESERVE2[4];

    


















 
    volatile uint32_t PSCR;

} PWM_T;




 

 












 












 




























































 



 



 




 




































 
























 










































 










































 



 



 












 












 
























 












 











   
   




 



 
typedef struct
{
    


































































 
    volatile uint32_t CNTRL;

    







 
    volatile uint32_t DIVIDER;

    



































 
    volatile uint32_t SSR;

    




 
    volatile const  uint32_t RESERVE0;

    












 
    volatile const  uint32_t RX0;

    




 
    volatile const  uint32_t RESERVE1[2];

    




 
    volatile const  uint32_t RESERVE2;

    













 
    volatile  uint32_t TX0;

    




 
    volatile const  uint32_t RESERVE3[2];

    




 
    volatile const  uint32_t RESERVE4;

    




 
    volatile const  uint32_t RESERVE5;

    




 
    volatile const  uint32_t RESERVE6;

    




 
    volatile const  uint32_t RESERVE7;

    


































 
    volatile uint32_t CNTRL2;

    
































 
    volatile uint32_t FIFO_CTL;

    


















































 
    volatile uint32_t STATUS;

} SPI_T;




 

 
















































 






 















 





















 
























 



































   
   




 




 

typedef struct
{
    



















































 
    volatile uint32_t PWRCON;

    















 
    volatile uint32_t AHBCLK;

    

























































 
    volatile uint32_t APBCLK;

    






















 
    volatile uint32_t CLKSTATUS;

    




























 
    volatile uint32_t CLKSEL0;

    



















































 
    volatile uint32_t CLKSEL1;

    












 
    volatile uint32_t CLKDIV;

    




















 
    volatile uint32_t CLKSEL2;

    






















 
    volatile uint32_t PLLCON;

    














 
    volatile uint32_t FRQDIV;

} CLK_T;




 

 




























 









 



























































 



















 






 

































 












 









 





















 








   
   




 



 
typedef struct
{
    

















































 
    volatile uint32_t  TCSR;

    














 
    volatile uint32_t  TCMPR;

    










 
    volatile uint32_t  TISR;

    









 
    volatile uint32_t  TDR;

    









 
    volatile uint32_t  TCAP;

    





































 
    volatile uint32_t  TEXCON;

    











 
    volatile uint32_t  TEXISR;
} TIMER_T;




 

 










































 



 






 



 



 





















 


   
   


 




 
typedef struct
{

    union
    {
        volatile uint32_t DATA;

        










 
        volatile uint32_t THR;

        








 
        volatile uint32_t RBR;
    };

    









































 
    volatile uint32_t IER;

    


































 
    volatile uint32_t FCR;

    





























 
    volatile uint32_t LCR;

    

















 
    volatile uint32_t MCR;

    
















 
    volatile uint32_t MSR;

    




























































 
    volatile uint32_t FSR;

    















































 
    volatile uint32_t ISR;

    














 
    volatile uint32_t TOR;

    





















 
    volatile uint32_t BAUD;

    















 
    volatile uint32_t IRCR;

    




































 
    volatile uint32_t ALT_CSR;

    











 
    volatile uint32_t FUN_SEL;
} UART_T;




 

 



 



 

































 















 


















 









 









 







































 










































 






 












 









 
























 


   
   



 



 
typedef struct
{
    















































 
    volatile uint32_t  WTCR;

    




 
    volatile uint32_t  WTCRALT;
} WDT_T;




 

 






























 


   
   


 



 
typedef struct
{
    










 
    volatile uint32_t  WWDTRLD;

    



























 
    volatile uint32_t  WWDTCR;

    











 
    volatile uint32_t  WWDTSR;

    








 
    volatile uint32_t  WWDTCVR;

} WWDT_T;




 

 



 















 






 


   
   
   


 
 
 



 
 






 
#line 6482 "..\\..\\Library\\Device\\Nuvoton\\M051Series\\Include\\M051Series.h"









































   

 
 
 




 
#line 6539 "..\\..\\Library\\Device\\Nuvoton\\M051Series\\Include\\M051Series.h"







































   



typedef volatile unsigned char  vu8;
typedef volatile unsigned long  vu32;
typedef volatile unsigned short vu16;




#line 6595 "..\\..\\Library\\Device\\Nuvoton\\M051Series\\Include\\M051Series.h"

#line 6602 "..\\..\\Library\\Device\\Nuvoton\\M051Series\\Include\\M051Series.h"













 
#line 6648 "..\\..\\Library\\Device\\Nuvoton\\M051Series\\Include\\M051Series.h"


 











 
 
 
#line 1 "..\\..\\Library\\StdDriver\\inc\\sys.h"
 









 




#line 1 "..\\..\\Library\\Device\\Nuvoton\\M051Series\\Include\\M051Series.h"
 









 


















 













 

#line 6681 "..\\..\\Library\\Device\\Nuvoton\\M051Series\\Include\\M051Series.h"

 

#line 17 "..\\..\\Library\\StdDriver\\inc\\sys.h"









 



 



 

 
 
 
#line 59 "..\\..\\Library\\StdDriver\\inc\\sys.h"


 
 
 
#line 70 "..\\..\\Library\\StdDriver\\inc\\sys.h"


 
 
 




#line 85 "..\\..\\Library\\StdDriver\\inc\\sys.h"

#line 92 "..\\..\\Library\\StdDriver\\inc\\sys.h"























































#line 153 "..\\..\\Library\\StdDriver\\inc\\sys.h"

#line 160 "..\\..\\Library\\StdDriver\\inc\\sys.h"













































#line 211 "..\\..\\Library\\StdDriver\\inc\\sys.h"








































#line 257 "..\\..\\Library\\StdDriver\\inc\\sys.h"











































   



 





 





 





 





 






 







 





 





 





 










 






 






 






 






 






 






 





 





 





 





 






 






 
static __inline void SYS_LockReg(void)
{
    ((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->REGWRPROT = 0;
}





 
static __inline void SYS_UnlockReg(void)
{
    while(((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->REGWRPROT != (1ul << 0))
    {
        ((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->REGWRPROT = 0x59;
        ((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->REGWRPROT = 0x16;
        ((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->REGWRPROT = 0x88;
    }
}




void SYS_ClearResetSrc(uint32_t u32Src);
uint32_t SYS_GetBODStatus(void);
uint32_t SYS_GetResetSrc(void);
uint32_t SYS_IsRegLocked(void);
uint32_t  SYS_ReadPDID(void);
void SYS_ResetChip(void);
void SYS_ResetCPU(void);
void SYS_ResetModule(uint32_t u32ModuleIndex);
void SYS_EnableBOD(int32_t i32Mode, uint32_t u32BODLevel);
void SYS_DisableBOD(void);


   

   

   






#line 6666 "..\\..\\Library\\Device\\Nuvoton\\M051Series\\Include\\M051Series.h"
#line 1 "..\\..\\Library\\StdDriver\\inc\\clk.h"
 









 




#line 17 "..\\..\\Library\\StdDriver\\inc\\clk.h"




 



 



 






 
 
 





 
 
 
#line 55 "..\\..\\Library\\StdDriver\\inc\\clk.h"


 
 
 
#line 101 "..\\..\\Library\\StdDriver\\inc\\clk.h"


 
 
 
#line 120 "..\\..\\Library\\StdDriver\\inc\\clk.h"


 
 
 





 
 
 














 
 
 
#line 159 "..\\..\\Library\\StdDriver\\inc\\clk.h"
 
 
 
#line 182 "..\\..\\Library\\StdDriver\\inc\\clk.h"


   




 





 
static __inline uint32_t CLK_GetPLLClockFreq(void)
{
    uint32_t u32PllFreq = 0, u32PllReg;
    uint32_t u32FIN, u32NF, u32NR, u32NO;
    uint8_t au8NoTbl[4] = {1, 2, 2, 4};

    u32PllReg = ((CLK_T *) ((( uint32_t)0x50000000) + 0x00200))->PLLCON;

    if(u32PllReg & ((1ul << 16) | (1ul << 18)))
        return 0;            

    if(u32PllReg & 0x00080000UL)
        u32FIN = (22118400UL);     
    else
        u32FIN = (12000000UL);      

    if(u32PllReg & (1ul << 17))
        return u32FIN;       

     
    u32NO = au8NoTbl[((u32PllReg & (3ul << 14)) >> 14)];
    u32NF = ((u32PllReg & (0x1FFul << 0)) >> 0) + 2;
    u32NR = ((u32PllReg & (0x1Ful << 9)) >> 9) + 2;

     
    u32PllFreq = (((u32FIN >> 2) * u32NF) / (u32NR * u32NO) << 2);

    return u32PllFreq;
}








 
static __inline void CLK_SysTickDelay(uint32_t us)
{
    ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->LOAD = us * CyclesPerUs;
    ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->VAL  = (0x00);
    ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL = (1UL << 2) | (1UL << 0);

     
    while((((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL & (1UL << 16)) != 0);
}


void CLK_DisableCKO(void);
void CLK_EnableCKO(uint32_t u32ClkSrc, uint32_t u32ClkDiv, uint32_t u32ClkDivBy1En);
void CLK_PowerDown(void);
void CLK_Idle(void);
uint32_t CLK_GetHXTFreq(void);
uint32_t CLK_GetLXTFreq(void);
uint32_t CLK_GetHCLKFreq(void);
uint32_t CLK_GetPCLKFreq(void);
uint32_t CLK_GetCPUFreq(void);
uint32_t CLK_SetCoreClock(uint32_t u32Hclk);
void CLK_SetHCLK(uint32_t u32ClkSrc, uint32_t u32ClkDiv);
void CLK_SetModuleClock(uint32_t u32ModuleIdx, uint32_t u32ClkSrc, uint32_t u32ClkDiv);
void CLK_SetSysTickClockSrc(uint32_t u32ClkSrc);
void CLK_EnableXtalRC(uint32_t u32ClkMask);
void CLK_DisableXtalRC(uint32_t u32ClkMask);
void CLK_EnableModuleClock(uint32_t u32ModuleIdx);
void CLK_DisableModuleClock(uint32_t u32ModuleIdx);
uint32_t CLK_EnablePLL(uint32_t u32PllClkSrc, uint32_t u32PllFreq);
void CLK_DisablePLL(void);
void CLK_WaitClockReady(uint32_t u32ClkMask);


   

   

   







 
#line 6667 "..\\..\\Library\\Device\\Nuvoton\\M051Series\\Include\\M051Series.h"
#line 1 "..\\..\\Library\\StdDriver\\inc\\adc.h"
 








 
#line 12 "..\\..\\Library\\StdDriver\\inc\\adc.h"











 



 



 
 
 
 

























 
 
 




 
 
 
#line 76 "..\\..\\Library\\StdDriver\\inc\\adc.h"

 
 
 




 
 
 





 
 
 





 
 
 



 
 
 





   



 










 







 











 











 








 









 









 






 






 

















 
#line 232 "..\\..\\Library\\StdDriver\\inc\\adc.h"




 















 
#line 262 "..\\..\\Library\\StdDriver\\inc\\adc.h"




 









 











 






 











 


void ADC_Open(ADC_T *adc,
              uint32_t u32InputMode,
              uint32_t u32OpMode,
              uint32_t u32ChMask);
void ADC_Close(ADC_T *adc);
void ADC_EnableHWTrigger(ADC_T *adc,
                         uint32_t u32Source,
                         uint32_t u32Param);
void ADC_DisableHWTrigger(ADC_T *adc);
void ADC_EnableInt(ADC_T *adc, uint32_t u32Mask);
void ADC_DisableInt(ADC_T *adc, uint32_t u32Mask);



   

   

   







 
#line 6668 "..\\..\\Library\\Device\\Nuvoton\\M051Series\\Include\\M051Series.h"
#line 1 "..\\..\\Library\\StdDriver\\inc\\ebi.h"
 








 











 



 



 
 
 
 



 
 
 



 
 
 
#line 52 "..\\..\\Library\\StdDriver\\inc\\ebi.h"

#line 60 "..\\..\\Library\\StdDriver\\inc\\ebi.h"

   




 



 




 




 




 




 




 


void EBI_Open(uint32_t u32Bank, uint32_t u32DataWidth, uint32_t u32TimingClass, uint32_t u32BusMode, uint32_t u32CSActiveLevel);
void EBI_Close(uint32_t u32Bank);
void EBI_SetBusTiming(uint32_t u32Bank, uint32_t u32TimingConfig, uint32_t u32MclkDiv);

   

   

   







 
#line 6669 "..\\..\\Library\\Device\\Nuvoton\\M051Series\\Include\\M051Series.h"
#line 1 "..\\..\\Library\\StdDriver\\inc\\fmc.h"
 









 



#line 16 "..\\..\\Library\\StdDriver\\inc\\fmc.h"









 



 



 


 
 
 







 
 
 



 
 
 
#line 62 "..\\..\\Library\\StdDriver\\inc\\fmc.h"


   



 

 
 
 
#line 84 "..\\..\\Library\\StdDriver\\inc\\fmc.h"


 
 
 












 
static __inline void FMC_Write(uint32_t u32addr, uint32_t u32data)
{
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPCMD = 0x21;    
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPADR = u32addr;               
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPDAT = u32data;               
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG = 0x1;                   
    __isb(0xF);                             
    while(((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG);                  
}













 
static __inline uint32_t FMC_Read(uint32_t u32addr)
{
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPCMD = 0x00;  
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPADR = u32addr;          
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG = 0x1;              
    __isb(0xF);                        
    while(((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG);             

    return ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPDAT;
}
















 
static __inline int32_t FMC_Erase(uint32_t u32addr)
{
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPCMD = 0x22;  
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPADR = u32addr;                
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG = 0x1;                    
    __isb(0xF);                              
    while(((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG);                   

     
    if(((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPCON & (1ul << 6))
    {
        ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPCON = (1ul << 6);
        return -1;
    }
    return 0;
}













 
static __inline uint32_t FMC_ReadUID(uint8_t u8index)
{
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPCMD = 0x04;  
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPADR = (u8index << 2);       
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG = 0x1;                  
    __isb(0xF);                            
    while(((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG);                 

    return ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPDAT;
}








 
static __inline uint32_t FMC_ReadCID(void)
{
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPCMD = 0x0B;            
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPADR = 0x0;                            
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG = (1ul << 0);           
    __isb(0xF);                                      
    while(((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG & (1ul << 0)) ;   

    return ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPDAT;
}







 
static __inline uint32_t FMC_ReadDID(void)
{
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPCMD = 0x0C;           
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPADR = 0;                             
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG = (1ul << 0);          
    __isb(0xF);                                     
    while(((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG & (1ul << 0));   

    return ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPDAT;
}








 
static __inline uint32_t FMC_ReadPID(void)
{
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPCMD = 0x0C;           
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPADR = 0x04;                          
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG = (1ul << 0);          
    __isb(0xF);                                     
    while(((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG & (1ul << 0));   

    return ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPDAT;
}








 
static __inline uint32_t FMC_ReadUCID(uint32_t u32Index)
{
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPCMD = 0x04;           
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPADR = (0x04 * u32Index) + 0x10;      
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG = (1ul << 0);          
    __isb(0xF);                                     
    while(((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG & (1ul << 0));   

    return ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPDAT;
}













 
static __inline void FMC_SetVectorPageAddr(uint32_t u32PageAddr)
{
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPCMD = 0x2e;  
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPADR = u32PageAddr;        
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG = 0x1;                
    __isb(0xF);                          
    while(((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG);               
}












 
static __inline uint32_t FMC_GetVECMAP(void)
{
    return (((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPSTA & (0xffful << 9));
}

extern void FMC_Open(void);
extern void FMC_Close(void);
extern void FMC_EnableAPUpdate(void);
extern void FMC_DisableAPUpdate(void);
extern void FMC_EnableConfigUpdate(void);
extern void FMC_DisableConfigUpdate(void);
extern void FMC_EnableLDUpdate(void);
extern void FMC_DisableLDUpdate(void);
extern int32_t FMC_ReadConfig(uint32_t *u32Config, uint32_t u32Count);
extern int32_t FMC_WriteConfig(uint32_t *u32Config, uint32_t u32Count);
extern void FMC_SetBootSource(int32_t i32BootSrc);
extern int32_t FMC_GetBootSource(void);
extern uint32_t FMC_ReadDataFlashBaseAddr(void);

   

   

   








#line 6670 "..\\..\\Library\\Device\\Nuvoton\\M051Series\\Include\\M051Series.h"
#line 1 "..\\..\\Library\\StdDriver\\inc\\gpio.h"
 









 

#line 14 "..\\..\\Library\\StdDriver\\inc\\gpio.h"











 



 



 


 
 
 





 
 
 






 
 
 



 
 
 






#line 84 "..\\..\\Library\\StdDriver\\inc\\gpio.h"














 
#line 140 "..\\..\\Library\\StdDriver\\inc\\gpio.h"
   




 











 












 











 












 












 












 












 













 



















 










 











 










 













 












 














 












 



void GPIO_SetMode(GPIO_T *port, uint32_t u32PinMask, uint32_t u32Mode);
void GPIO_EnableInt(GPIO_T *port, uint32_t u32Pin, uint32_t u32IntAttribs);
void GPIO_DisableInt(GPIO_T *port, uint32_t u32Pin);


   

   

   







 
#line 6671 "..\\..\\Library\\Device\\Nuvoton\\M051Series\\Include\\M051Series.h"
#line 1 "..\\..\\Library\\StdDriver\\inc\\i2c.h"
 









 



#line 16 "..\\..\\Library\\StdDriver\\inc\\i2c.h"









 



 



 

 
 
 
#line 49 "..\\..\\Library\\StdDriver\\inc\\i2c.h"

   



 







 









 









 









 









 









 









 











 











 









 


void I2C_ClearTimeoutFlag(I2C_T *i2c);
void I2C_Close(I2C_T *i2c);
void I2C_Trigger(I2C_T *i2c, uint8_t u8Start, uint8_t u8Stop, uint8_t u8Si, uint8_t u8Ack);
void I2C_DisableInt(I2C_T *i2c);
void I2C_EnableInt(I2C_T *i2c);
uint32_t I2C_GetBusClockFreq(I2C_T *i2c);
uint32_t I2C_GetIntFlag(I2C_T *i2c);
uint32_t I2C_GetStatus(I2C_T *i2c);
uint32_t I2C_Open(I2C_T *i2c, uint32_t u32BusClock);
uint8_t I2C_GetData(I2C_T *i2c);
void I2C_SetSlaveAddr(I2C_T *i2c, uint8_t u8SlaveNo, uint8_t u8SlaveAddr, uint8_t u8GCMode);
void I2C_SetSlaveAddrMask(I2C_T *i2c, uint8_t u8SlaveNo, uint8_t u8SlaveAddrMask);
uint32_t I2C_SetClockBusFreq(I2C_T *i2c, uint32_t u32BusClock);
void I2C_EnableTimeout(I2C_T *i2c, uint8_t u8LongTimeout);
void I2C_DisableTimeout(I2C_T *i2c);
void I2C_EnableWakeup(I2C_T *i2c);
void I2C_DisableWakeup(I2C_T *i2c);
void I2C_SetData(I2C_T *i2c, uint8_t u8Data);

   

   

   

#line 6672 "..\\..\\Library\\Device\\Nuvoton\\M051Series\\Include\\M051Series.h"
#line 1 "..\\..\\Library\\StdDriver\\inc\\pwm.h"
 








 











 



 



 
#line 47 "..\\..\\Library\\StdDriver\\inc\\pwm.h"
 
 
 






   




 










 
#line 81 "..\\..\\Library\\StdDriver\\inc\\pwm.h"










 
#line 100 "..\\..\\Library\\StdDriver\\inc\\pwm.h"










 
#line 120 "..\\..\\Library\\StdDriver\\inc\\pwm.h"









 










 













 

















 













 














 














 
#line 225 "..\\..\\Library\\StdDriver\\inc\\pwm.h"


uint32_t PWM_ConfigCaptureChannel(PWM_T *pwm,
                                  uint32_t u32ChannelNum,
                                  uint32_t u32UnitTimeNsec,
                                  uint32_t u32CaptureEdge);
uint32_t PWM_ConfigOutputChannel(PWM_T *pwm,
                                 uint32_t u32ChannelNum,
                                 uint32_t u32Frequncy,
                                 uint32_t u32DutyCycle);
void PWM_Start(PWM_T *pwm, uint32_t u32ChannelMask);
void PWM_Stop(PWM_T *pwm, uint32_t u32ChannelMask);
void PWM_ForceStop(PWM_T *pwm, uint32_t u32ChannelMask);
void PWM_EnableADCTrigger(PWM_T *pwm, uint32_t u32ChannelNum, uint32_t u32Condition);
void PWM_DisableADCTrigger(PWM_T *pwm, uint32_t u32ChannelNum);
void PWM_ClearADCTriggerFlag(PWM_T *pwm, uint32_t u32ChannelNum, uint32_t u32Condition);
uint32_t PWM_GetADCTriggerFlag(PWM_T *pwm, uint32_t u32ChannelNum);
void PWM_EnableCapture(PWM_T *pwm, uint32_t u32ChannelMask);
void PWM_DisableCapture(PWM_T *pwm, uint32_t u32ChannelMask);
void PWM_EnableOutput(PWM_T *pwm, uint32_t u32ChannelMask);
void PWM_DisableOutput(PWM_T *pwm, uint32_t u32ChannelMask);
void PWM_EnableDeadZone(PWM_T *pwm, uint32_t u32ChannelNum, uint32_t u32Duration);
void PWM_DisableDeadZone(PWM_T *pwm, uint32_t u32ChannelNum);
void PWM_EnableCaptureInt(PWM_T *pwm, uint32_t u32ChannelNum, uint32_t u32Edge);
void PWM_DisableCaptureInt(PWM_T *pwm, uint32_t u32ChannelNum, uint32_t u32Edge);
void PWM_ClearCaptureIntFlag(PWM_T *pwm, uint32_t u32ChannelNum, uint32_t u32Edge);
uint32_t PWM_GetCaptureIntFlag(PWM_T *pwm, uint32_t u32ChannelNum);
void PWM_EnableDutyInt(PWM_T *pwm, uint32_t u32ChannelNum, uint32_t u32IntDutyType);
void PWM_DisableDutyInt(PWM_T *pwm, uint32_t u32ChannelNum);
void PWM_ClearDutyIntFlag(PWM_T *pwm, uint32_t u32ChannelNum);
uint32_t PWM_GetDutyIntFlag(PWM_T *pwm, uint32_t u32ChannelNum);
void PWM_EnablePeriodInt(PWM_T *pwm, uint32_t u32ChannelNum,  uint32_t u32IntPeriodType);
void PWM_DisablePeriodInt(PWM_T *pwm, uint32_t u32ChannelNum);
void PWM_ClearPeriodIntFlag(PWM_T *pwm, uint32_t u32ChannelNum);
uint32_t PWM_GetPeriodIntFlag(PWM_T *pwm, uint32_t u32ChannelNum);



   

   

   







 
#line 6673 "..\\..\\Library\\Device\\Nuvoton\\M051Series\\Include\\M051Series.h"
#line 1 "..\\..\\Library\\StdDriver\\inc\\spi.h"
 








 











 



 



 













#line 50 "..\\..\\Library\\StdDriver\\inc\\spi.h"







   




 





 






 






 






 






 






 








 








 








 






 






 







 







 






 






 






 






 







 






 






 







 








 






 



 
uint32_t SPI_Open(SPI_T *spi, uint32_t u32MasterSlave, uint32_t u32SPIMode, uint32_t u32DataWidth, uint32_t u32BusClock);
void SPI_Close(SPI_T *spi);
void SPI_ClearRxFIFO(SPI_T *spi);
void SPI_ClearTxFIFO(SPI_T *spi);
void SPI_DisableAutoSS(SPI_T *spi);
void SPI_EnableAutoSS(SPI_T *spi, uint32_t u32SSPinMask, uint32_t u32ActiveLevel);
uint32_t SPI_SetBusClock(SPI_T *spi, uint32_t u32BusClock);
void SPI_EnableFIFO(SPI_T *spi, uint32_t u32TxThreshold, uint32_t u32RxThreshold);
void SPI_DisableFIFO(SPI_T *spi);
uint32_t SPI_GetBusClock(SPI_T *spi);
void SPI_EnableInt(SPI_T *spi, uint32_t u32Mask);
void SPI_DisableInt(SPI_T *spi, uint32_t u32Mask);
uint32_t SPI_GetIntFlag(SPI_T *spi, uint32_t u32Mask);
void SPI_ClearIntFlag(SPI_T *spi, uint32_t u32Mask);
uint32_t SPI_GetStatus(SPI_T *spi, uint32_t u32Mask);

   

   

   







 
#line 6674 "..\\..\\Library\\Device\\Nuvoton\\M051Series\\Include\\M051Series.h"
#line 1 "..\\..\\Library\\StdDriver\\inc\\timer.h"
 








 











 



 



 

#line 48 "..\\..\\Library\\StdDriver\\inc\\timer.h"

   




 










 












 










 













 




 
static __inline void TIMER_Start(TIMER_T *timer)
{
    timer->TCSR |= (1ul << 30);
}



 
static __inline void TIMER_Stop(TIMER_T *timer)
{
    timer->TCSR &= ~(1ul << 30);
}




 
static __inline void TIMER_EnableWakeup(TIMER_T *timer)
{
    timer->TCSR |= (1ul << 23);
}



 
static __inline void TIMER_DisableWakeup(TIMER_T *timer)
{
    timer->TCSR &= ~(1ul << 23);
}



 
static __inline void TIMER_EnableCaptureDebounce(TIMER_T *timer)
{
    timer->TEXCON |= (1ul << 6);
}



 
static __inline void TIMER_DisableCaptureDebounce(TIMER_T *timer)
{
    timer->TEXCON &= ~(1ul << 6);
}



 
static __inline void TIMER_EnableEventCounterDebounce(TIMER_T *timer)
{
    timer->TEXCON |= (1ul << 7);
}



 
static __inline void TIMER_DisableEventCounterDebounce(TIMER_T *timer)
{
    timer->TEXCON &= ~(1ul << 7);
}



 
static __inline void TIMER_EnableInt(TIMER_T *timer)
{
    timer->TCSR |= (1ul << 29);
}



 
static __inline void TIMER_DisableInt(TIMER_T *timer)
{
    timer->TCSR &= ~(1ul << 29);
}



 
static __inline void TIMER_EnableCaptureInt(TIMER_T *timer)
{
    timer->TEXCON |= (1ul << 5);
}



 
static __inline void TIMER_DisableCaptureInt(TIMER_T *timer)
{
    timer->TEXCON &= ~(1ul << 5);
}











 
static __inline uint32_t TIMER_GetIntFlag(TIMER_T *timer)
{
    return (timer->TISR & (1ul << 0) ? 1 : 0);
}



 
static __inline void TIMER_ClearIntFlag(TIMER_T *timer)
{
    timer->TISR = (1ul << 0);
}











 
static __inline uint32_t TIMER_GetCaptureIntFlag(TIMER_T *timer)
{
    return timer->TEXISR;
}



 
static __inline void TIMER_ClearCaptureIntFlag(TIMER_T *timer)
{
    timer->TEXISR = (1ul << 0);
}











 
static __inline uint32_t TIMER_GetWakeupFlag(TIMER_T *timer)
{
    return (timer->TISR & (1ul << 1) ? 1 : 0);
}



 
static __inline void TIMER_ClearWakeupFlag(TIMER_T *timer)
{
    timer->TISR = (1ul << 1);
}



 
static __inline uint32_t TIMER_GetCaptureData(TIMER_T *timer)
{
    return timer->TCAP;
}



 
static __inline uint32_t TIMER_GetCounter(TIMER_T *timer)
{
    return timer->TDR;
}

uint32_t TIMER_Open(TIMER_T *timer, uint32_t u32Mode, uint32_t u32Freq);
void TIMER_Close(TIMER_T *timer);
void TIMER_Delay(TIMER_T *timer, uint32_t u32Usec);
void TIMER_EnableCapture(TIMER_T *timer, uint32_t u32CapMode, uint32_t u32Edge);
void TIMER_DisableCapture(TIMER_T *timer);
void TIMER_EnableEventCounter(TIMER_T *timer, uint32_t u32Edge);
void TIMER_DisableEventCounter(TIMER_T *timer);
uint32_t TIMER_GetModuleClock(TIMER_T *timer);

   

   

   







 
#line 6675 "..\\..\\Library\\Device\\Nuvoton\\M051Series\\Include\\M051Series.h"
#line 1 "..\\..\\Library\\StdDriver\\inc\\wdt.h"
 








 











 



 



 
 
 
 
#line 42 "..\\..\\Library\\StdDriver\\inc\\wdt.h"

 
 
 





   




 



 




 




 










 










 










 






 










 
static __inline void WDT_Close(void)
{
    ((WDT_T *) ((( uint32_t)0x40000000) + 0x4000))->WTCR = 0;
    return;
}









 
static __inline void WDT_EnableInt(void)
{
    ((WDT_T *) ((( uint32_t)0x40000000) + 0x4000))->WTCR |= (1ul << 6);
    return;
}









 
static __inline void WDT_DisableInt(void)
{
    
    ((WDT_T *) ((( uint32_t)0x40000000) + 0x4000))->WTCR &= ~((1ul << 6) | (1ul << 2) | (1ul << 3));
    return;
}

void WDT_Open(uint32_t u32TimeoutInterval, uint32_t u32ResetDelay, uint32_t u32EnableReset, uint32_t u32EnableWakeup);

   

   

   







 
#line 6676 "..\\..\\Library\\Device\\Nuvoton\\M051Series\\Include\\M051Series.h"
#line 1 "..\\..\\Library\\StdDriver\\inc\\wwdt.h"
 








 











 



 



 
 
 
 
#line 50 "..\\..\\Library\\StdDriver\\inc\\wwdt.h"



   




 



 




 










 










 




 






 


void WWDT_Open(uint32_t u32PreScale, uint32_t u32CmpValue, uint32_t u32EnableInt);

   

   

   







 
#line 6677 "..\\..\\Library\\Device\\Nuvoton\\M051Series\\Include\\M051Series.h"
#line 1 "..\\..\\Library\\StdDriver\\inc\\uart.h"
 








 



#line 15 "..\\..\\Library\\StdDriver\\inc\\uart.h"









 



 



 

 
 
 











 
 
 
















 
 
 



 
 
 



 
 
 






   




 








 









 











 









 










 








 









 









 








 









 










 











 











 









 









 


















 

















 



















 








 
__inline void UART_CLEAR_RTS(UART_T* uart)
{
    uart->MCR |= (1ul << 9);
    uart->MCR &= ~(1ul << 1);
}






 
__inline void UART_SET_RTS(UART_T* uart)
{
    uart->MCR |= (1ul << 9) | (1ul << 1);
}







 








 



void UART_ClearIntFlag(UART_T* uart , uint32_t u32InterruptFlag);
void UART_Close(UART_T* uart);
void UART_DisableFlowCtrl(UART_T* uart);
void UART_DisableInt(UART_T*  uart, uint32_t u32InterruptFlag);
void UART_EnableFlowCtrl(UART_T* uart);
void UART_EnableInt(UART_T*  uart, uint32_t u32InterruptFlag);
void UART_Open(UART_T* uart, uint32_t u32baudrate);
uint32_t UART_Read(UART_T* uart, uint8_t *pu8RxBuf, uint32_t u32ReadBytes);
void UART_SetLine_Config(UART_T* uart, uint32_t u32baudrate, uint32_t u32data_width, uint32_t u32parity, uint32_t  u32stop_bits);
void UART_SetTimeoutCnt(UART_T* uart, uint32_t u32TOC);
void UART_SelectIrDAMode(UART_T* uart, uint32_t u32Buadrate, uint32_t u32Direction);
void UART_SelectRS485Mode(UART_T* uart, uint32_t u32Mode, uint32_t u32Addr);
void UART_SelectLINMode(UART_T* uart, uint32_t u32Mode, uint32_t u32BreakLength);
uint32_t UART_Write(UART_T* uart, uint8_t *pu8TxBuf, uint32_t u32WriteBytes);


   

   

   







 

#line 6678 "..\\..\\Library\\Device\\Nuvoton\\M051Series\\Include\\M051Series.h"
#line 1 "..\\..\\Library\\StdDriver\\inc\\hdiv.h"
 









 














 
static __inline int32_t HDIV_Div(int32_t x, int16_t y)
{
    uint32_t *p32;

    p32 = (uint32_t *)((( uint32_t)0x50000000) + 0x14000);
    *p32++ = x;
    *p32++ = y;
    return *p32;
}











 
static __inline int16_t HDIV_Mod(int32_t x, int16_t y)
{
    uint32_t *p32;

    p32 = (uint32_t *)((( uint32_t)0x50000000) + 0x14000);
    *p32++ = x;
    *p32++ = y;
    return p32[1];
}





#line 6679 "..\\..\\Library\\Device\\Nuvoton\\M051Series\\Include\\M051Series.h"
#line 1 "..\\..\\Library\\StdDriver\\inc\\acmp.h"
 








 











 



 



 

 
 
 
#line 44 "..\\..\\Library\\StdDriver\\inc\\acmp.h"

   




 






 







 










 







 







 







 







 








 







 







 







 







 


void ACMP_Open(ACMP_T *, uint32_t u32ChNum, uint32_t u32NegSrc, uint32_t u32HysteresisEn);
void ACMP_Close(ACMP_T *, uint32_t u32ChNum);

   

   

   







 
#line 6680 "..\\..\\Library\\Device\\Nuvoton\\M051Series\\Include\\M051Series.h"


 

#line 15 "..\\main.c"
#line 1 "..\\..\\Library\\StdDriver\\inc\\gpio.h"
 









 

#line 14 "..\\..\\Library\\StdDriver\\inc\\gpio.h"
#line 377 "..\\..\\Library\\StdDriver\\inc\\gpio.h"

 
#line 16 "..\\main.c"
#line 1 "..\\..\\Library\\StdDriver\\inc\\adc.h"
 








 
#line 12 "..\\..\\Library\\StdDriver\\inc\\adc.h"
#line 335 "..\\..\\Library\\StdDriver\\inc\\adc.h"

 
#line 17 "..\\main.c"
#line 18 "..\\main.c"
#line 19 "..\\main.c"
#line 1 "..\\..\\Library\\CMSIS\\Include\\core_cm0.h"
 




















 








#line 120 "..\\..\\Library\\CMSIS\\Include\\core_cm0.h"



#line 666 "..\\..\\Library\\CMSIS\\Include\\core_cm0.h"



   

#line 20 "..\\main.c"
#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\math.h"




 





 












 






   









 






#line 61 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\math.h"

#line 75 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\math.h"







   




 















 
#line 112 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\math.h"











 





extern __attribute__((__pcs__("aapcs"))) unsigned __ARM_dcmp4(double  , double  );
extern __attribute__((__pcs__("aapcs"))) unsigned __ARM_fcmp4(float  , float  );
    




 

extern __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_fpclassifyf(float  );
extern __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_fpclassify(double  );
     
     

__inline __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_isfinitef(float __x)
{
    return (((*(unsigned *)&(__x)) >> 23) & 0xff) != 0xff;
}
__inline __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_isfinite(double __x)
{
    return (((*(1 + (unsigned *)&(__x))) >> 20) & 0x7ff) != 0x7ff;
}
     
     

__inline __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_isinff(float __x)
{
    return ((*(unsigned *)&(__x)) << 1) == 0xff000000;
}
__inline __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_isinf(double __x)
{
    return (((*(1 + (unsigned *)&(__x))) << 1) == 0xffe00000) && ((*(unsigned *)&(__x)) == 0);
}
     
     

__inline __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_islessgreaterf(float __x, float __y)
{
    unsigned __f = __ARM_fcmp4(__x, __y) >> 28;
    return (__f == 8) || (__f == 2);  
}
__inline __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_islessgreater(double __x, double __y)
{
    unsigned __f = __ARM_dcmp4(__x, __y) >> 28;
    return (__f == 8) || (__f == 2);  
}
    


 

__inline __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_isnanf(float __x)
{
    return (0x7f800000 - ((*(unsigned *)&(__x)) & 0x7fffffff)) >> 31;
}
__inline __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_isnan(double __x)
{
    unsigned __xf = (*(1 + (unsigned *)&(__x))) | (((*(unsigned *)&(__x)) == 0) ? 0 : 1);
    return (0x7ff00000 - (__xf & 0x7fffffff)) >> 31;
}
     
     

__inline __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_isnormalf(float __x)
{
    unsigned __xe = ((*(unsigned *)&(__x)) >> 23) & 0xff;
    return (__xe != 0xff) && (__xe != 0);
}
__inline __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_isnormal(double __x)
{
    unsigned __xe = ((*(1 + (unsigned *)&(__x))) >> 20) & 0x7ff;
    return (__xe != 0x7ff) && (__xe != 0);
}
     
     

__inline __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_signbitf(float __x)
{
    return (*(unsigned *)&(__x)) >> 31;
}
__inline __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_signbit(double __x)
{
    return (*(1 + (unsigned *)&(__x))) >> 31;
}
     
     








#line 230 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\math.h"







   
  typedef float float_t;
  typedef double double_t;
#line 251 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\math.h"



extern const int math_errhandling;
#line 261 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\math.h"

extern __declspec(__nothrow) double acos(double  );
    
    
    
extern __declspec(__nothrow) double asin(double  );
    
    
    
    

extern __declspec(__nothrow) __attribute__((const)) double atan(double  );
    
    

extern __declspec(__nothrow) double atan2(double  , double  );
    
    
    
    

extern __declspec(__nothrow) double cos(double  );
    
    
    
    
extern __declspec(__nothrow) double sin(double  );
    
    
    
    

extern void __use_accurate_range_reduction(void);
    
    

extern __declspec(__nothrow) double tan(double  );
    
    
    
    

extern __declspec(__nothrow) double cosh(double  );
    
    
    
    
extern __declspec(__nothrow) double sinh(double  );
    
    
    
    
    

extern __declspec(__nothrow) __attribute__((const)) double tanh(double  );
    
    

extern __declspec(__nothrow) double exp(double  );
    
    
    
    
    

extern __declspec(__nothrow) double frexp(double  , int *  ) __attribute__((__nonnull__(2)));
    
    
    
    
    
    

extern __declspec(__nothrow) double ldexp(double  , int  );
    
    
    
    
extern __declspec(__nothrow) double log(double  );
    
    
    
    
    
extern __declspec(__nothrow) double log10(double  );
    
    
    
extern __declspec(__nothrow) double modf(double  , double *  ) __attribute__((__nonnull__(2)));
    
    
    
    

extern __declspec(__nothrow) double pow(double  , double  );
    
    
    
    
    
    
extern __declspec(__nothrow) double sqrt(double  );
    
    
    




    __inline double _sqrt(double __x) { return sqrt(__x); }




    __inline float _sqrtf(float __x) { return (float)sqrt(__x); }

    



 

extern __declspec(__nothrow) __attribute__((const)) double ceil(double  );
    
    
extern __declspec(__nothrow) __attribute__((const)) double fabs(double  );
    
    

extern __declspec(__nothrow) __attribute__((const)) double floor(double  );
    
    

extern __declspec(__nothrow) double fmod(double  , double  );
    
    
    
    
    

    









 



extern __declspec(__nothrow) double acosh(double  );
    

 
extern __declspec(__nothrow) double asinh(double  );
    

 
extern __declspec(__nothrow) double atanh(double  );
    

 
extern __declspec(__nothrow) double cbrt(double  );
    

 
__inline __declspec(__nothrow) __attribute__((const)) double copysign(double __x, double __y)
    

 
{
    (*(1 + (unsigned *)&(__x))) = ((*(1 + (unsigned *)&(__x))) & 0x7fffffff) | ((*(1 + (unsigned *)&(__y))) & 0x80000000);
    return __x;
}
__inline __declspec(__nothrow) __attribute__((const)) float copysignf(float __x, float __y)
    

 
{
    (*(unsigned *)&(__x)) = ((*(unsigned *)&(__x)) & 0x7fffffff) | ((*(unsigned *)&(__y)) & 0x80000000);
    return __x;
}
extern __declspec(__nothrow) double erf(double  );
    

 
extern __declspec(__nothrow) double erfc(double  );
    

 
extern __declspec(__nothrow) double expm1(double  );
    

 



    

 






#line 479 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\math.h"


extern __declspec(__nothrow) double hypot(double  , double  );
    




 
extern __declspec(__nothrow) int ilogb(double  );
    

 
extern __declspec(__nothrow) int ilogbf(float  );
    

 
extern __declspec(__nothrow) int ilogbl(long double  );
    

 







    

 





    



 





    



 





    

 





    



 





    



 





    



 





    

 





    

 





    


 

extern __declspec(__nothrow) double lgamma (double  );
    


 
extern __declspec(__nothrow) double log1p(double  );
    

 
extern __declspec(__nothrow) double logb(double  );
    

 
extern __declspec(__nothrow) float logbf(float  );
    

 
extern __declspec(__nothrow) long double logbl(long double  );
    

 
extern __declspec(__nothrow) double nextafter(double  , double  );
    


 
extern __declspec(__nothrow) float nextafterf(float  , float  );
    


 
extern __declspec(__nothrow) long double nextafterl(long double  , long double  );
    


 
extern __declspec(__nothrow) double nexttoward(double  , long double  );
    


 
extern __declspec(__nothrow) float nexttowardf(float  , long double  );
    


 
extern __declspec(__nothrow) long double nexttowardl(long double  , long double  );
    


 
extern __declspec(__nothrow) double remainder(double  , double  );
    

 
extern __declspec(__nothrow) __attribute__((const)) double rint(double  );
    

 
extern __declspec(__nothrow) double scalbln(double  , long int  );
    

 
extern __declspec(__nothrow) float scalblnf(float  , long int  );
    

 
extern __declspec(__nothrow) long double scalblnl(long double  , long int  );
    

 
extern __declspec(__nothrow) double scalbn(double  , int  );
    

 
extern __declspec(__nothrow) float scalbnf(float  , int  );
    

 
extern __declspec(__nothrow) long double scalbnl(long double  , int  );
    

 




    

 



 
extern __declspec(__nothrow) __attribute__((const)) float _fabsf(float);  
__inline __declspec(__nothrow) __attribute__((const)) float fabsf(float __f) { return _fabsf(__f); }
extern __declspec(__nothrow) float sinf(float  );
extern __declspec(__nothrow) float cosf(float  );
extern __declspec(__nothrow) float tanf(float  );
extern __declspec(__nothrow) float acosf(float  );
extern __declspec(__nothrow) float asinf(float  );
extern __declspec(__nothrow) float atanf(float  );
extern __declspec(__nothrow) float atan2f(float  , float  );
extern __declspec(__nothrow) float sinhf(float  );
extern __declspec(__nothrow) float coshf(float  );
extern __declspec(__nothrow) float tanhf(float  );
extern __declspec(__nothrow) float expf(float  );
extern __declspec(__nothrow) float logf(float  );
extern __declspec(__nothrow) float log10f(float  );
extern __declspec(__nothrow) float powf(float  , float  );
extern __declspec(__nothrow) float sqrtf(float  );
extern __declspec(__nothrow) float ldexpf(float  , int  );
extern __declspec(__nothrow) float frexpf(float  , int *  ) __attribute__((__nonnull__(2)));
extern __declspec(__nothrow) __attribute__((const)) float ceilf(float  );
extern __declspec(__nothrow) __attribute__((const)) float floorf(float  );
extern __declspec(__nothrow) float fmodf(float  , float  );
extern __declspec(__nothrow) float modff(float  , float *  ) __attribute__((__nonnull__(2)));

 
 













 
__declspec(__nothrow) long double acosl(long double );
__declspec(__nothrow) long double asinl(long double );
__declspec(__nothrow) long double atanl(long double );
__declspec(__nothrow) long double atan2l(long double , long double );
__declspec(__nothrow) long double ceill(long double );
__declspec(__nothrow) long double cosl(long double );
__declspec(__nothrow) long double coshl(long double );
__declspec(__nothrow) long double expl(long double );
__declspec(__nothrow) long double fabsl(long double );
__declspec(__nothrow) long double floorl(long double );
__declspec(__nothrow) long double fmodl(long double , long double );
__declspec(__nothrow) long double frexpl(long double , int* ) __attribute__((__nonnull__(2)));
__declspec(__nothrow) long double ldexpl(long double , int );
__declspec(__nothrow) long double logl(long double );
__declspec(__nothrow) long double log10l(long double );
__declspec(__nothrow) long double modfl(long double  , long double *  ) __attribute__((__nonnull__(2)));
__declspec(__nothrow) long double powl(long double , long double );
__declspec(__nothrow) long double sinl(long double );
__declspec(__nothrow) long double sinhl(long double );
__declspec(__nothrow) long double sqrtl(long double );
__declspec(__nothrow) long double tanl(long double );
__declspec(__nothrow) long double tanhl(long double );





 
extern __declspec(__nothrow) float acoshf(float  );
__declspec(__nothrow) long double acoshl(long double );
extern __declspec(__nothrow) float asinhf(float  );
__declspec(__nothrow) long double asinhl(long double );
extern __declspec(__nothrow) float atanhf(float  );
__declspec(__nothrow) long double atanhl(long double );
__declspec(__nothrow) long double copysignl(long double , long double );
extern __declspec(__nothrow) float cbrtf(float  );
__declspec(__nothrow) long double cbrtl(long double );
extern __declspec(__nothrow) float erff(float  );
__declspec(__nothrow) long double erfl(long double );
extern __declspec(__nothrow) float erfcf(float  );
__declspec(__nothrow) long double erfcl(long double );
extern __declspec(__nothrow) float expm1f(float  );
__declspec(__nothrow) long double expm1l(long double );
extern __declspec(__nothrow) float log1pf(float  );
__declspec(__nothrow) long double log1pl(long double );
extern __declspec(__nothrow) float hypotf(float  , float  );
__declspec(__nothrow) long double hypotl(long double , long double );
extern __declspec(__nothrow) float lgammaf(float  );
__declspec(__nothrow) long double lgammal(long double );
extern __declspec(__nothrow) float remainderf(float  , float  );
__declspec(__nothrow) long double remainderl(long double , long double );
extern __declspec(__nothrow) float rintf(float  );
__declspec(__nothrow) long double rintl(long double );



#line 875 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\math.h"





#line 896 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\math.h"

#line 1087 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\math.h"











#line 1317 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\math.h"





 
#line 21 "..\\main.c"


















 
 
 
float gain_uiAdc8320Value_stain_e,previous_sumdata,previous_4_times_data_mean[16]={0},coef_a,coef_b,coef_c,coef_d,coef_e=1,coef_f;
uint8_t AC_counter,g_uEint0_Scan_Event_Flag,g_uEint0_Save_Event_Flag,unit_counter;
uint8_t	gucOutputVoltageType,gucOutputVoltagePeak,counter_a=0,algorithm_open,wakeup,wake_count=0;
float uiAdc8320Value_Hz,gain_uiAdc8320Value,uiAdc8320Value_f,uiAdc8320Value_ac,uiAdc8320Value_f_offset,uiAdc8320Value_Hz_1,gain_uiAdc8320Value_f3,after_algorithm_value,DG_value;

uint8_t gucGainTableIndex,g_u8RecData[64]  = {0};
float 				gfloatGainTable[6]
										={0.33333,	1.0,	3.6,	10.804,	33.01,	99.04},time_ms,stain_e,strain_coeffic=1,Tem_V;
volatile float Temper,typeSgain_uiAdc8320Value,uiAdc8320Value_Hz_mean_STD,uiAdc8320Value_Hz_mean,Hz_out_of_mean,Hz_out_of_mean_STD,Hz_out_of_mean_1;

volatile uint32_t u32InitCount,g_u32AdcIntFlag,n_counter,n_max_counter;
uint8_t gucGainTable[8]
										={0x02,		0x0e,	0x03,	0x0f,		0x00,		0x0c,0x07,0x80},BR_count=1;
uint32_t guiTimer0Period[57] = {(12000000UL)/800,(12000000UL)/1000,(12000000UL)/1200,(12000000UL)/1400,(12000000UL)/1600,(12000000UL)/1800,(12000000UL)/2000,(12000000UL)/2200,(12000000UL)/2400,(12000000UL)/2600,(12000000UL)/2800,(12000000UL)/3000,(12000000UL)/3200,(12000000UL)/3400,(12000000UL)/3600,(12000000UL)/3800,(12000000UL)/4000,
	(12000000UL)/4200,(12000000UL)/4400,(12000000UL)/4600,(12000000UL)/4800,(12000000UL)/5000,(12000000UL)/5200,(12000000UL)/5400,(12000000UL)/5600,(12000000UL)/5800,(12000000UL)/6000,(12000000UL)/6200,(12000000UL)/6400,(12000000UL)/6600,(12000000UL)/6800,(12000000UL)/7000,(12000000UL)/7200,(12000000UL)/7400,(12000000UL)/7600,(12000000UL)/7800,(12000000UL)/8000,
	(12000000UL)/8200,	(12000000UL)/8400,(12000000UL)/8600,(12000000UL)/8800,(12000000UL)/9000,(12000000UL)/9200,(12000000UL)/9400,(12000000UL)/9600,(12000000UL)/9800,(12000000UL)/10000,(12000000UL)/10200,(12000000UL)/10400,(12000000UL)/10600,(12000000UL)/10800,(12000000UL)/11000,(12000000UL)/11200,(12000000UL)/11400,(12000000UL)/11600,(12000000UL)/11800,(12000000UL)/12000};
	
	
	
	
 uint32_t stri_counter=100,ADC_check_Count[8]={0},Hz_data;
 uint32_t gucT0Index=0,gucindex_range=4,button_range_min=0,button_range_max=56,bat_data;
uint32_t one_step_sti=0;
 uint32_t uiAdc8320Value,typeS_uiAdc8320Value,uiAdc8320Value_offset;
 uint32_t u32iPortStatus,uiTimerCounter,while_counter;
 uint32_t u32iOutputVoltage;
uint8_t g_u8CommandData[64]  = {0},gucUartReceivePointer,gucUartCommandSucceed,gucOutputVoltageType,gucOutputVoltagePeak,gucUartCommandType; 
 uint32_t g_au32TMRINTCount[4] = {0},uart_BR;
uint8_t save_eeprom_address_counter[5]  = {0},finish=0;
int AD_data;
float g_au32TMR1Count[300],gucOutputVoltage,uiAdc8320Value_ff,DC_12V_AD_data,thermal_AD_data,bat_AD_data;

 float min_freq_timer,max_freq_timer,min_freq,max_freq;
uint32_t g_au32HzMaxMin[2]={0};
 uint8_t interrupt_left=0,select_freq_range=0,select_freq_range2,interrupt_right,select_command=0,interrupt_enter_command[3],Hz_thou,Hz_hun,Hz_tens,Hz_ones,uE_thou,uE_hun,uE_tens,uE_ones,mS_thou,mS_hun,mS_tens,mS_ones,gain_coe,Hz_pointone,uE_pointone,mS_pointone;
 uint8_t enter_i,select_command_success,select_type,timer0_check,dig3_hun,dig3_ten,dig3_one,dig3_pointone,dig3_pointtwo,dig3_pointthree,dig_thou,dig_hun,dig_tens,dig_ones,dig_zeros,dig_pointzeros,dig_pointones,dig2_thouthou,dig2_hunthou,dig2_tenthou,dig2_thou,dig2_hun,dig2_tens,dig2_ones,dig2_zeros,Temper_tens,Temper_ones,Temper_point,language_select=0,language=0;
uint16_t save_eeprom_counter;
 float previous_data[10][16]={0},Raw_data[10][16]={0};
int_least32_t algo_x_counter;

volatile uint32_t u32_address_to_save_to_eeprom;
int swing_flag;



















 


#line 117 "..\\main.c"

#line 126 "..\\main.c"













#line 150 "..\\main.c"


void UART_TEST_HANDLE(void);

void I2C_Init(void);
void I2C_WriteData(uint8_t u8DeviceAddr, uint32_t u32Addr, uint8_t *pu8Buf, uint32_t u32Size);
uint8_t I2C_ReadData(uint8_t u8DeviceAddr, uint32_t u32Addr, uint8_t *pu8Buf, uint32_t u32Size);
void Read_RTC_Data(void);
int Check_RTC_Dat(void);


void I2C_24CM02_WriteData(uint8_t u8DeviceAddr, uint32_t u32Addr, uint8_t *pu8Buf, uint32_t u32Size);
uint8_t I2C_24CM02_ReadData(uint8_t u8DeviceAddr, uint32_t u32Addr, uint8_t *pu8Buf, uint32_t u32Size);

void save_measured_data_to_eeprom(void);



void write_eeprom_command_set(void);
void read_eeprom_command_set(void);
void initial_command_set_data(void);
void initial_measured_data(void);
int check_command_set_data(unsigned char *pByte);
void AdcSingleModeTest(void);
void Transfer_RTC_To_ADCII(void);

void COPY_UART_COMMAND_DATA(void);


unsigned char gucI2CBuffer[65];

typedef  union 
{
  struct
  {
    unsigned char START_CODE;						
    unsigned char MACHINE_MODEL[3];			
    unsigned char MODE;									
    unsigned char FILENAME[4];      		
		unsigned char SCAN_RATE[5];					
		unsigned char SAVE_RATE[5];					
		unsigned char ON_OFF_FLAG[16];				
		unsigned char FREQ_SEL[16];					
    unsigned char STOP_CODE;						
		unsigned char DUMMY[2];							
  } command;                                  
  unsigned char Command_string[54];             
} Command_Set_Type;
Command_Set_Type union_Set_Operation_Mode_Command;


typedef union
{
  struct
  {
    unsigned char START_CODE;						
    unsigned char MODE;									
     unsigned char RTC_DATA[12];					
     unsigned char CHANNEL_DATA[16][7]; 	
     unsigned char CHANNEL_SUBDATA[16][3]; 
    unsigned char STOP_CODE;						
		unsigned char DUMMY[2];							
  } data;                                  
  unsigned char Data_string[177];             
} Measured_Data_Type;
Measured_Data_Type union_One_Measured_Data;


 typedef union
{
	struct
	{
			
			unsigned char sec_unit:4;
			unsigned char sec_10:3;
			unsigned char stop:1;
			
			unsigned char min_unit:4;
			unsigned char min_10:3;
			unsigned char osc_fail:1;
			
			unsigned char hours_unit:4;
			unsigned char hours_10:2;
			unsigned char cent:1;
			unsigned char cent_en:1;
			
			unsigned char day:3;
			unsigned char day_rsvd:5;
			
			unsigned char date_unit:4;
			unsigned char date_10:2;
			unsigned char date_rsvd:2;
			
			unsigned char month_unit:4;
			unsigned char month_10:1;
			unsigned char month_rsvd:3;
			
			unsigned char year_unit:4;
			unsigned char year_10:4;
			
			unsigned char calibration_cal:5;
			unsigned char calibration_sign:1;
			unsigned char calibration_FT:1;
			unsigned char calibration_out:1;
	}reg;                    
  unsigned char RTC_Reg_string[8];
} RTC_Register_Type;

RTC_Register_Type RTC_register_map; 

volatile uint32_t u32Eint0Counter,u32Eint0SaveCounter;
uint32_t u32ScanRateInSecond;
uint32_t u32SaveRateInSecond;



void Read_RTC_Data(void)
{
			I2C_ReadData(0xD0, 0x0000, RTC_register_map.RTC_Reg_string, 8);
}

int Check_RTC_Dat(void)
{
		int iCheckFlag;
		
		
		
		iCheckFlag = 1;
		
		union_One_Measured_Data.data.RTC_DATA[11] = 0x30+(RTC_register_map.reg.sec_unit);
		if ((union_One_Measured_Data.data.RTC_DATA[11]<0x30) || (union_One_Measured_Data.data.RTC_DATA[11]>0x39)) iCheckFlag = 0;
		union_One_Measured_Data.data.RTC_DATA[10] = 0x30+(RTC_register_map.reg.sec_10);
		if ((union_One_Measured_Data.data.RTC_DATA[10]<0x30) || (union_One_Measured_Data.data.RTC_DATA[10]>0x35)) iCheckFlag = 0;
		
		union_One_Measured_Data.data.RTC_DATA[9] = 0x30+(RTC_register_map.reg.min_unit);
		if ((union_One_Measured_Data.data.RTC_DATA[9]<0x30) || (union_One_Measured_Data.data.RTC_DATA[9]>0x39)) iCheckFlag = 0;
		union_One_Measured_Data.data.RTC_DATA[8] = 0x30+(RTC_register_map.reg.min_10);
		if ((union_One_Measured_Data.data.RTC_DATA[8]<0x30) || (union_One_Measured_Data.data.RTC_DATA[8]>0x35)) iCheckFlag = 0;
		
		union_One_Measured_Data.data.RTC_DATA[7] = 0x30+(RTC_register_map.reg.hours_unit);
		if ((union_One_Measured_Data.data.RTC_DATA[7]<0x30) || (union_One_Measured_Data.data.RTC_DATA[7]>0x39)) iCheckFlag = 0;
		union_One_Measured_Data.data.RTC_DATA[6] = 0x30+(RTC_register_map.reg.hours_10);
		if ((union_One_Measured_Data.data.RTC_DATA[6]<0x30) || (union_One_Measured_Data.data.RTC_DATA[6]>0x32)) iCheckFlag = 0;
		
		union_One_Measured_Data.data.RTC_DATA[5] = 0x30+(RTC_register_map.reg.date_unit);
		if ((union_One_Measured_Data.data.RTC_DATA[5]<0x30) || (union_One_Measured_Data.data.RTC_DATA[5]>0x39)) iCheckFlag = 0;
		union_One_Measured_Data.data.RTC_DATA[4] = 0x30+(RTC_register_map.reg.date_10);
		if ((union_One_Measured_Data.data.RTC_DATA[4]<0x30) || (union_One_Measured_Data.data.RTC_DATA[4]>0x33)) iCheckFlag = 0;
		
		union_One_Measured_Data.data.RTC_DATA[3] = 0x30+(RTC_register_map.reg.month_unit);
		if ((union_One_Measured_Data.data.RTC_DATA[3]<0x30) || (union_One_Measured_Data.data.RTC_DATA[3]>0x39)) iCheckFlag = 0;
		union_One_Measured_Data.data.RTC_DATA[2] = 0x30+(RTC_register_map.reg.month_10);
		if ((union_One_Measured_Data.data.RTC_DATA[2]<0x30) || (union_One_Measured_Data.data.RTC_DATA[2]>0x31)) iCheckFlag = 0;
		
		union_One_Measured_Data.data.RTC_DATA[1] = 0x30+(RTC_register_map.reg.year_unit);
		if ((union_One_Measured_Data.data.RTC_DATA[1]<0x30) || (union_One_Measured_Data.data.RTC_DATA[1]>0x39)) iCheckFlag = 0;
		union_One_Measured_Data.data.RTC_DATA[0] = 0x30+(RTC_register_map.reg.year_10);
		if ((union_One_Measured_Data.data.RTC_DATA[0]<0x30) || (union_One_Measured_Data.data.RTC_DATA[0]>0x33)) iCheckFlag = 0;
		
		return iCheckFlag;
}
	
void Transfer_RTC_To_ADCII(void)
{

	
		union_One_Measured_Data.data.RTC_DATA[11] = 0x30+(RTC_register_map.reg.sec_unit);
		union_One_Measured_Data.data.RTC_DATA[10] = 0x30+(RTC_register_map.reg.sec_10);
		union_One_Measured_Data.data.RTC_DATA[9] = 0x30+(RTC_register_map.reg.min_unit);
		union_One_Measured_Data.data.RTC_DATA[8] = 0x30+(RTC_register_map.reg.min_10);
		union_One_Measured_Data.data.RTC_DATA[7] = 0x30+(RTC_register_map.reg.hours_unit);
		union_One_Measured_Data.data.RTC_DATA[6] = 0x30+(RTC_register_map.reg.hours_10);
		union_One_Measured_Data.data.RTC_DATA[5] = 0x30+(RTC_register_map.reg.date_unit);
		union_One_Measured_Data.data.RTC_DATA[4] = 0x30+(RTC_register_map.reg.date_10);
		union_One_Measured_Data.data.RTC_DATA[3] = 0x30+(RTC_register_map.reg.month_unit);
		union_One_Measured_Data.data.RTC_DATA[2] = 0x30+(RTC_register_map.reg.month_10);
		union_One_Measured_Data.data.RTC_DATA[1] = 0x30+(RTC_register_map.reg.year_unit);
		union_One_Measured_Data.data.RTC_DATA[0] = 0x30+(RTC_register_map.reg.year_10);
	
	

 
}





















 
void Transfer_SAVE_COUNT_ADCII(void)
{
		save_eeprom_address_counter[0] = 0x30+((save_eeprom_counter/10000)%10);
		save_eeprom_address_counter[1] = 0x30+((save_eeprom_counter/1000)%10);
		save_eeprom_address_counter[2] = 0x30+((save_eeprom_counter/100)%10);
		save_eeprom_address_counter[3] = 0x30+((save_eeprom_counter/10)%10);
		save_eeprom_address_counter[4] = 0x30+(save_eeprom_counter%10);
	
}

void Inital_RTC_To_ADCII(void)
{
	
	
		
		RTC_register_map.reg.sec_unit=7;
		RTC_register_map.reg.sec_10=1;
		RTC_register_map.reg.min_unit=7;
		RTC_register_map.reg.min_10=1;
		RTC_register_map.reg.hours_unit=7;
		RTC_register_map.reg.hours_10=1;
		RTC_register_map.reg.date_unit=7;
		RTC_register_map.reg.date_10=1;
		RTC_register_map.reg.month_unit=7;
		RTC_register_map.reg.month_10=0;
		RTC_register_map.reg.year_unit=7;
		RTC_register_map.reg.year_10=1;
}



void I2C_Init(void)
{
     
    I2C_Open(((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)), 100000);
}






 
void I2C_WriteData(uint8_t u8DeviceAddr, uint32_t u32Addr, uint8_t *pu8Buf, uint32_t u32Size)
{
    int32_t i32Err;
    int32_t i;

    do
    {
        i32Err = 0;

         
        ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~(1ul << 3)) | (1ul << 5));
        while(!((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & (1ul << 3))){};

         
        ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CDAT = u8DeviceAddr);
        ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x08UL);
        while(!((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & (1ul << 3))){};
        if(((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CSTATUS) == 0x18)
        {
            {
                ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CDAT = u32Addr & 0xFFUL); 
                ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x08UL);
                while(!((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & (1ul << 3))){};
                if(((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CSTATUS) == 0x28)
                {
                     

                    for(i = 0; i < u32Size; i++)
                    {
                         
                        ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CDAT = pu8Buf[i]); 
                        ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x08UL);
                        while(!((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & (1ul << 3))){};
                        if(((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CSTATUS) == 0x30)
                        {
                          
                            i32Err = 4;
                        }
                    }
                    if(i32Err == 0)
                    {
                         
                        ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x10UL | 0x08UL);
                    }
                }
                else
                {
      
                    i32Err = 3;
                }
            }
        }
        else
        {
          
            i32Err = 1;
        }

        if(i32Err)
        {
             
            ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x10UL | 0x08UL);

            CLK_SysTickDelay(100);
        }

    }
    while(i32Err);

}







 
uint8_t I2C_ReadData(uint8_t u8DeviceAddr, uint32_t u32Addr, uint8_t *pu8Buf, uint32_t u32Size)
{
    int32_t i32Err;
    int32_t i;

    do
    {
        i32Err = 0;

         
        ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~(1ul << 3)) | (1ul << 5));
        while(!((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & (1ul << 3))){};

         
        ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CDAT = u8DeviceAddr);
        ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x08UL);
        while(!((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & (1ul << 3))){};
        if(((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CSTATUS) == 0x18)
        {
            






             {
                

                
                ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CDAT = u32Addr & 0xFFUL); 
                ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x08UL);
                while(!((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & (1ul << 3))){};
                if(((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CSTATUS) == 0x28)
                {
                     

                     
                    ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x20UL | 0x08UL);
                    while(!((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & (1ul << 3))){};
                    if(((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CSTATUS) == 0x10)
                    {
                         

                         
                        ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CDAT = u8DeviceAddr|0x01);
                        ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x08UL);
                        while(!((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & (1ul << 3))){};
                        if(((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CSTATUS) == 0x40)
                        {
                            for(i = 0; i < u32Size - 1; i++)
                            {
                                ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x08UL | 0x04UL);
                                while(!((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & (1ul << 3))){};

                                 
                                pu8Buf[i] = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CDAT);
                            }

                            ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x08UL);
                            while(!((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & (1ul << 3))){};
                            pu8Buf[i] = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CDAT);

                             
                            ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x10UL | 0x08UL);
                        }
                        else
                        {
                             

                             
                            i32Err = 5;
                        }
                    }
                    else
                    {
                         

                         
                        i32Err = 4;
                    }
                }
                else
                {
                     

                     
                    i32Err = 3;
                }
            }






 
        }
        else
        {
             

             
            i32Err = 1;

        }

        if(i32Err)
        {
             
            ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x10UL | 0x08UL);

            CLK_SysTickDelay(100);
        }

    }
    while(i32Err);

    return u32Size;
}







 
void I2C_24CM02_WriteData(uint8_t u8DeviceAddr, uint32_t u32Addr, uint8_t *pu8Buf, uint32_t u32Size)
{
    int32_t i32Err;
    int32_t i;
		
		
		
		
		
		
		
		u8DeviceAddr |= (((u32Addr >>16) & 0x00FF)<<1);
    do
    {
        i32Err = 0;

         
        ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~(1ul << 3)) | (1ul << 5));
        while(!((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & (1ul << 3))){};

         
        ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CDAT = u8DeviceAddr);
        ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x08UL);
        while(!((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & (1ul << 3))){};
        if(((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CSTATUS) == 0x18)
        {
             
            ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CDAT = (u32Addr >> 8) & 0xFFUL); 
            ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x08UL);
            while(!((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & (1ul << 3))){};
            if(((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CSTATUS) == 0x28)
            {
                 

                 
                ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CDAT = u32Addr & 0xFFUL); 
                ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x08UL);
                while(!((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & (1ul << 3))){};
                if(((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CSTATUS) == 0x28)
                {
                     

                    for(i = 0; i < u32Size; i++)
                    {
                         
                        ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CDAT = pu8Buf[i]); 
                        ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x08UL);
                        while(!((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & (1ul << 3))){};
                        if(((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CSTATUS) == 0x30)
                        {
                          
                            i32Err = 4;
                        }
                    }
                    if(i32Err == 0)
                    {
                         
                        ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x10UL | 0x08UL);
                    }
                }
                else
                {
      
                    i32Err = 3;
                }
            }
        }
        else
        {
          
            i32Err = 1;
        }

        if(i32Err)
        {
             
            ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x10UL | 0x08UL);

            CLK_SysTickDelay(100);
        }

    }
    while(i32Err);

}







 
uint8_t I2C_24CM02_ReadData(uint8_t u8DeviceAddr, uint32_t u32Addr, uint8_t *pu8Buf, uint32_t u32Size)
{
    int32_t i32Err;
    int32_t i;

		
		
		
	
			u8DeviceAddr |= (((u32Addr >>16) & 0x00FFUL)<<1);

		
		
    do
    {
        i32Err = 0;

         
        ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~(1ul << 3)) | (1ul << 5));
        while(!((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & (1ul << 3))){};

         
        ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CDAT = u8DeviceAddr);
        ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x08UL);
        while(!((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & (1ul << 3))){};
					
        if(((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CSTATUS) == 0x18)
        {
            

            
            ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CDAT = (u32Addr >> 8) & 0xFFUL); 
            ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x08UL);
            while(!((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & (1ul << 3))){};
            if(((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CSTATUS) == 0x28)
            {
                

                
                ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CDAT = u32Addr & 0xFFUL); 
                ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x08UL);
                while(!((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & (1ul << 3))){};
                if(((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CSTATUS) == 0x28)
                {
                     

                     
                    ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x20UL | 0x08UL);
                    while(!((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & (1ul << 3))){};
                    if(((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CSTATUS) == 0x10)
                    {
                         

                         
                        ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CDAT = u8DeviceAddr|0x01);
                        ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x08UL);
                        while(!((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & (1ul << 3))){};
                        if(((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CSTATUS) == 0x40)
                        {
                            for(i = 0; i < u32Size - 1; i++)
                            {
                                ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x08UL | 0x04UL);
                                while(!((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & (1ul << 3))){};

                                 
                                pu8Buf[i] = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CDAT);
                            }

                            ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x08UL);
                            while(!((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & (1ul << 3))){};
                            pu8Buf[i] = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CDAT);

                             
                            ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x10UL | 0x08UL);
                        }
                        else
                        {
                             

                             
                            i32Err = 5;
                        }
                    }
                    else
                    {
                         

                         
                        i32Err = 4;
                    }
                }
                else
                {
                     

                     
                    i32Err = 3;
                }
            }
            else
            {
                

                
                i32Err = 2;
            }
        }
        else
        {
             

             
            i32Err = 1;

        }

        if(i32Err)
        {
             
            ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON = ((((I2C_T *) ((( uint32_t)0x40000000) + 0x20000)))->I2CON & ~0x3c) | 0x10UL | 0x08UL);

            CLK_SysTickDelay(1000);
        }

    }
    while(i32Err);

    return u32Size;
}







unsigned int transfer_command_to_variables(unsigned char * byte)
{
	unsigned int i;
	
	i = *(byte+0)-0x30;
	i *= 10;
	i += *(byte+1)-0x30;
	i *= 10;
	i += *(byte+2)-0x30;
	i *= 10;
	i += *(byte+3)-0x30;
	i *= 10;
	i += *(byte+4)-0x30;
	
	return i;
	
















 
}



void update_command_from_uart(void)
{
	int i;
	for(i=0;i<54;i++)
	{
	 union_Set_Operation_Mode_Command.Command_string[i]=g_u8CommandData[i];
	}
	union_Set_Operation_Mode_Command.command.DUMMY[0] = 0x00;
	union_Set_Operation_Mode_Command.command.DUMMY[1] = 0x00;
}


void update_RTC_from_uart(void)
{
		RTC_register_map.reg.sec_unit		=g_u8CommandData[16];
		RTC_register_map.reg.sec_10			=g_u8CommandData[15];
		RTC_register_map.reg.min_unit		=g_u8CommandData[14];
		RTC_register_map.reg.min_10			=g_u8CommandData[13];
		RTC_register_map.reg.hours_unit	=g_u8CommandData[12];
		RTC_register_map.reg.hours_10		=g_u8CommandData[11];
		RTC_register_map.reg.date_unit	=g_u8CommandData[10];
		RTC_register_map.reg.date_10		=g_u8CommandData[9];
		RTC_register_map.reg.month_unit	=g_u8CommandData[8];
		RTC_register_map.reg.month_10		=g_u8CommandData[7];
		RTC_register_map.reg.year_unit	=g_u8CommandData[6];
		RTC_register_map.reg.year_10		=g_u8CommandData[5];
}


void delay_time(unsigned int timer)
{
	unsigned int delay_i;
	for(delay_i=0;delay_i<timer;delay_i++){};
}



int check_command_set_data(unsigned char *pByte)
{
	if (*(pByte+0) != '*') 
		return 0;
	if (*(pByte+1) != 'M') 
		return 0;
	if (*(pByte+2) != 'I') 
		return 0;
	if (*(pByte+3) != 'N') 
		return 0;
	
	return 1;
}




void initial_command_set_data(void)
{			
	union_Set_Operation_Mode_Command.command.START_CODE = '*';
	union_Set_Operation_Mode_Command.command.MACHINE_MODEL[0] = 'M';
	union_Set_Operation_Mode_Command.command.MACHINE_MODEL[1] = 'I';
	union_Set_Operation_Mode_Command.command.MACHINE_MODEL[2] = 'N';
	union_Set_Operation_Mode_Command.command.MODE = 'V';
	union_Set_Operation_Mode_Command.command.FILENAME[0] = '0';
	union_Set_Operation_Mode_Command.command.FILENAME[1] = '0';
	union_Set_Operation_Mode_Command.command.FILENAME[2] = '0';
	union_Set_Operation_Mode_Command.command.FILENAME[3] = '0';
	union_Set_Operation_Mode_Command.command.SCAN_RATE[0] = '0';
	union_Set_Operation_Mode_Command.command.SCAN_RATE[1] = '0';
	union_Set_Operation_Mode_Command.command.SCAN_RATE[2] = '6';
	union_Set_Operation_Mode_Command.command.SCAN_RATE[3] = '0';
	union_Set_Operation_Mode_Command.command.SCAN_RATE[4] = '0';
	union_Set_Operation_Mode_Command.command.SAVE_RATE[0] = '0';
	union_Set_Operation_Mode_Command.command.SAVE_RATE[1] = '0';
	union_Set_Operation_Mode_Command.command.SAVE_RATE[2] = '6';
	union_Set_Operation_Mode_Command.command.SAVE_RATE[3] = '0';
	union_Set_Operation_Mode_Command.command.SAVE_RATE[4] = '0';
	union_Set_Operation_Mode_Command.command.ON_OFF_FLAG[0] = '0';
	union_Set_Operation_Mode_Command.command.ON_OFF_FLAG[1] = '0';
	union_Set_Operation_Mode_Command.command.ON_OFF_FLAG[2] = '0';
	union_Set_Operation_Mode_Command.command.ON_OFF_FLAG[3] = '0';
	union_Set_Operation_Mode_Command.command.ON_OFF_FLAG[4] = '0';
	union_Set_Operation_Mode_Command.command.ON_OFF_FLAG[5] = '0';
	union_Set_Operation_Mode_Command.command.ON_OFF_FLAG[6] = '0';
	union_Set_Operation_Mode_Command.command.ON_OFF_FLAG[7] = '0';
	union_Set_Operation_Mode_Command.command.ON_OFF_FLAG[8] = '0';
	union_Set_Operation_Mode_Command.command.ON_OFF_FLAG[9] = '0';
	union_Set_Operation_Mode_Command.command.ON_OFF_FLAG[10] = '0';
	union_Set_Operation_Mode_Command.command.ON_OFF_FLAG[11] = '0';
	union_Set_Operation_Mode_Command.command.ON_OFF_FLAG[12] = '0';
	union_Set_Operation_Mode_Command.command.ON_OFF_FLAG[13] = '0';
	union_Set_Operation_Mode_Command.command.ON_OFF_FLAG[14] = '0';
	union_Set_Operation_Mode_Command.command.ON_OFF_FLAG[15] = '0';
	union_Set_Operation_Mode_Command.command.FREQ_SEL[0]='1';
	union_Set_Operation_Mode_Command.command.FREQ_SEL[1]='1';
	union_Set_Operation_Mode_Command.command.FREQ_SEL[2]='1';
	union_Set_Operation_Mode_Command.command.FREQ_SEL[3]='1';
	union_Set_Operation_Mode_Command.command.FREQ_SEL[4]='1';
	union_Set_Operation_Mode_Command.command.FREQ_SEL[5]='1';
	union_Set_Operation_Mode_Command.command.FREQ_SEL[6]='1';
	union_Set_Operation_Mode_Command.command.FREQ_SEL[7]='1';
	union_Set_Operation_Mode_Command.command.FREQ_SEL[8]='1';
	union_Set_Operation_Mode_Command.command.FREQ_SEL[9]='1';
	union_Set_Operation_Mode_Command.command.FREQ_SEL[10]='1';
	union_Set_Operation_Mode_Command.command.FREQ_SEL[11]='1';
	union_Set_Operation_Mode_Command.command.FREQ_SEL[12]='1';
	union_Set_Operation_Mode_Command.command.FREQ_SEL[13]='1';
	union_Set_Operation_Mode_Command.command.FREQ_SEL[14]='1';
	union_Set_Operation_Mode_Command.command.FREQ_SEL[15]='1';
	union_Set_Operation_Mode_Command.command.STOP_CODE = 'E';
	union_Set_Operation_Mode_Command.command.DUMMY[0] = 0x00;
	union_Set_Operation_Mode_Command.command.DUMMY[1] = 0x00;
}




void initial_measured_data(void)
{	
	unsigned char i=0,j=0;
	union_One_Measured_Data.data.START_CODE = '#';
	union_One_Measured_Data.data.MODE = 'V';
	
	
	for(i=0;i<16;i++)
	{
		for (j=0;j<7;j++)
		{
			union_One_Measured_Data.data.CHANNEL_DATA[i][j] = 0x41+i;
		}
		
	}
	for(i=0;i<16;i++)
	{
		for (j=0;j<3;j++)
		{
			union_One_Measured_Data.data.CHANNEL_SUBDATA[i][j] = 0x61+i;
		}
		
	}
	union_One_Measured_Data.data.STOP_CODE = 'E';
	union_One_Measured_Data.data.DUMMY[0] = 0x00;
	union_One_Measured_Data.data.DUMMY[1] = 0x00;
}


void write_eeprom_command_set(void)
{
		I2C_24CM02_WriteData(0xA0, 0x0000, &g_u8CommandData[0], 58);
		
}

void read_eeprom_command_set(void)
{
		I2C_24CM02_ReadData(0xA0, 0x0000, g_u8CommandData, 58);
	  
}

void write_save_eeprom_address(void)
{
		I2C_24CM02_WriteData(0xA0, 0x0040, &save_eeprom_address_counter[0], 5);
		
}

void read_save_eeprom_address(void)
{
		I2C_24CM02_ReadData(0xA0, 0x0040, save_eeprom_address_counter, 5);
	  
}






















void save_measured_data_to_eeprom(void)
{
		
		

		I2C_24CM02_WriteData(0xA0, u32_address_to_save_to_eeprom, union_One_Measured_Data.Data_string,sizeof(union_One_Measured_Data.Data_string));
		
		u32_address_to_save_to_eeprom += 256;
	
	
		if (u32_address_to_save_to_eeprom >= ((256*1023)-256))
		{
				u32_address_to_save_to_eeprom = 256;
		}
		
		save_eeprom_counter++;

		if(save_eeprom_counter>=1023){
			save_eeprom_counter=1023;
			printf("1111111111");
		}
		
#line 1088 "..\\main.c"
		Transfer_SAVE_COUNT_ADCII();
		write_save_eeprom_address();
}						

void read_measured_data_from_eeprom(void)
{		
		uint32_t u32_address;
	Measured_Data_Type union_One_Measured_Data;
	
	
	
		
		
		read_save_eeprom_address();
		save_eeprom_counter=transfer_command_to_variables(&save_eeprom_address_counter[0]);
		u32_address = 256;
	NVIC_DisableIRQ(EINT0_IRQn);
	
		
	
		for(u32_address=256;u32_address<=((save_eeprom_counter-1)*256+256);u32_address+=256)
		{
			
			
			I2C_24CM02_ReadData(0xA0, u32_address, union_One_Measured_Data.Data_string, sizeof(union_One_Measured_Data.Data_string));
			delay_time(10000);
			printf("\n%s-Data\n",union_One_Measured_Data.Data_string);	
			delay_time(10000);
		}
		
		
		NVIC_EnableIRQ(EINT0_IRQn);
}











































































 

#line 1259 "..\\main.c"
	




void init_ext_ad()
{
		(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x0200)+(0x20*(4))) + ((2)<<2)))) = 1;
		(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x0200)+(0x20*(1))) + ((4)<<2)))) = 1;
}


unsigned int read_ext_adc()
{
		int i;
		unsigned int data;
	
		data = 0;
		(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x0200)+(0x20*(4))) + ((2)<<2)))) = 0;
	  (*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x0200)+(0x20*(1))) + ((4)<<2)))) = 1;
		for(i=0;i<5;i++) 
		{
			(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x0200)+(0x20*(1))) + ((4)<<2)))) = 0;
			delay_time(15);
			(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x0200)+(0x20*(1))) + ((4)<<2)))) = 1;
			delay_time(13);
			
		}
		for(i=0;i<16;i++) 
		{
			(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x0200)+(0x20*(1))) + ((4)<<2)))) = 0;
			delay_time(15);
			if ((*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x0200)+(0x20*(4))) + ((1)<<2)))))
				data += 1;
			(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x0200)+(0x20*(1))) + ((4)<<2)))) = 1;
			data <<= 1;
			delay_time(13);
			
		}
		(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x0200)+(0x20*(4))) + ((2)<<2)))) = 1;
		for(i=0;i<5;i++) 
		{
			(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x0200)+(0x20*(1))) + ((4)<<2)))) = 0;
			delay_time(15);
			(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x0200)+(0x20*(1))) + ((4)<<2)))) = 1;
			delay_time(13);
			}
		
	  
		
		
			
			
		
		
		return(data);
		
}




#line 1352 "..\\main.c"


void RESET_Gain(void)
{
		gucGainTableIndex = 0;
		u32iPortStatus = ((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) + 0x0080)))->PIN);
		u32iPortStatus &= 0xfff8;  
		
		
		
		
		u32iPortStatus |= gucGainTable[gucGainTableIndex];
		((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) + 0x0080)))->DOUT = (u32iPortStatus));
}
void SET_Gain(unsigned char index)
{
		u32iPortStatus = ((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) + 0x0080)))->PIN);
		u32iPortStatus &= 0xfff8;  
		u32iPortStatus |= gucGainTable[index];
		((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) + 0x0080)))->DOUT = (u32iPortStatus));
}

				 
     
   
				
   
	
			
void SYS_Init(void)
{
     
     
     
     
    ((CLK_T *) ((( uint32_t)0x50000000) + 0x00200))->PWRCON |= (1ul << 2);

     
    CLK_WaitClockReady((1ul << 4));

     
    ((CLK_T *) ((( uint32_t)0x50000000) + 0x00200))->CLKSEL0 = 0x07UL;

     
    ((CLK_T *) ((( uint32_t)0x50000000) + 0x00200))->PLLCON |= (1ul << 16);

     
    ((CLK_T *) ((( uint32_t)0x50000000) + 0x00200))->PWRCON |= (1ul << 0) | (1ul << 3);

     
    ((CLK_T *) ((( uint32_t)0x50000000) + 0x00200))->PLLCON = (0x00000000UL | (((3)-2)<<9) | ((25)-2) | 0x4000UL);

     
    CLK_WaitClockReady((1ul << 2) | (1ul << 0) | (1ul << 3));

     
    ((CLK_T *) ((( uint32_t)0x50000000) + 0x00200))->CLKSEL0 = 0x18UL | 0x02UL;

     
    ((CLK_T *) ((( uint32_t)0x50000000) + 0x00200))->APBCLK = (1ul << 16) |
                  (1ul << 2) | (1ul << 3) | (1ul << 4) | (1ul << 5) |
                  (1ul << 8);;

     
    ((CLK_T *) ((( uint32_t)0x50000000) + 0x00200))->CLKSEL1 = 0x01000000UL |
                   0x00000000UL | 0x00002000UL ;
		CLK_EnableModuleClock(((0x0<<31)|(0x1<<29) |(0x3<<25) |( 2<<20) |(0x0<<18) |(0xFF<<10) |(16<<5) |28));
    CLK_SetModuleClock(((0x0<<31)|(0x1<<29) |(0x3<<25) |( 2<<20) |(0x0<<18) |(0xFF<<10) |(16<<5) |28), 0x0000000CUL, (((7)-1) << 16));
     
     
    SystemCoreClockUpdate();
    
     
     
     

     
     
    ((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->P3_MFP &= ~(0x00000101UL | 0x00000202UL|0x00000808UL|0x00000404UL);
    ((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->P3_MFP = 0x00000001UL | 0x00000002UL | 0x00000004UL | 0x00000808UL ;

     
    ((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->P3_MFP &= ~(0x00001010UL | 0x00002020UL);
    ((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->P3_MFP |= 0x00001000UL | 0x00002000UL;
		
		((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) + 0x0040)))->OFFD |= 0x00000001|0x00000002|0x00000040);
		((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->P1_MFP &= ~(0x00000101UL | 0x00000202UL|0x00004040UL);
    ((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->P1_MFP |= 0x00000001UL|0x00000002UL|0x00000040UL;
		
		
		
     ((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) + 0x00C0))->IMD |= (0UL << 2);
     ((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) + 0x00C0))->IEN |= (0x00000004 << 0);
    
}
void AdcSingleModeTest(void)
{
	
	bat_AD_data=0,DC_12V_AD_data=0,thermal_AD_data=0;
	
           
  
            ADC_Open(((ADC_T *) ((( uint32_t)0x40000000) + 0xE0000)), (0UL<<10), (2UL<<2),0x43);
						
					
             
            (((ADC_T *) ((( uint32_t)0x40000000) + 0xE0000))->ADCR |= (1ul << 0));

             
            (((ADC_T *) ((( uint32_t)0x40000000) + 0xE0000))->ADSR = ((1ul << 0)));

             
            ADC_EnableInt(((ADC_T *) ((( uint32_t)0x40000000) + 0xE0000)), ((1ul << 0)));
            NVIC_EnableIRQ(ADC_IRQn);

             
            g_u32AdcIntFlag = 0;
            (((ADC_T *) ((( uint32_t)0x40000000) + 0xE0000))->ADCR |= (1ul << 11));

             
            while(g_u32AdcIntFlag == 0);

             
            ADC_DisableInt(((ADC_T *) ((( uint32_t)0x40000000) + 0xE0000)), ((1ul << 0)));

             
            bat_AD_data = ((((ADC_T *) ((( uint32_t)0x40000000) + 0xE0000))->ADDR[(0)] & (0xFFFFul << 0))>>0);
						DC_12V_AD_data = ((((ADC_T *) ((( uint32_t)0x40000000) + 0xE0000))->ADDR[(1)] & (0xFFFFul << 0))>>0);
						
						
						thermal_AD_data = ((((ADC_T *) ((( uint32_t)0x40000000) + 0xE0000))->ADDR[(6)] & (0xFFFFul << 0))>>0);

						DC_12V_AD_data=DC_12V_AD_data/4096*3.3333*4.024;
						bat_AD_data=(bat_AD_data/4096)*3.3333;
						thermal_AD_data=(thermal_AD_data/4096)*3.3333/1.22;
						
						thermal_AD_data=(120 -196.12 * thermal_AD_data +214.51 * thermal_AD_data*thermal_AD_data -151.07 * thermal_AD_data * thermal_AD_data * thermal_AD_data +55.748 * thermal_AD_data *thermal_AD_data *thermal_AD_data *thermal_AD_data -8.5429 * thermal_AD_data *thermal_AD_data*thermal_AD_data*thermal_AD_data*thermal_AD_data);
	
}
	void ADC_IRQHandler(void)
{
	g_u32AdcIntFlag = 1;
    (((ADC_T *) ((( uint32_t)0x40000000) + 0xE0000))->ADSR = ((1ul << 0)));  
}
void UART0_Init(void)
{
     
     
     
     
    SYS_ResetModule(((0x4<<24) | 16 ));
	switch(BR_count){
		case 1:
			uart_BR=9600;
		break;
		case 2:
			uart_BR=19200;
		break;
		case 3:
			uart_BR=38400;
		break;
		case 4:
			uart_BR=115200;
		break;
	}
     
    UART_Open(((UART_T *) ((( uint32_t)0x40000000) + 0x50000)), uart_BR);
}
 
 
 
void UART0_IRQHandler(void)
{
    UART_TEST_HANDLE();
}
 
 
 


void UART_TEST_HANDLE()
{
    uint8_t u8InChar = 0xFF;
    uint32_t u32IntSts = ((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->ISR;
	
    if(u32IntSts & (1ul << 8))
    {
        

         
        while(((((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->ISR & (1ul << 0))>>0))
        {
             
            u8InChar = (((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->RBR);
						
							if(u8InChar==0x0D)
							{
								wakeup^=1;
								if(wakeup)
								{	
								printf("\tCommand Enable\n");	
									
							}
								else{
							
									
								printf("\tCommand Disable\n");
								}
							}
						if (gucUartReceivePointer > 70) 
						{
							gucUartReceivePointer = 0;
						}
						
				



 
						
					
						if(u8InChar == '*')
						{
							gucUartReceivePointer = 0;
							g_u8RecData[gucUartReceivePointer] = u8InChar;
							if(wakeup!=1)
							{
									wake_count^=1;
									
								if(wake_count){
								NVIC_EnableIRQ(EINT0_IRQn);
								printf("\t measure\n");
								}else{
								NVIC_DisableIRQ(EINT0_IRQn);
								printf("\t Stop measure\n");
								}
						}
						}
					
						if (gucUartReceivePointer == 1)
						{
								if((u8InChar == 'M')||(u8InChar ==0x0D))
								{
									if(u8InChar!=0x0D)
									g_u8RecData[gucUartReceivePointer] = u8InChar;
									
								}else
								{
									gucUartReceivePointer = 80;
									printf("\tERROR\n");
									NVIC_EnableIRQ(EINT0_IRQn);	
									
								}
						}
						if (gucUartReceivePointer == 2)
						{
								if(u8InChar == 'I')
								{
									g_u8RecData[gucUartReceivePointer] = u8InChar;
								}else
								{
									gucUartReceivePointer = 80;
									printf("ERROR\n");
									NVIC_EnableIRQ(EINT0_IRQn);	
								}
						}
						if (gucUartReceivePointer == 3)
						{
								if(u8InChar == 'N')
								{
									g_u8RecData[gucUartReceivePointer] = u8InChar;
								}else
								{
									gucUartReceivePointer = 80;
									printf("ERROR\n");
									NVIC_EnableIRQ(EINT0_IRQn);	
								}
						}
						
						if(gucUartReceivePointer == 4)
						{
							if ((u8InChar == 'R')||(u8InChar=='V')||(u8InChar=='D')||(u8InChar=='A')||(u8InChar=='C')||(u8InChar=='U')||(u8InChar=='T')||(u8InChar=='S')||(u8InChar=='K')||(u8InChar=='B')||(u8InChar=='N')||(u8InChar=='O')||(u8InChar=='I')) 
								{
										g_u8RecData[gucUartReceivePointer] = u8InChar;
										gucUartCommandType = u8InChar;
								}else
								{
										gucUartReceivePointer = 80; 
									printf("ERROR\n");
									NVIC_EnableIRQ(EINT0_IRQn);	
								}
						}
						if(gucUartReceivePointer == 5)
						{
								if((gucUartCommandType == 'R') ||(gucUartCommandType == 'U')||(gucUartCommandType == 'S')||(gucUartCommandType=='K')||(gucUartCommandType=='B')||(gucUartCommandType=='N')||(gucUartCommandType=='O')||(gucUartCommandType=='I'))
								{
									if (u8InChar == 'E') 
									{
										g_u8RecData[gucUartReceivePointer] = u8InChar;
										g_u8RecData[gucUartReceivePointer+1] = 0x00;
										wakeup=0;
										gucUartCommandSucceed = 1;
										COPY_UART_COMMAND_DATA();
										if(g_u8CommandData[4] == 'S'){
												SYS_UnlockReg();
												SYS_ResetCPU();
										}
										else if(g_u8CommandData[4] =='K')
										{
											unit_counter++;
											if(unit_counter>3)unit_counter=0;
										}
										else if(g_u8CommandData[4] =='B')
										{
											BR_count++;
											if(BR_count>4)BR_count=1;
											SYS_UnlockReg();
											UART0_Init();
											SYS_LockReg();	
											
										}
											else if(g_u8CommandData[4] =='N')
										{
											g_uEint0_Scan_Event_Flag=1;
											
										}
										else if(g_u8CommandData[4] =='O')
										{
											
											Read_RTC_Data();
											Transfer_RTC_To_ADCII();	
											printf("Device Real Time:%s\n",union_One_Measured_Data.data.RTC_DATA);	
										}
										else if(g_u8CommandData[4] =='I')
										{
											 printf("\n+-------------------------------------------------+\n");
											printf("|Welcome To Geotech Science|\n");
											printf("|This is The Device : Minilogger_16Channel|\n");
											printf("|The Firmware Version:mini_17.09.v3|\n");
											printf("+-------------------------------------------------+\n\n");
										}
										
										
										
										gucUartReceivePointer = 80;
										
										gucUartCommandType = 0x00;
									}else
									{
										gucUartReceivePointer = 80; 
										NVIC_EnableIRQ(EINT0_IRQn);	
									}
								}else if((u8InChar >='0') && (u8InChar <= '9')) 
								{
										g_u8RecData[gucUartReceivePointer] = u8InChar;
								}
								else
								{
										gucUartReceivePointer = 80; 
										NVIC_EnableIRQ(EINT0_IRQn);	
								}
						}
						if ((gucUartReceivePointer >= 6)&&(gucUartReceivePointer<51))
						{
								if ((u8InChar >='0') && (u8InChar <= '9'))
								{
									g_u8RecData[gucUartReceivePointer] = u8InChar;
								}else
								{
										gucUartReceivePointer = 80; 
									printf("ERROR\n");
									NVIC_EnableIRQ(EINT0_IRQn);	
								}
						}
						if (gucUartReceivePointer ==51)
						{
								if (u8InChar == 'E') 
									{
										g_u8RecData[gucUartReceivePointer] = u8InChar;
										g_u8RecData[gucUartReceivePointer+1] = 0x00;
										
										
										wakeup=1;
										gucUartCommandSucceed = 1;
										COPY_UART_COMMAND_DATA();
										gucUartReceivePointer = 80;
										gucUartCommandType = 0x00;
										printf("\t Com_UART_OK \0\n");
										wakeup=0;
									}else
									{
										gucUartReceivePointer = 80; 
										printf("ERROR\n");
										NVIC_EnableIRQ(EINT0_IRQn);	
									}
						}
						
						
						if(wakeup)
						gucUartReceivePointer++;
        }
    }
}
#line 1902 "..\\main.c"








 
void TMR0_IRQHandler(void)
{  
			
			char i;
    if(TIMER_GetIntFlag(((TIMER_T *) ((( uint32_t)0x40000000) + 0x10000))) == 1)
    {
         
			
        TIMER_ClearIntFlag(((TIMER_T *) ((( uint32_t)0x40000000) + 0x10000)));
				uiTimerCounter++;
			
			if(select_type =='A')((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )))->DOUT = (0x80));
			
			
			if (timer0_check == 'T')
			{
					if (uiTimerCounter >= 1)
					{
						g_au32TMRINTCount[1] = 200; 
					}
			}
			if ((select_type =='D')||(select_type =='A')||(select_type =='S')||(select_type =='C'))
			{
				if (select_type =='S')
				{
						
							if(u32iOutputVoltage>0x80)
							((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )))->DOUT = (u32iOutputVoltage));	
							else{
							((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )))->DOUT = (0x80));	
							}							
						
					
					
					if (uiTimerCounter>1)
					{
						
						
						if (n_counter <= n_max_counter){							
							

 
							
							n_counter+=30;
							
						if(Hz_data>0)
						{				
						if(select_freq_range==2||select_freq_range==3)
							{
								((TIMER_T *) ((( uint32_t)0x40000000) + 0x10000))->TCMPR = (12000000UL)/n_counter;
							}
							else{
										((TIMER_T *) ((( uint32_t)0x40000000) + 0x10000))->TCMPR = (12000000UL)/n_counter;
										}
						}
						else{
						((TIMER_T *) ((( uint32_t)0x40000000) + 0x10000))->TCMPR = (12000000UL)/n_counter;
						}
						uiTimerCounter = 0;
					
																								}
						else
						{
							((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )))->DOUT = (0x80));
							
						}
						

					}
				}
		
				
				else if(select_type =='A')
					{

					if(gucOutputVoltagePeak==0x66)
					{
						
							
							((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )))->DOUT = (u32iOutputVoltage));
						delay_time(800);	
						((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )))->DOUT = (0xff-u32iOutputVoltage));
						delay_time(1000);
						for(i=0;i<5;i++){uiAdc8320Value += read_ext_adc();}
						delay_time(1000);
						((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )))->DOUT = (0x80));
						delay_time(300);
						uiAdc8320Value_offset += read_ext_adc();
						
						delay_time(300);
						
						((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )))->DOUT = (u32iOutputVoltage));
						delay_time(1000);
						for(i=0;i<5;i++){uiAdc8320Value += read_ext_adc();}
						delay_time(1000);
						((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )))->DOUT = (0x80));
						delay_time(1600);
						((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )))->DOUT = (0xff-u32iOutputVoltage));
						
						
						delay_time(800);
						((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )))->DOUT = (0x80));
						
							
							
							
						}else{
							
							if(u32iOutputVoltage < 0x80) 
									{
										u32iOutputVoltage = 0xff-u32iOutputVoltage;
										((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )))->DOUT = (u32iOutputVoltage));
										uiAdc8320Value += read_ext_adc();
										}else if (u32iOutputVoltage>=0x80)
											{
											u32iOutputVoltage = 0xff-u32iOutputVoltage;
												((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )))->DOUT = (u32iOutputVoltage));
												uiAdc8320Value_offset += read_ext_adc();
												}
											
									}
					
									
			}
					else if(select_type =='D')
					{
					   ((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )))->DOUT = (0xff-u32iOutputVoltage));	
							
					}
					else if(select_type =='C')
					{
					   ((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )))->DOUT = (0xff-u32iOutputVoltage));
						
						
							
						
					}	
					
				if (select_type =='S')
				{
					if(u32iOutputVoltage <= 0x80) 
					{
						
						u32iOutputVoltage = 0xff-u32iOutputVoltage;
					if(n_counter>=n_max_counter)
						((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )))->DOUT = (0x80));
					}else if (u32iOutputVoltage>0x80)
					{
						
						u32iOutputVoltage = 0xff-u32iOutputVoltage;
						
						if(n_counter>=n_max_counter)
							((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )))->DOUT = (0x80));
					}
					
					
				}
			}
		}
 if(select_type =='A'){
		if(uiTimerCounter>=stri_counter){
														TIMER_Stop(((TIMER_T *) ((( uint32_t)0x40000000) + 0x10000)));
														u32iOutputVoltage=0x80;
														((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )))->DOUT = (u32iOutputVoltage));
														
														uiAdc8320Value_f =(float)uiAdc8320Value/(uiTimerCounter*10);
														uiAdc8320Value_f_offset =(float)uiAdc8320Value_offset/(uiTimerCounter);
														uiAdc8320Value_ac = uiAdc8320Value_f-uiAdc8320Value_f_offset;
														uiAdc8320Value=0;
														uiAdc8320Value_offset=0;
															}		
											}

						
    														
}









 
void TMR1_IRQHandler(void)
{
    if(TIMER_GetCaptureIntFlag(((TIMER_T *) ((( uint32_t)0x40000000) + 0x10020))) == 1)
    {
				
         
        TIMER_ClearCaptureIntFlag(((TIMER_T *) ((( uint32_t)0x40000000) + 0x10020)));

        g_au32TMRINTCount[1]++;
			if(u32InitCount>=300)u32InitCount=300;
			g_au32TMR1Count[u32InitCount++] = TIMER_GetCaptureData(((TIMER_T *) ((( uint32_t)0x40000000) + 0x10020)));
			
			
			if (g_au32TMRINTCount[1]%2)
				TIMER_EnableCapture(((TIMER_T *) ((( uint32_t)0x40000000) + 0x10020)),(0UL << 4) , (1UL << 1));
			else
				TIMER_EnableCapture(((TIMER_T *) ((( uint32_t)0x40000000) + 0x10020)),(1UL << 4) , (1UL << 1));
			
    }
}
void EINT0_IRQHandler(void)
{
    
    ((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) + 0x00C0)))->ISRC = 0x00000004);
		
		if (u32Eint0Counter>=(u32ScanRateInSecond))
		{
				g_uEint0_Scan_Event_Flag = 1; 
				u32Eint0Counter = 0;
			
				
				
				
		}
		if (u32Eint0SaveCounter>=(u32SaveRateInSecond))
		{
				g_uEint0_Save_Event_Flag = 1; 
				u32Eint0SaveCounter = 0;
				
				
		}
		
		u32Eint0Counter++;
		u32Eint0SaveCounter++;

}

void COPY_UART_COMMAND_DATA(void)
{
	int i;
	for (i=0;i<54;i++)
	{
		g_u8CommandData[i] = g_u8RecData[i];
		g_u8RecData[i] = 0;
	}	
}
 
 
 
double myFloorRound(double dInput)
{
    if(dInput >= 0.000f)
    {
        return floor(dInput + 0.005f);
    }
    return ceil(dInput - 0.005f);
}
int main(void)
{



	int i,j,kk;
	
volatile	uint8_t iChannel_on_off_flag_counter;

	  SYS_UnlockReg();
		
		

     
    SYS_Init();
		UART0_Init();
		I2C_Init();
	
		SYS_LockReg();	
	NVIC_DisableIRQ(EINT0_IRQn);

	  printf("\n+-------------------------------------------------+\n");
    printf("|Welcome To Geotech Science|\n");
		printf("|This is The Device : Minilogger_16Channel|\n");
		printf("|The Firmware Version:mini_v17.05.1|\n");
    printf("+-------------------------------------------------+\n\n");
     
		GPIO_SetMode(((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )), 0x00000001, 0x1UL);
    GPIO_SetMode(((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )), 0x00000002, 0x1UL);
    GPIO_SetMode(((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )), 0x00000004, 0x1UL);
    GPIO_SetMode(((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )), 0x00000008, 0x1UL);
    GPIO_SetMode(((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )), 0x00000010, 0x1UL);
    GPIO_SetMode(((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )), 0x00000020, 0x1UL);
    GPIO_SetMode(((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )), 0x00000040, 0x1UL);
    GPIO_SetMode(((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )), 0x00000080, 0x1UL);

		GPIO_SetMode(((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) + 0x0080)), 0x00000001, 0x1UL);
    GPIO_SetMode(((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) + 0x0080)), 0x00000002, 0x1UL);
    GPIO_SetMode(((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) + 0x0080)), 0x00000004, 0x1UL);
    GPIO_SetMode(((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) + 0x0080)), 0x00000008, 0x1UL);
 
		

 
    GPIO_SetMode(((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) + 0x0040)), 0x00000010, 0x1UL);
    GPIO_SetMode(((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) + 0x0040)), 0x00000020, 0x1UL);
		


 
		
		GPIO_SetMode(((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) + 0x00C0)), 0x00000040, 0x1UL);
    GPIO_SetMode(((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) + 0x00C0)), 0x00000080, 0x1UL);
		
		
		
						
    GPIO_SetMode(((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) + 0x0100)), 0x00000002, 0x0UL);
		GPIO_SetMode(((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) + 0x0100)), 0x00000004, 0x1UL);
		
    GPIO_SetMode(((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) + 0x00C0)), 0x00000008, 0x0UL);
		GPIO_SetMode(((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) + 0x00C0)), 0x00000004, 0x0UL);
		GPIO_EnableInt(((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) + 0x00C0)), 2, 0x00000001UL);			
		
					(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x0200)+(0x20*(3))) + ((7)<<2))))=0;
					(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x0200)+(0x20*(3))) + ((6)<<2))))=0;
	
			(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x0200)+(0x20*(2))) + ((3)<<2)))) =1;
		for (i=0;i<32;i++)
			{
					gucI2CBuffer[i] = 0;
			}

			delay_time(600000);
			Read_RTC_Data();
			if (!Check_RTC_Dat())
			{
			
			
			
			gucI2CBuffer[0]=0x5e;
			gucI2CBuffer[1]=0xc7;
			gucI2CBuffer[2]=0x01;
			I2C_WriteData(0xD0, 0x0020, gucI2CBuffer, 3);
			I2C_WriteData(0xD0, 0x0022, gucI2CBuffer, 1);
			gucI2CBuffer[0]=0xDF;
			I2C_WriteData(0xD0, 0x0007, gucI2CBuffer, 1);
				
				Inital_RTC_To_ADCII();
			}else
			{
				gucI2CBuffer[0]=0x5e;
			gucI2CBuffer[1]=0xc7;
			gucI2CBuffer[2]=0x01;
			I2C_WriteData(0xD0, 0x0020, gucI2CBuffer, 3);
			
			gucI2CBuffer[0]=0x01;	
			I2C_WriteData(0xD0, 0x0022, gucI2CBuffer, 1);
			
				gucI2CBuffer[0]=0xDF;
			I2C_WriteData(0xD0, 0x0007, gucI2CBuffer, 1);
			
			}
			
			
			








 
			
			
			Transfer_RTC_To_ADCII();
			read_eeprom_command_set();
			if(!check_command_set_data(&g_u8CommandData[0]))
			{
					initial_command_set_data();
					
					for(i=0;i<64;i++)
					{
						g_u8CommandData[i] = union_Set_Operation_Mode_Command.Command_string[i];
					}
					union_Set_Operation_Mode_Command.command.DUMMY[0] = 0x00;
					union_Set_Operation_Mode_Command.command.DUMMY[1] = 0x00;
					write_eeprom_command_set();
					
					u32_address_to_save_to_eeprom = 256;
					printf("Loading Command Fail,----\n");
			}else
			{
				
					update_command_from_uart();
					
					u32_address_to_save_to_eeprom = 256;
				printf("Default Command Setting:%s\n",union_Set_Operation_Mode_Command.Command_string);	
				printf("Last Measurement Time:%s\n",union_One_Measured_Data.data.RTC_DATA);	
			}
			if(g_u8CommandData[4] == 'V')
						gucOutputVoltageType=select_type='S';
			else if(g_u8CommandData[4] == 'D')
						gucOutputVoltageType=select_type='D';
			else if(g_u8CommandData[4] == 'A')
						gucOutputVoltageType=select_type='A';
			else if(g_u8CommandData[4] == 'C')
						gucOutputVoltageType=select_type='C';	
			
			u32ScanRateInSecond = transfer_command_to_variables(&union_Set_Operation_Mode_Command.command.SCAN_RATE[0]);
			u32SaveRateInSecond = transfer_command_to_variables(&union_Set_Operation_Mode_Command.command.SAVE_RATE[0]);
	
			
			initial_measured_data();
	
			
    min_freq=400;
		max_freq =6000;
		
		(((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->IER |= ((1ul << 0)));

     
    init_ext_ad();
		


 
		
			uiAdc8320Value = 0;
     
		gucT0Index = 0;
    ((TIMER_T *) ((( uint32_t)0x40000000) + 0x10000))->TCMPR =(12000000UL)/2000;
    ((TIMER_T *) ((( uint32_t)0x40000000) + 0x10000))->TCSR = (1ul << 29) | (1UL << 27);
    ((((TIMER_T *) ((( uint32_t)0x40000000) + 0x10000)))->TCSR = ((((TIMER_T *) ((( uint32_t)0x40000000) + 0x10000)))->TCSR & ~(0xFFul << 0)) | (0));
		uiTimerCounter = 0;
     
		g_uEint0_Scan_Event_Flag=1; 
		algorithm_open=1;										
		NVIC_EnableIRQ(TMR0_IRQn);
		NVIC_EnableIRQ(UART0_IRQn);
		NVIC_EnableIRQ(EINT0_IRQn);
			((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )))->DOUT = (0x80));
			u32iOutputVoltage = 0x80;		
  while(1)
	{	
	  
		
		
		
		
		
		
		
		
	
		uiAdc8320Value = 0;
		uiAdc8320Value_offset=0;
		if (gucUartCommandSucceed == 1)
		{
			
					gucUartCommandSucceed = 0;
					if ((g_u8CommandData[4] == 'R')||(g_u8CommandData[4] == 'U')||(g_u8CommandData[4] == 'S'))
					{
						if(g_u8CommandData[4] == 'R')
						printf("%s\n",union_One_Measured_Data.Data_string);
						else if(g_u8CommandData[4] == 'U'){
							if(finish)
							{
							printf("...................");
							}
							else
								{
								read_measured_data_from_eeprom();
							}
						

 
						}
						else if(g_u8CommandData[4] == 'S'){
						SYS_UnlockReg();
						SYS_ResetCPU();
						}
					}
					if ((g_u8CommandData[4] == 'V')||(g_u8CommandData[4] == 'D')||(g_u8CommandData[4] == 'A')||(g_u8CommandData[4] == 'C'))
					{
						
						update_command_from_uart();
						write_eeprom_command_set(); 
						
						printf("Command_Sucess\n");
						
						
						u32ScanRateInSecond = transfer_command_to_variables(&union_Set_Operation_Mode_Command.command.SCAN_RATE[0]);
						u32SaveRateInSecond = transfer_command_to_variables(&union_Set_Operation_Mode_Command.command.SAVE_RATE[0]);
						
						if(g_u8CommandData[4] == 'V')
							gucOutputVoltageType=select_type='S';
						else if(g_u8CommandData[4] == 'D')
							gucOutputVoltageType=select_type='D';
						else if(g_u8CommandData[4] == 'A')
							gucOutputVoltageType=select_type='A';
						else if(g_u8CommandData[4] == 'C')
							gucOutputVoltageType=select_type='C';	
						
					}
					if (g_u8CommandData[4] == 'T')
					{
						
						update_RTC_from_uart();
						
						Transfer_RTC_To_ADCII();
						I2C_WriteData(0xD0, 0x0000, RTC_register_map.RTC_Reg_string, 8);
						printf("Set_Time_Done\n");
						u32Eint0SaveCounter=0;
						u32Eint0Counter =0;
					}
						
					 
					NVIC_EnableIRQ(EINT0_IRQn);
					
		}
		
    if(g_uEint0_Scan_Event_Flag == 1)
		{	
			
			(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x0200)+(0x20*(2))) + ((3)<<2)))) = 1;
			
			(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x0200)+(0x20*(3))) + ((6)<<2))))=1;
			delay_time(200000);
			while_counter++;
			if(while_counter>0xffffffff)while_counter=2;
			uiTimerCounter = 0;
				
			
			
			g_uEint0_Scan_Event_Flag=0;
			
			AdcSingleModeTest();
			
			
			for (iChannel_on_off_flag_counter = 0;iChannel_on_off_flag_counter<16;iChannel_on_off_flag_counter++)
			{
				
				
				if(gucOutputVoltageType=='S'||select_type=='S')u32iOutputVoltage =0xf6;
				
				
				gain_uiAdc8320Value=0;
				
				
				(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x0200)+(0x20*(3))) + ((7)<<2))))=1;
				delay_time(10*10000);
				(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x0200)+(0x20*(3))) + ((7)<<2))))=0;
				delay_time(10*10000);
				(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x0200)+(0x20*(3))) + ((7)<<2))))=1;
				delay_time(10*10000);
				(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x0200)+(0x20*(3))) + ((7)<<2))))=0;
				delay_time(10*10000);
				
		    select_freq_range=union_Set_Operation_Mode_Command.command.FREQ_SEL[iChannel_on_off_flag_counter] -0x30;
						
					if(select_freq_range==2)
					{ 
						button_range_min=gucT0Index=0;
						button_range_max=gucindex_range=9;
						min_freq=500;
						max_freq =1200;
						strain_coeffic = 4.062;
					}
					else if(select_freq_range==3)
					{
						button_range_min=gucT0Index=0;
						button_range_max=gucindex_range=9;
						min_freq=500;
						max_freq =1200;	
						strain_coeffic = 3.304;		
					}
					else if(select_freq_range==1)
					{ 

						button_range_min=gucT0Index=11;
						button_range_max=gucindex_range=31;
						min_freq=2000;
						max_freq =3500;						
					}
					else if(select_freq_range==4)
					{
						button_range_min=gucT0Index=11;
						button_range_max=gucindex_range=56;
						min_freq=1500;
						max_freq =6000;
						strain_coeffic = 0.39102;
					}
					else if(select_freq_range==5)
					{
						button_range_min=gucT0Index=21;
						button_range_max=gucindex_range=56;
						min_freq=2500;
						max_freq =6000;
					}
					else if(select_freq_range==0)
					{
						button_range_min=gucT0Index=0;
						button_range_max=gucindex_range=56;
						min_freq=450;
						max_freq =6100;
					}
					
								max_freq_timer = (50000000)/(min_freq);
								min_freq_timer = (50000000)/(max_freq);
						n_counter = gucT0Index*200+800;
						n_max_counter = gucindex_range*200+800;	
					g_au32HzMaxMin[0] = max_freq_timer;
					g_au32HzMaxMin[1] = min_freq_timer;
			
				if(union_Set_Operation_Mode_Command.command.ON_OFF_FLAG[iChannel_on_off_flag_counter] == '1') 
				{
					
					uiTimerCounter = 0;
					
			
			
			gucGainTableIndex = 0;
	
			
		if (select_type =='S')
			{
				
				one_step_sti++;
				
				delay_time(1000);
				
 
				
			if(Hz_data>0){
				if(select_freq_range==2||select_freq_range==3)
				{
					((TIMER_T *) ((( uint32_t)0x40000000) + 0x10000))->TCMPR = (12000000UL)/n_counter;
					TIMER_Start(((TIMER_T *) ((( uint32_t)0x40000000) + 0x10000)));
				}
					
				else{
					((TIMER_T *) ((( uint32_t)0x40000000) + 0x10000))->TCMPR = (12000000UL)/n_counter;
					TIMER_Start(((TIMER_T *) ((( uint32_t)0x40000000) + 0x10000)));
				}
			}
					else
					{
					((TIMER_T *) ((( uint32_t)0x40000000) + 0x10000))->TCMPR = (12000000UL)/n_counter;
					TIMER_Start(((TIMER_T *) ((( uint32_t)0x40000000) + 0x10000)));
					}
					
			}
	else if(select_type =='A')
			{
			
				((TIMER_T *) ((( uint32_t)0x40000000) + 0x10000))->TCMPR = (12000000UL)/300;
			TIMER_Start(((TIMER_T *) ((( uint32_t)0x40000000) + 0x10000)));
			}
	else if(select_type =='D')
			{
			gucT0Index = 0;
				((TIMER_T *) ((( uint32_t)0x40000000) + 0x10000))->TCMPR = guiTimer0Period[gucT0Index];
			TIMER_Start(((TIMER_T *) ((( uint32_t)0x40000000) + 0x10000)));
				
			}
		else if(select_type =='C')
			{
			gucT0Index = 0;
				((TIMER_T *) ((( uint32_t)0x40000000) + 0x10000))->TCMPR = (12000000UL)/4000;
				
			TIMER_Start(((TIMER_T *) ((( uint32_t)0x40000000) + 0x10000)));
				
				
			}	

			if (select_type =='S')
			{
				
				
				
				
				
				while (n_counter <= (n_max_counter)){
					if(n_counter>=n_max_counter)
							{
								
								gucindex_range = button_range_max;
								gucT0Index = button_range_min;
								n_counter = gucT0Index*200+800;
						n_max_counter = gucindex_range*200+800;
								((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )))->DOUT = (0x80));
								
								break;
							}	
							
							
						}
				
				
					TIMER_Stop(((TIMER_T *) ((( uint32_t)0x40000000) + 0x10000)));
					
					for(i=0;i<300;i++)
					{
						g_au32TMR1Count[i] = 0;
					}
				
					
					timer0_check = 'T';
					((TIMER_T *) ((( uint32_t)0x40000000) + 0x10000))->TCMPR = (12000000UL); 
					delay_time(500000);
					TIMER_Start(((TIMER_T *) ((( uint32_t)0x40000000) + 0x10000)));
				
				
				TIMER_Open(((TIMER_T *) ((( uint32_t)0x40000000) + 0x10020)), (3UL << 27),1);
				 
					((((TIMER_T *) ((( uint32_t)0x40000000) + 0x10020)))->TCSR = ((((TIMER_T *) ((( uint32_t)0x40000000) + 0x10020)))->TCSR & ~(0xFFul << 0)) | (0));
					((((TIMER_T *) ((( uint32_t)0x40000000) + 0x10020)))->TCMPR = (0xffffff));
					TIMER_EnableEventCounter(((TIMER_T *) ((( uint32_t)0x40000000) + 0x10020)), (0UL << 0));
					TIMER_EnableCaptureDebounce(((TIMER_T *) ((( uint32_t)0x40000000) + 0x10020)));
					TIMER_DisableEventCounter(((TIMER_T *) ((( uint32_t)0x40000000) + 0x10020)));
				
					TIMER_EnableCapture(((TIMER_T *) ((( uint32_t)0x40000000) + 0x10020)), (0UL << 4), (1UL << 1));
					TIMER_EnableCaptureInt(((TIMER_T *) ((( uint32_t)0x40000000) + 0x10020)));
			
					
				 
					
				
					u32InitCount = g_au32TMRINTCount[1] = 0;
					
					
					TIMER_Start(((TIMER_T *) ((( uint32_t)0x40000000) + 0x10020)));
				
						
					NVIC_EnableIRQ(TMR1_IRQn);
					delay_time(700000);
				 
				
			



 
				
				TIMER_Stop(((TIMER_T *) ((( uint32_t)0x40000000) + 0x10000)));
				
					

				 
				TIMER_Stop(((TIMER_T *) ((( uint32_t)0x40000000) + 0x10020)));
				TIMER_Close(((TIMER_T *) ((( uint32_t)0x40000000) + 0x10020)));
				
				
				uiAdc8320Value_Hz_mean=0;
				uiAdc8320Value_Hz_mean_STD=0;
				uiAdc8320Value_Hz_1=0;
				Hz_out_of_mean=0;
				Hz_out_of_mean_STD=0;
				Hz_out_of_mean_1=0;
				j=0;
				kk=0;
				
			





















 
				




































































































 
				
				
				
				
				uiAdc8320Value_Hz_mean=0;
				uiAdc8320Value_Hz_mean_STD=0;
				uiAdc8320Value_Hz_1=0;
				Hz_out_of_mean=0;
				Hz_out_of_mean_STD=0;
				Hz_out_of_mean_1=0;
				j=0;
				kk=0;
			for(i=5;i<300;i++)
				{
					
					if((g_au32TMR1Count[i] <= g_au32HzMaxMin[0])&&(g_au32TMR1Count[i] >= g_au32HzMaxMin[1]))
								{
								
						
									if(g_au32TMR1Count[i]>0)
										{
												uiAdc8320Value_Hz_mean+=g_au32TMR1Count[i]; 
												j++;
										}
								}
								else
								{
								if(g_au32TMR1Count[i]>0)
										{
												Hz_out_of_mean+=g_au32TMR1Count[i]; 
												kk++;
										}
								}
				
				
				}
				uiAdc8320Value_Hz_mean=uiAdc8320Value_Hz_mean/j;
				Hz_out_of_mean = Hz_out_of_mean/kk;
				
				j=0,kk=0;
			for(i=5;i<300;i++)
				{
					if((g_au32TMR1Count[i] <= g_au32HzMaxMin[0])&&(g_au32TMR1Count[i] >= g_au32HzMaxMin[1]))
								{
									if(g_au32TMR1Count[i]>0)
										{
											uiAdc8320Value_Hz_mean_STD+=((g_au32TMR1Count[i]-uiAdc8320Value_Hz_mean)*(g_au32TMR1Count[i]-uiAdc8320Value_Hz_mean)); 
											j++;
										}
								}
								else
								{
									if(g_au32TMR1Count[i]>0)
										{
												Hz_out_of_mean_STD+=g_au32TMR1Count[i]; 
												kk++;
										}
								}
				}
				uiAdc8320Value_Hz_mean_STD=sqrt(uiAdc8320Value_Hz_mean_STD/j);
				Hz_out_of_mean_STD =sqrt(Hz_out_of_mean_STD/kk);
				uiAdc8320Value_Hz_mean_STD=uiAdc8320Value_Hz_mean_STD*2;
				j=0,kk=0;
				for(i=5;i<300;i++)
				{
								if((g_au32TMR1Count[i] <= g_au32HzMaxMin[0])&&(g_au32TMR1Count[i] >= g_au32HzMaxMin[1]))
								{
									if(g_au32TMR1Count[i]>(uiAdc8320Value_Hz_mean+uiAdc8320Value_Hz_mean_STD)||(g_au32TMR1Count[i]<(uiAdc8320Value_Hz_mean-uiAdc8320Value_Hz_mean_STD)))
											g_au32TMR1Count[i]=0;
									else
											{
												g_au32TMR1Count[i]=g_au32TMR1Count[i];
											}
								}
								







 
					
				}
				
				
						for(i=5;i<300;i++)
							{
								if((g_au32TMR1Count[i] <= g_au32HzMaxMin[0])&&(g_au32TMR1Count[i] >= g_au32HzMaxMin[1]))
								{
								
								
									if(g_au32TMR1Count[i]>0)
										{
											uiAdc8320Value_Hz_1 += g_au32TMR1Count[i];
											j++;
										}
								}
								else
								{
									if(g_au32TMR1Count[i]>0)
										{
												Hz_out_of_mean_1+=g_au32TMR1Count[i]; 
												kk++;
										}
								}
								
				      }
							
				
						if (j>0)
						{
						
						uiAdc8320Value_Hz_1/= j;
							Hz_out_of_mean_1/=kk;
							
						i,j,kk=0;
						}

	













 
				

 
						
										uiAdc8320Value_Hz =uiAdc8320Value_Hz_1;
					
					
				

				
						
					init_ext_ad();
				
				
					
				
					SET_Gain(6);
					delay_time(10000);
					delay_time(10000);
					typeS_uiAdc8320Value = 0;
				  ((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )))->DOUT = (0x99));
				  delay_time(10000);
					for (i=0;i<50;i++)
					{
						typeS_uiAdc8320Value += read_ext_adc();
					}
					typeS_uiAdc8320Value /= 50;
					
					
					
					if((uiAdc8320Value_Hz>0)&&(one_step_sti>0)){																																			
				
						gain_uiAdc8320Value = (50000000)/uiAdc8320Value_Hz;
				time_ms = 1/gain_uiAdc8320Value*1000000;
				
				
						
					
									
							
						
					

						algo_x_counter =(while_counter-1)%10; 
					










 

							if(algo_x_counter>=0)
							Raw_data[algo_x_counter][iChannel_on_off_flag_counter]=gain_uiAdc8320Value;
							j=0;
						for( i=0;i<10;i++)
						{
							if(Raw_data[i][iChannel_on_off_flag_counter]>0)
							{
								j++;
							previous_sumdata+=Raw_data[i][iChannel_on_off_flag_counter];	
							}
						}
						previous_sumdata /=j;
						previous_4_times_data_mean[iChannel_on_off_flag_counter]=previous_sumdata;
						if(algorithm_open){
							
							
							
							






































 
							
							if(abs(previous_sumdata-gain_uiAdc8320Value)>previous_4_times_data_mean[iChannel_on_off_flag_counter]*0.001)
								{		
								swing_flag++;
								}
								else
								{
								swing_flag=0;
								}
							
								if(abs(previous_sumdata-gain_uiAdc8320Value)>previous_4_times_data_mean[iChannel_on_off_flag_counter]*0.001)
								{		
								if(swing_flag>=2){
								for( i=0;i<10;i++)
										{
											
											previous_data[i][iChannel_on_off_flag_counter]=0;
											
												previous_4_times_data_mean[i]=0;
										}
										previous_4_times_data_mean[iChannel_on_off_flag_counter]=previous_data[algo_x_counter][iChannel_on_off_flag_counter]=gain_uiAdc8320Value;
									}
								else{
												gain_uiAdc8320Value = previous_4_times_data_mean[iChannel_on_off_flag_counter]+((gain_uiAdc8320Value-previous_4_times_data_mean[iChannel_on_off_flag_counter])*0.1)	;
												
								}
										
								}
									else
										{
											if(abs(previous_sumdata-gain_uiAdc8320Value)==0)
											{
											gain_uiAdc8320Value = gain_uiAdc8320Value;
											}
											else{
											
													
													gain_uiAdc8320Value = previous_4_times_data_mean[iChannel_on_off_flag_counter]+((gain_uiAdc8320Value-previous_4_times_data_mean[iChannel_on_off_flag_counter])*0.1)	;
												previous_data[algo_x_counter][iChannel_on_off_flag_counter]=gain_uiAdc8320Value;
											}
										}
															j=0;
																				
									
									previous_sumdata=0;
									uiAdc8320Value_Hz_mean=0;
									
							}
						else 
						{	
									
							gain_uiAdc8320Value=gain_uiAdc8320Value;																				
						}

				gain_uiAdc8320Value_stain_e=(gain_uiAdc8320Value);	
				stain_e =  gain_uiAdc8320Value_stain_e*gain_uiAdc8320Value_stain_e*0.001*strain_coeffic;
						
switch(unit_counter)
	
				{
	
					case 1:
									gain_uiAdc8320Value = gain_uiAdc8320Value_stain_e*gain_uiAdc8320Value_stain_e*0.001*strain_coeffic;
					break;
					case 2 :
									gain_uiAdc8320Value = 1/gain_uiAdc8320Value*1000000;
					break;
					case 3 :
									gain_uiAdc8320Value = 	coef_a*pow(gain_uiAdc8320Value,5)+coef_b*pow(gain_uiAdc8320Value,4)+coef_c*pow(gain_uiAdc8320Value,3)+coef_d*pow(gain_uiAdc8320Value,2)+coef_e*gain_uiAdc8320Value+coef_f;	
					break;
					default:
								gain_uiAdc8320Value =gain_uiAdc8320Value;
					break;
				}
																	}
					previous_sumdata=0;
					gucGainTableIndex=1;
				typeS_uiAdc8320Value/=gfloatGainTable[gucGainTableIndex];
				typeSgain_uiAdc8320Value = (float)typeS_uiAdc8320Value/65535*5;
				typeSgain_uiAdc8320Value=		 (120 -196.12 * typeSgain_uiAdc8320Value +214.51 * typeSgain_uiAdc8320Value*typeSgain_uiAdc8320Value -151.07 * typeSgain_uiAdc8320Value * typeSgain_uiAdc8320Value * typeSgain_uiAdc8320Value +55.748 * typeSgain_uiAdc8320Value *typeSgain_uiAdc8320Value *typeSgain_uiAdc8320Value *typeSgain_uiAdc8320Value -8.5429 * typeSgain_uiAdc8320Value *typeSgain_uiAdc8320Value*typeSgain_uiAdc8320Value*typeSgain_uiAdc8320Value*typeSgain_uiAdc8320Value);											
				if(gain_uiAdc8320Value>0)Hz_data=gain_uiAdc8320Value;
					else{Hz_data=0;}
				
					
					
				AD_data=typeSgain_uiAdc8320Value*10;
						if((typeSgain_uiAdc8320Value>70)||(typeSgain_uiAdc8320Value<-20))
						AD_data=0;
						if(gain_uiAdc8320Value<10000)
								uiAdc8320Value=	gain_uiAdc8320Value*1000;
						else{
								uiAdc8320Value=	gain_uiAdc8320Value*100;
						}
			
				
			
			}else if((select_type =='D')||(select_type =='A')||(select_type =='C'))
			{

			 
				
				if(select_type =='A')
					{
						if(gucOutputVoltagePeak==0x66)
							{
								
								delay_time(8000000);
								init_ext_ad();
								gucGainTableIndex=0;
								if(while_counter>1)
									{
										uiAdc8320Value_ff=uiAdc8320Value_f;
										uiAdc8320Value_f =uiAdc8320Value_ac;
										stri_counter=100;
										}else{
													uiAdc8320Value_f=0xffff;
													stri_counter=100;
													}
								if(AC_counter>5)AC_counter=1;
								uiAdc8320Value_ac=0;
								}else{
										
											for (i=0;i<500;i++)
											{
												uiAdc8320Value += read_ext_adc();
											}
											uiAdc8320Value =uiAdc8320Value/500;
											uiAdc8320Value_ff=uiAdc8320Value;
										}
					}
							
					
					
				
				else if(select_type =='D')
				{
					
					init_ext_ad();
				
					
					
					
					SET_Gain(0);
					
					delay_time(1000000);
					
					uiAdc8320Value = 0;
					for (i=0;i<1000;i++)
					{
						uiAdc8320Value += read_ext_adc();
					}
					uiAdc8320Value =uiAdc8320Value/1000;
					
					uiAdc8320Value_f=uiAdc8320Value;

					}
				  else
						{
							init_ext_ad();
				
					
					
					
					SET_Gain(4);
					
					delay_time(10000000);
					
					for (i=0;i<500;i++)
					{
						uiAdc8320Value += read_ext_adc();
					}
					uiAdc8320Value =uiAdc8320Value/500;
					
					uiAdc8320Value_f=uiAdc8320Value;

					
						

					}
						
					
											
					gain_uiAdc8320Value = uiAdc8320Value_f;
				  
					gain_uiAdc8320Value=gain_uiAdc8320Value/0.3333333;
					gain_uiAdc8320Value/=65535;
				  gain_uiAdc8320Value*=5;
					uiAdc8320Value_ff/=0.3333333;
					uiAdc8320Value_ff/=65535;
					uiAdc8320Value_ff=uiAdc8320Value_ff*5;
					
					
				
					
					
					
					if(select_type=='D'){	
																				 if(gucOutputVoltagePeak==0x4d){gucOutputVoltage=5.1;gain_uiAdc8320Value=(gain_uiAdc8320Value);}
																		else if(gucOutputVoltagePeak==0x66){gucOutputVoltage=2.6;gain_uiAdc8320Value=(gain_uiAdc8320Value);}
																		else if(gucOutputVoltagePeak==0x09){gucOutputVoltage=12.1;gain_uiAdc8320Value=(gain_uiAdc8320Value);}
												
															dig_thou = gain_uiAdc8320Value/10;
															dig_hun  = (gain_uiAdc8320Value-(dig_thou*10))/1;
															dig_tens = (gain_uiAdc8320Value-(dig_thou*10)-(dig_hun*1))/0.1;
															dig_ones =	(gain_uiAdc8320Value-(dig_thou*10)-(dig_hun*1)-(dig_tens*0.1))/0.01;
															dig_zeros =	(gain_uiAdc8320Value-(dig_thou*10)-(dig_hun*1)-(dig_tens*0.1)-(dig_ones*0.01))/0.001;
															dig_pointzeros =	(gain_uiAdc8320Value-(dig_thou*10)-(dig_hun*1)-(dig_tens*0.1)-(dig_ones*0.01)-(dig_zeros*0.001))/0.0001;
															dig_pointones		=	(gain_uiAdc8320Value-(dig_thou*10)-(dig_hun*1)-(dig_tens*0.1)-(dig_ones*0.01)-(dig_zeros*0.001)-(dig_pointzeros*0.0001))/0.00001;
																}
					else if(select_type=='C'){	
																				  if(gucOutputVoltagePeak==0x09){
																					gucOutputVoltage=12.1;
																					
																					
																						if(gain_uiAdc8320Value<0)gain_uiAdc8320Value=0;
																					
								
																					}
																		
															
															dig3_hun = gain_uiAdc8320Value/10;
															if(gain_uiAdc8320Value>=10)	gain_uiAdc8320Value = gain_uiAdc8320Value-(dig3_hun*10);						
															dig3_ten = gain_uiAdc8320Value/1;
															dig3_one  = (gain_uiAdc8320Value-(dig3_ten))/0.1;
															dig3_pointone = (gain_uiAdc8320Value-(dig3_ten)-(dig3_one*0.1))/0.01;
															dig3_pointtwo =	(gain_uiAdc8320Value-(dig3_ten)-(dig3_one*0.1)-(dig3_pointone*0.01))/0.001;
															dig3_pointthree =	(gain_uiAdc8320Value-(dig3_ten)-(dig3_one*0.1)-(dig3_pointone*0.01)-(dig3_pointtwo*0.001))/0.0001;
																}
					else if (select_type=='A'){
						
																		     if(gucOutputVoltagePeak==0x4d){gain_uiAdc8320Value=gain_uiAdc8320Value;}
																		else if(gucOutputVoltagePeak==0x66){gain_uiAdc8320Value=gain_uiAdc8320Value/2.5*10;}
																		else if(gucOutputVoltagePeak==0x09){gain_uiAdc8320Value=gain_uiAdc8320Value;}
																		if(gucOutputVoltagePeak==0x66){if(gain_uiAdc8320Value>=10){gain_uiAdc8320Value=9.99999;}}
																if(gucOutputVoltagePeak==0x66)
																		{
																		dig2_hunthou = gain_uiAdc8320Value/1;
																		dig2_tenthou = (gain_uiAdc8320Value-(dig2_hunthou*1))/0.1;
																		dig2_thou = (gain_uiAdc8320Value-(dig2_hunthou*1)-(dig2_tenthou*0.1))/0.01;
																		dig2_hun  = (gain_uiAdc8320Value-(dig2_hunthou*1)-(dig2_tenthou*0.1)-(dig2_thou*0.01))/0.001;
																		dig2_tens = (gain_uiAdc8320Value-(dig2_hunthou*1)-(dig2_tenthou*0.1)-(dig2_thou*0.01)-(dig2_hun*0.001))/0.0001;
																		dig2_ones =	(gain_uiAdc8320Value-(dig2_hunthou*1)-(dig2_tenthou*0.1)-(dig2_thou*0.01)-(dig2_hun*0.001)-(dig2_tens*0.0001))/0.00001;
																		}
																		
																else{
																	dig2_thouthou=uiAdc8320Value_ff/10;
																	dig2_hunthou = (uiAdc8320Value_ff-dig2_thouthou*10)/1;
																		dig2_tenthou = (uiAdc8320Value_ff-(dig2_thouthou*10)-(dig2_hunthou*1))/0.1;
																		dig2_thou = (uiAdc8320Value_ff-(dig2_thouthou*10)-(dig2_hunthou*1)-(dig2_tenthou*0.1))/0.01;
																		dig2_hun  = (uiAdc8320Value_ff-(dig2_thouthou*10)-(dig2_hunthou*1)-(dig2_tenthou*0.1)-(dig2_thou*0.01))/0.001;
																		dig2_tens = (uiAdc8320Value_ff-(dig2_thouthou*10)-(dig2_hunthou*1)-(dig2_tenthou*0.1)-(dig2_thou*0.01)-(dig2_hun*0.001))/0.0001;
																		dig2_ones =	(uiAdc8320Value_ff-(dig2_thouthou*10)-(dig2_hunthou*1)-(dig2_tenthou*0.1)-(dig2_thou*0.01)-(dig2_hun*0.001)-(dig2_tens*0.0001))/0.00001;
																		}
																			}
					
																			
													
													gain_uiAdc8320Value=0;
					
												}
												
												
										
			
					union_One_Measured_Data.data.CHANNEL_DATA[iChannel_on_off_flag_counter][6] = 0x30+(uiAdc8320Value%10);
					union_One_Measured_Data.data.CHANNEL_DATA[iChannel_on_off_flag_counter][5] = 0x30+((uiAdc8320Value/10)%10);
					union_One_Measured_Data.data.CHANNEL_DATA[iChannel_on_off_flag_counter][4] = 0x30+((uiAdc8320Value/100)%10);
					union_One_Measured_Data.data.CHANNEL_DATA[iChannel_on_off_flag_counter][3] = 0x30+((uiAdc8320Value/1000)%10);
					union_One_Measured_Data.data.CHANNEL_DATA[iChannel_on_off_flag_counter][2] = 0x30+((uiAdc8320Value/10000)%10);
					union_One_Measured_Data.data.CHANNEL_DATA[iChannel_on_off_flag_counter][1] = 0x30+((uiAdc8320Value/100000)%10);
					union_One_Measured_Data.data.CHANNEL_DATA[iChannel_on_off_flag_counter][0] = 0x30+((uiAdc8320Value/1000000)%10);							
					
				
												
					union_One_Measured_Data.data.CHANNEL_SUBDATA[iChannel_on_off_flag_counter][0] = 0x30+((AD_data/100)%10);	
					union_One_Measured_Data.data.CHANNEL_SUBDATA[iChannel_on_off_flag_counter][1] = 0x30+((AD_data/10)%10);	
					union_One_Measured_Data.data.CHANNEL_SUBDATA[iChannel_on_off_flag_counter][2] = 0x30+((AD_data)%10);	
					
					uiAdc8320Value_Hz_mean_STD=0;
					uiAdc8320Value_Hz_1=0;
					typeS_uiAdc8320Value=0;								
				}else
				{
					union_One_Measured_Data.data.CHANNEL_DATA[iChannel_on_off_flag_counter][0] = '9';
					union_One_Measured_Data.data.CHANNEL_DATA[iChannel_on_off_flag_counter][1] = '9';
					union_One_Measured_Data.data.CHANNEL_DATA[iChannel_on_off_flag_counter][2] = '9';
					union_One_Measured_Data.data.CHANNEL_DATA[iChannel_on_off_flag_counter][3] = '9';
					union_One_Measured_Data.data.CHANNEL_DATA[iChannel_on_off_flag_counter][4] = '9';
					union_One_Measured_Data.data.CHANNEL_DATA[iChannel_on_off_flag_counter][5] = '9';
					union_One_Measured_Data.data.CHANNEL_DATA[iChannel_on_off_flag_counter][6] = '9';
					union_One_Measured_Data.data.CHANNEL_SUBDATA[iChannel_on_off_flag_counter][0] = '9';	
					union_One_Measured_Data.data.CHANNEL_SUBDATA[iChannel_on_off_flag_counter][1] = '9';	
					union_One_Measured_Data.data.CHANNEL_SUBDATA[iChannel_on_off_flag_counter][2] = '9';
					
				}
				
									
									
									((((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) )))->DOUT = (0x80));
									NVIC_EnableIRQ(EINT0_IRQn);
				          (((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->IER |= (((1ul << 0))));
									
									
									delay_time(1000);		
									
			}
						
						
						
						
				(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x0200)+(0x20*(3))) + ((6)<<2))))=0;
						delay_time(1000);	
						RESET_Gain();
									Read_RTC_Data();
									Transfer_RTC_To_ADCII();	
									
									printf("\n%s-Real_Time_Data\t\n\n,DC_IN=%2.1f V,Temp=%2.1f deg\n",union_One_Measured_Data.Data_string,DC_12V_AD_data,thermal_AD_data);	
						delay_time(1000);	
						
						
					
			
						typeSgain_uiAdc8320Value=0;
						
						
			
						
			
			
						TIMER_Stop(((TIMER_T *) ((( uint32_t)0x40000000) + 0x10000)));
						
						uiAdc8320Value_f=0;
						uiAdc8320Value_f_offset=0;
						uiAdc8320Value=0;
						
						
						
						delay_time(1000);	
						(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x0200)+(0x20*(2))) + ((3)<<2)))) =0;
						
	}
		
		
		if (g_uEint0_Save_Event_Flag == 1)
		{
				g_uEint0_Save_Event_Flag = 0;
				
				save_measured_data_to_eeprom();
		}
		
		
		
		
		}
	
}

 
