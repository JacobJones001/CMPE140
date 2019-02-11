Still in progress, I will continue to work on it until Sunday night.

inModified is concatenated to accommodate the Factiorial.v's 32-bit 'n' input.
MUX2LED is used to take in all 4-bit output and select between sets of four 4-bit outputs to be passed to the 7 segment LED
Bitstream successful

Issues: 7 Segment now outputs in decimal.
Solution: Remove the BCD32 and connect product_F straight into hex_to_7seg, however, manual requires to use it despite requesting for the output to be HEX.

**Check the FPGA Diagram in the Google Drive**