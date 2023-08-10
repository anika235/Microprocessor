#include "hal.h"

static volatile uint32_t s_ticks; 
void SysTick_Handler(void) { s_ticks++; } 

void ms_delay(uint32_t ms) { 
  uint32_t start = s_ticks;
  while (s_ticks - start < ms);
}

void initClock(void) {
  RCC->CR |= (1 << 16);  
  while (!(RCC->CR & (1 << 17)));  
  RCC->APB1ENR |= (1 << 28);  
  PWR->CR |= (3U << 14);  

  FLASH->ACR |= (1 << 9) | (1 << 10) 
      | (1 << 8) | (5 << 0);  

  RCC->CFGR |= 0;
  RCC->CFGR |= 0x00001400U;
  RCC->CFGR |= 0x00008000U;

  RCC->PLLCFGR = (PLL_M << 0) | (PLL_N << 6) 
        | (PLL_P << 16) | (1 << 22);

  RCC->CR |= (1 << 24);
  while (!(RCC->CR & (1 <<  25))); 
  RCC->CFGR |= (2 << 0);
  while ((RCC->CFGR & (3 << 2)) != 0x00000008U);
}

int main(void) {
  initClock();
  uint16_t led = 5;
  RCC->AHB1ENR |= (1 << 0);
  systick_init(FREQ / 1000);
  gpio_set_mode(GPIOA, led, GPIO_MODE_OUTPUT);
  for (;;) {
    ms_delay(500);
    gpio_write(GPIOA, led, 1);
    ms_delay(500);
    gpio_write(GPIOA, led, 0);
  }
  return 0;
}