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


module tasks(input CLOCK,input [10:0] pixel_index, output reg [15:0] oled_pixel = 0);

always@(posedge CLOCK) begin
case(pixel_index)
127:oled_pixel <= 16'b1111111111111111;
128:oled_pixel <= 16'b1111111111111111;
129:oled_pixel <= 16'b1111111111111111;
130:oled_pixel <= 16'b1111111111111111;
131:oled_pixel <= 16'b1111111111111111;
132:oled_pixel <= 16'b1111111111111111;
133:oled_pixel <= 16'b1111111111111111;
134:oled_pixel <= 16'b1111111111111111;
139:oled_pixel <= 16'b1111111111111111;
140:oled_pixel <= 16'b1111111111111111;
141:oled_pixel <= 16'b1111111111111111;
142:oled_pixel <= 16'b1111111111111111;
147:oled_pixel <= 16'b1111111111111111;
148:oled_pixel <= 16'b1111111111111111;
149:oled_pixel <= 16'b1111111111111111;
150:oled_pixel <= 16'b1111111111111111;
153:oled_pixel <= 16'b1111111111111111;
158:oled_pixel <= 16'b1111111111111111;
222:oled_pixel <= 16'b1111111111111111;
223:oled_pixel <= 16'b1111111111111111;
224:oled_pixel <= 16'b1111111111111111;
225:oled_pixel <= 16'b1111111111111111;
226:oled_pixel <= 16'b1111111111111111;
227:oled_pixel <= 16'b1111111111111111;
228:oled_pixel <= 16'b1111111111111111;
229:oled_pixel <= 16'b1111111111111111;
230:oled_pixel <= 16'b1111111111111111;
231:oled_pixel <= 16'b1111111111111111;
234:oled_pixel <= 16'b1111111111111111;
235:oled_pixel <= 16'b1111111111111111;
236:oled_pixel <= 16'b1111111111111111;
237:oled_pixel <= 16'b1111111111111111;
238:oled_pixel <= 16'b1111111111111111;
239:oled_pixel <= 16'b1111111111111111;
242:oled_pixel <= 16'b1111111111111111;
243:oled_pixel <= 16'b1111111111111111;
244:oled_pixel <= 16'b1111111111111111;
245:oled_pixel <= 16'b1111111111111111;
246:oled_pixel <= 16'b1111111111111111;
247:oled_pixel <= 16'b1111111111111111;
249:oled_pixel <= 16'b1111111111111111;
250:oled_pixel <= 16'b1111111111111111;
253:oled_pixel <= 16'b1111111111111111;
254:oled_pixel <= 16'b1111111111111111;
322:oled_pixel <= 16'b1111111111111111;
323:oled_pixel <= 16'b1111111111111111;
329:oled_pixel <= 16'b1111111111111111;
330:oled_pixel <= 16'b1111111111111111;
331:oled_pixel <= 16'b1111111111111111;
334:oled_pixel <= 16'b1111111111111111;
335:oled_pixel <= 16'b1111111111111111;
336:oled_pixel <= 16'b1111111111111111;
338:oled_pixel <= 16'b1111111111111111;
339:oled_pixel <= 16'b1111111111111111;
340:oled_pixel <= 16'b1111111111111111;
345:oled_pixel <= 16'b1111111111111111;
346:oled_pixel <= 16'b1111111111111111;
349:oled_pixel <= 16'b1111111111111111;
350:oled_pixel <= 16'b1111111111111111;
418:oled_pixel <= 16'b1111111111111111;
419:oled_pixel <= 16'b1111111111111111;
425:oled_pixel <= 16'b1111111111111111;
426:oled_pixel <= 16'b1111111111111111;
431:oled_pixel <= 16'b1111111111111111;
432:oled_pixel <= 16'b1111111111111111;
434:oled_pixel <= 16'b1111111111111111;
435:oled_pixel <= 16'b1111111111111111;
441:oled_pixel <= 16'b1111111111111111;
442:oled_pixel <= 16'b1111111111111111;
444:oled_pixel <= 16'b1111111111111111;
445:oled_pixel <= 16'b1111111111111111;
446:oled_pixel <= 16'b1111111111111111;
514:oled_pixel <= 16'b1111111111111111;
515:oled_pixel <= 16'b1111111111111111;
521:oled_pixel <= 16'b1111111111111111;
522:oled_pixel <= 16'b1111111111111111;
523:oled_pixel <= 16'b1111111111111111;
524:oled_pixel <= 16'b1111111111111111;
525:oled_pixel <= 16'b1111111111111111;
526:oled_pixel <= 16'b1111111111111111;
527:oled_pixel <= 16'b1111111111111111;
528:oled_pixel <= 16'b1111111111111111;
530:oled_pixel <= 16'b1111111111111111;
531:oled_pixel <= 16'b1111111111111111;
532:oled_pixel <= 16'b1111111111111111;
533:oled_pixel <= 16'b1111111111111111;
534:oled_pixel <= 16'b1111111111111111;
537:oled_pixel <= 16'b1111111111111111;
538:oled_pixel <= 16'b1111111111111111;
539:oled_pixel <= 16'b1111111111111111;
540:oled_pixel <= 16'b1111111111111111;
541:oled_pixel <= 16'b1111111111111111;
610:oled_pixel <= 16'b1111111111111111;
611:oled_pixel <= 16'b1111111111111111;
617:oled_pixel <= 16'b1111111111111111;
618:oled_pixel <= 16'b1111111111111111;
619:oled_pixel <= 16'b1111111111111111;
620:oled_pixel <= 16'b1111111111111111;
621:oled_pixel <= 16'b1111111111111111;
622:oled_pixel <= 16'b1111111111111111;
623:oled_pixel <= 16'b1111111111111111;
624:oled_pixel <= 16'b1111111111111111;
627:oled_pixel <= 16'b1111111111111111;
628:oled_pixel <= 16'b1111111111111111;
629:oled_pixel <= 16'b1111111111111111;
630:oled_pixel <= 16'b1111111111111111;
631:oled_pixel <= 16'b1111111111111111;
633:oled_pixel <= 16'b1111111111111111;
634:oled_pixel <= 16'b1111111111111111;
635:oled_pixel <= 16'b1111111111111111;
636:oled_pixel <= 16'b1111111111111111;
637:oled_pixel <= 16'b1111111111111111;
706:oled_pixel <= 16'b1111111111111111;
707:oled_pixel <= 16'b1111111111111111;
713:oled_pixel <= 16'b1111111111111111;
714:oled_pixel <= 16'b1111111111111111;
719:oled_pixel <= 16'b1111111111111111;
720:oled_pixel <= 16'b1111111111111111;
726:oled_pixel <= 16'b1111111111111111;
727:oled_pixel <= 16'b1111111111111111;
729:oled_pixel <= 16'b1111111111111111;
730:oled_pixel <= 16'b1111111111111111;
732:oled_pixel <= 16'b1111111111111111;
733:oled_pixel <= 16'b1111111111111111;
734:oled_pixel <= 16'b1111111111111111;
802:oled_pixel <= 16'b1111111111111111;
803:oled_pixel <= 16'b1111111111111111;
809:oled_pixel <= 16'b1111111111111111;
810:oled_pixel <= 16'b1111111111111111;
815:oled_pixel <= 16'b1111111111111111;
816:oled_pixel <= 16'b1111111111111111;
821:oled_pixel <= 16'b1111111111111111;
822:oled_pixel <= 16'b1111111111111111;
823:oled_pixel <= 16'b1111111111111111;
825:oled_pixel <= 16'b1111111111111111;
826:oled_pixel <= 16'b1111111111111111;
829:oled_pixel <= 16'b1111111111111111;
830:oled_pixel <= 16'b1111111111111111;
898:oled_pixel <= 16'b1111111111111111;
899:oled_pixel <= 16'b1111111111111111;
905:oled_pixel <= 16'b1111111111111111;
906:oled_pixel <= 16'b1111111111111111;
911:oled_pixel <= 16'b1111111111111111;
912:oled_pixel <= 16'b1111111111111111;
914:oled_pixel <= 16'b1111111111111111;
915:oled_pixel <= 16'b1111111111111111;
916:oled_pixel <= 16'b1111111111111111;
917:oled_pixel <= 16'b1111111111111111;
918:oled_pixel <= 16'b1111111111111111;
919:oled_pixel <= 16'b1111111111111111;
921:oled_pixel <= 16'b1111111111111111;
922:oled_pixel <= 16'b1111111111111111;
925:oled_pixel <= 16'b1111111111111111;
926:oled_pixel <= 16'b1111111111111111;
994:oled_pixel <= 16'b1111111111111111;
1002:oled_pixel <= 16'b1111111111111111;
1007:oled_pixel <= 16'b1111111111111111;
1011:oled_pixel <= 16'b1111111111111111;
1012:oled_pixel <= 16'b1111111111111111;
1013:oled_pixel <= 16'b1111111111111111;
1014:oled_pixel <= 16'b1111111111111111;
1017:oled_pixel <= 16'b1111111111111111;
1022:oled_pixel <= 16'b1111111111111111;
default:oled_pixel<=0;
endcase

end
endmodule