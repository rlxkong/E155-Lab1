module top (
    output logic led
);

    logic clk;

    // iCE40 UltraPlus internal high-speed oscillator.
    // Radiant primitive: HSOSC
    //
    // CLKHF_DIV:
    //   2'b00 = 48 MHz
    //   2'b01 = 24 MHz
    //   2'b10 = 12 MHz
    //   2'b11 =  6 MHz
    //
    HSOSC #(
        .CLKHF_DIV(2'b01)
    ) hfosc (
        .CLKHFPU(1'b1),
        .CLKHFEN(1'b1),
        .CLKHF(clk)
    );

    // 24 MHz clock.
    //
    // Toggle every 6,000,000 clocks:
    //
    //   6,000,000 / 24,000,000 = 0.25 seconds
    //
    // Thus:
    //   LED ON  = 0.25 s
    //   LED OFF = 0.25 s
    //   complete cycle = 0.5 s
    //   blink frequency = 2 Hz
    //
    localparam int unsigned HALF_PERIOD = 6_000_000;
    localparam int unsigned COUNTER_WIDTH = $clog2(HALF_PERIOD);

    logic [COUNTER_WIDTH-1:0] counter = '0;

    always_ff @(posedge clk) begin
        if (counter == HALF_PERIOD - 1) begin
            counter <= '0;
            led     <= ~led;
        end
        else begin
            counter <= counter + 1'b1;
        end
    end

endmodule