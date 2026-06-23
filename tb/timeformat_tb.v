`timescale 1ns/1ps

module timeformat_tb;

  reg	a;

  initial begin

    // Wait for some time - note that because precision is 1/1000 of
    // the main scale (1ns), this delay will be truncated by the 3rd
    // position
    #10.512351;

    // Display current time with default timeformat parameters
    $display("[T=%0t] a=%0b", $realtime, a);

    // Change timeformat parameters and display again
    $timeformat(-9, 2, " ns");
    $display("[T=%0t] a=%0b", $realtime, a);

    // Remove the space in suffix, and extend fractional digits to 5
    $timeformat(-9, 5, "ns");
    $display("[T=%0t] a=%0b", $realtime, a);

    // Here suffix is wrong, it should not be "ns" because we are
    // setting display in "ps" (-12)
    $timeformat(-12, 3, " ns");
    $display("[T=%0t] a=%0b", $realtime, a);

    // Correct the suffix to ps
    $timeformat(-12, 2, " ps");
    $display("[T=%0t] a=%0b", $realtime, a);
  end
endmodule