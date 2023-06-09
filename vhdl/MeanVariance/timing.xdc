#200 MHz system clock
# 'SYSCLK' in the VC709 manual, 'clk200' in this project
create_clock -period 5.000 -name clk200 [get_ports {clk200_p}]

# programmable oscillator
# 'USER_CLOCK' in the VC709 manual, 'prog_clk' in this project
# The oscillator should be programmed for 125 MHz. However, in this
# design, it runs at the default 156.25 MHz. Internally, it is changes to
# 125 MHz. The chip is configured to drive, rather than receive, the
# USER_SMA connectors. A pair of cables will loop this back to the GTH_SMA connectors.
create_clock -period 6.400 -name prog_clk [get_ports {prog_clk_p}]
create_clock -period 8.000 -name gt_clk [get_ports {gt_clkp}]

# specify what clocks are asynchronous to others
set_clock_groups -asynchronous -group [get_clocks clk200]
set_clock_groups -asynchronous -group [get_clocks prog_clk]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks gt_clk]

