`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//  STUDENT A NAME: 
//  STUDENT B NAME:
//  STUDENT C NAME: 
//  STUDENT D NAME:  
//
//////////////////////////////////////////////////////////////////////////////////


module sad(input CLOCK,input [10:0] pixel_index, output reg [15:0] oled_pixel = 0);

always@(posedge CLOCK) begin
case(pixel_index)
133:oled_pixel <= 16'b1011010110110110;
134:oled_pixel <= 16'b1011010110110110;
135:oled_pixel <= 16'b1011010110110110;
136:oled_pixel <= 16'b1011010110110110;
141:oled_pixel <= 16'b1011010110110110;
142:oled_pixel <= 16'b1011010110110110;
143:oled_pixel <= 16'b1011010110110110;
144:oled_pixel <= 16'b1011010110110110;
149:oled_pixel <= 16'b1011010110110110;
150:oled_pixel <= 16'b1011010110110110;
151:oled_pixel <= 16'b1011010110110110;
152:oled_pixel <= 16'b1011010110110110;
153:oled_pixel <= 16'b1011010110110110;
228:oled_pixel <= 16'b1011010110110110;
229:oled_pixel <= 16'b1011010110110110;
230:oled_pixel <= 16'b1011010110110110;
231:oled_pixel <= 16'b1011010110110110;
232:oled_pixel <= 16'b1011010110110110;
233:oled_pixel <= 16'b1011010110110110;
236:oled_pixel <= 16'b1011010110110110;
237:oled_pixel <= 16'b1011010110110110;
238:oled_pixel <= 16'b1011010110110110;
239:oled_pixel <= 16'b1011010110110110;
240:oled_pixel <= 16'b1011010110110110;
241:oled_pixel <= 16'b1011010110110110;
244:oled_pixel <= 16'b1011010110110110;
245:oled_pixel <= 16'b1011010110110110;
246:oled_pixel <= 16'b1011010110110110;
247:oled_pixel <= 16'b1011010110110110;
248:oled_pixel <= 16'b1011010110110110;
249:oled_pixel <= 16'b1011010110110110;
250:oled_pixel <= 16'b1011010110110110;
324:oled_pixel <= 16'b1011010110110110;
325:oled_pixel <= 16'b1011010110110110;
326:oled_pixel <= 16'b1011010110110110;
331:oled_pixel <= 16'b1011010110110110;
332:oled_pixel <= 16'b1011010110110110;
333:oled_pixel <= 16'b1011010110110110;
336:oled_pixel <= 16'b1011010110110110;
337:oled_pixel <= 16'b1011010110110110;
338:oled_pixel <= 16'b1011010110110110;
340:oled_pixel <= 16'b1011010110110110;
341:oled_pixel <= 16'b1011010110110110;
345:oled_pixel <= 16'b1011010110110110;
346:oled_pixel <= 16'b1011010110110110;
347:oled_pixel <= 16'b1011010110110110;
420:oled_pixel <= 16'b1011010110110110;
421:oled_pixel <= 16'b1011010110110110;
427:oled_pixel <= 16'b1011010110110110;
428:oled_pixel <= 16'b1011010110110110;
433:oled_pixel <= 16'b1011010110110110;
434:oled_pixel <= 16'b1011010110110110;
436:oled_pixel <= 16'b1011010110110110;
437:oled_pixel <= 16'b1011010110110110;
442:oled_pixel <= 16'b1011010110110110;
443:oled_pixel <= 16'b1011010110110110;
516:oled_pixel <= 16'b1011010110110110;
517:oled_pixel <= 16'b1011010110110110;
518:oled_pixel <= 16'b1011010110110110;
519:oled_pixel <= 16'b1011010110110110;
520:oled_pixel <= 16'b1011010110110110;
523:oled_pixel <= 16'b1011010110110110;
524:oled_pixel <= 16'b1011010110110110;
525:oled_pixel <= 16'b1011010110110110;
526:oled_pixel <= 16'b1011010110110110;
527:oled_pixel <= 16'b1011010110110110;
528:oled_pixel <= 16'b1011010110110110;
529:oled_pixel <= 16'b1011010110110110;
530:oled_pixel <= 16'b1011010110110110;
532:oled_pixel <= 16'b1011010110110110;
533:oled_pixel <= 16'b1011010110110110;
538:oled_pixel <= 16'b1011010110110110;
539:oled_pixel <= 16'b1011010110110110;
613:oled_pixel <= 16'b1011010110110110;
614:oled_pixel <= 16'b1011010110110110;
615:oled_pixel <= 16'b1011010110110110;
616:oled_pixel <= 16'b1011010110110110;
617:oled_pixel <= 16'b1011010110110110;
619:oled_pixel <= 16'b1011010110110110;
620:oled_pixel <= 16'b1011010110110110;
621:oled_pixel <= 16'b1011010110110110;
622:oled_pixel <= 16'b1011010110110110;
623:oled_pixel <= 16'b1011010110110110;
624:oled_pixel <= 16'b1011010110110110;
625:oled_pixel <= 16'b1011010110110110;
626:oled_pixel <= 16'b1011010110110110;
628:oled_pixel <= 16'b1011010110110110;
629:oled_pixel <= 16'b1011010110110110;
634:oled_pixel <= 16'b1011010110110110;
635:oled_pixel <= 16'b1011010110110110;
712:oled_pixel <= 16'b1011010110110110;
713:oled_pixel <= 16'b1011010110110110;
715:oled_pixel <= 16'b1011010110110110;
716:oled_pixel <= 16'b1011010110110110;
721:oled_pixel <= 16'b1011010110110110;
722:oled_pixel <= 16'b1011010110110110;
724:oled_pixel <= 16'b1011010110110110;
725:oled_pixel <= 16'b1011010110110110;
730:oled_pixel <= 16'b1011010110110110;
731:oled_pixel <= 16'b1011010110110110;
807:oled_pixel <= 16'b1011010110110110;
808:oled_pixel <= 16'b1011010110110110;
809:oled_pixel <= 16'b1011010110110110;
811:oled_pixel <= 16'b1011010110110110;
812:oled_pixel <= 16'b1011010110110110;
817:oled_pixel <= 16'b1011010110110110;
818:oled_pixel <= 16'b1011010110110110;
820:oled_pixel <= 16'b1011010110110110;
821:oled_pixel <= 16'b1011010110110110;
825:oled_pixel <= 16'b1011010110110110;
826:oled_pixel <= 16'b1011010110110110;
827:oled_pixel <= 16'b1011010110110110;
900:oled_pixel <= 16'b1011010110110110;
901:oled_pixel <= 16'b1011010110110110;
902:oled_pixel <= 16'b1011010110110110;
903:oled_pixel <= 16'b1011010110110110;
904:oled_pixel <= 16'b1011010110110110;
905:oled_pixel <= 16'b1011010110110110;
907:oled_pixel <= 16'b1011010110110110;
908:oled_pixel <= 16'b1011010110110110;
913:oled_pixel <= 16'b1011010110110110;
914:oled_pixel <= 16'b1011010110110110;
916:oled_pixel <= 16'b1011010110110110;
917:oled_pixel <= 16'b1011010110110110;
918:oled_pixel <= 16'b1011010110110110;
919:oled_pixel <= 16'b1011010110110110;
920:oled_pixel <= 16'b1011010110110110;
921:oled_pixel <= 16'b1011010110110110;
922:oled_pixel <= 16'b1011010110110110;
997:oled_pixel <= 16'b1011010110110110;
998:oled_pixel <= 16'b1011010110110110;
999:oled_pixel <= 16'b1011010110110110;
1000:oled_pixel <= 16'b1011010110110110;
1004:oled_pixel <= 16'b1011010110110110;
1009:oled_pixel <= 16'b1011010110110110;
1013:oled_pixel <= 16'b1011010110110110;
1014:oled_pixel <= 16'b1011010110110110;
1015:oled_pixel <= 16'b1011010110110110;
1016:oled_pixel <= 16'b1011010110110110;
1017:oled_pixel <= 16'b1011010110110110;
default:oled_pixel<=0;
endcase

end
endmodule