
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdbool.h>
#include <stdint.h>

//float data[100]={90.1,90.2,90.3,90.4,90.5,90.6,90.7,90.8,90.9,91.0,
//									90.9,90.8,90.7,90.6,90.5,90.4,90.3,90.2,90.1,90.0,
//									90.1,90.2,90.3,90.4,90.5,90.6,90.7,90.8,90.9,91.0,
//									90.9,90.8,90.7,90.6,90.5,90.4,90.3,90.2,90.1,90.0,
//									90.1,90.2,90.3,90.4,90.5,90.6,90.7,90.8,90.9,91.0,
//									90.9,90.8,90.7,90.6,90.5,90.4,90.3,90.2,90.1,90.0,
//									90.1,90.2,90.3,90.4,90.5,90.6,90.7,90.8,90.9,91.0,
//									90.9,90.8,90.7,90.6,90.5,90.4,90.3,90.2,90.1,90.0,
//									90.1,90.2,90.3,90.4,90.5,90.6,90.7,90.8,90.9,91.0,
//									90.9,90.8,90.7,90.6,90.5,90.4,90.3,90.2,90.1,90.0};
typedef struct 
{
	int stable;//0:unstable 1:stable
	int count;
    float Max;
    float Min;
    float avg_angle;
	float holdtime;//uint:sec
    
}ANGLE_INFO;
extern int swing_flag;
typedef struct 
{
	bool stable_buf;
	bool count_buf;
	uint8_t sample_ms;		//uint:ms
	uint8_t triggrt_level;	//degree
	uint8_t angle_range;	//reange = 20 =>-10~+10(degree)
	uint8_t triggrt_count;  //degree
	int i;
	int jj;
	int kk;
	int arc1;
	int arc2;
	int freq;
    float angle;			//real time angle
	float angle_point;		//stable first angle
	float j;
	float k;
	float summax;
	//float angle_point;
	float Max_count;
	float KGain;
	float aplace[2];
	float stab_avg[2];
	float X[2];
	float Pk;
	  
}FShoulder_IN;
void FrozenShoulder_ini(FShoulder_IN *fs_in,ANGLE_INFO *m_angle);
float ALG_FrozenShoulder_cal(FShoulder_IN fs_in,ANGLE_INFO *m_angle);
