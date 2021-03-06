
 //author::Jared_CCC
 //DATE;2016/0829/05:45 begin
 //2017-09-01
 //V1_DATE: 2016/1229/13:57
 //V1_fix:2017/02/10
 //16_channel:2017/03/30
 //V2_:2017/05_01 descrip:first data has no data output and calibration Timer Timing to match CR1000
 //V2_fix:2017/07/10 descrip:first data has data output
 //V3: 2017_09_v3 descrip:Addition 5 function .Unit change,Baud Rate change,meassure immediately,Device RTC output,Device Information
#include <stdio.h>
#include "stdint.h"
#include <stdlib.h>
#include "M051Series.h"
#include "gpio.h"
#include "adc.h"
#include "fmc.h"
#include "timer.h"
#include "core_cm0.h"
#include <math.h>

#define PLLCON_SETTING      CLK_PLLCON_50MHz_HXT
#define PLL_CLOCK           50000000
//#define _LTC2328_
#define RXBUFSIZE 64//1024
#define Channel 16//1024
//define channel_16 1
//#define channel_4 1
//#define LCM_W12864S
//#define _ADS8887_
#ifndef channel_16
#define channel_16
#else
#define channel_4
#endif

#define _ADS8320_
//#define _DAC714_
/*---------------------------------------------------------------------------------------------------------*/
/* Global variables                                                                                        */
/*---------------------------------------------------------------------------------------------------------*/
float gain_uiAdc8320Value_stain_e,previous_sumdata,previous_4_times_data_mean[16]={0},coef_a,coef_b,coef_c,coef_d,coef_e=1,coef_f;
uint8_t AC_counter,g_uEint0_Scan_Event_Flag,g_uEint0_Save_Event_Flag,unit_counter;
uint8_t	gucOutputVoltageType,gucOutputVoltagePeak,counter_a=0,algorithm_open,wakeup,wake_count=0;
float uiAdc8320Value_Hz,gain_uiAdc8320Value,uiAdc8320Value_f,uiAdc8320Value_ac,uiAdc8320Value_f_offset,uiAdc8320Value_Hz_1,gain_uiAdc8320Value_f3,after_algorithm_value,DG_value;
// gain table
uint8_t gucGainTableIndex,g_u8RecData[RXBUFSIZE]  = {0};
float 				gfloatGainTable[6]
										={0.33333,	1.0,	3.6,	10.804,	33.01,	99.04},time_ms,stain_e,strain_coeffic=1,Tem_V;
volatile float Temper,typeSgain_uiAdc8320Value,uiAdc8320Value_Hz_mean_STD,uiAdc8320Value_Hz_mean,Hz_out_of_mean,Hz_out_of_mean_STD,Hz_out_of_mean_1;

volatile uint32_t u32InitCount,g_u32AdcIntFlag,n_counter,n_max_counter;
uint8_t gucGainTable[8]
										={0x02,		0x0e,	0x03,	0x0f,		0x00,		0x0c,0x07,0x80},BR_count=1;
uint32_t guiTimer0Period[57] = {__HXT/800,__HXT/1000,__HXT/1200,__HXT/1400,__HXT/1600,__HXT/1800,__HXT/2000,__HXT/2200,__HXT/2400,__HXT/2600,__HXT/2800,__HXT/3000,__HXT/3200,__HXT/3400,__HXT/3600,__HXT/3800,__HXT/4000,
	__HXT/4200,__HXT/4400,__HXT/4600,__HXT/4800,__HXT/5000,__HXT/5200,__HXT/5400,__HXT/5600,__HXT/5800,__HXT/6000,__HXT/6200,__HXT/6400,__HXT/6600,__HXT/6800,__HXT/7000,__HXT/7200,__HXT/7400,__HXT/7600,__HXT/7800,__HXT/8000,
	__HXT/8200,	__HXT/8400,__HXT/8600,__HXT/8800,__HXT/9000,__HXT/9200,__HXT/9400,__HXT/9600,__HXT/9800,__HXT/10000,__HXT/10200,__HXT/10400,__HXT/10600,__HXT/10800,__HXT/11000,__HXT/11200,__HXT/11400,__HXT/11600,__HXT/11800,__HXT/12000};
	//0~28=400~6000,0~4 = 400~1200,10~15=2400~3400;
	//400,600,800,1000,1200Hz,1400.1600.1800.2000.2200.2400,2600,2800,3000,3200,3400
	//__HXT/7200,__HXT/7600,__HXT/8000,__HXT/8400,__HXT/8800,__HXT/9200,__HXT/9600,__HXT/10000,__HXT/10400,__HXT/10800,__HXT/11200,__HXT/11600,__HXT/12000
	//3600,3800,4000,4200,4400,4600,4800,5000,5200,5400,5600,5800,6000
 uint32_t stri_counter=100,ADC_check_Count[8]={0},Hz_data;
 uint32_t gucT0Index=0,gucindex_range=4,button_range_min=0,button_range_max=56,bat_data;//freqency_range
uint32_t one_step_sti=0;
 uint32_t uiAdc8320Value,typeS_uiAdc8320Value,uiAdc8320Value_offset;
 uint32_t u32iPortStatus,uiTimerCounter,while_counter;
 uint32_t u32iOutputVoltage;
uint8_t g_u8CommandData[RXBUFSIZE]  = {0},gucUartReceivePointer,gucUartCommandSucceed,gucOutputVoltageType,gucOutputVoltagePeak,gucUartCommandType; // copy of g_u8RecData										
 uint32_t g_au32TMRINTCount[4] = {0},uart_BR;
uint8_t save_eeprom_address_counter[5]  = {0},finish=0;
int AD_data;
float g_au32TMR1Count[300],gucOutputVoltage,uiAdc8320Value_ff,DC_12V_AD_data,thermal_AD_data,bat_AD_data;
// uint32_t u32InitCount;
 float min_freq_timer,max_freq_timer,min_freq,max_freq;
uint32_t g_au32HzMaxMin[2]={0};
 uint8_t interrupt_left=0,select_freq_range=0,select_freq_range2,interrupt_right,select_command=0,interrupt_enter_command[3],Hz_thou,Hz_hun,Hz_tens,Hz_ones,uE_thou,uE_hun,uE_tens,uE_ones,mS_thou,mS_hun,mS_tens,mS_ones,gain_coe,Hz_pointone,uE_pointone,mS_pointone;//button_command
 uint8_t enter_i,select_command_success,select_type,timer0_check,dig3_hun,dig3_ten,dig3_one,dig3_pointone,dig3_pointtwo,dig3_pointthree,dig_thou,dig_hun,dig_tens,dig_ones,dig_zeros,dig_pointzeros,dig_pointones,dig2_thouthou,dig2_hunthou,dig2_tenthou,dig2_thou,dig2_hun,dig2_tens,dig2_ones,dig2_zeros,Temper_tens,Temper_ones,Temper_point,language_select=0,language=0;
uint16_t save_eeprom_counter;
 float previous_data[10][16]={0},Raw_data[10][16]={0};
int_least32_t algo_x_counter;
// added 20160904
volatile uint32_t u32_address_to_save_to_eeprom;
int swing_flag;

/*typedef struct {
char a;
char b;
char c;
	
}in,*xxx;
void dsfrgtsdg(in xx){
xx.a=121;
xx.b=122;
	xx.c=123;
	sdsdfsdf(xx);
	
}
void sdsdfsdf(in *xx){

	
}

*/
//volatile uint8_t bat_data,bat_hun,bat_ten,bat_one;
//self-define
#ifdef _ADS8320_
#define ADS8320_CLK		P14
#define ADS8320_CS			P42
#define ADS8320_DOUT	P41
#endif
#ifdef _ADS8887_
#define ADS8887_CLK		P14
#define ADS8887_CS			P42
#define ADS8887_DOUT	P41

#endif
//#define Temp_sw		P17
#ifdef _DAC714_
#define DAC714_CLK		P00
#define DAC714_A0			P01
#define DAC714_SDI		P02
#define DAC714_A1			P03
#define DAC714_CLR		P04

#endif

/////////////////////////////////////////MUX4
#define ANALOG_POWERMOS_PIN	P23
#define MUX_CLK 						P37
#define MUX_RES 						P36
/////////////////////////////////////////////////
#ifdef LCM_W12864S
#define LCM_CS P21				
#define LCM_SID P22			  
#define LCM_SCLK P23			
#endif


#ifdef _LTC1856_ 

#define ADC_1856_SCK 			P14
#define ADC_1856_BUSY 		P15
#define ADC_1856_CNV 			P42
#define ADC_1856_DO 			P41
#define ADC_1856_DI 			P04
#define ADC_1856_RD 			P44//connect to GND
#define read_ext_adc LTC1856_data_ac
#define init_ext_ad LTC1856_Ini
#endif


void UART_TEST_HANDLE(void);
// i2c function definition
void I2C_Init(void);
void I2C_WriteData(uint8_t u8DeviceAddr, uint32_t u32Addr, uint8_t *pu8Buf, uint32_t u32Size);
uint8_t I2C_ReadData(uint8_t u8DeviceAddr, uint32_t u32Addr, uint8_t *pu8Buf, uint32_t u32Size);
void Read_RTC_Data(void);
int Check_RTC_Dat(void);
//int check_command_set_data(unsigned char *pByte);
// 24CM02 18-bits addressing
void I2C_24CM02_WriteData(uint8_t u8DeviceAddr, uint32_t u32Addr, uint8_t *pu8Buf, uint32_t u32Size);
uint8_t I2C_24CM02_ReadData(uint8_t u8DeviceAddr, uint32_t u32Addr, uint8_t *pu8Buf, uint32_t u32Size);
// save to eeprom function
void save_measured_data_to_eeprom(void);
/////////////////////////////////////////////
/////////////////////////////////////////////
// write eeprom function
void write_eeprom_command_set(void);
void read_eeprom_command_set(void);
void initial_command_set_data(void);
void initial_measured_data(void);
int check_command_set_data(unsigned char *pByte);
void AdcSingleModeTest(void);
void Transfer_RTC_To_ADCII(void);
//void test_pointer(union_One_Measured_Data *RTC_DATA);
void COPY_UART_COMMAND_DATA(void);
//////////////////////////////////////////////////////////////////////////////STRUCT
//
unsigned char gucI2CBuffer[65];

typedef  union 
{
  struct
  {
    unsigned char START_CODE;						//0
    unsigned char MACHINE_MODEL[3];			//1~3
    unsigned char MODE;									//4
    unsigned char FILENAME[4];      		//5~8
		unsigned char SCAN_RATE[5];					//9~13
		unsigned char SAVE_RATE[5];					//14~18
		unsigned char ON_OFF_FLAG[16];				//19~34
		unsigned char FREQ_SEL[16];					//35~50
    unsigned char STOP_CODE;						//51		
		unsigned char DUMMY[2];							//52~53
  } command;                                  //
  unsigned char Command_string[54];             //
} Command_Set_Type;
Command_Set_Type union_Set_Operation_Mode_Command;
//

typedef union
{
  struct
  {
    unsigned char START_CODE;						//0
    unsigned char MODE;									//1
     unsigned char RTC_DATA[12];					//2~13
     unsigned char CHANNEL_DATA[16][7]; 	//112//14~125
     unsigned char CHANNEL_SUBDATA[16][3]; //48//126~173
    unsigned char STOP_CODE;						//174		
		unsigned char DUMMY[2];							//175~176
  } data;                                  //
  unsigned char Data_string[177];             //
} Measured_Data_Type;
Measured_Data_Type union_One_Measured_Data;

// struct for RTC register
 typedef union
{
	struct
	{
			// byte 0x00, clock seconds and stop bit
			unsigned char sec_unit:4;
			unsigned char sec_10:3;
			unsigned char stop:1;
			// byte 0x01, clock minutes and osc failure bit
			unsigned char min_unit:4;
			unsigned char min_10:3;
			unsigned char osc_fail:1;
			// byte 0x02, clock hours and century bit
			unsigned char hours_unit:4;
			unsigned char hours_10:2;
			unsigned char cent:1;
			unsigned char cent_en:1;
			// byte 0x03, clock day 
			unsigned char day:3;
			unsigned char day_rsvd:5;
			// byte 0x04, clock date
			unsigned char date_unit:4;
			unsigned char date_10:2;
			unsigned char date_rsvd:2;
			// byte 0x05, clock month
			unsigned char month_unit:4;
			unsigned char month_10:1;
			unsigned char month_rsvd:3;
			// byte 0x06, clock year
			unsigned char year_unit:4;
			unsigned char year_10:4;
			// byte 0x07, clock calibration
			unsigned char calibration_cal:5;
			unsigned char calibration_sign:1;
			unsigned char calibration_FT:1;
			unsigned char calibration_out:1;
	}reg;                    //8 bytes
  unsigned char RTC_Reg_string[8];
} RTC_Register_Type;

RTC_Register_Type RTC_register_map; 

volatile uint32_t u32Eint0Counter,u32Eint0SaveCounter;
uint32_t u32ScanRateInSecond;
uint32_t u32SaveRateInSecond;

/////////////////////////////////////////////
//I2C
void Read_RTC_Data(void)
{
			I2C_ReadData(0xD0, 0x0000, RTC_register_map.RTC_Reg_string, 8);
}

int Check_RTC_Dat(void)
{
		int iCheckFlag;
		// check data is correct or not
		// if RTC data is correct, then return 1
		// 			else return 0
		iCheckFlag = 1;
		// second 00~59
		union_One_Measured_Data.data.RTC_DATA[11] = 0x30+(RTC_register_map.reg.sec_unit);
		if ((union_One_Measured_Data.data.RTC_DATA[11]<0x30) || (union_One_Measured_Data.data.RTC_DATA[11]>0x39)) iCheckFlag = 0;
		union_One_Measured_Data.data.RTC_DATA[10] = 0x30+(RTC_register_map.reg.sec_10);
		if ((union_One_Measured_Data.data.RTC_DATA[10]<0x30) || (union_One_Measured_Data.data.RTC_DATA[10]>0x35)) iCheckFlag = 0;
		// minutes 00~60
		union_One_Measured_Data.data.RTC_DATA[9] = 0x30+(RTC_register_map.reg.min_unit);
		if ((union_One_Measured_Data.data.RTC_DATA[9]<0x30) || (union_One_Measured_Data.data.RTC_DATA[9]>0x39)) iCheckFlag = 0;
		union_One_Measured_Data.data.RTC_DATA[8] = 0x30+(RTC_register_map.reg.min_10);
		if ((union_One_Measured_Data.data.RTC_DATA[8]<0x30) || (union_One_Measured_Data.data.RTC_DATA[8]>0x35)) iCheckFlag = 0;
		// hours 00~24
		union_One_Measured_Data.data.RTC_DATA[7] = 0x30+(RTC_register_map.reg.hours_unit);
		if ((union_One_Measured_Data.data.RTC_DATA[7]<0x30) || (union_One_Measured_Data.data.RTC_DATA[7]>0x39)) iCheckFlag = 0;
		union_One_Measured_Data.data.RTC_DATA[6] = 0x30+(RTC_register_map.reg.hours_10);
		if ((union_One_Measured_Data.data.RTC_DATA[6]<0x30) || (union_One_Measured_Data.data.RTC_DATA[6]>0x32)) iCheckFlag = 0;
		// date 00~31
		union_One_Measured_Data.data.RTC_DATA[5] = 0x30+(RTC_register_map.reg.date_unit);
		if ((union_One_Measured_Data.data.RTC_DATA[5]<0x30) || (union_One_Measured_Data.data.RTC_DATA[5]>0x39)) iCheckFlag = 0;
		union_One_Measured_Data.data.RTC_DATA[4] = 0x30+(RTC_register_map.reg.date_10);
		if ((union_One_Measured_Data.data.RTC_DATA[4]<0x30) || (union_One_Measured_Data.data.RTC_DATA[4]>0x33)) iCheckFlag = 0;
		// month 00~12
		union_One_Measured_Data.data.RTC_DATA[3] = 0x30+(RTC_register_map.reg.month_unit);
		if ((union_One_Measured_Data.data.RTC_DATA[3]<0x30) || (union_One_Measured_Data.data.RTC_DATA[3]>0x39)) iCheckFlag = 0;
		union_One_Measured_Data.data.RTC_DATA[2] = 0x30+(RTC_register_map.reg.month_10);
		if ((union_One_Measured_Data.data.RTC_DATA[2]<0x30) || (union_One_Measured_Data.data.RTC_DATA[2]>0x31)) iCheckFlag = 0;
		// year 00~30
		union_One_Measured_Data.data.RTC_DATA[1] = 0x30+(RTC_register_map.reg.year_unit);
		if ((union_One_Measured_Data.data.RTC_DATA[1]<0x30) || (union_One_Measured_Data.data.RTC_DATA[1]>0x39)) iCheckFlag = 0;
		union_One_Measured_Data.data.RTC_DATA[0] = 0x30+(RTC_register_map.reg.year_10);
		if ((union_One_Measured_Data.data.RTC_DATA[0]<0x30) || (union_One_Measured_Data.data.RTC_DATA[0]>0x33)) iCheckFlag = 0;
		
		return iCheckFlag;
}
	//unsigned char *bufff;
void Transfer_RTC_To_ADCII(void)
{

	//unsigned char i;
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
	
	/*for( i=0;i<12;i++){
	bufff =(unsigned char *) union_One_Measured_Data->data->RTC_DATA[i];
	}*/
}
/*
void test_pointer(union_One_Measured_Data *RTC_DATA)
{

	unsigned char i;
		union_One_Measured_Data->data->RTC_DATA[11] = 0x30+(RTC_register_map.reg.sec_unit);
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
	
	for( i=0;i<12;i++){
	bufff =(unsigned char *) union_One_Measured_Data->data->RTC_DATA[i];
	}
}*/
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
	
	//Read_RTC_Data();
		
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
/////////////////////////////////////////////
/////////////////////////////////////////////
/////////////////////////////////////////////
void I2C_Init(void)
{
    /* Open I2C module and set bus clock */
    I2C_Open(I2C0, 100000);
}
/////////////////////////////////////////////
/**
  * @brief Write page data to EEPROM
  * @param u32Addr Address for reading
  * @param pu8Buf The pointer of buffer that data will be written.
  * @return None
  */
void I2C_WriteData(uint8_t u8DeviceAddr, uint32_t u32Addr, uint8_t *pu8Buf, uint32_t u32Size)
{
    int32_t i32Err;
    int32_t i;

    do
    {
        i32Err = 0;

        /* Send start */
        I2C_START(I2C0);
        I2C_WAIT_READY(I2C0);

        /* Send control byte */
        I2C_SET_DATA(I2C0, u8DeviceAddr);
        I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_SI);
        I2C_WAIT_READY(I2C0);
        if(I2C_GET_STATUS(I2C0) == 0x18)
        {
            {
                I2C_SET_DATA(I2C0, u32Addr & 0xFFUL); // low address
                I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_SI);
                I2C_WAIT_READY(I2C0);
                if(I2C_GET_STATUS(I2C0) == 0x28)
                {
                    /* ACK */

                    for(i = 0; i < u32Size; i++)
                    {
                        /* Send data */
                        I2C_SET_DATA(I2C0, pu8Buf[i]); // data
                        I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_SI);
                        I2C_WAIT_READY(I2C0);
                        if(I2C_GET_STATUS(I2C0) == 0x30)
                        {
                          
                            i32Err = 4;
                        }
                    }
                    if(i32Err == 0)
                    {
                        /* Send stop */
                        I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_STO | I2C_I2CON_SI);
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
            /* Send stop */
            I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_STO | I2C_I2CON_SI);

            CLK_SysTickDelay(100);
        }

    }
    while(i32Err);

}
/////////////////////////////////////////////
/**
  * @brief Read data from RTC using sequential read method
  * @param u32Addr Address for reading
  * @param pu8Buf The pointer of buffer that data will be put.
  * @param u32Size Read size
  * @return Actual size that read from EEPROM
  */
uint8_t I2C_ReadData(uint8_t u8DeviceAddr, uint32_t u32Addr, uint8_t *pu8Buf, uint32_t u32Size)
{
    int32_t i32Err;
    int32_t i;

    do
    {
        i32Err = 0;

        /* Send start */
        I2C_START(I2C0);
        I2C_WAIT_READY(I2C0);

        /* Send control byte */
        I2C_SET_DATA(I2C0, u8DeviceAddr);
        I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_SI);
        I2C_WAIT_READY(I2C0);
        if(I2C_GET_STATUS(I2C0) == 0x18)
        {
            // ACK //
/*
            /// Send high address //
            I2C_SET_DATA(I2C0, (u32Addr >> 8) & 0xFFUL); // high address
            I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_SI);
            I2C_WAIT_READY(I2C0);
            if(I2C_GET_STATUS(I2C0) == 0x28)
*/            {
                // ACK //

                // Send low address //
                I2C_SET_DATA(I2C0, u32Addr & 0xFFUL); // low address
                I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_SI);
                I2C_WAIT_READY(I2C0);
                if(I2C_GET_STATUS(I2C0) == 0x28)
                {
                    /* ACK */

                    /* Send data */
                    I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_STA | I2C_I2CON_SI);
                    I2C_WAIT_READY(I2C0);
                    if(I2C_GET_STATUS(I2C0) == 0x10)
                    {
                        /* ACK */

                        /* Send control byte */
                        I2C_SET_DATA(I2C0, u8DeviceAddr|0x01);
                        I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_SI);
                        I2C_WAIT_READY(I2C0);
                        if(I2C_GET_STATUS(I2C0) == 0x40)
                        {
                            for(i = 0; i < u32Size - 1; i++)
                            {
                                I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_SI | I2C_I2CON_AA);
                                I2C_WAIT_READY(I2C0);

                                /* Read data */
                                pu8Buf[i] = I2C_GET_DATA(I2C0);
                            }

                            I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_SI);
                            I2C_WAIT_READY(I2C0);
                            pu8Buf[i] = I2C_GET_DATA(I2C0);

                            /* Send stop */
                            I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_STO | I2C_I2CON_SI);
                        }
                        else
                        {
                            /* NACK */

                            /* Send control read error */
                            i32Err = 5;
                        }
                    }
                    else
                    {
                        /* NACK */

                        /* Send start error */
                        i32Err = 4;
                    }
                }
                else
                {
                    /* NACK */

                    /* Send low address error */
                    i32Err = 3;
                }
            }/*
            else
            {
                // NACK //

                // Send high address error //
                i32Err = 2;
            }*/
        }
        else
        {
            /* NACK */

            /* Send control write error */
            i32Err = 1;

        }

        if(i32Err)
        {
            /* Send stop */
            I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_STO | I2C_I2CON_SI);

            CLK_SysTickDelay(100);
        }

    }
    while(i32Err);

    return u32Size;
}

/////////////////////////////////////////////
/**
  * @brief Write page data to EEPROM : 24CM02, 256K-bytes, A17~A0
  * @param u32Addr Address for reading
  * @param pu8Buf The pointer of buffer that data will be written.
  * @return None
  */
void I2C_24CM02_WriteData(uint8_t u8DeviceAddr, uint32_t u32Addr, uint8_t *pu8Buf, uint32_t u32Size)
{
    int32_t i32Err;
    int32_t i;
		//uint32_t test_address;
		// assembly the memory address
		// device_addr + A2 + A17 + A16
		// A15~A0
		//test_address=(u32Addr >>16);
		//test_address &=0xff;
		//test_address<<=1;
		u8DeviceAddr |= (((u32Addr >>16) & 0x00FF)<<1);
    do
    {
        i32Err = 0;

        /* Send start */
        I2C_START(I2C0);
        I2C_WAIT_READY(I2C0);
//				I2C0->CTL &=~I2C_CTL_STA_SI;
        /* Send control byte */
        I2C_SET_DATA(I2C0, u8DeviceAddr);
        I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_SI);
        I2C_WAIT_READY(I2C0);
        if(I2C_GET_STATUS(I2C0) == 0x18)
        {
            /* Send high address */
            I2C_SET_DATA(I2C0, (u32Addr >> 8) & 0xFFUL); // high address
            I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_SI);
            I2C_WAIT_READY(I2C0);
            if(I2C_GET_STATUS(I2C0) == 0x28)
            {
                /* ACK */

                /* Send low address */
                I2C_SET_DATA(I2C0, u32Addr & 0xFFUL); // low address
                I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_SI);
                I2C_WAIT_READY(I2C0);
                if(I2C_GET_STATUS(I2C0) == 0x28)
                {
                    /* ACK */

                    for(i = 0; i < u32Size; i++)
                    {
                        /* Send data */
                        I2C_SET_DATA(I2C0, pu8Buf[i]); // data
                        I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_SI);
                        I2C_WAIT_READY(I2C0);
                        if(I2C_GET_STATUS(I2C0) == 0x30)
                        {
                          
                            i32Err = 4;
                        }
                    }
                    if(i32Err == 0)
                    {
                        /* Send stop */
                        I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_STO | I2C_I2CON_SI);
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
            /* Send stop */
            I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_STO | I2C_I2CON_SI);

            CLK_SysTickDelay(100);
        }

    }
    while(i32Err);

}
/////////////////////////////////////////////
/**
  * @brief Read data from EEPROM using sequential read method
  * @param u32Addr Address for reading
  * @param pu8Buf The pointer of buffer that data will be put.
  * @param u32Size Read size
  * @return Actual size that read from EEPROM
  */
uint8_t I2C_24CM02_ReadData(uint8_t u8DeviceAddr, uint32_t u32Addr, uint8_t *pu8Buf, uint32_t u32Size)
{
    int32_t i32Err;
    int32_t i;

		// assembly the memory address
		// device_addr + A2 + A17 + A16 +R/W
		// A15~A0
	
			u8DeviceAddr |= (((u32Addr >>16) & 0x00FFUL)<<1);

		
		//
    do
    {
        i32Err = 0;

        /* Send start */
        I2C_START(I2C0);
        I2C_WAIT_READY(I2C0);

        /* Send control byte */
        I2C_SET_DATA(I2C0, u8DeviceAddr);
        I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_SI);
        I2C_WAIT_READY(I2C0);
					//if(!finish)i32Err = 1;
        if(I2C_GET_STATUS(I2C0) == 0x18)//STATUS_TABLE
        {
            // ACK //

            /// Send high address //
            I2C_SET_DATA(I2C0, (u32Addr >> 8) & 0xFFUL); // high address
            I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_SI);
            I2C_WAIT_READY(I2C0);
            if(I2C_GET_STATUS(I2C0) == 0x28)
            {
                // ACK //

                // Send low address //
                I2C_SET_DATA(I2C0, u32Addr & 0xFFUL); // low address
                I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_SI);
                I2C_WAIT_READY(I2C0);
                if(I2C_GET_STATUS(I2C0) == 0x28)
                {
                    /* ACK */

                    /* Send data */
                    I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_STA | I2C_I2CON_SI);
                    I2C_WAIT_READY(I2C0);
                    if(I2C_GET_STATUS(I2C0) == 0x10)
                    {
                        /* ACK */

                        /* Send control byte */
                        I2C_SET_DATA(I2C0, u8DeviceAddr|0x01);
                        I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_SI);
                        I2C_WAIT_READY(I2C0);
                        if(I2C_GET_STATUS(I2C0) == 0x40)
                        {
                            for(i = 0; i < u32Size - 1; i++)
                            {
                                I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_SI | I2C_I2CON_AA);
                                I2C_WAIT_READY(I2C0);

                                /* Read data */
                                pu8Buf[i] = I2C_GET_DATA(I2C0);
                            }

                            I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_SI);
                            I2C_WAIT_READY(I2C0);
                            pu8Buf[i] = I2C_GET_DATA(I2C0);

                            /* Send stop */
                            I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_STO | I2C_I2CON_SI);
                        }
                        else
                        {
                            /* NACK */

                            /* Send control read error */
                            i32Err = 5;
                        }
                    }
                    else
                    {
                        /* NACK */

                        /* Send start error */
                        i32Err = 4;
                    }
                }
                else
                {
                    /* NACK */

                    /* Send low address error */
                    i32Err = 3;
                }
            }
            else
            {
                // NACK //

                // Send high address error //
                i32Err = 2;
            }
        }
        else
        {
            /* NACK */

            /* Send control write error */
            i32Err = 1;

        }

        if(i32Err)
        {
            /* Send stop */
            I2C_SET_CONTROL_REG(I2C0, I2C_I2CON_STO | I2C_I2CON_SI);

            CLK_SysTickDelay(1000);
        }

    }
    while(i32Err);

    return u32Size;
}

/////////////////////////////////////////////
//-----------------------------------------------------------------
//-----------------------------------------------------------------
//- transfer ascii to int
//-----------------------------------------------------------------
//-----------------------------------------------------------------
unsigned int transfer_command_to_variables(unsigned char * byte)//save_time&scan_time
{
	unsigned int i;
	//if((*byte>0x39)||(*byte<0x30))*byte=0x30;
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
	/*
	// scan rate
	u32ScanRateInSecond = union_Set_Operation_Mode_Command.command.SCAN_RATE[0]-0x30;
	u32ScanRateInSecond *= 10;
	u32ScanRateInSecond += union_Set_Operation_Mode_Command.command.SCAN_RATE[1]-0x30;
	u32ScanRateInSecond *= 10;
	u32ScanRateInSecond += union_Set_Operation_Mode_Command.command.SCAN_RATE[2]-0x30;
	u32ScanRateInSecond *= 10;
	u32ScanRateInSecond += union_Set_Operation_Mode_Command.command.SCAN_RATE[3]-0x30;
	// save rate
	u32SaveRateInSecond = union_Set_Operation_Mode_Command.command.SAVE_RATE[0]-0x30;
	u32SaveRateInSecond *= 10;
	u32SaveRateInSecond += union_Set_Operation_Mode_Command.command.SAVE_RATE[1]-0x30;
	u32SaveRateInSecond *= 10;
	u32SaveRateInSecond += union_Set_Operation_Mode_Command.command.SAVE_RATE[2]-0x30;
	u32SaveRateInSecond *= 10;
	u32SaveRateInSecond += union_Set_Operation_Mode_Command.command.SAVE_RATE[3]-0x30;
	*/
}

//==================================================================
//==================================================================
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
//==================================================================
//==================================================================
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
//  delay_time

void delay_time(unsigned int timer)
{
	unsigned int delay_i;
	for(delay_i=0;delay_i<timer;delay_i++){};
}

//////////////////////////////////////////////////////////////////
//INITIAL
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
	//
	return 1;
}
//--------------------------------------------------------
//--------------------------------------------------------
//--------------------------------------------------------
//--------------------------------------------------------
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
//--------------------------------------------------------
//--------------------------------------------------------
//--------------------------------------------------------
//--------------------------------------------------------
void initial_measured_data(void)
{	
	unsigned char i=0,j=0;
	union_One_Measured_Data.data.START_CODE = '#';
	union_One_Measured_Data.data.MODE = 'V';
	//union_One_Measured_Data.data.RTC_DATA = "160805162244";
	
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

////////////////////////////////////////////////////////////////////////////////////////////
void write_eeprom_command_set(void)
{
		I2C_24CM02_WriteData(0xA0, 0x0000, &g_u8CommandData[0], 58);//0 byte commanad
		
}
//
void read_eeprom_command_set(void)
{
		I2C_24CM02_ReadData(0xA0, 0x0000, g_u8CommandData, 58);
	  
}

void write_save_eeprom_address(void)
{
		I2C_24CM02_WriteData(0xA0, 0x0040, &save_eeprom_address_counter[0], 5);//64|177_byte address 
		
}
//
void read_save_eeprom_address(void)
{
		I2C_24CM02_ReadData(0xA0, 0x0040, save_eeprom_address_counter, 5);
	  
}

//---------------------------------------------------------------
//- eeprom space map
//- 1st page : command
//- 2nd page~ last page  : data
//- 24CM02  page size : 256 bytes    1page = 4data
//total size 256Kbytes
//total page 1K       -1024 page
//---------------------------------------------------------------
#define PAGE_SIZE_OF_EEPROM										256// page size
#define TOTAL_SIZE_OF_EEPROM									(256*1023)// all block size
#define DATA_SIZE_OF_EEPROM										(TOTAL_SIZE_OF_EEPROM-PAGE_SIZE_OF_EEPROM)//剩餘大小
//
#ifdef channel_16
#define ONE_COMMAND_DATA_SIZE									256 							//data_size
#else 
#define ONE_COMMAND_DATA_SIZE									64 							//data_size
#endif

#define	MIN_ADDRESS_OF_MEASURED_DATA_MAP			PAGE_SIZE_OF_EEPROM
#define MAX_ADDRESS_OF_MEASURED_DATA_MAP			DATA_SIZE_OF_EEPROM
//
void save_measured_data_to_eeprom(void)//every cycle measured data save it  ,data page ratio 4:1 so can save data abouts 4000//
{
		// save data
		//u32_address_to_save_to_eeprom = 0x31100;

		I2C_24CM02_WriteData(0xA0, u32_address_to_save_to_eeprom, union_One_Measured_Data.Data_string,sizeof(union_One_Measured_Data.Data_string));
		// increase data address
		u32_address_to_save_to_eeprom += ONE_COMMAND_DATA_SIZE;
	
	//I2C_24CM02_ReadData(0xA0, u32_address_to_save_to_eeprom, union_One_Measured_Data.Data_string, sizeof(union_One_Measured_Data.Data_string));
		if (u32_address_to_save_to_eeprom >= DATA_SIZE_OF_EEPROM)
		{
				u32_address_to_save_to_eeprom = MIN_ADDRESS_OF_MEASURED_DATA_MAP;
		}
		//u32_address_to_save_to_eeprom+=ONE_COMMAND_DATA_SIZE;
		save_eeprom_counter++;
		#ifdef channel_16
		if(save_eeprom_counter>=1023){
			save_eeprom_counter=1023;
			printf("1111111111");
		}
		
		#else
		if(save_eeprom_counter>=4091)
			{
			save_eeprom_counter=4091;
			printf("22222222");
		}
		#endif
		Transfer_SAVE_COUNT_ADCII();
		write_save_eeprom_address();//0x0041
}						

void read_measured_data_from_eeprom(void)///////every time read it from eeprom is page0 to last page at last time measure//副函式註解
{		
		uint32_t u32_address;
	Measured_Data_Type union_One_Measured_Data;
	//////////////jared_0224
	//save_eeprom_counter = 1234;
	//Transfer_SAVE_COUNT_ADCII();
		//write_save_eeprom_address();
		
		read_save_eeprom_address();
		save_eeprom_counter=transfer_command_to_variables(&save_eeprom_address_counter[0]);
		u32_address = MIN_ADDRESS_OF_MEASURED_DATA_MAP;
	NVIC_DisableIRQ(EINT0_IRQn);
	//return;
		//
	//finish=1;
		for(u32_address=MIN_ADDRESS_OF_MEASURED_DATA_MAP;u32_address<=((save_eeprom_counter-1)*ONE_COMMAND_DATA_SIZE+MIN_ADDRESS_OF_MEASURED_DATA_MAP);u32_address+=ONE_COMMAND_DATA_SIZE)
		{
			// read data
			
			I2C_24CM02_ReadData(0xA0, u32_address, union_One_Measured_Data.Data_string, sizeof(union_One_Measured_Data.Data_string));
			delay_time(10000);
			printf("\n%s-Data\n",union_One_Measured_Data.Data_string);	
			delay_time(10000);
		}
		
		//finish=0;
		NVIC_EnableIRQ(EINT0_IRQn);
}
/**************************************************************************************************************FFT_test/////////////////////////////////////////////////////////////////////////////////////////////////////////
#define N           128 
#define POWER       6	//?值代表了?入?据首先被放大的倍?，放大倍??2^POWER 
#define P_COEF      8	//?值代表了旋?因子被放大的倍?，放大倍??2^POWER 
#if (N == 4) #define L           2//L的定??足L = log2(N) 
#elif (N == 8) #define L           3//L的定??足L = log2(N) 
#elif (N == 16) #define L           4//L的定??足L = log2(N) 
#elif (N == 32) #define L           5//L的定??足L = log2(N) 
#elif (N == 64) #define L           6//L的定??足L = log2(N) 
#elif (N == 128) #define L           7//L的定??足L = log2(N)
#endif   //AD采?位??12位，本可以采用s16 x[N]定??据空?，但是?了?省存?空?，
fft?果也?存?在??量空?。由于受 //fft影??量需要重新定?，定?的方式及具体原因如下： //fft?程?乘以?大旋?因子，
因此需要32位定? //fft?程??生??，因此需要有符?定? //fft?程?出?复?，因此需要定?二???，[][0]存放?部，
[][1]存放?部 
s32 x[N][2] = {};  //定?*p[N]是?了在第一次指?初始化以后，???指?按照位倒序指向?据?量x //p[i][0]代表了指向?据的?部，
p[i][1]代表了指向?据的?部 
s32 *p[N];  //定?旋?因子矩? //旋?因子矩?存?了wn^0,wn^1,wn^2...wn^(N/2-1)?N/2?复?旋?因子  
									s16 w[N>>1][2] = {256,0,256,-13,255,-25,253,-38,251,-50,248,-62,245,-74,241,-86,237,-98,231,-109,226,
                  -121,220,-132,213,-142,206,-152,198,-162,190,-172,181,-181,172,-190,162,-198,152,
                  -206,142,-213,132,-220,121,-226,109,-231,98,-237,86,-241,74,-245,62,-248,50,-251,38,
                  -253,25,-255,13,-256,0,-256,-13,-256,-25,-255,-38,-253,-50,-251,-62,-248,-74,-245,-86,
                  -241,-98,-237,-109,-231,-121,-226,-132,-220,-142,-213,-152,-206,-162,-198,-172,-190,-181,
                  -181,-190,-172,-198,-162,-206,-152,-213,-142,-220,-132,-226,-121,-231,-109,-237,-98,-241,
                  -86,-245,-74,-248,-62,-251,-50,-253,-38,-255,-25,-256,-13}; 
s32 x[N];									
void init_pointer(void) {      
unsigned char i = 0;   
unsigned char j = 0;   
unsigned char k = 0;      
for(i = 0; i < N; i++)   
{  
j = 0;      
for(k = 0; k < L; k++) 
{
j |= (((i >> k)&0x01)<<(L-k-1));      
}       p[i] = &x[j][0];    

} 

																	}    // *description:基2fft主函?,?函??借助指???p?全局?量??x?行fft?算 *            并??果存?在??x中 *global var:rw->x; r->p,w。(r表示?，w表示?，rw表示??) 
void fft2(void) {  
u8 i;//i用于表示蝶形???的??   
u8 j;//表示蝶形分?起始?序列，蝶形分?跨度?2^i   
u8 k;//k表示蝶形??偶?分支序列??   
u8 gp_distance = 1;//蝶形分?跨度  
u8 temp;//temp用于???前??距离的一半,同?也表示了同一碟形?分支?的距离  
u8 gp_hf = 0;//???前?的中??序?   
u8 delta = N;//旋?因子下?增量，本?下?初始值???N/2，但是。。    
s16 *pw = &(w[0][0]);   
int tp_result[2];       //用于??存放旋?因子和奇?分?的乘?    //?入信?序列放大   
for(i = 0; i < N; i++)  
{ 
x[i][0] <<= POWER;      x[i][1] <<= POWER;  
}     for(i = 0; i < L; i++)   
			{  
			temp = gp_distance;      gp_distance <<= 1;     
				for(j = 0; j < N; j+=gp_distance)     
				{  		gp_hf = temp + j; 
								pw = &(w[0][0]);
				for(k = j; k < gp_hf; k++)//完成一??的所有蝶形?算 
		{  //蝶形?算中的一?复?乘法?程            
					tp_result[0] = pw[0] * (p[k+temp][0]) - pw[1] * (p[k+temp][1]);
					tp_result[1] = pw[0] * (p[k+temp][1]) + pw[1] * (p[k+temp][0]); 
					tp_result[0] >>= P_COEF; 
					tp_result[1] >>= P_COEF;            //蝶形?算中的2?复?加法?程            
					p[k+temp][0] = p[k][0] - tp_result[0];            
					p[k+temp][1] = p[k][1] - tp_result[1];            
					p[k][0] += tp_result[0];            
					p[k][1] += tp_result[1];                        
					pw += delta;         
		}           
}      
delta >>= 1;   
} 
								}
***********************************************************************************************************************************/
////////////////////////////////////////////function_LTC11856/////////////////////////////////////////////////////////
	#ifdef _LTC1856_
	void LTC1856_Ini(void)
	{
		ADC_1856_CNV=0;
		ADC_1856_BUSY=0;
		ADC_1856_DO=0;
		ADC_1856_SCK=0;
		ADC_1856_DI=0;
		ADC_1856_RD=0;
	}
	/////////////////////////////////////////////////////////////////////////////////////////type:0->Diff,type:1->Single-END/////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////channel:1-8; type0:1-4,type1:1-8/////////////////////////////////////////////////////////////////////////////////////////
 long int LTC1856_data_ac(char channel,char type)
	{
		 int data=0;
		char o,cmd_8bits,cmd_7bit,cmd_5bits;
		channel-=1;
		if(type)
		{
				if(channel%2)
				{
					cmd_7bit =1;
				}
					else
					{
							cmd_7bit =0;
					}
					cmd_5bits = channel/2;
		}
		else
		{
			cmd_7bit=0;
			
		}
		cmd_8bits = type<<7+cmd_7bit<<6+cmd_5bits<<4;
		///////////////////////////////////////////////////////DI_cmd
		
		ADC_1856_CNV=1;
		delay_time(1);
		ADC_1856_CNV=0;
		while(ADC_1856_BUSY);
		for(o=0;o<18;o++)
		{
			ADC_1856_SCK=1;
			if(ADC_1856_DO)
					data +=1;
			ADC_1856_SCK=0;
			data <<= 1;
			
		}
		if(data<=131072)
			data=data;
		else{
			data=0-(262144-data);
					/////////////////////////////////////////////////////////////////////20160908////////////////////////////////////////////////
		}
		
		return(data);
	}
	
	#endif
	///////////////////////////////////////////ADS8320/////////////////////////////////////////////////////////
#ifdef _ADS8320_


//function_ADS8320
void init_ext_ad()
{
		ADS8320_CS = 1;
		ADS8320_CLK = 1;
}


unsigned int read_ext_adc()
{
		int i;
		unsigned int data;
	
		data = 0;
		ADS8320_CS = 0;
	  ADS8320_CLK = 1;
		for(i=0;i<5;i++) // take sample and send start bit
		{
			ADS8320_CLK = 0;
			delay_time(15);
			ADS8320_CLK = 1;
			delay_time(13);
			
		}
		for(i=0;i<16;i++) // read 16-bits data back
		{
			ADS8320_CLK = 0;
			delay_time(15);
			if (ADS8320_DOUT)
				data += 1;
			ADS8320_CLK = 1;
			data <<= 1;
			delay_time(13);
			
		}
		ADS8320_CS = 1;
		for(i=0;i<5;i++) // take sample and send start bit
		{
			ADS8320_CLK = 0;
			delay_time(15);
			ADS8320_CLK = 1;
			delay_time(13);
			}
		
	  
		//for(i=0;i<100;i++) // take sample and send start bit
		//{
			//ADS8320_CLK = 0;
			//ADS8320_CLK = 1;
		//}
		
		return(data);
		//delay_time(10);	
}
#endif

/////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////DAC/////////////////////////////////////////////////////////////////////
#ifdef _DAC714_
void initial_DAC(void)
{

 DAC714_CLK=0;
 DAC714_A0=1;		
 DAC714_SDI=0;	
 DAC714_A1=1;	
}
void DAC714_out(uint16_t value)
{
	uint8_t i;
	DAC714_A0=0;

			for(i=0;i<16;i++)
			{
				DAC714_CLK= 1;
				delay_time(50);
				DAC714_SDI=(value>>(15-i))%2;
				
				DAC714_CLK= 0;
				delay_time(60);
				
			}	
			
	DAC714_A0=1;		
	DAC714_A1=0;
	delay_time(50);		
	DAC714_A1=1;		
}
#endif
// FUNCTION
//  reset gain
void RESET_Gain(void)
{
		gucGainTableIndex = 0;
		u32iPortStatus = GPIO_GET_IN_DATA(P2);
		u32iPortStatus &= 0xfff8;  // clear gain scaler bits P2[2:0]
		//P13 = 0;
		//P12 = 0;
		//P11 = 1;
		//P10 = 0;
		u32iPortStatus |= gucGainTable[gucGainTableIndex];
		GPIO_SET_OUT_DATA (P2,u32iPortStatus);
}
void SET_Gain(unsigned char index)
{
		u32iPortStatus = GPIO_GET_IN_DATA(P2);
		u32iPortStatus &= 0xfff8;  // clear gain scaler bits P2[3:0]
		u32iPortStatus |= gucGainTable[index];
		GPIO_SET_OUT_DATA (P2,u32iPortStatus);
}

				/**/
    /* Write Demo */
   // u32Data = 0x12345678;
				
   // FMC_Write(u32Addr, u32Data);
	
			
void SYS_Init(void)
{
    /*---------------------------------------------------------------------------------------------------------*/
    /* Init System Clock                                                                                       */
    /*---------------------------------------------------------------------------------------------------------------*/
    /* Enable IRC22M clock */
    CLK->PWRCON |= CLK_PWRCON_IRC22M_EN_Msk;

    /* Waiting for IRC22M clock ready */
    CLK_WaitClockReady(CLK_CLKSTATUS_IRC22M_STB_Msk);

    /* Switch HCLK clock source to HIRC */
    CLK->CLKSEL0 = CLK_CLKSEL0_HCLK_S_HIRC;

    /* Set PLL to Power-down mode and PLL_STB bit in CLKSTATUS register will be cleared by hardware.*/
    CLK->PLLCON |= CLK_PLLCON_PD_Msk;

    /* Enable external 12 MHz XTAL, IRC10K */
    CLK->PWRCON |= CLK_PWRCON_XTL12M_EN_Msk | CLK_PWRCON_OSC10K_EN_Msk;

    /* Enable PLL and Set PLL frequency */
    CLK->PLLCON = PLLCON_SETTING;

    /* Waiting for clock ready */
    CLK_WaitClockReady(CLK_CLKSTATUS_PLL_STB_Msk | CLK_CLKSTATUS_XTL12M_STB_Msk | CLK_CLKSTATUS_IRC10K_STB_Msk);

    /* Switch HCLK clock source to PLL, STCLK to HCLK/2 */
    CLK->CLKSEL0 = CLK_CLKSEL0_STCLK_S_HCLK_DIV2 | CLK_CLKSEL0_HCLK_S_PLL;

    /* Enable peripheral clock */
    CLK->APBCLK = CLK_APBCLK_UART0_EN_Msk |
                  CLK_APBCLK_TMR0_EN_Msk | CLK_APBCLK_TMR1_EN_Msk | CLK_APBCLK_TMR2_EN_Msk | CLK_APBCLK_TMR3_EN_Msk |
                  CLK_APBCLK_I2C_EN_Msk;;

    /* Peripheral clock source */
    CLK->CLKSEL1 = CLK_CLKSEL1_UART_S_PLL |
                   CLK_CLKSEL1_TMR0_S_HXT | CLK_CLKSEL1_TMR1_S_HCLK ;
		CLK_EnableModuleClock(ADC_MODULE);
    CLK_SetModuleClock(ADC_MODULE, CLK_CLKSEL1_ADC_S_HIRC, CLK_CLKDIV_ADC(7));
    /* Update System Core Clock */
    /* User can use SystemCoreClockUpdate() to calculate PllClock, SystemCoreClock and CycylesPerUs automatically. */
    SystemCoreClockUpdate();
    
    /*---------------------------------------------------------------------------------------------------------*/
    /* Init I/O Multi-function                                                                                 */
    /*---------------------------------------------------------------------------------------------------------*/

    /* Set P3 multi-function pins for UART0 RXD and TXD */
    /* Set P3 multi-function pins for UART0 RXD, TXD, and T1EX */
    SYS->P3_MFP &= ~(SYS_MFP_P30_Msk | SYS_MFP_P31_Msk|SYS_MFP_P33_Msk|SYS_MFP_P32_Msk);
    SYS->P3_MFP = SYS_MFP_P30_RXD0 | SYS_MFP_P31_TXD0 | SYS_MFP_P32_INT0 | SYS_MFP_P33_T1EX ;

    /* Configure the SDA0 & SCL0 of I2C0 pins */
    SYS->P3_MFP &= ~(SYS_MFP_P34_Msk | SYS_MFP_P35_Msk);
    SYS->P3_MFP |= SYS_MFP_P34_SDA0 | SYS_MFP_P35_SCL0;
		//////////////////////////////////////////////////VW_V2
		GPIO_DISABLE_DIGITAL_PATH(P1, BIT0|BIT1|BIT6);
		SYS->P1_MFP &= ~(SYS_MFP_P10_Msk | SYS_MFP_P11_Msk|SYS_MFP_P16_Msk);
    SYS->P1_MFP |= SYS_MFP_P10_AIN0|SYS_MFP_P11_AIN1|SYS_MFP_P16_AIN6;
		
		// P3.2 as int0
		// P3.2 as int0
     P3->IMD |= (GPIO_IMD_EDGE << 2);
     P3->IEN |= (BIT2 << GPIO_IEN_IF_EN_Pos);
    
}
void AdcSingleModeTest(void)
{
	//float uint32PowerData=0;
	bat_AD_data=0,DC_12V_AD_data=0,thermal_AD_data=0;
	//bat_data=0;
           //uint32_t  i32ConversionData;
 /* Set the ADC operation mode as single, input mode as single-end and enable the analog input channel 7 */
            ADC_Open(ADC, ADC_ADCR_DIFFEN_SINGLE_END, ADC_ADCR_ADMD_SINGLE_CYCLE,0x43);
						//ADC_Open(ADC, ADC_ADCR_DIFFEN_SINGLE_END, ADC_ADCR_ADMD_SINGLE, 0x1<<0);
					//ADC_Open(ADC, ADC_ADCR_DIFFEN_SINGLE_END, ADC_ADCR_ADMD_SINGLE, 0x1<<6);
            /* Power on ADC module */
            ADC_POWER_ON(ADC);

            /* clear the A/D interrupt flag for safe */
            ADC_CLR_INT_FLAG(ADC, ADC_ADF_INT);

            /* Enable the ADC interrupt */
            ADC_EnableInt(ADC, ADC_ADF_INT);
            NVIC_EnableIRQ(ADC_IRQn);

            /* Reset the ADC interrupt indicator and Start A/D conversion */
            g_u32AdcIntFlag = 0;
            ADC_START_CONV(ADC);

            /* Wait ADC interrupt (g_u32AdcIntFlag will be set at IRQ_Handler function)*/
            while(g_u32AdcIntFlag == 0);

            /* Disable the ADC interrupt */
            ADC_DisableInt(ADC, ADC_ADF_INT);

            /* Get the conversion result of the ADC channel 7 */
            bat_AD_data = ADC_GET_CONVERSION_DATA(ADC, 0);////////////////////////////////////////////////////////////dry battary
						DC_12V_AD_data = ADC_GET_CONVERSION_DATA(ADC, 1);////////////////////////////////////////////////////////////DC_12V
						
						
						thermal_AD_data = ADC_GET_CONVERSION_DATA(ADC, 6);////////////////////////////////////////////////////////////thermal 

						DC_12V_AD_data=DC_12V_AD_data/4096*3.3333*4.024;
						bat_AD_data=(bat_AD_data/4096)*3.3333;
						thermal_AD_data=(thermal_AD_data/4096)*3.3333/1.22;
						
						thermal_AD_data=(120 -196.12 * thermal_AD_data +214.51 * thermal_AD_data*thermal_AD_data -151.07 * thermal_AD_data * thermal_AD_data * thermal_AD_data +55.748 * thermal_AD_data *thermal_AD_data *thermal_AD_data *thermal_AD_data -8.5429 * thermal_AD_data *thermal_AD_data*thermal_AD_data*thermal_AD_data*thermal_AD_data);
	
}
	void ADC_IRQHandler(void)
{
	g_u32AdcIntFlag = 1;
    ADC_CLR_INT_FLAG(ADC, ADC_ADF_INT); /* clear the A/D conversion flag */
}
void UART0_Init(void)
{
    /*---------------------------------------------------------------------------------------------------------*/
    /* Init UART                                                                                               */
    /*---------------------------------------------------------------------------------------------------------*/
    /* Reset UART */
    SYS_ResetModule(UART0_RST);
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
    /* Configure UART0 and set UART0 Baudrate */
    UART_Open(UART0, uart_BR);
}
/*---------------------------------------------------------------------------------------------------------*/
/* ISR to handle UART Channel 0 interrupt event                                                            */
/*---------------------------------------------------------------------------------------------------------*/
void UART0_IRQHandler(void)
{
    UART_TEST_HANDLE();
}
/*---------------------------------------------------------------------------------------------------------*/
/* UART Callback function                                                                                  */
/*---------------------------------------------------------------------------------------------------------*/
#ifdef channel_16

void UART_TEST_HANDLE()
{
    uint8_t u8InChar = 0xFF;
    uint32_t u32IntSts = UART0->ISR;
	
    if(u32IntSts & UART_ISR_RDA_INT_Msk)
    {
        //printf("\nInput:");

        /* Get all the input characters */
        while(UART_IS_RX_READY(UART0))
        {
            /* Get the character from UART Buffer */
            u8InChar = UART_READ(UART0);
						//printf("%c",u8InChar);
							if(u8InChar==0x0D)
							{
								wakeup^=1;
								if(wakeup)
								{	
								printf("\tCommand Enable\n");	
									//wake_count=1;
							}
								else{
							//	gucUartReceivePointer=0;		
									//wake_count=0;
								printf("\tCommand Disable\n");
								}
							}
						if (gucUartReceivePointer > 70) // max command set length is 60 bytes 
						{
							gucUartReceivePointer = 0;
						}
						//-------------------------------
				/*		if(wakeup)
							u8InChar = UART_READ(UART0);
						else{
						u8InChar=0x00;
						}*/
						//--------------------------------
					
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
									gucUartReceivePointer = 80;// max command set length is 23 bytes
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
									gucUartReceivePointer = 80;// max command set length is 23 bytes
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
									gucUartReceivePointer = 80;// max command set length is 23 bytes
									printf("ERROR\n");
									NVIC_EnableIRQ(EINT0_IRQn);	
								}
						}
						
						if(gucUartReceivePointer == 4)
						{
							if ((u8InChar == 'R')||(u8InChar=='V')||(u8InChar=='D')||(u8InChar=='A')||(u8InChar=='C')||(u8InChar=='U')||(u8InChar=='T')||(u8InChar=='S')||(u8InChar=='K')||(u8InChar=='B')||(u8InChar=='N')||(u8InChar=='O')||(u8InChar=='I')) // R,T,VDAC,U,S MODE K:change unit  B:change burd rate
								{
										g_u8RecData[gucUartReceivePointer] = u8InChar;
										gucUartCommandType = u8InChar;
								}else
								{
										gucUartReceivePointer = 80; // unknow command, restart command protocol
									printf("ERROR\n");
									NVIC_EnableIRQ(EINT0_IRQn);	
								}
						}
						if(gucUartReceivePointer == 5)
						{
								if((gucUartCommandType == 'R') ||(gucUartCommandType == 'U')||(gucUartCommandType == 'S')||(gucUartCommandType=='K')||(gucUartCommandType=='B')||(gucUartCommandType=='N')||(gucUartCommandType=='O')||(gucUartCommandType=='I'))
								{
									if (u8InChar == 'E') // stop code
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
										else if(g_u8CommandData[4] =='K')//0:HZ,1:DG,2:coef
										{
											unit_counter++;
											if(unit_counter>3)unit_counter=0;
										}
										else if(g_u8CommandData[4] =='B')//1:9600,2:19200,3:38400,4:115200:
										{
											BR_count++;
											if(BR_count>4)BR_count=1;
											SYS_UnlockReg();
											UART0_Init();
											SYS_LockReg();	
											
										}
											else if(g_u8CommandData[4] =='N')//Now meassure
										{
											g_uEint0_Scan_Event_Flag=1;
											
										}
										else if(g_u8CommandData[4] =='O')//Real Time output 
										{
											
											Read_RTC_Data();
											Transfer_RTC_To_ADCII();	
											printf("Device Real Time:%s\n",union_One_Measured_Data.data.RTC_DATA);	
										}
										else if(g_u8CommandData[4] =='I')//Information
										{
											 printf("\n+-------------------------------------------------+\n");
											printf("|Welcome To Geotech Science|\n");
											printf("|This is The Device : Minilogger_16Channel|\n");
											printf("|The Firmware Version:mini_17.09.v3|\n");//20170429-v17.05.1
											printf("+-------------------------------------------------+\n\n");
										}
										
										//printf("#OKE");
										//printf("%s\n",g_u8RecData);
										gucUartReceivePointer = 80;
										
										gucUartCommandType = 0x00;
									}else
									{
										gucUartReceivePointer = 80; // unknow command, restart command protocol
										NVIC_EnableIRQ(EINT0_IRQn);	
									}
								}else if((u8InChar >='0') && (u8InChar <= '9')) // add other command set here below 
								{
										g_u8RecData[gucUartReceivePointer] = u8InChar;
								}
								else
								{
										gucUartReceivePointer = 80; // unknow command, restart command protocol
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
										gucUartReceivePointer = 80; // unknow command, restart command protocol
									printf("ERROR\n");
									NVIC_EnableIRQ(EINT0_IRQn);	
								}
						}
						if (gucUartReceivePointer ==51)
						{
								if (u8InChar == 'E') // stop code
									{
										g_u8RecData[gucUartReceivePointer] = u8InChar;
										g_u8RecData[gucUartReceivePointer+1] = 0x00;
										//printf("**");
										//printf("%s\n",g_u8RecData);
										wakeup=1;
										gucUartCommandSucceed = 1;
										COPY_UART_COMMAND_DATA();
										gucUartReceivePointer = 80;
										gucUartCommandType = 0x00;
										printf("\t Com_UART_OK \0\n");
										wakeup=0;
									}else
									{
										gucUartReceivePointer = 80; // unknow command, restart command protocol
										printf("ERROR\n");
										NVIC_EnableIRQ(EINT0_IRQn);	
									}
						}
						//}//
						// increase pointer
						if(wakeup)
						gucUartReceivePointer++;
        }//while_end
    }//Msk_end
}//handle_end
#else
void UART_TEST_HANDLE()
{
    uint8_t u8InChar = 0xFF;
    uint32_t u32IntSts = UART0->ISR;

    if(u32IntSts & UART_ISR_RDA_INT_Msk)
    {
        //printf("\nInput:");

        /* Get all the input characters */
        while(UART_IS_RX_READY(UART0))
        {
            /* Get the character from UART Buffer */
            u8InChar = UART_READ(UART0);
						//printf("%c",u8InChar);
						//NVIC_DisableIRQ(EINT0_IRQn);
						if (gucUartReceivePointer > 30) // max command set length is 30 bytes 
						{
							gucUartReceivePointer = 0;
						}
					
						if(u8InChar == '*')
						{
								gucUartReceivePointer = 0;
								g_u8RecData[gucUartReceivePointer] = u8InChar;
								NVIC_DisableIRQ(EINT0_IRQn);
						}
					
						if (gucUartReceivePointer == 1)
						{
								if(u8InChar == 'M')
								{
									g_u8RecData[gucUartReceivePointer] = u8InChar;
								}else
								{
									gucUartReceivePointer = 50;// max command set length is 23 bytes
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
									gucUartReceivePointer = 50;// max command set length is 23 bytes
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
									gucUartReceivePointer = 50;// max command set length is 23 bytes
									printf("ERROR\n");
									NVIC_EnableIRQ(EINT0_IRQn);	
								}
						}
						
						if(gucUartReceivePointer == 4)
						{
								if ((u8InChar == 'R')||(u8InChar=='V')||(u8InChar=='D')||(u8InChar=='A')||(u8InChar=='C')||(u8InChar=='U')||(u8InChar=='T')||(u8InChar=='S')) // R,T,VDAC,U,S MODE
								{
										g_u8RecData[gucUartReceivePointer] = u8InChar;
										gucUartCommandType = u8InChar;
								}else
								{
										gucUartReceivePointer = 60; // unknow command, restart command protocol
									printf("ERROR\n");
									NVIC_EnableIRQ(EINT0_IRQn);	
								}
						}
						if(gucUartReceivePointer == 5)
						{
								if((gucUartCommandType == 'R') ||(gucUartCommandType == 'U')||(gucUartCommandType == 'S'))
								{
									if (u8InChar == 'E') // stop code
									{
										g_u8RecData[gucUartReceivePointer] = u8InChar;
										g_u8RecData[gucUartReceivePointer+1] = 0x00;
										//
										gucUartCommandSucceed = 1;
										COPY_UART_COMMAND_DATA();
										if(g_u8CommandData[4] == 'S'){
												SYS_UnlockReg();
												SYS_ResetCPU();
										}
										//printf("#OKE");
										//printf("%s\n",g_u8RecData);
										gucUartReceivePointer = 100;
										gucUartCommandType = 0x00;
									}else
									{
										gucUartReceivePointer = 70; // unknow command, restart command protocol
										NVIC_EnableIRQ(EINT0_IRQn);	
									}
								}else // add other command set here below 
								{
										g_u8RecData[gucUartReceivePointer] = u8InChar;
								}
						}
						if ((gucUartReceivePointer >= 6)&&(gucUartReceivePointer<27))
						{
								if ((u8InChar >='0') && (u8InChar <= '9'))
								{
									g_u8RecData[gucUartReceivePointer] = u8InChar;
								}else
								{
										gucUartReceivePointer = 80; // unknow command, restart command protocol
									printf("ERROR\n");
									NVIC_EnableIRQ(EINT0_IRQn);	
								}
						}
						if (gucUartReceivePointer == 27)
						{
								if (u8InChar == 'E') // stop code
									{
										g_u8RecData[gucUartReceivePointer] = u8InChar;
										g_u8RecData[gucUartReceivePointer+1] = 0x00;
										//printf("**");
										//printf("%s\n",g_u8RecData);
										//
										gucUartCommandSucceed = 1;
										COPY_UART_COMMAND_DATA();
										gucUartReceivePointer = 100;
										gucUartCommandType = 0x00;
										printf("\t Com_UART_OK\n");
									}else
									{
										gucUartReceivePointer = 90; // unknow command, restart command protocol
										printf("ERROR\n");
										NVIC_EnableIRQ(EINT0_IRQn);	
									}
						}
						// increase pointer
						gucUartReceivePointer++;
        }
    }
}
#endif
/**
 * @brief       Timer0 IRQ
 *
 * @param       None
 *
 * @return      None
 *
 * @details     The Timer0 default IRQ, declared in startup_M051Series.s.
 */
void TMR0_IRQHandler(void)
{  
			
			char i;
    if(TIMER_GetIntFlag(TIMER0) == 1)
    {
        /* Clear Timer0 time-out interrupt flag */
			
        TIMER_ClearIntFlag(TIMER0);
				uiTimerCounter++;
			
			if(select_type =='A')GPIO_SET_OUT_DATA (P0,0x80);
			
			// add check time-out function
			if (timer0_check == 'T')
			{
					if (uiTimerCounter >= 1)// 100ms*1=100ms
					{
						g_au32TMRINTCount[1] = 200; // set 60 to exit while loop in main
					}
			}
			if ((select_type =='D')||(select_type =='A')||(select_type =='S')||(select_type =='C'))
			{
				if (select_type =='S')
				{
						
							if(u32iOutputVoltage>0x80)
							GPIO_SET_OUT_DATA (P0,u32iOutputVoltage);	
							else{
							GPIO_SET_OUT_DATA (P0,0x80);	
							}							
						
					
					
					if (uiTimerCounter>1)
					{
						
						
						if (n_counter <= n_max_counter){							
							/*gucT0Index++;
								TIMER0->TCMPR = guiTimer0Period[gucT0Index];								
									uiTimerCounter = 0;*/
							/////////////////////////////////////////////////////////////////////////////////////////
							n_counter+=30;
							
						if(Hz_data>0)
						{				
						if(select_freq_range==2||select_freq_range==3)
							{
								TIMER0->TCMPR = __HXT/n_counter;
							}
							else{
										TIMER0->TCMPR = __HXT/n_counter;
										}
						}
						else{
						TIMER0->TCMPR = __HXT/n_counter;
						}
						uiTimerCounter = 0;
					//////////////////////////////////////////////////////////////////////////////////////////////
																								}
						else
						{
							GPIO_SET_OUT_DATA (P0,0x80);
							//u32iOutputVoltage=0x80;
						}
						

					}
				}
		
				
				else if(select_type =='A')
					{

					if(gucOutputVoltagePeak==0x66)
					{
						
							
							GPIO_SET_OUT_DATA (P0,u32iOutputVoltage);//67-
						delay_time(800);	//800			
						GPIO_SET_OUT_DATA (P0,0xff-u32iOutputVoltage);//98+
						delay_time(1000);//7000
						for(i=0;i<5;i++){uiAdc8320Value += read_ext_adc();}
						delay_time(1000);
						GPIO_SET_OUT_DATA (P0,0x80);//160us
						delay_time(300);
						uiAdc8320Value_offset += read_ext_adc();
						//ADS8320_CS=0;/////////////////////////////////////////////////////////////////////////////
						delay_time(300);
						//ADS8320_CS=0;////////////////////////////////////////////////////////////////////////////201607
						GPIO_SET_OUT_DATA (P0,u32iOutputVoltage);//67-
						delay_time(1000);//7000
						for(i=0;i<5;i++){uiAdc8320Value += read_ext_adc();}
						delay_time(1000);
						GPIO_SET_OUT_DATA (P0,0x80);
						delay_time(1600);//1600
						GPIO_SET_OUT_DATA (P0,0xff-u32iOutputVoltage);//98+
						
						//uiAdc8320Value += read_ext_adc();
						delay_time(800);
						GPIO_SET_OUT_DATA (P0,0x80);
						
							
							
							
						}else{
							
							if(u32iOutputVoltage < 0x80) 
									{
										u32iOutputVoltage = 0xff-u32iOutputVoltage;
										GPIO_SET_OUT_DATA (P0,u32iOutputVoltage);
										uiAdc8320Value += read_ext_adc();
										}else if (u32iOutputVoltage>=0x80)
											{
											u32iOutputVoltage = 0xff-u32iOutputVoltage;
												GPIO_SET_OUT_DATA (P0,u32iOutputVoltage);
												uiAdc8320Value_offset += read_ext_adc();
												}
											
									}
					
									
			}
					else if(select_type =='D')
					{
					   GPIO_SET_OUT_DATA (P0,0xff-u32iOutputVoltage);	
							//GPIO_SET_OUT_DATA (P0,0x80);
					}
					else if(select_type =='C')
					{
					   GPIO_SET_OUT_DATA (P0,0xff-u32iOutputVoltage);
						
						
							//GPIO_SET_OUT_DATA (P0,0x80);
						
					}	
					
				if (select_type =='S')
				{
					if(u32iOutputVoltage <= 0x80) 
					{
						//u32iOutputVoltage=0x80;
						u32iOutputVoltage = 0xff-u32iOutputVoltage;
					if(n_counter>=n_max_counter)
						GPIO_SET_OUT_DATA (P0,0x80);
					}else if (u32iOutputVoltage>0x80)
					{
						
						u32iOutputVoltage = 0xff-u32iOutputVoltage;
						//u32iOutputVoltage=0x80;
						if(n_counter>=n_max_counter)
							GPIO_SET_OUT_DATA (P0,0x80);
					}
					
					
				}
			}
		}//else{GPIO_SET_OUT_DATA (P0,0x80);}
 if(select_type =='A'){
		if(uiTimerCounter>=stri_counter){
														TIMER_Stop(TIMER0);
														u32iOutputVoltage=0x80;
														GPIO_SET_OUT_DATA (P0,u32iOutputVoltage);
														//if(uiTimerCounter<50)
														uiAdc8320Value_f =(float)uiAdc8320Value/(uiTimerCounter*10);
														uiAdc8320Value_f_offset =(float)uiAdc8320Value_offset/(uiTimerCounter);
														uiAdc8320Value_ac = uiAdc8320Value_f-uiAdc8320Value_f_offset;
														uiAdc8320Value=0;
														uiAdc8320Value_offset=0;
															}		
											}

						
    														
}

/**
 * @brief       Timer1 IRQ
 *
 * @param       None
 *
 * @return      None
 *
 * @details     The Timer1 default IRQ, declared in startup_M051Series.s.
 */
void TMR1_IRQHandler(void)
{
    if(TIMER_GetCaptureIntFlag(TIMER1) == 1)
    {
				//ADS8320_CLK = ~ADS8320_CLK;
        /* Clear Timer1 capture interrupt flag */
        TIMER_ClearCaptureIntFlag(TIMER1);

        g_au32TMRINTCount[1]++;
			if(u32InitCount>=300)u32InitCount=300;
			g_au32TMR1Count[u32InitCount++] = TIMER_GetCaptureData(TIMER1);
			//TIMER_GetCounter(TIMER1)
			///*
			if (g_au32TMRINTCount[1]%2)
				TIMER_EnableCapture(TIMER1,TIMER_CAPTURE_FREE_COUNTING_MODE , TIMER_CAPTURE_RISING_EDGE);
			else
				TIMER_EnableCapture(TIMER1,TIMER_CAPTURE_COUNTER_RESET_MODE , TIMER_CAPTURE_RISING_EDGE);
			//*/
    }
}
void EINT0_IRQHandler(void)
{
    // For P3.2, clear the INT flag //
    GPIO_CLR_INT_FLAG(P3, BIT2);
		
		if (u32Eint0Counter>=(u32ScanRateInSecond))
		{
				g_uEint0_Scan_Event_Flag = 1; // set command successful flag
				u32Eint0Counter = 0;
			//ANALOG_POWERMOS_PIN = 1;
				//Read_RTC_Data();
				//printf("EINT0 Interrupt!\n");	
				//printf("%s\n",union_One_Measured_Data.string);
		}
		if (u32Eint0SaveCounter>=(u32SaveRateInSecond))
		{
				g_uEint0_Save_Event_Flag = 1; // set command successful flag
				u32Eint0SaveCounter = 0;
				//printf("EINT0 Interrupt!\n");	
				//printf("%s\n",union_One_Measured_Data.string);
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
/*---------------------------------------------------------------------------------------------------------*/
/* MAIN function                                                                                           */
/*---------------------------------------------------------------------------------------------------------*/
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
//	uint32_t u32Cfg0, u32Cfg1;
//	uint32_t u32CBS,u32RData;
//	 uint32_t u32Addr;
	int i,j,kk;
	//uint32_t TIMER_CLK;
volatile	uint8_t iChannel_on_off_flag_counter;

	  SYS_UnlockReg();
		
		
//FMC_ENABLE_ISP();
    /* Init System, peripheral clock and multi-function I/O */
    SYS_Init();
		UART0_Init();
		I2C_Init();
	
		SYS_LockReg();	
	NVIC_DisableIRQ(EINT0_IRQn);
//		int iFlag;
	  printf("\n+-------------------------------------------------+\n");
    printf("|Welcome To Geotech Science|\n");
		printf("|This is The Device : Minilogger_16Channel|\n");
		printf("|The Firmware Version:mini_v17.05.1|\n");
    printf("+-------------------------------------------------+\n\n");
    /* Configure P1.0-P1.7 as Output mode and P4.1 as Input mode */
		GPIO_SetMode(P0, BIT0, GPIO_PMD_OUTPUT);
    GPIO_SetMode(P0, BIT1, GPIO_PMD_OUTPUT);
    GPIO_SetMode(P0, BIT2, GPIO_PMD_OUTPUT);
    GPIO_SetMode(P0, BIT3, GPIO_PMD_OUTPUT);
    GPIO_SetMode(P0, BIT4, GPIO_PMD_OUTPUT);
    GPIO_SetMode(P0, BIT5, GPIO_PMD_OUTPUT);
    GPIO_SetMode(P0, BIT6, GPIO_PMD_OUTPUT);
    GPIO_SetMode(P0, BIT7, GPIO_PMD_OUTPUT);
//R2R------P0
		GPIO_SetMode(P2, BIT0, GPIO_PMD_OUTPUT);//IN1
    GPIO_SetMode(P2, BIT1, GPIO_PMD_OUTPUT);//IN2
    GPIO_SetMode(P2, BIT2, GPIO_PMD_OUTPUT);//IN3.4
    GPIO_SetMode(P2, BIT3, GPIO_PMD_OUTPUT);//SHDN
 //switch_P2   			
		/*GPIO_SetMode(P1, BIT0, GPIO_PMD_INPUT);//1.0=bat_in	
		GPIO_SetMode(P1, BIT1, GPIO_PMD_INPUT);//1.1=DCt_in
		GPIO_SetMode(P1, BIT6, GPIO_PMD_INPUT);//1.6=Tem_in*/
    GPIO_SetMode(P1, BIT4, GPIO_PMD_OUTPUT);//1.4=ADC_CLK
    GPIO_SetMode(P1, BIT5, GPIO_PMD_OUTPUT);//1.5=ADC_CS
		/*************************************************************************************VW_V1
    GPIO_SetMode(P1, BIT6, GPIO_PMD_OUTPUT);//1.6=MUX_RES
    GPIO_SetMode(P1, BIT7, GPIO_PMD_OUTPUT);//1.7=MUX_CLK
		*************************************************************************************/
		////////////////////////////////////////////////////////////VW_V2//////////////////////////
		GPIO_SetMode(P3, BIT6, GPIO_PMD_OUTPUT);//3.6=MUX_RES
    GPIO_SetMode(P3, BIT7, GPIO_PMD_OUTPUT);//3.7=MUX_CLK
		
		
		//GPIO_SetMode(P2, BIT3, GPIO_PMD_OUTPUT);
						
    GPIO_SetMode(P4, BIT1, GPIO_PMD_INPUT);//4.1=ADC_DO
		GPIO_SetMode(P4, BIT2, GPIO_PMD_OUTPUT);//4.2=ADC_BUSY			
		
    GPIO_SetMode(P3, BIT3, GPIO_PMD_INPUT);//VW_count
		GPIO_SetMode(P3, BIT2, GPIO_PMD_INPUT);//RTC_int
		GPIO_EnableEINT0(P3, 2, GPIO_INT_FALLING);			
		//p4
					MUX_CLK=0;
					MUX_RES=0;
	
			ANALOG_POWERMOS_PIN =1;//20170503
		for (i=0;i<32;i++)
			{
					gucI2CBuffer[i] = 0;
			}

			delay_time(600000);
			Read_RTC_Data();
			if (!Check_RTC_Dat())
			{
			
			//transfer_command_to_variables();
			//
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
			//RTC_register_map.reg.calibration_FT = 1;
			
			/*I2C_WriteData(0xD0, 0x0000, RTC_register_map.RTC_Reg_string, 8);
			//transfer_command_to_variables();
			//
			gucI2CBuffer[0]=0x5e;
			gucI2CBuffer[1]=0xc7;
			gucI2CBuffer[2]=0x01;
			I2C_WriteData(0xD0, 0x0020, gucI2CBuffer, 3);
			I2C_WriteData(0xD0, 0x0022, gucI2CBuffer, 1);
			gucI2CBuffer[0]=0xc7;
			I2C_WriteData(0xD0, 0x0007, gucI2CBuffer, 1);*/
			//Transfer_RTC_To_ADCII();
			
			Transfer_RTC_To_ADCII();
			read_eeprom_command_set();
			if(!check_command_set_data(&g_u8CommandData[0]))
			{
					initial_command_set_data();
					// updata g_u8CommandData then save to eeprom
					for(i=0;i<64;i++)
					{
						g_u8CommandData[i] = union_Set_Operation_Mode_Command.Command_string[i];
					}
					union_Set_Operation_Mode_Command.command.DUMMY[0] = 0x00;
					union_Set_Operation_Mode_Command.command.DUMMY[1] = 0x00;
					write_eeprom_command_set();
					// initialize address to save measured data
					u32_address_to_save_to_eeprom = MIN_ADDRESS_OF_MEASURED_DATA_MAP;
					printf("Loading Command Fail,----\n");
			}else
			{
				//initial_command_set_data();
					update_command_from_uart();
					//read_measured_data_from_eeprom();
					u32_address_to_save_to_eeprom = MIN_ADDRESS_OF_MEASURED_DATA_MAP;
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
			// get scan rate and save rate
			u32ScanRateInSecond = transfer_command_to_variables(&union_Set_Operation_Mode_Command.command.SCAN_RATE[0]);
			u32SaveRateInSecond = transfer_command_to_variables(&union_Set_Operation_Mode_Command.command.SAVE_RATE[0]);
	
			// initial mesured data structure
			initial_measured_data();
	
			//printf("%s\n",union_Set_Operation_Mode_Command.Command_string);
    min_freq=400;
		max_freq =6000;
		
		UART_ENABLE_INT(UART0, UART_IER_RDA_IEN_Msk);

    /* Initial ADC8320 */
    init_ext_ad();
		/*	for (i=0;i<50;i++)
					{
						typeS_uiAdc8320Value += read_ext_adc();
					}*/
		//RESET_Gain();
			uiAdc8320Value = 0;
    /* Open Timer0 frequency to 0.5 mS in periodic mode, and enable interrupt */
		gucT0Index = 0;
    TIMER0->TCMPR =__HXT/2000;//__HXT/2000;
    TIMER0->TCSR = TIMER_TCSR_IE_Msk | TIMER_PERIODIC_MODE;
    TIMER_SET_PRESCALE_VALUE(TIMER0, 0);
		uiTimerCounter = 0;
    /* Enable Timer0 ~ Timer3 NVIC */
		g_uEint0_Scan_Event_Flag=1; //////////////////start_code
		algorithm_open=1;										/////////////////algorithm 1:open 0:close
		NVIC_EnableIRQ(TMR0_IRQn);
		NVIC_EnableIRQ(UART0_IRQn);
		NVIC_EnableIRQ(EINT0_IRQn);
			GPIO_SET_OUT_DATA (P0,0x80);
			u32iOutputVoltage = 0x80;		
  while(1)
	{	
	  
		
		//u32iOutputVoltage = 0x80;
		//GPIO_SET_OUT_DATA (P0,u32iOutputVoltage);	
		//delay_time(8000000);
		
		
		//test_simon
		
	
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
						/*	save_eeprom_counter=0;
							Transfer_SAVE_COUNT_ADCII();
							write_save_eeprom_address();//0x003F*/
						}
						else if(g_u8CommandData[4] == 'S'){
						SYS_UnlockReg();
						SYS_ResetCPU();
						}
					}
					if ((g_u8CommandData[4] == 'V')||(g_u8CommandData[4] == 'D')||(g_u8CommandData[4] == 'A')||(g_u8CommandData[4] == 'C'))
					{
						// update command
						update_command_from_uart();
						write_eeprom_command_set(); // write to eeprom
						//g_uEint0_Scan_Event_Flag=1;
						printf("Command_Sucess\n");
						//
						
						u32ScanRateInSecond = transfer_command_to_variables(&union_Set_Operation_Mode_Command.command.SCAN_RATE[0]);
						u32SaveRateInSecond = transfer_command_to_variables(&union_Set_Operation_Mode_Command.command.SAVE_RATE[0]);
						//
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
						// update RTC data
						update_RTC_from_uart();
						// write to RTC ic
						Transfer_RTC_To_ADCII();
						I2C_WriteData(0xD0, 0x0000, RTC_register_map.RTC_Reg_string, 8);
						printf("Set_Time_Done\n");
						u32Eint0SaveCounter=0;
						u32Eint0Counter =0;
					}
						//
					 //COPY_UART_COMMAND_DATA();
					NVIC_EnableIRQ(EINT0_IRQn);
					
		}
		
    if(g_uEint0_Scan_Event_Flag == 1)
		{	
			
			ANALOG_POWERMOS_PIN = 1;
			
			MUX_RES=1;////////////////////////////MUX_START
			delay_time(200000);
			while_counter++;
			if(while_counter>0xffffffff)while_counter=2;
			uiTimerCounter = 0;
				
			//union_Set_Operation_Mode_Command.Command_string= &g_u8CommandData; 
			//update_command_from_uart();
			g_uEint0_Scan_Event_Flag=0;
			//////////////////////////////////////////////////////type////////////////////////////////////////////	
			AdcSingleModeTest();
			//g_uEint0_Scan_Event_Flag = 0; // clear flag
			//UART_DISABLE_INT(UART0, (UART_IER_RDA_IEN_Msk ));
			for (iChannel_on_off_flag_counter = 0;iChannel_on_off_flag_counter<16;iChannel_on_off_flag_counter++)
			{
				//
				
				if(gucOutputVoltageType=='S'||select_type=='S')u32iOutputVoltage =0xf6;///5V...smaller than 0x80 Vol is negative,bigger than 0x80 Vol is positive  0x66:2.5V , 0x4d: 5V , 0x09:12V
				
				
				gain_uiAdc8320Value=0;
				
				
				MUX_CLK=1;
				delay_time(10*10000);//ms
				MUX_CLK=0;
				delay_time(10*10000);
				MUX_CLK=1;
				delay_time(10*10000);
				MUX_CLK=0;
				delay_time(10*10000);
				
		    select_freq_range=union_Set_Operation_Mode_Command.command.FREQ_SEL[iChannel_on_off_flag_counter] -0x30;
						
					if(select_freq_range==2)//C
					{ 
						button_range_min=gucT0Index=0;
						button_range_max=gucindex_range=9;
						min_freq=500;
						max_freq =1200;
						strain_coeffic = 4.062;
					}
					else if(select_freq_range==3)//D
					{
						button_range_min=gucT0Index=0;
						button_range_max=gucindex_range=9;
						min_freq=500;
						max_freq =1200;	
						strain_coeffic = 3.304;		
					}
					else if(select_freq_range==1)//B
					{ 

						button_range_min=gucT0Index=11;
						button_range_max=gucindex_range=31;
						min_freq=2000;
						max_freq =3500;						
					}
					else if(select_freq_range==4)//E
					{
						button_range_min=gucT0Index=11;
						button_range_max=gucindex_range=56;
						min_freq=1500;
						max_freq =6000;
						strain_coeffic = 0.39102;
					}
					else if(select_freq_range==5)//F
					{
						button_range_min=gucT0Index=21;
						button_range_max=gucindex_range=56;
						min_freq=2500;
						max_freq =6000;
					}
					else if(select_freq_range==0)//A
					{
						button_range_min=gucT0Index=0;
						button_range_max=gucindex_range=56;
						min_freq=450;
						max_freq =6100;
					}
					
								max_freq_timer = (50000000)/(min_freq);
								min_freq_timer = (50000000)/(max_freq);
						n_counter = gucT0Index*200+800;//change freq to Timer0 interval
						n_max_counter = gucindex_range*200+800;	
					g_au32HzMaxMin[0] = max_freq_timer;
					g_au32HzMaxMin[1] = min_freq_timer;
			//	printf("%d....%d\n",AD_data,iChannel_on_off_flag_counter);
				if(union_Set_Operation_Mode_Command.command.ON_OFF_FLAG[iChannel_on_off_flag_counter] == '1') // if turn on
				{
					//NVIC_DisableIRQ(EINT0_IRQn);
					uiTimerCounter = 0;
					
			//NVIC_DisableIRQ(EINT0_IRQn);
			//NVIC_DisableIRQ(UART0_IRQn);
			gucGainTableIndex = 0;
	
			//ANALOG_POWERMOS_PIN = 1;
		if (select_type =='S')
			{
				
				one_step_sti++;
				//AdcSingleModeTest();
				delay_time(1000);
				/*TIMER0->TCMPR = guiTimer0Period[gucT0Index];
			TIMER_Start(TIMER0);*/
				/////////////////////////////////////////////////////////////////////////////////////
			if(Hz_data>0){
				if(select_freq_range==2||select_freq_range==3)
				{
					TIMER0->TCMPR = __HXT/n_counter;
					TIMER_Start(TIMER0);
				}
					
				else{
					TIMER0->TCMPR = __HXT/n_counter;
					TIMER_Start(TIMER0);
				}
			}
					else
					{
					TIMER0->TCMPR = __HXT/n_counter;
					TIMER_Start(TIMER0);
					}
					//////////////////////////////////////////////////////////////////////////////////
			}
	else if(select_type =='A')
			{
			
				TIMER0->TCMPR = __HXT/300;//__HXT/2000;
			TIMER_Start(TIMER0);
			}
	else if(select_type =='D')
			{
			gucT0Index = 0;
				TIMER0->TCMPR = guiTimer0Period[gucT0Index];//__HXT/2000;
			TIMER_Start(TIMER0);
				
			}
		else if(select_type =='C')
			{
			gucT0Index = 0;
				TIMER0->TCMPR = __HXT/4000;//__HXT/2000;
				
			TIMER_Start(TIMER0);
				//SET_Gain(4);
				
			}	

			if (select_type =='S')
			{
				
				//
				// excite sine wave for 0.4 sec
				// four patterns
				//Temp_sw=1;
				while (n_counter <= (n_max_counter)){
					if(n_counter>=n_max_counter)
							{
								
								gucindex_range = button_range_max;
								gucT0Index = button_range_min;
								n_counter = gucT0Index*200+800;
						n_max_counter = gucindex_range*200+800;
								GPIO_SET_OUT_DATA (P0,0x80);
								//u32iOutputVoltage = 0X80;
								break;
							}	
							//gucT0Index=gucindex_range;
							//if(select_command_success==0)break;
						}
				// stop excite sine wave
				//	u32iOutputVoltage=0X80;	
					TIMER_Stop(TIMER0);
					
					for(i=0;i<300;i++)
					{
						g_au32TMR1Count[i] = 0;
					}
				// set timer0 time-out function
					
					timer0_check = 'T';
					TIMER0->TCMPR = __HXT; // 100ms per time-out interrupt
					delay_time(500000);
					TIMER_Start(TIMER0);
				//
				
				TIMER_Open(TIMER1, TIMER_CONTINUOUS_MODE,1);
				/* Configure Timer1 setting for external counter input and capture function */
					TIMER_SET_PRESCALE_VALUE(TIMER1,0);
					TIMER_SET_CMP_VALUE(TIMER1, 0xffffff);
					TIMER_EnableEventCounter(TIMER1, TIMER_COUNTER_FALLING_EDGE);
					TIMER_EnableCaptureDebounce(TIMER1);
					TIMER_DisableEventCounter(TIMER1);
				//TIMER_EnableCapture(TIMER1, TIMER_CAPTURE_FREE_COUNTING_MODE, TIMER_CAPTURE_FALLING_EDGE);
					TIMER_EnableCapture(TIMER1, TIMER_CAPTURE_FREE_COUNTING_MODE, TIMER_CAPTURE_RISING_EDGE);
					TIMER_EnableCaptureInt(TIMER1);
			//	TIMER_CLK=TIMER_GetModuleClock(TIMER1);
					
				/* Enable Timer1 NVIC */
					
				//TIMER_Stop(TIMER1);
					u32InitCount = g_au32TMRINTCount[1] = 0;
					
					
					TIMER_Start(TIMER1);
				//TIMER_EnableInt(TIMER1);
						
					NVIC_EnableIRQ(TMR1_IRQn);
					delay_time(700000);
				/* Check T1EX interrupt counts */
				
			/*	while(g_au32TMRINTCount[1] <=100)
				//while(1)
				{
					//P00 = ~P00;
				}*/
				// stop time0 time-out function
				TIMER_Stop(TIMER0);
				
					

				/* Stop Timer0, Timer1 and Timer3 counting */
				TIMER_Stop(TIMER1);
				TIMER_Close(TIMER1);
				
				//printf("*** PASS ***\n");
				uiAdc8320Value_Hz_mean=0;
				uiAdc8320Value_Hz_mean_STD=0;
				uiAdc8320Value_Hz_1=0;
				Hz_out_of_mean=0;
				Hz_out_of_mean_STD=0;
				Hz_out_of_mean_1=0;
				j=0;
				kk=0;
				
			/*	
				for(i=10;i<300;i++)/////////////////////////////////////////////////////////////////////////////////mean+STD////////////////////////////
				{
					if(i%2)
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
				uiAdc8320Value_Hz_mean/=j;
				Hz_out_of_mean = Hz_out_of_mean/kk;
				uiAdc8320Value_Hz_mean-=Hz_out_of_mean;*/
				/*///////////////////////////////////////////////////////////////////////////////////////////////////////////
				
				for(i=10;i<300;i++)/////////////////////////////////////////////////////////////////////////////////mean+STD////////////////////////////
				{
					
					if(i%2)
					{
					if((g_au32TMR1Count[i] <= g_au32HzMaxMin[0])&&(g_au32TMR1Count[i] >= g_au32HzMaxMin[1]))
								{
								//printf("[%2d] - %4d\n", i, g_au32TMR1Count[i]);
						
									if(g_au32TMR1Count[i]>0)
										{
												uiAdc8320Value_Hz_mean+=g_au32TMR1Count[i]; 
												j++;
										}
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
							
				
				//	uiAdc8320Value_Hz_1+=g_au32TMR1Count[i]; 
				}
				uiAdc8320Value_Hz_mean=uiAdc8320Value_Hz_mean/j;/////////////////////////////////////////////////////////mean
				Hz_out_of_mean = Hz_out_of_mean/kk;
				
				j=0,kk=0;
			for(i=10;i<300;i++)
				{
					
					if(i%2)
					{	
					
							if((g_au32TMR1Count[i] <= g_au32HzMaxMin[0])&&(g_au32TMR1Count[i] >= g_au32HzMaxMin[1]))
								{
									uiAdc8320Value_Hz_mean_STD+=((g_au32TMR1Count[i]-uiAdc8320Value_Hz_mean)*(g_au32TMR1Count[i]-uiAdc8320Value_Hz_mean)); 
									j++;
								}
								
					}
				}
				uiAdc8320Value_Hz_mean_STD=sqrt(uiAdc8320Value_Hz_mean_STD/j);///////////////////////////////////////////////////////////////////////////STD
				Hz_out_of_mean_STD =sqrt(Hz_out_of_mean_STD/kk);
				j=0,kk=0;
				for(i=10;i<300;i++)
				{
								if((g_au32TMR1Count[i] <= g_au32HzMaxMin[0])&&(g_au32TMR1Count[i] >= g_au32HzMaxMin[1]))
								{
									if(g_au32TMR1Count[i]>=(uiAdc8320Value_Hz_mean+uiAdc8320Value_Hz_mean_STD)||(g_au32TMR1Count[i]<=(uiAdc8320Value_Hz_mean-uiAdc8320Value_Hz_mean_STD)))
											g_au32TMR1Count[i]=0;
									else
											{
												g_au32TMR1Count[i]=g_au32TMR1Count[i];
											}
								}
								else
								{
									if(g_au32TMR1Count[i]>=(Hz_out_of_mean+Hz_out_of_mean_STD)||(g_au32TMR1Count[i]<=(Hz_out_of_mean-Hz_out_of_mean_STD)))
											g_au32TMR1Count[i]=0;
									else
											{
												g_au32TMR1Count[i]=g_au32TMR1Count[i];
											}
								}
					
				}
				
				
						for(i=10;i<300;i++)
							{
								if((g_au32TMR1Count[i] <= g_au32HzMaxMin[0])&&(g_au32TMR1Count[i] >= g_au32HzMaxMin[1]))
								{
								//printf("[%2d] - %4d\n", i, g_au32TMR1Count[i]);
								
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
				
				
				
				
				*////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				
				
				
				
				uiAdc8320Value_Hz_mean=0;
				uiAdc8320Value_Hz_mean_STD=0;
				uiAdc8320Value_Hz_1=0;
				Hz_out_of_mean=0;
				Hz_out_of_mean_STD=0;
				Hz_out_of_mean_1=0;
				j=0;
				kk=0;
			for(i=5;i<300;i++)/////////////////////////////////////////////////////////////////////////////////mean+STD////////////////////////////
				{
					
					if((g_au32TMR1Count[i] <= g_au32HzMaxMin[0])&&(g_au32TMR1Count[i] >= g_au32HzMaxMin[1]))
								{
								//printf("[%2d] - %4d\n", i, g_au32TMR1Count[i]);
						
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
				
				//	uiAdc8320Value_Hz_1+=g_au32TMR1Count[i]; 
				}
				uiAdc8320Value_Hz_mean=uiAdc8320Value_Hz_mean/j;/////////////////////////////////////////////////////////mean
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
				uiAdc8320Value_Hz_mean_STD=sqrt(uiAdc8320Value_Hz_mean_STD/j);///////////////////////////////////////////////////////////////////////////STD
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
								/*else
								{
									if(g_au32TMR1Count[i]>=(Hz_out_of_mean+Hz_out_of_mean_STD)||(g_au32TMR1Count[i]<=(Hz_out_of_mean-Hz_out_of_mean_STD)))
											g_au32TMR1Count[i]=0;
									else
											{
												g_au32TMR1Count[i]=g_au32TMR1Count[i];
											}
								}*/
					
				}
				
				
						for(i=5;i<300;i++)
							{
								if((g_au32TMR1Count[i] <= g_au32HzMaxMin[0])&&(g_au32TMR1Count[i] >= g_au32HzMaxMin[1]))
								{
								//printf("[%2d] - %4d\n", i, g_au32TMR1Count[i]);
								
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
							
				//uiAdc8320Value /= 18;
						if (j>0)
						{
						
						uiAdc8320Value_Hz_1/= j;
							Hz_out_of_mean_1/=kk;
							//uiAdc8320Value_Hz_1-=Hz_out_of_mean_1;
						i,j,kk=0;
						}
/////////////////////////////////////////////////////////////////////////////////test/////////////////////////////////////////////////////
	/*	for(i=1;i<60;i++)
							{
								if((g_au32TMR1Count[i] < (uiAdc8320Value_Hz_1*1.001))&&(g_au32TMR1Count[i] > (uiAdc8320Value_Hz_1*0.999)))
								{
									uiAdc8320Value_Hz_mean += g_au32TMR1Count[i];
									j++;
								}
				      }

						if (j>0)
						{
						
						uiAdc8320Value_Hz_mean/= j;
				j=0;
						}*/
				/*		if(uiAdc8320Value_Hz_mean>=(uiAdc8320Value_Hz_1*1.00)||(uiAdc8320Value_Hz_mean<=(uiAdc8320Value_Hz_1*0.998)))
									uiAdc8320Value_Hz =(uiAdc8320Value_Hz_1+uiAdc8320Value_Hz_mean)/2;
						else{*/
						//uiAdc8320Value_Hz=uiAdc8320Value_Hz_mean;
										uiAdc8320Value_Hz =uiAdc8320Value_Hz_1;
					//	}
					//uiAdc8320Value_Hz = g_au32TMR1Count[50];
				//uiAdc8320Value_Hz= myFloorRound(uiAdc8320Value_Hz);		
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				
						
					init_ext_ad();
				//do{
				
					// read data
				
					SET_Gain(6);
					delay_time(10000);
					delay_time(10000);
					typeS_uiAdc8320Value = 0;
				  GPIO_SET_OUT_DATA (P0,0x99);
				  delay_time(10000);
					for (i=0;i<50;i++)
					{
						typeS_uiAdc8320Value += read_ext_adc();
					}
					typeS_uiAdc8320Value /= 50;
					//
					
					//gain_uiAdc8320Value = (50000000)/uiAdc8320Value_Hz;//50000000;////HZ
					if((uiAdc8320Value_Hz>0)&&(one_step_sti>0)){																																			//if has value and after first sti 
				
						gain_uiAdc8320Value = (50000000)/uiAdc8320Value_Hz;//50000000
				time_ms = 1/gain_uiAdc8320Value*1000000;
				
				
						
					
									//previous_data[algo_x_counter][iChannel_on_off_flag_counter]=gain_uiAdc8320Value;
							
						////////////////////////////////////////////////////////////////////////////////////////////////////0.003//////////Algorithm//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
					//	if(gain_uiAdc8320Value)
////////////////////////////////////////////////						//
						algo_x_counter =(while_counter-1)%10; //initial  while_counter to 0;
					/*	if(previous_data[algo_x_counter][iChannel_on_off_flag_counter]<=0.0)
											previous_data[algo_x_counter][iChannel_on_off_flag_counter]=gain_uiAdc8320Value;
							else {
												if(abs(gain_uiAdc8320Value-previous_4_times_data_mean[iChannel_on_off_flag_counter])>(previous_sumdata*0.001))
																						{			
																							gain_uiAdc8320Value=gain_uiAdc8320Value;
																								//previous_data[algo_x_counter][iChannel_on_off_flag_counter]=gain_uiAdc8320Value;
																						}
																							else{
																								previous_data[algo_x_counter][iChannel_on_off_flag_counter]=previous_4_times_data_mean[iChannel_on_off_flag_counter]+(previous_4_times_data_mean[iChannel_on_off_flag_counter]-gain_uiAdc8320Value);
																							}
							}*/
////////////////////////							j=0;
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
							//previous_data[algo_x_counter][iChannel_on_off_flag_counter]=previous_sumdata;
							//previous_data[algo_x_counter][iChannel_on_off_flag_counter] =previous_sumdata;
							//previous_data[algo_x_counter][iChannel_on_off_flag_counter]=gain_uiAdc8320Value;
							/*if(select_freq_range==2|select_freq_range==3)
							{
								if((abs(gain_uiAdc8320Value-previous_sumdata)>gain_uiAdc8320Value*0.013)&&(abs(gain_uiAdc8320Value-previous_sumdata)<gain_uiAdc8320Value*0.02))//bigger than abs previous data//test11_16_///////////////////////////////////////////
									{
								
									if(gain_uiAdc8320Value>previous_4_times_data_mean[iChannel_on_off_flag_counter])
										{
											gain_uiAdc8320Value=previous_4_times_data_mean[iChannel_on_off_flag_counter]+(gain_uiAdc8320Value-previous_4_times_data_mean[iChannel_on_off_flag_counter])*0.015;			
										}
										else
										{
											gain_uiAdc8320Value=previous_4_times_data_mean[iChannel_on_off_flag_counter]+(gain_uiAdc8320Value-previous_4_times_data_mean[iChannel_on_off_flag_counter])*0.015;
										}
									previous_data[algo_x_counter][iChannel_on_off_flag_counter]=gain_uiAdc8320Value;
							
									}
									else if((abs(gain_uiAdc8320Value-previous_sumdata)<gain_uiAdc8320Value*0.001))//small than previous data
										{
											//previous_data[algo_x_counter][iChannel_on_off_flag_counter]=gain_uiAdc8320Value;
													if(gain_uiAdc8320Value>previous_4_times_data_mean[iChannel_on_off_flag_counter])
															gain_uiAdc8320Value = previous_4_times_data_mean[iChannel_on_off_flag_counter]+((gain_uiAdc8320Value-previous_4_times_data_mean[iChannel_on_off_flag_counter])*(0.001));
													else
													{
														gain_uiAdc8320Value = previous_4_times_data_mean[iChannel_on_off_flag_counter]+((gain_uiAdc8320Value-previous_4_times_data_mean[iChannel_on_off_flag_counter])*(0.001))	;
													}
											previous_data[algo_x_counter][iChannel_on_off_flag_counter]=gain_uiAdc8320Value;
										}
										else
											{
												for( i=0;i<4;i++)
												{
													previous_data[i][iChannel_on_off_flag_counter]	=0;
													previous_4_times_data_mean[i]=0;
												}
												previous_data[algo_x_counter][iChannel_on_off_flag_counter]=gain_uiAdc8320Value;
											}
															j=0;
																				
									
							}*/
							
							if(abs(previous_sumdata-gain_uiAdc8320Value)>previous_4_times_data_mean[iChannel_on_off_flag_counter]*0.001)//bigger than abs previous data//test11_16_///flag to swing
								{		
								swing_flag++;
								}
								else
								{
								swing_flag=0;
								}
							//else{
								if(abs(previous_sumdata-gain_uiAdc8320Value)>previous_4_times_data_mean[iChannel_on_off_flag_counter]*0.001)//bigger than abs previous data//test11_16_///////////////////////////////////////////
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
												//previous_data[algo_x_counter][iChannel_on_off_flag_counter]=gain_uiAdc8320Value;
								}
										//
								}
									else//small than previous data
										{
											if(abs(previous_sumdata-gain_uiAdc8320Value)==0)
											{
											gain_uiAdc8320Value = gain_uiAdc8320Value;
											}
											else{
											//previous_data[algo_x_counter][iChannel_on_off_flag_counter]=gain_uiAdc8320Value;
													//gain_uiAdc8320Value = previous_4_times_data_mean[iChannel_on_off_flag_counter]+((gain_uiAdc8320Value-previous_4_times_data_mean[iChannel_on_off_flag_counter])*(0.01))	;
													gain_uiAdc8320Value = previous_4_times_data_mean[iChannel_on_off_flag_counter]+((gain_uiAdc8320Value-previous_4_times_data_mean[iChannel_on_off_flag_counter])*0.1)	;
												previous_data[algo_x_counter][iChannel_on_off_flag_counter]=gain_uiAdc8320Value;
											}
										}
															j=0;
																				
									//}
									previous_sumdata=0;
									uiAdc8320Value_Hz_mean=0;
									
							}
						else 
						{	
									
							gain_uiAdc8320Value=gain_uiAdc8320Value;																				
						}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////																					
				gain_uiAdc8320Value_stain_e=(gain_uiAdc8320Value);	
				stain_e =  gain_uiAdc8320Value_stain_e*gain_uiAdc8320Value_stain_e*0.001*strain_coeffic;
						
switch(unit_counter)
	
				{
	
					case 1://DG
									gain_uiAdc8320Value = gain_uiAdc8320Value_stain_e*gain_uiAdc8320Value_stain_e*0.001*strain_coeffic;////DG
					break;
					case 2 ://mS
									gain_uiAdc8320Value = 1/gain_uiAdc8320Value*1000000;
					break;
					case 3 ://Coef
									gain_uiAdc8320Value = 	coef_a*pow(gain_uiAdc8320Value,5)+coef_b*pow(gain_uiAdc8320Value,4)+coef_c*pow(gain_uiAdc8320Value,3)+coef_d*pow(gain_uiAdc8320Value,2)+coef_e*gain_uiAdc8320Value+coef_f;	
					break;
					default://HZ
								gain_uiAdc8320Value =gain_uiAdc8320Value;//50000000;////HZ
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
				//////////////////////////////////////////////////temp////////////////////////////////////////////////////////////
					//typeSgain_uiAdc8320Value=		 (120 -196.12 * typeSgain_uiAdc8320Value +214.51 * typeSgain_uiAdc8320Value*typeSgain_uiAdc8320Value -151.07 * typeSgain_uiAdc8320Value * typeSgain_uiAdc8320Value * typeSgain_uiAdc8320Value +55.748 * typeSgain_uiAdc8320Value *typeSgain_uiAdc8320Value *typeSgain_uiAdc8320Value *typeSgain_uiAdc8320Value -8.5429 * typeSgain_uiAdc8320Value *typeSgain_uiAdc8320Value*typeSgain_uiAdc8320Value*typeSgain_uiAdc8320Value*typeSgain_uiAdc8320Value);	
					//}while(iFlag);
				AD_data=typeSgain_uiAdc8320Value*10;
						if((typeSgain_uiAdc8320Value>70)||(typeSgain_uiAdc8320Value<-20))//temp limit
						AD_data=0;
						if(gain_uiAdc8320Value<10000)
								uiAdc8320Value=	gain_uiAdc8320Value*1000;//floating %3f
						else{
								uiAdc8320Value=	gain_uiAdc8320Value*100;//floating %2f
						}
			
				//RESET_Gain();
			// measure DC & AC & 4-20mA
			}else if((select_type =='D')||(select_type =='A')||(select_type =='C'))
			{

			/* Initial ADC8320 */
				
				if(select_type =='A')
					{
						if(gucOutputVoltagePeak==0x66)
							{
								//AdcSingleModeTest();
								delay_time(8000000);//2500000
								init_ext_ad();
								gucGainTableIndex=0;
								if(while_counter>1)
									{
										uiAdc8320Value_ff=uiAdc8320Value_f;
										uiAdc8320Value_f =uiAdc8320Value_ac;
										stri_counter=100;//times
										}else{
													uiAdc8320Value_f=0xffff;
													stri_counter=100;
													}
								if(AC_counter>5)AC_counter=1;
								uiAdc8320Value_ac=0;
								}else{
										//AdcSingleModeTest();
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
				//do{
					
					// read data
					
					SET_Gain(0);
					//AdcSingleModeTest();
					delay_time(1000000);
					
					uiAdc8320Value = 0;
					for (i=0;i<1000;i++)
					{
						uiAdc8320Value += read_ext_adc();
					}
					uiAdc8320Value =uiAdc8320Value/1000;
					//
					uiAdc8320Value_f=uiAdc8320Value;

					}
				  else//type_C
						{
							init_ext_ad();
				//do{
					
					// read data
					
					SET_Gain(4);
					//AdcSingleModeTest();
					delay_time(10000000);
					
					for (i=0;i<500;i++)
					{
						uiAdc8320Value += read_ext_adc();
					}
					uiAdc8320Value =uiAdc8320Value/500;
					//
					uiAdc8320Value_f=uiAdc8320Value;

					
						

					}
						
					
											
					gain_uiAdc8320Value = uiAdc8320Value_f;
				  //gucGainTableIndex=0;
					gain_uiAdc8320Value=gain_uiAdc8320Value/0.3333333;
					gain_uiAdc8320Value/=65535;
				  gain_uiAdc8320Value*=5;
					uiAdc8320Value_ff/=0.3333333;
					uiAdc8320Value_ff/=65535;
					uiAdc8320Value_ff=uiAdc8320Value_ff*5;
					//PutString(20,26,select_type);
					
				
					
					//electronic
					
					if(select_type=='D'){	
																				 if(gucOutputVoltagePeak==0x4d){gucOutputVoltage=5.1;gain_uiAdc8320Value=(gain_uiAdc8320Value);}//5
																		else if(gucOutputVoltagePeak==0x66){gucOutputVoltage=2.6;gain_uiAdc8320Value=(gain_uiAdc8320Value);}//2.5
																		else if(gucOutputVoltagePeak==0x09){gucOutputVoltage=12.1;gain_uiAdc8320Value=(gain_uiAdc8320Value);}//12
												
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
																					//gain_uiAdc8320Value =	current_total;
																					//gain_uiAdc8320Value=(gain_uiAdc8320Value-0.0072);
																						if(gain_uiAdc8320Value<0)gain_uiAdc8320Value=0;
																					
								
																					}
																		
															//gain_uiAdc8320Value = gain_uiAdc8320Value/3;
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
					//LTC2328_Ini();
																			
													
													gain_uiAdc8320Value=0;
					
												}////////////if select_type =='DAC'
												
												//AD_data=0;
										
			
					union_One_Measured_Data.data.CHANNEL_DATA[iChannel_on_off_flag_counter][6] = 0x30+(uiAdc8320Value%10);
					union_One_Measured_Data.data.CHANNEL_DATA[iChannel_on_off_flag_counter][5] = 0x30+((uiAdc8320Value/10)%10);
					union_One_Measured_Data.data.CHANNEL_DATA[iChannel_on_off_flag_counter][4] = 0x30+((uiAdc8320Value/100)%10);
					union_One_Measured_Data.data.CHANNEL_DATA[iChannel_on_off_flag_counter][3] = 0x30+((uiAdc8320Value/1000)%10);
					union_One_Measured_Data.data.CHANNEL_DATA[iChannel_on_off_flag_counter][2] = 0x30+((uiAdc8320Value/10000)%10);
					union_One_Measured_Data.data.CHANNEL_DATA[iChannel_on_off_flag_counter][1] = 0x30+((uiAdc8320Value/100000)%10);
					union_One_Measured_Data.data.CHANNEL_DATA[iChannel_on_off_flag_counter][0] = 0x30+((uiAdc8320Value/1000000)%10);							
					
				
												//typeSgain_uiAdc8320Value= (int)typeSgain_uiAdc8320Value;
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
				
									
									//printf("%f....%d\n",gain_uiAdc8320Value,iChannel_on_off_flag_counter);
									GPIO_SET_OUT_DATA (P0,0x80);
									NVIC_EnableIRQ(EINT0_IRQn);
				          UART_ENABLE_INT(UART0, (UART_IER_RDA_IEN_Msk));
									//Read_RTC_Data();
									//Transfer_RTC_To_ADCII();	
									delay_time(1000);		
									//printf("%s-Data\n",union_One_Measured_Data.Data_string);	
			}///// end_of_4_channels_on/off//channel_select_end
						// 
						//---------------------------------------------
						//---------------------------------------------
						//read back time now
				MUX_RES=0;
						delay_time(1000);	
						RESET_Gain();
									Read_RTC_Data();
									Transfer_RTC_To_ADCII();	
									//I2C_WriteData(0xD0, 0x0000, RTC_register_map.RTC_Reg_string, 8);
									printf("\n%s-Real_Time_Data\t\n\n,DC_IN=%2.1f V,Temp=%2.1f deg\n",union_One_Measured_Data.Data_string,DC_12V_AD_data,thermal_AD_data);	
						delay_time(1000);	
						//---------------------------------------------
						//---------------------------------------------
					
			// turn off analog power
						typeSgain_uiAdc8320Value=0;
						//gain_uiAdc8320Value=0;
						
			// add to avoid leakage current to analog power	
						
			// stop timer
			//ADC_Close(ADC);
						TIMER_Stop(TIMER0);
						
						uiAdc8320Value_f=0;
						uiAdc8320Value_f_offset=0;
						uiAdc8320Value=0;
						
						
						
						delay_time(1000);	
						ANALOG_POWERMOS_PIN =0;//20170503
						//NVIC_EnableIRQ(EINT0_IRQn);	
	}///g_uEint0_Scan_Event_Flag=1
		//----------------------------------------
		//- save measured data to eeprom
		if (g_uEint0_Save_Event_Flag == 1)
		{
				g_uEint0_Save_Event_Flag = 0;
				// save to eeprom
				save_measured_data_to_eeprom();
		}
		//----------------------------------------
		//- end of save 
		//----------------------------------------
		
		}////wihle_end
	
}//main_end

/*** (C) COPYRIGHT 2015 .Chien Cheng Che ***/
