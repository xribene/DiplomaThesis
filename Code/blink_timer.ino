/**
 * Flash two LEDs at different rates (frequencies) and different duty cycles 
 * using an extended Simon Monk's Timer library.
 **/
//https://github.com/xribene/Timer at branch feat/adj_duty_cycle    
#include "Timer.h"        
const int LED1 = 8;  
const int LED2 = 9;
float dt2 = 0.1; // set the duty_cycle for LED1
int freq1=1; // set frequency of the first oscillation (LED1) at 1Hz
int freq2=2; // set frequency of the first oscillation (LED2) at 2Hz
// period of oscillation of the first led 
const unsigned long PERIOD_1 = 1000; 
// timeON = the amount of time in the period that LED2 will be on
const unsigned long timeON_2 = dt2*1000/freq2; 
// timeOFF = the amount of time in the period that LED2 will be off
const unsigned long timeOFF_2 = (1-dt2)*1000/freq2; 

Timer t; //instantiate the timer object
int event1,event2;

void setup()
{
    Serial.begin(9600);
    pinMode(LED1, OUTPUT);
    pinMode(LED2, OUTPUT);
    // oscillation command before the feature addition.
    // in this case timeON=timeOFF=PERIOD1, so duty_cycle=0.5
    event1=t.oscillate(LED1, PERIOD_1, HIGH);
    // oscillation command after the new feature. Instead of defining the
    // period you define timeON and timeOFF
    event2=t.oscillate(LED1, timeON_2 ,HIGH,timeOFF_2);
    // after 10 secs run doAfter() to stop both leds from blinking
    t.after(10000, doAfter); 
}
void loop()
{
    t.update();
}
void doAfter()
{  
    t.stop(event1); // stop event1
    t.stop(event2); // stop event2
}