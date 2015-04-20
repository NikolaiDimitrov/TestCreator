#include <basedef.h>
#include <Board.h>
#include <stdio.h>

#include <fixedsys.h>
#include <lcd_GE8.h>

#include <time.h>
#include <stdlib.h>

void Delay (unsigned long a) {while (--a!=0);}

int main()
{

	AT91PS_PIO    p_pPioA  = AT91C_BASE_PIOA;
	AT91PS_PIO    p_pPioB  = AT91C_BASE_PIOB;
	AT91PS_PMC    p_pPMC   = AT91C_BASE_PMC;
	AT91PS_SYS    p_pSys   = AT91C_BASE_SYS;
	
	int 	SW1_prev, SW1_cur, SW2_prev, SW2_cur;

	char msg[100];
	int k;
	int r;

//	char* directionUp = "UP";
//	char* directionDown = "DOWN";
//	char* directionLeft = "LEFT";
//	char* directionRight = "RIGHT";
//	char* directionPush = "PUSH";
   	char* directions[5] = {"UP", "Down", "Left", "Right", "Push"};


	
	/* Initialize the Atmel AT91SAM7X256 (watchdog, PLL clock, default interrupts, etc.) */
	AT91F_LowLevel_Init();

	//enable the clock of the PIO
	p_pPMC->PMC_PCER = 1 << AT91C_ID_PIOA;
	//enable the clock of the PIO
	p_pPMC->PMC_PCER = 1 << AT91C_ID_PIOB;

	// GPIO init
	p_pPioA->PIO_ODR    = 0xffffffff;   // All as input
	p_pPioB->PIO_ODR    = 0xffffffff;   // All as input
	p_pSys->PIOA_PPUDR  = 0xffffffff;   // Disable Pull-up resistor
	p_pSys->PIOB_PPUDR  = 0xffffffff;   // Disable Pull-up resistor

#define	BIT_SW1 0x01000000
#define	BIT_SW2 0x02000000
#define	BIT_SW3 0x03000000

#define	BIT_JUP 0x0000200
#define	BIT_JDOWN 0x0000100
#define	BIT_JLEFT 0x000080

#define	BIT_JRIGHT 0x0004000
#define	BIT_JPUSH 0x00008000


	// BUTTON SW1
	p_pPioB->PIO_ODR |= BIT_SW1; //Configure in Input
	p_pPioB->PIO_PER |= BIT_SW1; //Enable PB24

	// BUTTON SW2
	p_pPioB->PIO_ODR |= BIT_SW2; //Configure in Input
	p_pPioB->PIO_PER |= BIT_SW2; //Enable PB25
											   
	// BUTTON SW2
	p_pPioB->PIO_ODR |= BIT_SW3; //Configure in Input
	p_pPioB->PIO_PER |= BIT_SW3; //Enable PB25	  PB24

  
	// JOYSTICK PUSH 
	p_pPioA->PIO_ODR |= BIT_JPUSH; //Configure in Input
	p_pPioA->PIO_PER |= BIT_JPUSH; //Enable PA8

	// JOYSTICK LEFT 
	p_pPioA->PIO_ODR |= BIT_JLEFT; //Configure in Input
	p_pPioA->PIO_PER |= BIT_JLEFT; //Enable PA8
	
	// JOYSTICK RIGHT 
	p_pPioA->PIO_ODR |= BIT_JRIGHT; //Configure in Input
	p_pPioA->PIO_PER |= BIT_JRIGHT; //Enable PA8
	
	// JOYSTICK UP 
	p_pPioA->PIO_ODR |= BIT_JUP; //Configure in Input
	p_pPioA->PIO_PER |= BIT_JUP; //Enable PA8

	// JOYSTICK DWON 
	p_pPioA->PIO_ODR |= BIT_JDOWN; //Configure in Input
	p_pPioA->PIO_PER |= BIT_JDOWN; //Enable PA8				 

	/* Init the LCD */
	InitLCD();
	LCD_ClearScreen( LCD_COLOR_RED );

	/* enable interrupts */
	AT91F_Finalize_Init();

	
	/* add your program here ... */
	
	
	SW1_cur=0;
	SW2_cur=0;
	SW1_prev=0;
	SW2_prev=0;
	/* ... and here */
	while ( true ) {	  
	    // check button SW3

		
	   	r = rand() % 5;
		//printf(msg, directions[r]); LCD_WriteString(msg, FONT_DESCRIPTOR, 10, 60, LCD_COLOR_BLACK, LCD_COLOR_BLUE);
	
		 	LCD_WriteString(directions[r], &Fixedsys_descriptor, 2, 40, LCD_COLOR_WHITE, LCD_COLOR_BLUE);
			Delay(5000000);
			LCD_ClearScreen( LCD_COLOR_RED );

	/*	
		if((p_pPioA->PIO_PDSR) & BIT_JPUSH){
			LCD_WriteString("No Push", &Fixedsys_descriptor, 2, 20, LCD_COLOR_WHITE, LCD_COLOR_BLUE);	
		}
		else{
			LCD_WriteString("PUSHEDDDDDD", &Fixedsys_descriptor, 2, 20, LCD_COLOR_WHITE, LCD_COLOR_BLUE);		
		}

		if((p_pPioA->PIO_PDSR) & BIT_JUP){
			LCD_WriteString("No UP", &Fixedsys_descriptor, 2, 40, LCD_COLOR_WHITE, LCD_COLOR_BLUE);	
		}
		else{
			LCD_WriteString("UPPPPPPPPPP", &Fixedsys_descriptor, 2, 40, LCD_COLOR_WHITE, LCD_COLOR_BLUE);		
		}

		if((p_pPioA->PIO_PDSR) & BIT_JLEFT){
			LCD_WriteString("No LEFT", &Fixedsys_descriptor, 2, 60, LCD_COLOR_WHITE, LCD_COLOR_BLUE);	
		}
		else{
			LCD_WriteString("L\EFTTTTTTTT", &Fixedsys_descriptor, 2, 60, LCD_COLOR_WHITE, LCD_COLOR_BLUE);		
		}

		if((p_pPioA->PIO_PDSR) & BIT_JRIGHT){
			LCD_WriteString("No RIGHT", &Fixedsys_descriptor, 2, 80, LCD_COLOR_WHITE, LCD_COLOR_BLUE);	
		}
		else{
			LCD_WriteString("RIGHTTTTTTT", &Fixedsys_descriptor, 2, 80, LCD_COLOR_WHITE, LCD_COLOR_BLUE);		
		}

		if((p_pPioA->PIO_PDSR) & BIT_JDOWN){
			LCD_WriteString("No DOWN", &Fixedsys_descriptor, 2, 100, LCD_COLOR_WHITE, LCD_COLOR_BLUE);	
		}
		else{
			LCD_WriteString("DOWNNNNNNNN", &Fixedsys_descriptor, 2, 100, LCD_COLOR_WHITE, LCD_COLOR_BLUE);		
		}

	} 
	
	/* Actually, the execution never gets here */
	return -1;
}
