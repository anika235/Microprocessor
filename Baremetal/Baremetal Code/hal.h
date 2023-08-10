#pragma once 

#include <inttypes.h> 
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>

#define FREQ 180000000

struct systick {
  volatile uint32_t CTRL, LOAD, VAL, CALIB;
};
#define SYSTICK ((struct systick *)0xe000e010)

struct rcc {
  volatile uint32_t CR, PLLCFGR, CFGR, CIR, AHB1RSTR, AHB2RSTR, AHB3RSTR,
    RESERVED0, APB1RSTR, APB2RSTR, RESERVED1[2], AHB1ENR, AHB2ENR, AHB3ENR,
    RESERVED2, APB1ENR, APB2ENR, RESERVED3[2], AHB1LPENR, AHB2LPENR,
    AHB3LPENR, RESERVED4, APB1LPENR, APB2LPENR, RESERVED5[2], BDCR, CSR,
    RESERVED6[2], SSCGR, PLLI2SCFGR;
};
#define RCC ((struct rcc *)0x40023800)

#define PLL_M 4
#define PLL_N 180
#define PLL_P 0

struct flash {
  volatile uint32_t ACR, KEYR, OPTKEYR, SR, CR, OPTCR, OPTCR1;
};

struct pwr {
  volatile uint32_t CR, CSR; 
};

#define FLASH ((struct flash *)0x40023C00)
#define PWR ((struct pwr *)0x40007000)

static inline void systick_init(uint32_t ticks) {
  SYSTICK->LOAD = ticks - 1;
  SYSTICK->VAL = 0;
  SYSTICK->CTRL = (1 << 0) | (1 << 1) | (1 << 2);
  RCC->APB2ENR |= (1 << 14);
}

struct gpio {
  volatile uint32_t MODER, OTYPER, OSPEEDR, PUPDR, IDR, ODR, BSRR, LCKR, AFR[2];
};
#define GPIOA ((struct gpio *)(0x40020000))

enum { GPIO_MODE_INPUT,
       GPIO_MODE_OUTPUT,
       GPIO_MODE_AF,
       GPIO_MODE_ANALOG };

static inline void gpio_set_mode(struct gpio *gpio, uint16_t pin, uint8_t mode) {
  RCC->AHB1ENR |= (1U << 0);
  gpio->MODER &= ~(3U << (pin * 2));
  gpio->MODER |= mode << (pin * 2);
}

static inline void gpio_write(struct gpio *gpio, uint16_t pin, bool val) {
  gpio->BSRR = (1U << pin) << (val ? 0 : 16);
}
