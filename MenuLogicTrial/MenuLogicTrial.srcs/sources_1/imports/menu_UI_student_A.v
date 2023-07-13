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


module menu_UI_student_A(input CLOCK,input [10:0] pixel_index, output reg [15:0] oled_pixel = 0);

always@(posedge CLOCK) begin
case(pixel_index)
105:oled_pixel <= 16'b1111111111111111;
106:oled_pixel <= 16'b1111111111111111;
107:oled_pixel <= 16'b1111111111111111;
108:oled_pixel <= 16'b1111111111111111;
112:oled_pixel <= 16'b1111111111111111;
113:oled_pixel <= 16'b1111111111111111;
114:oled_pixel <= 16'b1111111111111111;
115:oled_pixel <= 16'b1111111111111111;
116:oled_pixel <= 16'b1111111111111111;
117:oled_pixel <= 16'b1111111111111111;
118:oled_pixel <= 16'b1111111111111111;
119:oled_pixel <= 16'b1111111111111111;
123:oled_pixel <= 16'b1111111111111111;
128:oled_pixel <= 16'b1111111111111111;
132:oled_pixel <= 16'b1111111111111111;
133:oled_pixel <= 16'b1111111111111111;
134:oled_pixel <= 16'b1111111111111111;
135:oled_pixel <= 16'b1111111111111111;
136:oled_pixel <= 16'b1111111111111111;
141:oled_pixel <= 16'b1111111111111111;
142:oled_pixel <= 16'b1111111111111111;
143:oled_pixel <= 16'b1111111111111111;
144:oled_pixel <= 16'b1111111111111111;
148:oled_pixel <= 16'b1111111111111111;
153:oled_pixel <= 16'b1111111111111111;
157:oled_pixel <= 16'b1111111111111111;
158:oled_pixel <= 16'b1111111111111111;
159:oled_pixel <= 16'b1111111111111111;
160:oled_pixel <= 16'b1111111111111111;
161:oled_pixel <= 16'b1111111111111111;
162:oled_pixel <= 16'b1111111111111111;
163:oled_pixel <= 16'b1111111111111111;
164:oled_pixel <= 16'b1111111111111111;
178:oled_pixel <= 16'b1111111111111111;
179:oled_pixel <= 16'b1111111111111111;
180:oled_pixel <= 16'b1111111111111111;
181:oled_pixel <= 16'b1111111111111111;
200:oled_pixel <= 16'b1111111111111111;
201:oled_pixel <= 16'b1111111111111111;
202:oled_pixel <= 16'b1111111111111111;
203:oled_pixel <= 16'b1111111111111111;
204:oled_pixel <= 16'b1111111111111111;
205:oled_pixel <= 16'b1111111111111111;
207:oled_pixel <= 16'b1111111111111111;
208:oled_pixel <= 16'b1111111111111111;
209:oled_pixel <= 16'b1111111111111111;
210:oled_pixel <= 16'b1111111111111111;
211:oled_pixel <= 16'b1111111111111111;
212:oled_pixel <= 16'b1111111111111111;
213:oled_pixel <= 16'b1111111111111111;
214:oled_pixel <= 16'b1111111111111111;
215:oled_pixel <= 16'b1111111111111111;
216:oled_pixel <= 16'b1111111111111111;
218:oled_pixel <= 16'b1111111111111111;
219:oled_pixel <= 16'b1111111111111111;
224:oled_pixel <= 16'b1111111111111111;
225:oled_pixel <= 16'b1111111111111111;
227:oled_pixel <= 16'b1111111111111111;
228:oled_pixel <= 16'b1111111111111111;
229:oled_pixel <= 16'b1111111111111111;
230:oled_pixel <= 16'b1111111111111111;
231:oled_pixel <= 16'b1111111111111111;
232:oled_pixel <= 16'b1111111111111111;
233:oled_pixel <= 16'b1111111111111111;
236:oled_pixel <= 16'b1111111111111111;
237:oled_pixel <= 16'b1111111111111111;
238:oled_pixel <= 16'b1111111111111111;
239:oled_pixel <= 16'b1111111111111111;
240:oled_pixel <= 16'b1111111111111111;
241:oled_pixel <= 16'b1111111111111111;
243:oled_pixel <= 16'b1111111111111111;
244:oled_pixel <= 16'b1111111111111111;
245:oled_pixel <= 16'b1111111111111111;
249:oled_pixel <= 16'b1111111111111111;
250:oled_pixel <= 16'b1111111111111111;
252:oled_pixel <= 16'b1111111111111111;
253:oled_pixel <= 16'b1111111111111111;
254:oled_pixel <= 16'b1111111111111111;
255:oled_pixel <= 16'b1111111111111111;
256:oled_pixel <= 16'b1111111111111111;
257:oled_pixel <= 16'b1111111111111111;
258:oled_pixel <= 16'b1111111111111111;
259:oled_pixel <= 16'b1111111111111111;
260:oled_pixel <= 16'b1111111111111111;
261:oled_pixel <= 16'b1111111111111111;
273:oled_pixel <= 16'b1111111111111111;
274:oled_pixel <= 16'b1111111111111111;
275:oled_pixel <= 16'b1111111111111111;
276:oled_pixel <= 16'b1111111111111111;
277:oled_pixel <= 16'b1111111111111111;
278:oled_pixel <= 16'b1111111111111111;
296:oled_pixel <= 16'b1111111111111111;
297:oled_pixel <= 16'b1111111111111111;
298:oled_pixel <= 16'b1111111111111111;
307:oled_pixel <= 16'b1111111111111111;
308:oled_pixel <= 16'b1111111111111111;
314:oled_pixel <= 16'b1111111111111111;
315:oled_pixel <= 16'b1111111111111111;
320:oled_pixel <= 16'b1111111111111111;
321:oled_pixel <= 16'b1111111111111111;
323:oled_pixel <= 16'b1111111111111111;
324:oled_pixel <= 16'b1111111111111111;
328:oled_pixel <= 16'b1111111111111111;
329:oled_pixel <= 16'b1111111111111111;
330:oled_pixel <= 16'b1111111111111111;
332:oled_pixel <= 16'b1111111111111111;
333:oled_pixel <= 16'b1111111111111111;
334:oled_pixel <= 16'b1111111111111111;
339:oled_pixel <= 16'b1111111111111111;
340:oled_pixel <= 16'b1111111111111111;
341:oled_pixel <= 16'b1111111111111111;
342:oled_pixel <= 16'b1111111111111111;
345:oled_pixel <= 16'b1111111111111111;
346:oled_pixel <= 16'b1111111111111111;
352:oled_pixel <= 16'b1111111111111111;
353:oled_pixel <= 16'b1111111111111111;
368:oled_pixel <= 16'b1111111111111111;
369:oled_pixel <= 16'b1111111111111111;
370:oled_pixel <= 16'b1111111111111111;
373:oled_pixel <= 16'b1111111111111111;
374:oled_pixel <= 16'b1111111111111111;
375:oled_pixel <= 16'b1111111111111111;
392:oled_pixel <= 16'b1111111111111111;
393:oled_pixel <= 16'b1111111111111111;
403:oled_pixel <= 16'b1111111111111111;
404:oled_pixel <= 16'b1111111111111111;
410:oled_pixel <= 16'b1111111111111111;
411:oled_pixel <= 16'b1111111111111111;
416:oled_pixel <= 16'b1111111111111111;
417:oled_pixel <= 16'b1111111111111111;
419:oled_pixel <= 16'b1111111111111111;
420:oled_pixel <= 16'b1111111111111111;
425:oled_pixel <= 16'b1111111111111111;
426:oled_pixel <= 16'b1111111111111111;
428:oled_pixel <= 16'b1111111111111111;
429:oled_pixel <= 16'b1111111111111111;
435:oled_pixel <= 16'b1111111111111111;
436:oled_pixel <= 16'b1111111111111111;
437:oled_pixel <= 16'b1111111111111111;
438:oled_pixel <= 16'b1111111111111111;
439:oled_pixel <= 16'b1111111111111111;
441:oled_pixel <= 16'b1111111111111111;
442:oled_pixel <= 16'b1111111111111111;
448:oled_pixel <= 16'b1111111111111111;
449:oled_pixel <= 16'b1111111111111111;
464:oled_pixel <= 16'b1111111111111111;
465:oled_pixel <= 16'b1111111111111111;
470:oled_pixel <= 16'b1111111111111111;
471:oled_pixel <= 16'b1111111111111111;
488:oled_pixel <= 16'b1111111111111111;
489:oled_pixel <= 16'b1111111111111111;
490:oled_pixel <= 16'b1111111111111111;
491:oled_pixel <= 16'b1111111111111111;
492:oled_pixel <= 16'b1111111111111111;
499:oled_pixel <= 16'b1111111111111111;
500:oled_pixel <= 16'b1111111111111111;
506:oled_pixel <= 16'b1111111111111111;
507:oled_pixel <= 16'b1111111111111111;
512:oled_pixel <= 16'b1111111111111111;
513:oled_pixel <= 16'b1111111111111111;
515:oled_pixel <= 16'b1111111111111111;
516:oled_pixel <= 16'b1111111111111111;
521:oled_pixel <= 16'b1111111111111111;
522:oled_pixel <= 16'b1111111111111111;
524:oled_pixel <= 16'b1111111111111111;
525:oled_pixel <= 16'b1111111111111111;
526:oled_pixel <= 16'b1111111111111111;
527:oled_pixel <= 16'b1111111111111111;
531:oled_pixel <= 16'b1111111111111111;
532:oled_pixel <= 16'b1111111111111111;
534:oled_pixel <= 16'b1111111111111111;
535:oled_pixel <= 16'b1111111111111111;
536:oled_pixel <= 16'b1111111111111111;
537:oled_pixel <= 16'b1111111111111111;
538:oled_pixel <= 16'b1111111111111111;
544:oled_pixel <= 16'b1111111111111111;
545:oled_pixel <= 16'b1111111111111111;
560:oled_pixel <= 16'b1111111111111111;
561:oled_pixel <= 16'b1111111111111111;
562:oled_pixel <= 16'b1111111111111111;
563:oled_pixel <= 16'b1111111111111111;
564:oled_pixel <= 16'b1111111111111111;
565:oled_pixel <= 16'b1111111111111111;
566:oled_pixel <= 16'b1111111111111111;
567:oled_pixel <= 16'b1111111111111111;
585:oled_pixel <= 16'b1111111111111111;
586:oled_pixel <= 16'b1111111111111111;
587:oled_pixel <= 16'b1111111111111111;
588:oled_pixel <= 16'b1111111111111111;
589:oled_pixel <= 16'b1111111111111111;
595:oled_pixel <= 16'b1111111111111111;
596:oled_pixel <= 16'b1111111111111111;
602:oled_pixel <= 16'b1111111111111111;
603:oled_pixel <= 16'b1111111111111111;
608:oled_pixel <= 16'b1111111111111111;
609:oled_pixel <= 16'b1111111111111111;
611:oled_pixel <= 16'b1111111111111111;
612:oled_pixel <= 16'b1111111111111111;
617:oled_pixel <= 16'b1111111111111111;
618:oled_pixel <= 16'b1111111111111111;
620:oled_pixel <= 16'b1111111111111111;
621:oled_pixel <= 16'b1111111111111111;
622:oled_pixel <= 16'b1111111111111111;
623:oled_pixel <= 16'b1111111111111111;
627:oled_pixel <= 16'b1111111111111111;
628:oled_pixel <= 16'b1111111111111111;
631:oled_pixel <= 16'b1111111111111111;
632:oled_pixel <= 16'b1111111111111111;
633:oled_pixel <= 16'b1111111111111111;
634:oled_pixel <= 16'b1111111111111111;
640:oled_pixel <= 16'b1111111111111111;
641:oled_pixel <= 16'b1111111111111111;
656:oled_pixel <= 16'b1111111111111111;
657:oled_pixel <= 16'b1111111111111111;
658:oled_pixel <= 16'b1111111111111111;
659:oled_pixel <= 16'b1111111111111111;
660:oled_pixel <= 16'b1111111111111111;
661:oled_pixel <= 16'b1111111111111111;
662:oled_pixel <= 16'b1111111111111111;
663:oled_pixel <= 16'b1111111111111111;
684:oled_pixel <= 16'b1111111111111111;
685:oled_pixel <= 16'b1111111111111111;
691:oled_pixel <= 16'b1111111111111111;
692:oled_pixel <= 16'b1111111111111111;
698:oled_pixel <= 16'b1111111111111111;
699:oled_pixel <= 16'b1111111111111111;
704:oled_pixel <= 16'b1111111111111111;
705:oled_pixel <= 16'b1111111111111111;
707:oled_pixel <= 16'b1111111111111111;
708:oled_pixel <= 16'b1111111111111111;
713:oled_pixel <= 16'b1111111111111111;
714:oled_pixel <= 16'b1111111111111111;
716:oled_pixel <= 16'b1111111111111111;
717:oled_pixel <= 16'b1111111111111111;
723:oled_pixel <= 16'b1111111111111111;
724:oled_pixel <= 16'b1111111111111111;
728:oled_pixel <= 16'b1111111111111111;
729:oled_pixel <= 16'b1111111111111111;
730:oled_pixel <= 16'b1111111111111111;
736:oled_pixel <= 16'b1111111111111111;
737:oled_pixel <= 16'b1111111111111111;
752:oled_pixel <= 16'b1111111111111111;
753:oled_pixel <= 16'b1111111111111111;
758:oled_pixel <= 16'b1111111111111111;
759:oled_pixel <= 16'b1111111111111111;
779:oled_pixel <= 16'b1111111111111111;
780:oled_pixel <= 16'b1111111111111111;
781:oled_pixel <= 16'b1111111111111111;
787:oled_pixel <= 16'b1111111111111111;
788:oled_pixel <= 16'b1111111111111111;
794:oled_pixel <= 16'b1111111111111111;
795:oled_pixel <= 16'b1111111111111111;
796:oled_pixel <= 16'b1111111111111111;
799:oled_pixel <= 16'b1111111111111111;
800:oled_pixel <= 16'b1111111111111111;
801:oled_pixel <= 16'b1111111111111111;
803:oled_pixel <= 16'b1111111111111111;
804:oled_pixel <= 16'b1111111111111111;
808:oled_pixel <= 16'b1111111111111111;
809:oled_pixel <= 16'b1111111111111111;
810:oled_pixel <= 16'b1111111111111111;
812:oled_pixel <= 16'b1111111111111111;
813:oled_pixel <= 16'b1111111111111111;
814:oled_pixel <= 16'b1111111111111111;
819:oled_pixel <= 16'b1111111111111111;
820:oled_pixel <= 16'b1111111111111111;
825:oled_pixel <= 16'b1111111111111111;
826:oled_pixel <= 16'b1111111111111111;
832:oled_pixel <= 16'b1111111111111111;
833:oled_pixel <= 16'b1111111111111111;
848:oled_pixel <= 16'b1111111111111111;
849:oled_pixel <= 16'b1111111111111111;
854:oled_pixel <= 16'b1111111111111111;
855:oled_pixel <= 16'b1111111111111111;
872:oled_pixel <= 16'b1111111111111111;
873:oled_pixel <= 16'b1111111111111111;
874:oled_pixel <= 16'b1111111111111111;
875:oled_pixel <= 16'b1111111111111111;
876:oled_pixel <= 16'b1111111111111111;
877:oled_pixel <= 16'b1111111111111111;
883:oled_pixel <= 16'b1111111111111111;
884:oled_pixel <= 16'b1111111111111111;
890:oled_pixel <= 16'b1111111111111111;
891:oled_pixel <= 16'b1111111111111111;
892:oled_pixel <= 16'b1111111111111111;
893:oled_pixel <= 16'b1111111111111111;
894:oled_pixel <= 16'b1111111111111111;
895:oled_pixel <= 16'b1111111111111111;
896:oled_pixel <= 16'b1111111111111111;
897:oled_pixel <= 16'b1111111111111111;
899:oled_pixel <= 16'b1111111111111111;
900:oled_pixel <= 16'b1111111111111111;
901:oled_pixel <= 16'b1111111111111111;
902:oled_pixel <= 16'b1111111111111111;
903:oled_pixel <= 16'b1111111111111111;
904:oled_pixel <= 16'b1111111111111111;
905:oled_pixel <= 16'b1111111111111111;
908:oled_pixel <= 16'b1111111111111111;
909:oled_pixel <= 16'b1111111111111111;
910:oled_pixel <= 16'b1111111111111111;
911:oled_pixel <= 16'b1111111111111111;
912:oled_pixel <= 16'b1111111111111111;
913:oled_pixel <= 16'b1111111111111111;
915:oled_pixel <= 16'b1111111111111111;
916:oled_pixel <= 16'b1111111111111111;
921:oled_pixel <= 16'b1111111111111111;
922:oled_pixel <= 16'b1111111111111111;
928:oled_pixel <= 16'b1111111111111111;
929:oled_pixel <= 16'b1111111111111111;
944:oled_pixel <= 16'b1111111111111111;
945:oled_pixel <= 16'b1111111111111111;
950:oled_pixel <= 16'b1111111111111111;
951:oled_pixel <= 16'b1111111111111111;
969:oled_pixel <= 16'b1111111111111111;
970:oled_pixel <= 16'b1111111111111111;
971:oled_pixel <= 16'b1111111111111111;
972:oled_pixel <= 16'b1111111111111111;
979:oled_pixel <= 16'b1111111111111111;
987:oled_pixel <= 16'b1111111111111111;
988:oled_pixel <= 16'b1111111111111111;
989:oled_pixel <= 16'b1111111111111111;
990:oled_pixel <= 16'b1111111111111111;
991:oled_pixel <= 16'b1111111111111111;
992:oled_pixel <= 16'b1111111111111111;
996:oled_pixel <= 16'b1111111111111111;
997:oled_pixel <= 16'b1111111111111111;
998:oled_pixel <= 16'b1111111111111111;
999:oled_pixel <= 16'b1111111111111111;
1000:oled_pixel <= 16'b1111111111111111;
1005:oled_pixel <= 16'b1111111111111111;
1006:oled_pixel <= 16'b1111111111111111;
1007:oled_pixel <= 16'b1111111111111111;
1008:oled_pixel <= 16'b1111111111111111;
1012:oled_pixel <= 16'b1111111111111111;
1017:oled_pixel <= 16'b1111111111111111;
1024:oled_pixel <= 16'b1111111111111111;
1041:oled_pixel <= 16'b1111111111111111;
1046:oled_pixel <= 16'b1111111111111111;
default:oled_pixel<=0;
endcase


end
endmodule
