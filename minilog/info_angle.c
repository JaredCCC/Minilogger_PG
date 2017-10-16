#include <stdio.h>
#include <stdint.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include "info_angle.h"
//#include "custom_define.h"

//	Debug configuration
//------------------------
#define NRF_LOG_MODULE_NAME 	""
//#include "nrf_log.h"
#if DBG_info_angle_LOG
#define	DBG  	NRF_LOG_INFO
#else
#define DBG(...)
#endif

//satbility parameter
//static float Q=0.0007,R=0.07,KGain,X[2],Pk=100.0;
static float Q=0.0007,R=0.07;
//static float aplace[2],stab_avg[2];
//static int i=0,jj=0,kk=0;
//static int arc1=0,arc2=0,freq=0;
//static float j=0.0,k=0.0,test_time=0.3,summax = 0.0,angle_point=0,Max_count=0.0;
static float test_time=0.3,fk=0,z=0,ii=90.0;
//static int ii=0;
//bool stable_buf;
//bool count_buf;

void FrozenShoulder_ini(FShoulder_IN *fs_in,ANGLE_INFO *m_angle)
{
    fs_in->stable_buf = 0; fs_in->count_buf = 0,fk=0,z=0;
    fs_in->j=0,fs_in->k=0,fs_in->arc1=0,fs_in->arc2=0,fs_in->kk=0,fs_in->jj=0,fs_in->summax=0,fs_in->angle_point=0;
	fs_in->Max_count=0,fs_in->freq=0,fs_in->Pk=100.0,ii=0;
    memset(fs_in->aplace,0,sizeof(fs_in->aplace));
    memset(fs_in->stab_avg,0,sizeof(fs_in->stab_avg));
    memset(fs_in->X,0,sizeof(fs_in->X));
	
	
	m_angle->avg_angle = 0.0f;
	m_angle->Max = 0.0f;
	m_angle->Min = 0.0f;
	m_angle->stable = 0.0f;
	m_angle->count = 0.0f;
	DBG("k[0]1:" NRF_LOG_FLOAT_MARKER "\r\n",NRF_LOG_FLOAT(fs_in->k));
    DBG("FrozenShoulder_ini\r\n");
}

void stable_cal(FShoulder_IN fs_in)
{
	//fk=fs_in->k;
//	memcpy(&fs_in->X[1],&fs_in->X[0],4);
	  fs_in.X[0]=123.0;
		fs_in.X[1]=10.0;
    fs_in.X[1]=fs_in.X[0];
    fs_in.Pk=fs_in.Pk+Q;
    fs_in.KGain=fs_in.Pk/(fs_in.Pk+R);
    fs_in.X[0]=fs_in.X[1]+fs_in.KGain*(fs_in.angle-fs_in.X[1]);
    fs_in.Pk=(1-fs_in.KGain)*fs_in.Pk;
		
    if(fs_in.k <(1000/fs_in.sample_ms)*test_time)
    {
        fs_in.aplace[0]+=fs_in.X[0];
        //fs_in->k++;
		fs_in.k++;
        fs_in.arc1=0;

    }
    else if(fs_in.k>=(1000/fs_in.sample_ms)*test_time)
    {
        if(fs_in.k==(1000/fs_in.sample_ms)*test_time)
        {
            fs_in.stab_avg[0]=fs_in.aplace[0]/((1000/fs_in.sample_ms)*test_time);
            fs_in.arc1=1;
            memset(fs_in.aplace,0,sizeof(fs_in.aplace));
        }
        fs_in.aplace[1]+=fs_in.X[0];
        //fs_in->k++;
		fs_in.k++;

        if(fs_in.k==2*(1000/fs_in.sample_ms)*test_time)
        {
            fs_in.stab_avg[1]=fs_in.aplace[1]/((1000/fs_in.sample_ms)*test_time);
            fs_in.arc2=1;
            memset(fs_in.aplace,0,sizeof(fs_in.aplace));
            fs_in.k=0;
        }
    }
		if(fs_in.X[0]<fs_in.X[1] || fabs(fs_in.X[0]-fs_in.X[1])<=0.2)
    {
        fs_in.kk=1;  
		DBG("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\r\n");
    }
    if(fs_in.arc1 ==1 && fs_in.arc2 ==1)
    {
        if(fs_in.k==0)
        {
            if(fs_in.angle>=fs_in.triggrt_level && fabs(fs_in.stab_avg[1]-fs_in.stab_avg[0])<=1.0&& fs_in.kk==1 )
            {
                fs_in.stable_buf=1;
				//if(point !=0 && angle>(point+(angle_range/2.0)) || point !=0 && angle<(point-(angle_range/2.0)))
				if(fs_in.angle_point !=0 && (fs_in.angle>(fs_in.angle_point+(fs_in.angle_range/2.0)) || fs_in.angle<(fs_in.angle_point-(fs_in.angle_range/2.0))))
				{
						fs_in.stable_buf=0;
				}
                DBG("stable!!!!!!!!!!!!!!!!!!!!!!!!!!!\r\n");
            }
						else 
            {
                fs_in.stable_buf=0;
            }
        }
        else if(fs_in.k!=0)
        {
            if(fs_in.angle>=fs_in.triggrt_level && fabs(fs_in.stab_avg[0]-fs_in.stab_avg[1]<=1.0) && fs_in.kk==1)
            {
                fs_in.stable_buf=1;
				//if(point !=0 && angle>(point+(angle_range/2.0)) || point !=0 && angle<(point-(angle_range/2.0)))
				if(fs_in.angle_point !=0 && (fs_in.angle>(fs_in.angle_point+(fs_in.angle_range/2.0f)) || fs_in.angle<(fs_in.angle_point-(fs_in.angle_range/2.0f))))
				{
						fs_in.stable_buf=0;
				}
                DBG("stable2!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\r\n");
            }
						else 
            {
                fs_in.stable_buf=0;
            }
        }
    }
    if(fs_in.k>(1000/fs_in.sample_ms)*test_time && fs_in.k<2*(1000/fs_in.sample_ms)*test_time)
    {
        fs_in.arc2=0;
    }
	//fs_in->k=fk;
//	DBG("point1:" NRF_LOG_FLOAT_MARKER "\r\n",NRF_LOG_FLOAT(point));
//	DBG("sample_ms:" NRF_LOG_FLOAT_MARKER "\r\n",NRF_LOG_FLOAT(fs_in->sample_ms));
	DBG("k[0]1222:" NRF_LOG_FLOAT_MARKER "\r\n",NRF_LOG_FLOAT(fs_in->k));
	DBG("X0:" NRF_LOG_FLOAT_MARKER "\r\n",NRF_LOG_FLOAT(fs_in->X[0]));
	DBG("X1:" NRF_LOG_FLOAT_MARKER "\r\n",NRF_LOG_FLOAT(fs_in->X[1]));
}

//void count_cal(float count_level,float angle_range, float shoulder_simple_ms,float angle,float point)
//{
//	if(X[0]>Max_count && angle>=count_level)
//	{
//		Max_count=X[0];
//		count_buf = 0;
//	}
//	if(angle<count_level && count_buf == 0)
//	{
//		fs_in.Max_count=0;		
//		fs_in.freq++;
//		fs_in.count_buf = 1;		
//	}	
//}

float ALG_FrozenShoulder_cal(FShoulder_IN fs_in,ANGLE_INFO *m_angle)
{
//		DBG("i:%d\r\n",i);
//		i++;
//	DBG("angle_in:" NRF_LOG_FLOAT_MARKER "\r\r\n",NRF_LOG_FLOAT(fs_real_time_ang));
		ii=ii+0.1;
		fs_in.angle=ii;
    stable_cal(fs_in);
	
    if(fs_in.angle>fs_in.triggrt_level && fs_in.jj==0 && fs_in.stable_buf ==1)
    {
		fs_in.j=1.0f;
		fs_in.jj=1;
		m_angle->stable=1;
		fs_in.summax = 0.0f;
    }
	//else if(stable_buf == 0)
	m_angle->stable = fs_in.stable_buf;
	m_angle->count = fs_in.freq;
    if(fs_in.j>=1)
    {
		//count_cal((float)(fs_in.triggrt_count),(float)fs_in.angle_range,(float)(fs_in.sample_ms),fs_in.angle,angle_point);
        fs_in.summax+=fs_in.angle;
        m_angle->avg_angle=fs_in.summax/fs_in.j;				
        if(fs_in.j==1)
        {
			m_angle->Min=180.0;
			fs_in.angle_point=fs_in.angle;
        }
        fs_in.j++;
        if(fs_in.angle>m_angle->Max)
        {
            m_angle->Max=fs_in.angle;
        }
        if(fs_in.angle<m_angle->Min)
        {
            m_angle->Min=fs_in.angle;
        }
    }
//		ii++;
//		if(ii>=100)
//			ii=0;
		DBG("k[0]1333:" NRF_LOG_FLOAT_MARKER "\r\n",NRF_LOG_FLOAT(fs_in.k));
		DBG("Max:" NRF_LOG_FLOAT_MARKER "\r\n",NRF_LOG_FLOAT(m_angle->Max));
		DBG("Min:" NRF_LOG_FLOAT_MARKER "\r\n",NRF_LOG_FLOAT(m_angle->Min));
		DBG("avg:" NRF_LOG_FLOAT_MARKER "\r\n",NRF_LOG_FLOAT(m_angle->avg_angle));
		DBG("stable:" NRF_LOG_FLOAT_MARKER "\r\n",NRF_LOG_FLOAT(m_angle->stable));
//		DBG("count:" NRF_LOG_FLOAT_MARKER "\r\n",NRF_LOG_FLOAT(m_angle->count));
		DBG("triggrt_count:" NRF_LOG_FLOAT_MARKER "\r\n",NRF_LOG_FLOAT(fs_in.triggrt_count));
//		DBG("\r\n");
}
