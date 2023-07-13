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


module menu_UI_student_G(input CLOCK,input [10:0] pixel_index, output reg [15:0] oled_pixel = 0);

always@(posedge CLOCK) begin
case(pixel_index)
108:oled_pixel <= 16'b1111111111111111;
109:oled_pixel <= 16'b1111111111111111;
110:oled_pixel <= 16'b1111111111111111;
111:oled_pixel <= 16'b1111111111111111;
112:oled_pixel <= 16'b1111111111111111;
116:oled_pixel <= 16'b1111111111111111;
117:oled_pixel <= 16'b1111111111111111;
118:oled_pixel <= 16'b1111111111111111;
119:oled_pixel <= 16'b1111111111111111;
123:oled_pixel <= 16'b1111111111111111;
124:oled_pixel <= 16'b1111111111111111;
125:oled_pixel <= 16'b1111111111111111;
126:oled_pixel <= 16'b1111111111111111;
127:oled_pixel <= 16'b1111111111111111;
128:oled_pixel <= 16'b1111111111111111;
132:oled_pixel <= 16'b1111111111111111;
137:oled_pixel <= 16'b1111111111111111;
141:oled_pixel <= 16'b1111111111111111;
142:oled_pixel <= 16'b1111111111111111;
143:oled_pixel <= 16'b1111111111111111;
144:oled_pixel <= 16'b1111111111111111;
148:oled_pixel <= 16'b1111111111111111;
149:oled_pixel <= 16'b1111111111111111;
150:oled_pixel <= 16'b1111111111111111;
151:oled_pixel <= 16'b1111111111111111;
152:oled_pixel <= 16'b1111111111111111;
153:oled_pixel <= 16'b1111111111111111;
154:oled_pixel <= 16'b1111111111111111;
155:oled_pixel <= 16'b1111111111111111;
160:oled_pixel <= 16'b1111111111111111;
161:oled_pixel <= 16'b1111111111111111;
162:oled_pixel <= 16'b1111111111111111;
163:oled_pixel <= 16'b1111111111111111;
168:oled_pixel <= 16'b1111111111111111;
169:oled_pixel <= 16'b1111111111111111;
170:oled_pixel <= 16'b1111111111111111;
171:oled_pixel <= 16'b1111111111111111;
174:oled_pixel <= 16'b1111111111111111;
179:oled_pixel <= 16'b1111111111111111;
203:oled_pixel <= 16'b1111111111111111;
204:oled_pixel <= 16'b1111111111111111;
205:oled_pixel <= 16'b1111111111111111;
206:oled_pixel <= 16'b1111111111111111;
207:oled_pixel <= 16'b1111111111111111;
208:oled_pixel <= 16'b1111111111111111;
209:oled_pixel <= 16'b1111111111111111;
211:oled_pixel <= 16'b1111111111111111;
212:oled_pixel <= 16'b1111111111111111;
213:oled_pixel <= 16'b1111111111111111;
214:oled_pixel <= 16'b1111111111111111;
215:oled_pixel <= 16'b1111111111111111;
216:oled_pixel <= 16'b1111111111111111;
218:oled_pixel <= 16'b1111111111111111;
219:oled_pixel <= 16'b1111111111111111;
220:oled_pixel <= 16'b1111111111111111;
221:oled_pixel <= 16'b1111111111111111;
222:oled_pixel <= 16'b1111111111111111;
223:oled_pixel <= 16'b1111111111111111;
224:oled_pixel <= 16'b1111111111111111;
225:oled_pixel <= 16'b1111111111111111;
227:oled_pixel <= 16'b1111111111111111;
228:oled_pixel <= 16'b1111111111111111;
233:oled_pixel <= 16'b1111111111111111;
234:oled_pixel <= 16'b1111111111111111;
236:oled_pixel <= 16'b1111111111111111;
237:oled_pixel <= 16'b1111111111111111;
238:oled_pixel <= 16'b1111111111111111;
239:oled_pixel <= 16'b1111111111111111;
240:oled_pixel <= 16'b1111111111111111;
241:oled_pixel <= 16'b1111111111111111;
243:oled_pixel <= 16'b1111111111111111;
244:oled_pixel <= 16'b1111111111111111;
245:oled_pixel <= 16'b1111111111111111;
246:oled_pixel <= 16'b1111111111111111;
247:oled_pixel <= 16'b1111111111111111;
248:oled_pixel <= 16'b1111111111111111;
249:oled_pixel <= 16'b1111111111111111;
250:oled_pixel <= 16'b1111111111111111;
251:oled_pixel <= 16'b1111111111111111;
252:oled_pixel <= 16'b1111111111111111;
255:oled_pixel <= 16'b1111111111111111;
256:oled_pixel <= 16'b1111111111111111;
257:oled_pixel <= 16'b1111111111111111;
258:oled_pixel <= 16'b1111111111111111;
259:oled_pixel <= 16'b1111111111111111;
260:oled_pixel <= 16'b1111111111111111;
263:oled_pixel <= 16'b1111111111111111;
264:oled_pixel <= 16'b1111111111111111;
265:oled_pixel <= 16'b1111111111111111;
266:oled_pixel <= 16'b1111111111111111;
267:oled_pixel <= 16'b1111111111111111;
268:oled_pixel <= 16'b1111111111111111;
270:oled_pixel <= 16'b1111111111111111;
271:oled_pixel <= 16'b1111111111111111;
274:oled_pixel <= 16'b1111111111111111;
275:oled_pixel <= 16'b1111111111111111;
299:oled_pixel <= 16'b1111111111111111;
300:oled_pixel <= 16'b1111111111111111;
301:oled_pixel <= 16'b1111111111111111;
307:oled_pixel <= 16'b1111111111111111;
308:oled_pixel <= 16'b1111111111111111;
311:oled_pixel <= 16'b1111111111111111;
312:oled_pixel <= 16'b1111111111111111;
314:oled_pixel <= 16'b1111111111111111;
315:oled_pixel <= 16'b1111111111111111;
316:oled_pixel <= 16'b1111111111111111;
319:oled_pixel <= 16'b1111111111111111;
320:oled_pixel <= 16'b1111111111111111;
321:oled_pixel <= 16'b1111111111111111;
323:oled_pixel <= 16'b1111111111111111;
324:oled_pixel <= 16'b1111111111111111;
329:oled_pixel <= 16'b1111111111111111;
330:oled_pixel <= 16'b1111111111111111;
332:oled_pixel <= 16'b1111111111111111;
333:oled_pixel <= 16'b1111111111111111;
336:oled_pixel <= 16'b1111111111111111;
337:oled_pixel <= 16'b1111111111111111;
343:oled_pixel <= 16'b1111111111111111;
344:oled_pixel <= 16'b1111111111111111;
350:oled_pixel <= 16'b1111111111111111;
351:oled_pixel <= 16'b1111111111111111;
352:oled_pixel <= 16'b1111111111111111;
355:oled_pixel <= 16'b1111111111111111;
356:oled_pixel <= 16'b1111111111111111;
357:oled_pixel <= 16'b1111111111111111;
359:oled_pixel <= 16'b1111111111111111;
360:oled_pixel <= 16'b1111111111111111;
361:oled_pixel <= 16'b1111111111111111;
366:oled_pixel <= 16'b1111111111111111;
367:oled_pixel <= 16'b1111111111111111;
370:oled_pixel <= 16'b1111111111111111;
371:oled_pixel <= 16'b1111111111111111;
395:oled_pixel <= 16'b1111111111111111;
396:oled_pixel <= 16'b1111111111111111;
403:oled_pixel <= 16'b1111111111111111;
404:oled_pixel <= 16'b1111111111111111;
407:oled_pixel <= 16'b1111111111111111;
408:oled_pixel <= 16'b1111111111111111;
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
432:oled_pixel <= 16'b1111111111111111;
433:oled_pixel <= 16'b1111111111111111;
439:oled_pixel <= 16'b1111111111111111;
440:oled_pixel <= 16'b1111111111111111;
446:oled_pixel <= 16'b1111111111111111;
447:oled_pixel <= 16'b1111111111111111;
452:oled_pixel <= 16'b1111111111111111;
453:oled_pixel <= 16'b1111111111111111;
455:oled_pixel <= 16'b1111111111111111;
456:oled_pixel <= 16'b1111111111111111;
462:oled_pixel <= 16'b1111111111111111;
463:oled_pixel <= 16'b1111111111111111;
465:oled_pixel <= 16'b1111111111111111;
466:oled_pixel <= 16'b1111111111111111;
467:oled_pixel <= 16'b1111111111111111;
491:oled_pixel <= 16'b1111111111111111;
492:oled_pixel <= 16'b1111111111111111;
495:oled_pixel <= 16'b1111111111111111;
496:oled_pixel <= 16'b1111111111111111;
497:oled_pixel <= 16'b1111111111111111;
499:oled_pixel <= 16'b1111111111111111;
500:oled_pixel <= 16'b1111111111111111;
502:oled_pixel <= 16'b1111111111111111;
503:oled_pixel <= 16'b1111111111111111;
504:oled_pixel <= 16'b1111111111111111;
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
528:oled_pixel <= 16'b1111111111111111;
529:oled_pixel <= 16'b1111111111111111;
535:oled_pixel <= 16'b1111111111111111;
536:oled_pixel <= 16'b1111111111111111;
542:oled_pixel <= 16'b1111111111111111;
543:oled_pixel <= 16'b1111111111111111;
544:oled_pixel <= 16'b1111111111111111;
545:oled_pixel <= 16'b1111111111111111;
546:oled_pixel <= 16'b1111111111111111;
547:oled_pixel <= 16'b1111111111111111;
548:oled_pixel <= 16'b1111111111111111;
549:oled_pixel <= 16'b1111111111111111;
551:oled_pixel <= 16'b1111111111111111;
552:oled_pixel <= 16'b1111111111111111;
553:oled_pixel <= 16'b1111111111111111;
554:oled_pixel <= 16'b1111111111111111;
555:oled_pixel <= 16'b1111111111111111;
558:oled_pixel <= 16'b1111111111111111;
559:oled_pixel <= 16'b1111111111111111;
560:oled_pixel <= 16'b1111111111111111;
561:oled_pixel <= 16'b1111111111111111;
562:oled_pixel <= 16'b1111111111111111;
587:oled_pixel <= 16'b1111111111111111;
588:oled_pixel <= 16'b1111111111111111;
590:oled_pixel <= 16'b1111111111111111;
591:oled_pixel <= 16'b1111111111111111;
592:oled_pixel <= 16'b1111111111111111;
593:oled_pixel <= 16'b1111111111111111;
595:oled_pixel <= 16'b1111111111111111;
596:oled_pixel <= 16'b1111111111111111;
597:oled_pixel <= 16'b1111111111111111;
598:oled_pixel <= 16'b1111111111111111;
599:oled_pixel <= 16'b1111111111111111;
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
624:oled_pixel <= 16'b1111111111111111;
631:oled_pixel <= 16'b1111111111111111;
632:oled_pixel <= 16'b1111111111111111;
638:oled_pixel <= 16'b1111111111111111;
639:oled_pixel <= 16'b1111111111111111;
640:oled_pixel <= 16'b1111111111111111;
641:oled_pixel <= 16'b1111111111111111;
642:oled_pixel <= 16'b1111111111111111;
643:oled_pixel <= 16'b1111111111111111;
644:oled_pixel <= 16'b1111111111111111;
645:oled_pixel <= 16'b1111111111111111;
648:oled_pixel <= 16'b1111111111111111;
649:oled_pixel <= 16'b1111111111111111;
650:oled_pixel <= 16'b1111111111111111;
651:oled_pixel <= 16'b1111111111111111;
652:oled_pixel <= 16'b1111111111111111;
654:oled_pixel <= 16'b1111111111111111;
655:oled_pixel <= 16'b1111111111111111;
656:oled_pixel <= 16'b1111111111111111;
657:oled_pixel <= 16'b1111111111111111;
658:oled_pixel <= 16'b1111111111111111;
683:oled_pixel <= 16'b1111111111111111;
684:oled_pixel <= 16'b1111111111111111;
688:oled_pixel <= 16'b1111111111111111;
689:oled_pixel <= 16'b1111111111111111;
691:oled_pixel <= 16'b1111111111111111;
692:oled_pixel <= 16'b1111111111111111;
693:oled_pixel <= 16'b1111111111111111;
694:oled_pixel <= 16'b1111111111111111;
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
727:oled_pixel <= 16'b1111111111111111;
728:oled_pixel <= 16'b1111111111111111;
734:oled_pixel <= 16'b1111111111111111;
735:oled_pixel <= 16'b1111111111111111;
740:oled_pixel <= 16'b1111111111111111;
741:oled_pixel <= 16'b1111111111111111;
747:oled_pixel <= 16'b1111111111111111;
748:oled_pixel <= 16'b1111111111111111;
750:oled_pixel <= 16'b1111111111111111;
751:oled_pixel <= 16'b1111111111111111;
753:oled_pixel <= 16'b1111111111111111;
754:oled_pixel <= 16'b1111111111111111;
755:oled_pixel <= 16'b1111111111111111;
779:oled_pixel <= 16'b1111111111111111;
780:oled_pixel <= 16'b1111111111111111;
781:oled_pixel <= 16'b1111111111111111;
784:oled_pixel <= 16'b1111111111111111;
785:oled_pixel <= 16'b1111111111111111;
787:oled_pixel <= 16'b1111111111111111;
788:oled_pixel <= 16'b1111111111111111;
789:oled_pixel <= 16'b1111111111111111;
790:oled_pixel <= 16'b1111111111111111;
791:oled_pixel <= 16'b1111111111111111;
794:oled_pixel <= 16'b1111111111111111;
795:oled_pixel <= 16'b1111111111111111;
796:oled_pixel <= 16'b1111111111111111;
799:oled_pixel <= 16'b1111111111111111;
800:oled_pixel <= 16'b1111111111111111;
801:oled_pixel <= 16'b1111111111111111;
803:oled_pixel <= 16'b1111111111111111;
804:oled_pixel <= 16'b1111111111111111;
805:oled_pixel <= 16'b1111111111111111;
808:oled_pixel <= 16'b1111111111111111;
809:oled_pixel <= 16'b1111111111111111;
810:oled_pixel <= 16'b1111111111111111;
812:oled_pixel <= 16'b1111111111111111;
813:oled_pixel <= 16'b1111111111111111;
823:oled_pixel <= 16'b1111111111111111;
824:oled_pixel <= 16'b1111111111111111;
830:oled_pixel <= 16'b1111111111111111;
831:oled_pixel <= 16'b1111111111111111;
836:oled_pixel <= 16'b1111111111111111;
837:oled_pixel <= 16'b1111111111111111;
842:oled_pixel <= 16'b1111111111111111;
843:oled_pixel <= 16'b1111111111111111;
844:oled_pixel <= 16'b1111111111111111;
846:oled_pixel <= 16'b1111111111111111;
847:oled_pixel <= 16'b1111111111111111;
850:oled_pixel <= 16'b1111111111111111;
851:oled_pixel <= 16'b1111111111111111;
875:oled_pixel <= 16'b1111111111111111;
876:oled_pixel <= 16'b1111111111111111;
877:oled_pixel <= 16'b1111111111111111;
878:oled_pixel <= 16'b1111111111111111;
879:oled_pixel <= 16'b1111111111111111;
880:oled_pixel <= 16'b1111111111111111;
881:oled_pixel <= 16'b1111111111111111;
883:oled_pixel <= 16'b1111111111111111;
884:oled_pixel <= 16'b1111111111111111;
886:oled_pixel <= 16'b1111111111111111;
887:oled_pixel <= 16'b1111111111111111;
888:oled_pixel <= 16'b1111111111111111;
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
906:oled_pixel <= 16'b1111111111111111;
908:oled_pixel <= 16'b1111111111111111;
909:oled_pixel <= 16'b1111111111111111;
919:oled_pixel <= 16'b1111111111111111;
920:oled_pixel <= 16'b1111111111111111;
926:oled_pixel <= 16'b1111111111111111;
927:oled_pixel <= 16'b1111111111111111;
932:oled_pixel <= 16'b1111111111111111;
933:oled_pixel <= 16'b1111111111111111;
935:oled_pixel <= 16'b1111111111111111;
936:oled_pixel <= 16'b1111111111111111;
937:oled_pixel <= 16'b1111111111111111;
938:oled_pixel <= 16'b1111111111111111;
939:oled_pixel <= 16'b1111111111111111;
940:oled_pixel <= 16'b1111111111111111;
942:oled_pixel <= 16'b1111111111111111;
943:oled_pixel <= 16'b1111111111111111;
946:oled_pixel <= 16'b1111111111111111;
947:oled_pixel <= 16'b1111111111111111;
972:oled_pixel <= 16'b1111111111111111;
973:oled_pixel <= 16'b1111111111111111;
974:oled_pixel <= 16'b1111111111111111;
975:oled_pixel <= 16'b1111111111111111;
976:oled_pixel <= 16'b1111111111111111;
980:oled_pixel <= 16'b1111111111111111;
983:oled_pixel <= 16'b1111111111111111;
984:oled_pixel <= 16'b1111111111111111;
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
1001:oled_pixel <= 16'b1111111111111111;
1005:oled_pixel <= 16'b1111111111111111;
1015:oled_pixel <= 16'b1111111111111111;
1023:oled_pixel <= 16'b1111111111111111;
1028:oled_pixel <= 16'b1111111111111111;
1032:oled_pixel <= 16'b1111111111111111;
1033:oled_pixel <= 16'b1111111111111111;
1034:oled_pixel <= 16'b1111111111111111;
1035:oled_pixel <= 16'b1111111111111111;
1038:oled_pixel <= 16'b1111111111111111;
1043:oled_pixel <= 16'b1111111111111111;
default:oled_pixel<=0;
endcase

end
endmodule