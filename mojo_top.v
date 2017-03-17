module mojo_top (
    input clk,
    input rst_n,
    output [7:0] led,
    input cclk,
    output spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output [3:0] spi_channel,
    input avr_tx,
    output avr_rx,
    input avr_rx_busy
  );

  wire rst;

  wire [1-1:0] M_reset_cond_out;
  wire [1-1:0] M_reset_cond_in;

  reset_conditioner reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );

  assign M_reset_cond_in = ~rst_n;
  assign rst = M_reset_cond_out;
  assign led = 8'h55;
  assign spi_miso = 1'bz;
  assign spi_channel = 4'bzzzz;
  assign avr_rx = 1'bz;
endmodule
