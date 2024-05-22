#include "init.h"
#include "xparameters.h"
#include "TesterHW.h"
#include "platform.h"
#include "xil_printf.h"
#include "xil_io.h"
// Global Variables Declaration
XScuGic INTCInst;
extern int Intr_flag;
int ret;
int valid;

int IntrInitFunction(u16 DeviceId)
{
	XScuGic_Config *IntcConfig;
	int Status ;

	//Check device id
	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	//Initialization
	Status = XScuGic_CfgInitialize(&INTCInst, IntcConfig, IntcConfig->CpuBaseAddress) ;
	if (Status != XST_SUCCESS)
		return XST_FAILURE ;


	XScuGic_SetPriorityTriggerType(&INTCInst, INTC_INTERRUPT_ID,
			0xA0, 0x3);

	Status = XScuGic_Connect(&INTCInst, INTC_INTERRUPT_ID,
			(Xil_ExceptionHandler)IntrHandler,
			(void *)&INTCInst) ;
	if (Status != XST_SUCCESS)
		return XST_FAILURE ;

	XScuGic_Enable(&INTCInst, INTC_INTERRUPT_ID) ;


	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler)XScuGic_InterruptHandler,
			&INTCInst);
	Xil_ExceptionEnable();


	return XST_SUCCESS ;
}

void IntrHandler(void *CallbackRef)
{
	Intr_flag = 1;
	ret = TESTERHW_mReadReg(XPAR_TESTERHW_0_S00_AXI_BASEADDR, TESTERHW_S00_AXI_SLV_REG0_OFFSET);
	valid = CheckValid();
	char output[50];
	switch(valid){
		case 0:
			char prefix[20] = "Your Reaction Time:";
			sprintf(output, "%s %d ms\n", prefix, ret);
			break;
		case 1:
			sprintf(output, "You press the button too soon! Please retry!\n");
			break;
		case 2:
			sprintf(output, "You press the button too late! Please retry!\n");
			break;
	}

	print(output);
}

int CheckValid() {
	return TESTERHW_mReadReg(XPAR_TESTERHW_0_S00_AXI_BASEADDR, TESTERHW_S00_AXI_SLV_REG1_OFFSET);
}
