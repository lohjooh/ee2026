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


module message(input CLOCK,input [12:0] pixel_index, output reg [15:0] oled_pixel = 0);
always@(posedge CLOCK) begin
case(pixel_index)
293:oled_pixel <= 16'b1110100011100100;
294:oled_pixel <= 16'b1110100011100100;
295:oled_pixel <= 16'b1110100011100100;
296:oled_pixel <= 16'b1110100011100100;
297:oled_pixel <= 16'b1110100011100100;
298:oled_pixel <= 16'b1110100011100100;
299:oled_pixel <= 16'b1110100011100100;
300:oled_pixel <= 16'b1110100011100100;
301:oled_pixel <= 16'b1110100011100100;
302:oled_pixel <= 16'b1110100011100100;
305:oled_pixel <= 16'b1110100011100100;
306:oled_pixel <= 16'b1110100011100100;
307:oled_pixel <= 16'b1110100011100100;
308:oled_pixel <= 16'b1110100011100100;
309:oled_pixel <= 16'b1110100011100100;
310:oled_pixel <= 16'b1110100011100100;
311:oled_pixel <= 16'b1110100011100100;
312:oled_pixel <= 16'b1110100011100100;
313:oled_pixel <= 16'b1110100011100100;
314:oled_pixel <= 16'b1110100011100100;
319:oled_pixel <= 16'b1110100011100100;
320:oled_pixel <= 16'b1110100011100100;
321:oled_pixel <= 16'b1110100011100100;
322:oled_pixel <= 16'b1110100011100100;
323:oled_pixel <= 16'b1110100011100100;
324:oled_pixel <= 16'b1110100011100100;
331:oled_pixel <= 16'b1110100011100100;
332:oled_pixel <= 16'b1110100011100100;
333:oled_pixel <= 16'b1110100011100100;
334:oled_pixel <= 16'b1110100011100100;
335:oled_pixel <= 16'b1110100011100100;
336:oled_pixel <= 16'b1110100011100100;
343:oled_pixel <= 16'b1110100011100100;
344:oled_pixel <= 16'b1110100011100100;
345:oled_pixel <= 16'b1110100011100100;
346:oled_pixel <= 16'b1110100011100100;
347:oled_pixel <= 16'b1110100011100100;
348:oled_pixel <= 16'b1110100011100100;
355:oled_pixel <= 16'b1110100011100100;
356:oled_pixel <= 16'b1110100011100100;
357:oled_pixel <= 16'b1110100011100100;
358:oled_pixel <= 16'b1110100011100100;
359:oled_pixel <= 16'b1110100011100100;
360:oled_pixel <= 16'b1110100011100100;
369:oled_pixel <= 16'b1110100011100100;
370:oled_pixel <= 16'b1110100011100100;
371:oled_pixel <= 16'b1110100011100100;
372:oled_pixel <= 16'b1110100011100100;
373:oled_pixel <= 16'b1110100011100100;
374:oled_pixel <= 16'b1110100011100100;
375:oled_pixel <= 16'b1110100011100100;
376:oled_pixel <= 16'b1110100011100100;
377:oled_pixel <= 16'b1110100011100100;
378:oled_pixel <= 16'b1110100011100100;
389:oled_pixel <= 16'b1110100011100100;
390:oled_pixel <= 16'b1110100011100100;
391:oled_pixel <= 16'b1110100011100100;
392:oled_pixel <= 16'b1110100011100100;
393:oled_pixel <= 16'b1110100011100100;
394:oled_pixel <= 16'b1110100011100100;
395:oled_pixel <= 16'b1110100011100100;
396:oled_pixel <= 16'b1110100011100100;
397:oled_pixel <= 16'b1110100011100100;
398:oled_pixel <= 16'b1110100011100100;
401:oled_pixel <= 16'b1110100011100100;
402:oled_pixel <= 16'b1110100011100100;
403:oled_pixel <= 16'b1110100011100100;
404:oled_pixel <= 16'b1110100011100100;
405:oled_pixel <= 16'b1110100011100100;
406:oled_pixel <= 16'b1110100011100100;
407:oled_pixel <= 16'b1110100011100100;
408:oled_pixel <= 16'b1110100011100100;
409:oled_pixel <= 16'b1110100011100100;
410:oled_pixel <= 16'b1110100011100100;
415:oled_pixel <= 16'b1110100011100100;
416:oled_pixel <= 16'b1110100011100100;
417:oled_pixel <= 16'b1110100011100100;
418:oled_pixel <= 16'b1110100011100100;
419:oled_pixel <= 16'b1110100011100100;
420:oled_pixel <= 16'b1110100011100100;
427:oled_pixel <= 16'b1110100011100100;
428:oled_pixel <= 16'b1110100011100100;
429:oled_pixel <= 16'b1110100011100100;
430:oled_pixel <= 16'b1110100011100100;
431:oled_pixel <= 16'b1110100011100100;
432:oled_pixel <= 16'b1110100011100100;
439:oled_pixel <= 16'b1110100011100100;
440:oled_pixel <= 16'b1110100011100100;
441:oled_pixel <= 16'b1110100011100100;
442:oled_pixel <= 16'b1110100011100100;
443:oled_pixel <= 16'b1110100011100100;
444:oled_pixel <= 16'b1110100011100100;
451:oled_pixel <= 16'b1110100011100100;
452:oled_pixel <= 16'b1110100011100100;
453:oled_pixel <= 16'b1110100011100100;
454:oled_pixel <= 16'b1110100011100100;
455:oled_pixel <= 16'b1110100011100100;
456:oled_pixel <= 16'b1110100011100100;
465:oled_pixel <= 16'b1110100011100100;
466:oled_pixel <= 16'b1110100011100100;
467:oled_pixel <= 16'b1110100011100100;
468:oled_pixel <= 16'b1110100011100100;
469:oled_pixel <= 16'b1110100011100100;
470:oled_pixel <= 16'b1110100011100100;
471:oled_pixel <= 16'b1110100011100100;
472:oled_pixel <= 16'b1110100011100100;
473:oled_pixel <= 16'b1110100011100100;
474:oled_pixel <= 16'b1110100011100100;
485:oled_pixel <= 16'b1110100011100100;
486:oled_pixel <= 16'b1110100011100100;
487:oled_pixel <= 16'b1110100011100100;
488:oled_pixel <= 16'b1110100011100100;
491:oled_pixel <= 16'b1110100011100100;
492:oled_pixel <= 16'b1110100011100100;
493:oled_pixel <= 16'b1110100011100100;
494:oled_pixel <= 16'b1110100011100100;
497:oled_pixel <= 16'b1110100011100100;
498:oled_pixel <= 16'b1110100011100100;
499:oled_pixel <= 16'b1110100011100100;
500:oled_pixel <= 16'b1110100011100100;
503:oled_pixel <= 16'b1110100011100100;
504:oled_pixel <= 16'b1110100011100100;
505:oled_pixel <= 16'b1110100011100100;
506:oled_pixel <= 16'b1110100011100100;
509:oled_pixel <= 16'b1110100011100100;
510:oled_pixel <= 16'b1110100011100100;
511:oled_pixel <= 16'b1110100011100100;
512:oled_pixel <= 16'b1110100011100100;
515:oled_pixel <= 16'b1110100011100100;
516:oled_pixel <= 16'b1110100011100100;
517:oled_pixel <= 16'b1110100011100100;
518:oled_pixel <= 16'b1110100011100100;
521:oled_pixel <= 16'b1110100011100100;
522:oled_pixel <= 16'b1110100011100100;
523:oled_pixel <= 16'b1110100011100100;
524:oled_pixel <= 16'b1110100011100100;
527:oled_pixel <= 16'b1110100011100100;
528:oled_pixel <= 16'b1110100011100100;
529:oled_pixel <= 16'b1110100011100100;
530:oled_pixel <= 16'b1110100011100100;
533:oled_pixel <= 16'b1110100011100100;
534:oled_pixel <= 16'b1110100011100100;
535:oled_pixel <= 16'b1110100011100100;
536:oled_pixel <= 16'b1110100011100100;
539:oled_pixel <= 16'b1110100011100100;
540:oled_pixel <= 16'b1110100011100100;
541:oled_pixel <= 16'b1110100011100100;
542:oled_pixel <= 16'b1110100011100100;
545:oled_pixel <= 16'b1110100011100100;
546:oled_pixel <= 16'b1110100011100100;
547:oled_pixel <= 16'b1110100011100100;
548:oled_pixel <= 16'b1110100011100100;
551:oled_pixel <= 16'b1110100011100100;
552:oled_pixel <= 16'b1110100011100100;
553:oled_pixel <= 16'b1110100011100100;
554:oled_pixel <= 16'b1110100011100100;
561:oled_pixel <= 16'b1110100011100100;
562:oled_pixel <= 16'b1110100011100100;
563:oled_pixel <= 16'b1110100011100100;
564:oled_pixel <= 16'b1110100011100100;
567:oled_pixel <= 16'b1110100011100100;
568:oled_pixel <= 16'b1110100011100100;
569:oled_pixel <= 16'b1110100011100100;
570:oled_pixel <= 16'b1110100011100100;
581:oled_pixel <= 16'b1110100011100100;
582:oled_pixel <= 16'b1110100011100100;
583:oled_pixel <= 16'b1110100011100100;
584:oled_pixel <= 16'b1110100011100100;
587:oled_pixel <= 16'b1110100011100100;
588:oled_pixel <= 16'b1110100011100100;
589:oled_pixel <= 16'b1110100011100100;
590:oled_pixel <= 16'b1110100011100100;
593:oled_pixel <= 16'b1110100011100100;
594:oled_pixel <= 16'b1110100011100100;
595:oled_pixel <= 16'b1110100011100100;
596:oled_pixel <= 16'b1110100011100100;
599:oled_pixel <= 16'b1110100011100100;
600:oled_pixel <= 16'b1110100011100100;
601:oled_pixel <= 16'b1110100011100100;
602:oled_pixel <= 16'b1110100011100100;
605:oled_pixel <= 16'b1110100011100100;
606:oled_pixel <= 16'b1110100011100100;
607:oled_pixel <= 16'b1110100011100100;
608:oled_pixel <= 16'b1110100011100100;
611:oled_pixel <= 16'b1110100011100100;
612:oled_pixel <= 16'b1110100011100100;
613:oled_pixel <= 16'b1110100011100100;
614:oled_pixel <= 16'b1110100011100100;
617:oled_pixel <= 16'b1110100011100100;
618:oled_pixel <= 16'b1110100011100100;
619:oled_pixel <= 16'b1110100011100100;
620:oled_pixel <= 16'b1110100011100100;
623:oled_pixel <= 16'b1110100011100100;
624:oled_pixel <= 16'b1110100011100100;
625:oled_pixel <= 16'b1110100011100100;
626:oled_pixel <= 16'b1110100011100100;
629:oled_pixel <= 16'b1110100011100100;
630:oled_pixel <= 16'b1110100011100100;
631:oled_pixel <= 16'b1110100011100100;
632:oled_pixel <= 16'b1110100011100100;
635:oled_pixel <= 16'b1110100011100100;
636:oled_pixel <= 16'b1110100011100100;
637:oled_pixel <= 16'b1110100011100100;
638:oled_pixel <= 16'b1110100011100100;
641:oled_pixel <= 16'b1110100011100100;
642:oled_pixel <= 16'b1110100011100100;
643:oled_pixel <= 16'b1110100011100100;
644:oled_pixel <= 16'b1110100011100100;
647:oled_pixel <= 16'b1110100011100100;
648:oled_pixel <= 16'b1110100011100100;
649:oled_pixel <= 16'b1110100011100100;
650:oled_pixel <= 16'b1110100011100100;
657:oled_pixel <= 16'b1110100011100100;
658:oled_pixel <= 16'b1110100011100100;
659:oled_pixel <= 16'b1110100011100100;
660:oled_pixel <= 16'b1110100011100100;
663:oled_pixel <= 16'b1110100011100100;
664:oled_pixel <= 16'b1110100011100100;
665:oled_pixel <= 16'b1110100011100100;
666:oled_pixel <= 16'b1110100011100100;
677:oled_pixel <= 16'b1110100011100100;
678:oled_pixel <= 16'b1110100011100100;
679:oled_pixel <= 16'b1110100011100100;
680:oled_pixel <= 16'b1110100011100100;
689:oled_pixel <= 16'b1110100011100100;
690:oled_pixel <= 16'b1110100011100100;
691:oled_pixel <= 16'b1110100011100100;
692:oled_pixel <= 16'b1110100011100100;
707:oled_pixel <= 16'b1110100011100100;
708:oled_pixel <= 16'b1110100011100100;
709:oled_pixel <= 16'b1110100011100100;
710:oled_pixel <= 16'b1110100011100100;
713:oled_pixel <= 16'b1110100011100100;
714:oled_pixel <= 16'b1110100011100100;
715:oled_pixel <= 16'b1110100011100100;
716:oled_pixel <= 16'b1110100011100100;
719:oled_pixel <= 16'b1110100011100100;
720:oled_pixel <= 16'b1110100011100100;
721:oled_pixel <= 16'b1110100011100100;
722:oled_pixel <= 16'b1110100011100100;
731:oled_pixel <= 16'b1110100011100100;
732:oled_pixel <= 16'b1110100011100100;
733:oled_pixel <= 16'b1110100011100100;
734:oled_pixel <= 16'b1110100011100100;
737:oled_pixel <= 16'b1110100011100100;
738:oled_pixel <= 16'b1110100011100100;
739:oled_pixel <= 16'b1110100011100100;
740:oled_pixel <= 16'b1110100011100100;
753:oled_pixel <= 16'b1110100011100100;
754:oled_pixel <= 16'b1110100011100100;
755:oled_pixel <= 16'b1110100011100100;
756:oled_pixel <= 16'b1110100011100100;
759:oled_pixel <= 16'b1110100011100100;
760:oled_pixel <= 16'b1110100011100100;
761:oled_pixel <= 16'b1110100011100100;
762:oled_pixel <= 16'b1110100011100100;
773:oled_pixel <= 16'b1110100011100100;
774:oled_pixel <= 16'b1110100011100100;
775:oled_pixel <= 16'b1110100011100100;
776:oled_pixel <= 16'b1110100011100100;
785:oled_pixel <= 16'b1110100011100100;
786:oled_pixel <= 16'b1110100011100100;
787:oled_pixel <= 16'b1110100011100100;
788:oled_pixel <= 16'b1110100011100100;
803:oled_pixel <= 16'b1110100011100100;
804:oled_pixel <= 16'b1110100011100100;
805:oled_pixel <= 16'b1110100011100100;
806:oled_pixel <= 16'b1110100011100100;
809:oled_pixel <= 16'b1110100011100100;
810:oled_pixel <= 16'b1110100011100100;
811:oled_pixel <= 16'b1110100011100100;
812:oled_pixel <= 16'b1110100011100100;
815:oled_pixel <= 16'b1110100011100100;
816:oled_pixel <= 16'b1110100011100100;
817:oled_pixel <= 16'b1110100011100100;
818:oled_pixel <= 16'b1110100011100100;
827:oled_pixel <= 16'b1110100011100100;
828:oled_pixel <= 16'b1110100011100100;
829:oled_pixel <= 16'b1110100011100100;
830:oled_pixel <= 16'b1110100011100100;
833:oled_pixel <= 16'b1110100011100100;
834:oled_pixel <= 16'b1110100011100100;
835:oled_pixel <= 16'b1110100011100100;
836:oled_pixel <= 16'b1110100011100100;
849:oled_pixel <= 16'b1110100011100100;
850:oled_pixel <= 16'b1110100011100100;
851:oled_pixel <= 16'b1110100011100100;
852:oled_pixel <= 16'b1110100011100100;
855:oled_pixel <= 16'b1110100011100100;
856:oled_pixel <= 16'b1110100011100100;
857:oled_pixel <= 16'b1110100011100100;
858:oled_pixel <= 16'b1110100011100100;
869:oled_pixel <= 16'b1110100011100100;
870:oled_pixel <= 16'b1110100011100100;
871:oled_pixel <= 16'b1110100011100100;
872:oled_pixel <= 16'b1110100011100100;
873:oled_pixel <= 16'b1110100011100100;
874:oled_pixel <= 16'b1110100011100100;
875:oled_pixel <= 16'b1110100011100100;
876:oled_pixel <= 16'b1110100011100100;
881:oled_pixel <= 16'b1110100011100100;
882:oled_pixel <= 16'b1110100011100100;
883:oled_pixel <= 16'b1110100011100100;
884:oled_pixel <= 16'b1110100011100100;
885:oled_pixel <= 16'b1110100011100100;
886:oled_pixel <= 16'b1110100011100100;
887:oled_pixel <= 16'b1110100011100100;
888:oled_pixel <= 16'b1110100011100100;
897:oled_pixel <= 16'b1110100011100100;
898:oled_pixel <= 16'b1110100011100100;
899:oled_pixel <= 16'b1110100011100100;
900:oled_pixel <= 16'b1110100011100100;
905:oled_pixel <= 16'b1110100011100100;
906:oled_pixel <= 16'b1110100011100100;
907:oled_pixel <= 16'b1110100011100100;
908:oled_pixel <= 16'b1110100011100100;
911:oled_pixel <= 16'b1110100011100100;
912:oled_pixel <= 16'b1110100011100100;
913:oled_pixel <= 16'b1110100011100100;
914:oled_pixel <= 16'b1110100011100100;
921:oled_pixel <= 16'b1110100011100100;
922:oled_pixel <= 16'b1110100011100100;
923:oled_pixel <= 16'b1110100011100100;
924:oled_pixel <= 16'b1110100011100100;
929:oled_pixel <= 16'b1110100011100100;
930:oled_pixel <= 16'b1110100011100100;
931:oled_pixel <= 16'b1110100011100100;
932:oled_pixel <= 16'b1110100011100100;
933:oled_pixel <= 16'b1110100011100100;
934:oled_pixel <= 16'b1110100011100100;
935:oled_pixel <= 16'b1110100011100100;
936:oled_pixel <= 16'b1110100011100100;
945:oled_pixel <= 16'b1110100011100100;
946:oled_pixel <= 16'b1110100011100100;
947:oled_pixel <= 16'b1110100011100100;
948:oled_pixel <= 16'b1110100011100100;
949:oled_pixel <= 16'b1110100011100100;
950:oled_pixel <= 16'b1110100011100100;
951:oled_pixel <= 16'b1110100011100100;
952:oled_pixel <= 16'b1110100011100100;
953:oled_pixel <= 16'b1110100011100100;
954:oled_pixel <= 16'b1110100011100100;
965:oled_pixel <= 16'b1110100011100100;
966:oled_pixel <= 16'b1110100011100100;
967:oled_pixel <= 16'b1110100011100100;
968:oled_pixel <= 16'b1110100011100100;
969:oled_pixel <= 16'b1110100011100100;
970:oled_pixel <= 16'b1110100011100100;
971:oled_pixel <= 16'b1110100011100100;
972:oled_pixel <= 16'b1110100011100100;
977:oled_pixel <= 16'b1110100011100100;
978:oled_pixel <= 16'b1110100011100100;
979:oled_pixel <= 16'b1110100011100100;
980:oled_pixel <= 16'b1110100011100100;
981:oled_pixel <= 16'b1110100011100100;
982:oled_pixel <= 16'b1110100011100100;
983:oled_pixel <= 16'b1110100011100100;
984:oled_pixel <= 16'b1110100011100100;
993:oled_pixel <= 16'b1110100011100100;
994:oled_pixel <= 16'b1110100011100100;
995:oled_pixel <= 16'b1110100011100100;
996:oled_pixel <= 16'b1110100011100100;
1001:oled_pixel <= 16'b1110100011100100;
1002:oled_pixel <= 16'b1110100011100100;
1003:oled_pixel <= 16'b1110100011100100;
1004:oled_pixel <= 16'b1110100011100100;
1007:oled_pixel <= 16'b1110100011100100;
1008:oled_pixel <= 16'b1110100011100100;
1009:oled_pixel <= 16'b1110100011100100;
1010:oled_pixel <= 16'b1110100011100100;
1017:oled_pixel <= 16'b1110100011100100;
1018:oled_pixel <= 16'b1110100011100100;
1019:oled_pixel <= 16'b1110100011100100;
1020:oled_pixel <= 16'b1110100011100100;
1025:oled_pixel <= 16'b1110100011100100;
1026:oled_pixel <= 16'b1110100011100100;
1027:oled_pixel <= 16'b1110100011100100;
1028:oled_pixel <= 16'b1110100011100100;
1029:oled_pixel <= 16'b1110100011100100;
1030:oled_pixel <= 16'b1110100011100100;
1031:oled_pixel <= 16'b1110100011100100;
1032:oled_pixel <= 16'b1110100011100100;
1041:oled_pixel <= 16'b1110100011100100;
1042:oled_pixel <= 16'b1110100011100100;
1043:oled_pixel <= 16'b1110100011100100;
1044:oled_pixel <= 16'b1110100011100100;
1045:oled_pixel <= 16'b1110100011100100;
1046:oled_pixel <= 16'b1110100011100100;
1047:oled_pixel <= 16'b1110100011100100;
1048:oled_pixel <= 16'b1110100011100100;
1049:oled_pixel <= 16'b1110100011100100;
1050:oled_pixel <= 16'b1110100011100100;
1061:oled_pixel <= 16'b1110100011100100;
1062:oled_pixel <= 16'b1110100011100100;
1063:oled_pixel <= 16'b1110100011100100;
1064:oled_pixel <= 16'b1110100011100100;
1073:oled_pixel <= 16'b1110100011100100;
1074:oled_pixel <= 16'b1110100011100100;
1075:oled_pixel <= 16'b1110100011100100;
1076:oled_pixel <= 16'b1110100011100100;
1087:oled_pixel <= 16'b1110100011100100;
1088:oled_pixel <= 16'b1110100011100100;
1089:oled_pixel <= 16'b1110100011100100;
1090:oled_pixel <= 16'b1110100011100100;
1097:oled_pixel <= 16'b1110100011100100;
1098:oled_pixel <= 16'b1110100011100100;
1099:oled_pixel <= 16'b1110100011100100;
1100:oled_pixel <= 16'b1110100011100100;
1103:oled_pixel <= 16'b1110100011100100;
1104:oled_pixel <= 16'b1110100011100100;
1105:oled_pixel <= 16'b1110100011100100;
1106:oled_pixel <= 16'b1110100011100100;
1111:oled_pixel <= 16'b1110100011100100;
1112:oled_pixel <= 16'b1110100011100100;
1113:oled_pixel <= 16'b1110100011100100;
1114:oled_pixel <= 16'b1110100011100100;
1121:oled_pixel <= 16'b1110100011100100;
1122:oled_pixel <= 16'b1110100011100100;
1123:oled_pixel <= 16'b1110100011100100;
1124:oled_pixel <= 16'b1110100011100100;
1127:oled_pixel <= 16'b1110100011100100;
1128:oled_pixel <= 16'b1110100011100100;
1129:oled_pixel <= 16'b1110100011100100;
1130:oled_pixel <= 16'b1110100011100100;
1137:oled_pixel <= 16'b1110100011100100;
1138:oled_pixel <= 16'b1110100011100100;
1139:oled_pixel <= 16'b1110100011100100;
1140:oled_pixel <= 16'b1110100011100100;
1143:oled_pixel <= 16'b1110100011100100;
1144:oled_pixel <= 16'b1110100011100100;
1145:oled_pixel <= 16'b1110100011100100;
1146:oled_pixel <= 16'b1110100011100100;
1157:oled_pixel <= 16'b1110100011100100;
1158:oled_pixel <= 16'b1110100011100100;
1159:oled_pixel <= 16'b1110100011100100;
1160:oled_pixel <= 16'b1110100011100100;
1169:oled_pixel <= 16'b1110100011100100;
1170:oled_pixel <= 16'b1110100011100100;
1171:oled_pixel <= 16'b1110100011100100;
1172:oled_pixel <= 16'b1110100011100100;
1183:oled_pixel <= 16'b1110100011100100;
1184:oled_pixel <= 16'b1110100011100100;
1185:oled_pixel <= 16'b1110100011100100;
1186:oled_pixel <= 16'b1110100011100100;
1193:oled_pixel <= 16'b1110100011100100;
1194:oled_pixel <= 16'b1110100011100100;
1195:oled_pixel <= 16'b1110100011100100;
1196:oled_pixel <= 16'b1110100011100100;
1199:oled_pixel <= 16'b1110100011100100;
1200:oled_pixel <= 16'b1110100011100100;
1201:oled_pixel <= 16'b1110100011100100;
1202:oled_pixel <= 16'b1110100011100100;
1207:oled_pixel <= 16'b1110100011100100;
1208:oled_pixel <= 16'b1110100011100100;
1209:oled_pixel <= 16'b1110100011100100;
1210:oled_pixel <= 16'b1110100011100100;
1217:oled_pixel <= 16'b1110100011100100;
1218:oled_pixel <= 16'b1110100011100100;
1219:oled_pixel <= 16'b1110100011100100;
1220:oled_pixel <= 16'b1110100011100100;
1223:oled_pixel <= 16'b1110100011100100;
1224:oled_pixel <= 16'b1110100011100100;
1225:oled_pixel <= 16'b1110100011100100;
1226:oled_pixel <= 16'b1110100011100100;
1233:oled_pixel <= 16'b1110100011100100;
1234:oled_pixel <= 16'b1110100011100100;
1235:oled_pixel <= 16'b1110100011100100;
1236:oled_pixel <= 16'b1110100011100100;
1239:oled_pixel <= 16'b1110100011100100;
1240:oled_pixel <= 16'b1110100011100100;
1241:oled_pixel <= 16'b1110100011100100;
1242:oled_pixel <= 16'b1110100011100100;
1253:oled_pixel <= 16'b1110100011100100;
1254:oled_pixel <= 16'b1110100011100100;
1255:oled_pixel <= 16'b1110100011100100;
1256:oled_pixel <= 16'b1110100011100100;
1265:oled_pixel <= 16'b1110100011100100;
1266:oled_pixel <= 16'b1110100011100100;
1267:oled_pixel <= 16'b1110100011100100;
1268:oled_pixel <= 16'b1110100011100100;
1277:oled_pixel <= 16'b1110100011100100;
1278:oled_pixel <= 16'b1110100011100100;
1279:oled_pixel <= 16'b1110100011100100;
1280:oled_pixel <= 16'b1110100011100100;
1289:oled_pixel <= 16'b1110100011100100;
1290:oled_pixel <= 16'b1110100011100100;
1291:oled_pixel <= 16'b1110100011100100;
1292:oled_pixel <= 16'b1110100011100100;
1295:oled_pixel <= 16'b1110100011100100;
1296:oled_pixel <= 16'b1110100011100100;
1297:oled_pixel <= 16'b1110100011100100;
1298:oled_pixel <= 16'b1110100011100100;
1301:oled_pixel <= 16'b1110100011100100;
1302:oled_pixel <= 16'b1110100011100100;
1303:oled_pixel <= 16'b1110100011100100;
1304:oled_pixel <= 16'b1110100011100100;
1313:oled_pixel <= 16'b1110100011100100;
1314:oled_pixel <= 16'b1110100011100100;
1315:oled_pixel <= 16'b1110100011100100;
1316:oled_pixel <= 16'b1110100011100100;
1319:oled_pixel <= 16'b1110100011100100;
1320:oled_pixel <= 16'b1110100011100100;
1321:oled_pixel <= 16'b1110100011100100;
1322:oled_pixel <= 16'b1110100011100100;
1329:oled_pixel <= 16'b1110100011100100;
1330:oled_pixel <= 16'b1110100011100100;
1331:oled_pixel <= 16'b1110100011100100;
1332:oled_pixel <= 16'b1110100011100100;
1335:oled_pixel <= 16'b1110100011100100;
1336:oled_pixel <= 16'b1110100011100100;
1337:oled_pixel <= 16'b1110100011100100;
1338:oled_pixel <= 16'b1110100011100100;
1349:oled_pixel <= 16'b1110100011100100;
1350:oled_pixel <= 16'b1110100011100100;
1351:oled_pixel <= 16'b1110100011100100;
1352:oled_pixel <= 16'b1110100011100100;
1361:oled_pixel <= 16'b1110100011100100;
1362:oled_pixel <= 16'b1110100011100100;
1363:oled_pixel <= 16'b1110100011100100;
1364:oled_pixel <= 16'b1110100011100100;
1373:oled_pixel <= 16'b1110100011100100;
1374:oled_pixel <= 16'b1110100011100100;
1375:oled_pixel <= 16'b1110100011100100;
1376:oled_pixel <= 16'b1110100011100100;
1385:oled_pixel <= 16'b1110100011100100;
1386:oled_pixel <= 16'b1110100011100100;
1387:oled_pixel <= 16'b1110100011100100;
1388:oled_pixel <= 16'b1110100011100100;
1391:oled_pixel <= 16'b1110100011100100;
1392:oled_pixel <= 16'b1110100011100100;
1393:oled_pixel <= 16'b1110100011100100;
1394:oled_pixel <= 16'b1110100011100100;
1397:oled_pixel <= 16'b1110100011100100;
1398:oled_pixel <= 16'b1110100011100100;
1399:oled_pixel <= 16'b1110100011100100;
1400:oled_pixel <= 16'b1110100011100100;
1409:oled_pixel <= 16'b1110100011100100;
1410:oled_pixel <= 16'b1110100011100100;
1411:oled_pixel <= 16'b1110100011100100;
1412:oled_pixel <= 16'b1110100011100100;
1415:oled_pixel <= 16'b1110100011100100;
1416:oled_pixel <= 16'b1110100011100100;
1417:oled_pixel <= 16'b1110100011100100;
1418:oled_pixel <= 16'b1110100011100100;
1425:oled_pixel <= 16'b1110100011100100;
1426:oled_pixel <= 16'b1110100011100100;
1427:oled_pixel <= 16'b1110100011100100;
1428:oled_pixel <= 16'b1110100011100100;
1431:oled_pixel <= 16'b1110100011100100;
1432:oled_pixel <= 16'b1110100011100100;
1433:oled_pixel <= 16'b1110100011100100;
1434:oled_pixel <= 16'b1110100011100100;
1445:oled_pixel <= 16'b1110100011100100;
1446:oled_pixel <= 16'b1110100011100100;
1447:oled_pixel <= 16'b1110100011100100;
1448:oled_pixel <= 16'b1110100011100100;
1451:oled_pixel <= 16'b1110100011100100;
1452:oled_pixel <= 16'b1110100011100100;
1453:oled_pixel <= 16'b1110100011100100;
1454:oled_pixel <= 16'b1110100011100100;
1457:oled_pixel <= 16'b1110100011100100;
1458:oled_pixel <= 16'b1110100011100100;
1459:oled_pixel <= 16'b1110100011100100;
1460:oled_pixel <= 16'b1110100011100100;
1463:oled_pixel <= 16'b1110100011100100;
1464:oled_pixel <= 16'b1110100011100100;
1465:oled_pixel <= 16'b1110100011100100;
1466:oled_pixel <= 16'b1110100011100100;
1469:oled_pixel <= 16'b1110100011100100;
1470:oled_pixel <= 16'b1110100011100100;
1471:oled_pixel <= 16'b1110100011100100;
1472:oled_pixel <= 16'b1110100011100100;
1475:oled_pixel <= 16'b1110100011100100;
1476:oled_pixel <= 16'b1110100011100100;
1477:oled_pixel <= 16'b1110100011100100;
1478:oled_pixel <= 16'b1110100011100100;
1481:oled_pixel <= 16'b1110100011100100;
1482:oled_pixel <= 16'b1110100011100100;
1483:oled_pixel <= 16'b1110100011100100;
1484:oled_pixel <= 16'b1110100011100100;
1487:oled_pixel <= 16'b1110100011100100;
1488:oled_pixel <= 16'b1110100011100100;
1489:oled_pixel <= 16'b1110100011100100;
1490:oled_pixel <= 16'b1110100011100100;
1493:oled_pixel <= 16'b1110100011100100;
1494:oled_pixel <= 16'b1110100011100100;
1495:oled_pixel <= 16'b1110100011100100;
1496:oled_pixel <= 16'b1110100011100100;
1499:oled_pixel <= 16'b1110100011100100;
1500:oled_pixel <= 16'b1110100011100100;
1501:oled_pixel <= 16'b1110100011100100;
1502:oled_pixel <= 16'b1110100011100100;
1505:oled_pixel <= 16'b1110100011100100;
1506:oled_pixel <= 16'b1110100011100100;
1507:oled_pixel <= 16'b1110100011100100;
1508:oled_pixel <= 16'b1110100011100100;
1511:oled_pixel <= 16'b1110100011100100;
1512:oled_pixel <= 16'b1110100011100100;
1513:oled_pixel <= 16'b1110100011100100;
1514:oled_pixel <= 16'b1110100011100100;
1521:oled_pixel <= 16'b1110100011100100;
1522:oled_pixel <= 16'b1110100011100100;
1523:oled_pixel <= 16'b1110100011100100;
1524:oled_pixel <= 16'b1110100011100100;
1527:oled_pixel <= 16'b1110100011100100;
1528:oled_pixel <= 16'b1110100011100100;
1529:oled_pixel <= 16'b1110100011100100;
1530:oled_pixel <= 16'b1110100011100100;
1541:oled_pixel <= 16'b1110100011100100;
1542:oled_pixel <= 16'b1110100011100100;
1543:oled_pixel <= 16'b1110100011100100;
1544:oled_pixel <= 16'b1110100011100100;
1547:oled_pixel <= 16'b1110100011100100;
1548:oled_pixel <= 16'b1110100011100100;
1549:oled_pixel <= 16'b1110100011100100;
1550:oled_pixel <= 16'b1110100011100100;
1553:oled_pixel <= 16'b1110100011100100;
1554:oled_pixel <= 16'b1110100011100100;
1555:oled_pixel <= 16'b1110100011100100;
1556:oled_pixel <= 16'b1110100011100100;
1559:oled_pixel <= 16'b1110100011100100;
1560:oled_pixel <= 16'b1110100011100100;
1561:oled_pixel <= 16'b1110100011100100;
1562:oled_pixel <= 16'b1110100011100100;
1565:oled_pixel <= 16'b1110100011100100;
1566:oled_pixel <= 16'b1110100011100100;
1567:oled_pixel <= 16'b1110100011100100;
1568:oled_pixel <= 16'b1110100011100100;
1571:oled_pixel <= 16'b1110100011100100;
1572:oled_pixel <= 16'b1110100011100100;
1573:oled_pixel <= 16'b1110100011100100;
1574:oled_pixel <= 16'b1110100011100100;
1577:oled_pixel <= 16'b1110100011100100;
1578:oled_pixel <= 16'b1110100011100100;
1579:oled_pixel <= 16'b1110100011100100;
1580:oled_pixel <= 16'b1110100011100100;
1583:oled_pixel <= 16'b1110100011100100;
1584:oled_pixel <= 16'b1110100011100100;
1585:oled_pixel <= 16'b1110100011100100;
1586:oled_pixel <= 16'b1110100011100100;
1589:oled_pixel <= 16'b1110100011100100;
1590:oled_pixel <= 16'b1110100011100100;
1591:oled_pixel <= 16'b1110100011100100;
1592:oled_pixel <= 16'b1110100011100100;
1595:oled_pixel <= 16'b1110100011100100;
1596:oled_pixel <= 16'b1110100011100100;
1597:oled_pixel <= 16'b1110100011100100;
1598:oled_pixel <= 16'b1110100011100100;
1601:oled_pixel <= 16'b1110100011100100;
1602:oled_pixel <= 16'b1110100011100100;
1603:oled_pixel <= 16'b1110100011100100;
1604:oled_pixel <= 16'b1110100011100100;
1607:oled_pixel <= 16'b1110100011100100;
1608:oled_pixel <= 16'b1110100011100100;
1609:oled_pixel <= 16'b1110100011100100;
1610:oled_pixel <= 16'b1110100011100100;
1617:oled_pixel <= 16'b1110100011100100;
1618:oled_pixel <= 16'b1110100011100100;
1619:oled_pixel <= 16'b1110100011100100;
1620:oled_pixel <= 16'b1110100011100100;
1623:oled_pixel <= 16'b1110100011100100;
1624:oled_pixel <= 16'b1110100011100100;
1625:oled_pixel <= 16'b1110100011100100;
1626:oled_pixel <= 16'b1110100011100100;
1637:oled_pixel <= 16'b1110100011100100;
1638:oled_pixel <= 16'b1110100011100100;
1639:oled_pixel <= 16'b1110100011100100;
1640:oled_pixel <= 16'b1110100011100100;
1641:oled_pixel <= 16'b1110100011100100;
1642:oled_pixel <= 16'b1110100011100100;
1643:oled_pixel <= 16'b1110100011100100;
1644:oled_pixel <= 16'b1110100011100100;
1645:oled_pixel <= 16'b1110100011100100;
1646:oled_pixel <= 16'b1110100011100100;
1649:oled_pixel <= 16'b1110100011100100;
1650:oled_pixel <= 16'b1110100011100100;
1651:oled_pixel <= 16'b1110100011100100;
1652:oled_pixel <= 16'b1110100011100100;
1653:oled_pixel <= 16'b1110100011100100;
1654:oled_pixel <= 16'b1110100011100100;
1655:oled_pixel <= 16'b1110100011100100;
1656:oled_pixel <= 16'b1110100011100100;
1657:oled_pixel <= 16'b1110100011100100;
1658:oled_pixel <= 16'b1110100011100100;
1663:oled_pixel <= 16'b1110100011100100;
1664:oled_pixel <= 16'b1110100011100100;
1665:oled_pixel <= 16'b1110100011100100;
1666:oled_pixel <= 16'b1110100011100100;
1667:oled_pixel <= 16'b1110100011100100;
1668:oled_pixel <= 16'b1110100011100100;
1675:oled_pixel <= 16'b1110100011100100;
1676:oled_pixel <= 16'b1110100011100100;
1677:oled_pixel <= 16'b1110100011100100;
1678:oled_pixel <= 16'b1110100011100100;
1679:oled_pixel <= 16'b1110100011100100;
1680:oled_pixel <= 16'b1110100011100100;
1687:oled_pixel <= 16'b1110100011100100;
1688:oled_pixel <= 16'b1110100011100100;
1689:oled_pixel <= 16'b1110100011100100;
1690:oled_pixel <= 16'b1110100011100100;
1691:oled_pixel <= 16'b1110100011100100;
1692:oled_pixel <= 16'b1110100011100100;
1699:oled_pixel <= 16'b1110100011100100;
1700:oled_pixel <= 16'b1110100011100100;
1701:oled_pixel <= 16'b1110100011100100;
1702:oled_pixel <= 16'b1110100011100100;
1703:oled_pixel <= 16'b1110100011100100;
1704:oled_pixel <= 16'b1110100011100100;
1713:oled_pixel <= 16'b1110100011100100;
1714:oled_pixel <= 16'b1110100011100100;
1715:oled_pixel <= 16'b1110100011100100;
1716:oled_pixel <= 16'b1110100011100100;
1719:oled_pixel <= 16'b1110100011100100;
1720:oled_pixel <= 16'b1110100011100100;
1721:oled_pixel <= 16'b1110100011100100;
1722:oled_pixel <= 16'b1110100011100100;
1733:oled_pixel <= 16'b1110100011100100;
1734:oled_pixel <= 16'b1110100011100100;
1735:oled_pixel <= 16'b1110100011100100;
1736:oled_pixel <= 16'b1110100011100100;
1737:oled_pixel <= 16'b1110100011100100;
1738:oled_pixel <= 16'b1110100011100100;
1739:oled_pixel <= 16'b1110100011100100;
1740:oled_pixel <= 16'b1110100011100100;
1741:oled_pixel <= 16'b1110100011100100;
1742:oled_pixel <= 16'b1110100011100100;
1745:oled_pixel <= 16'b1110100011100100;
1746:oled_pixel <= 16'b1110100011100100;
1747:oled_pixel <= 16'b1110100011100100;
1748:oled_pixel <= 16'b1110100011100100;
1749:oled_pixel <= 16'b1110100011100100;
1750:oled_pixel <= 16'b1110100011100100;
1751:oled_pixel <= 16'b1110100011100100;
1752:oled_pixel <= 16'b1110100011100100;
1753:oled_pixel <= 16'b1110100011100100;
1754:oled_pixel <= 16'b1110100011100100;
1759:oled_pixel <= 16'b1110100011100100;
1760:oled_pixel <= 16'b1110100011100100;
1761:oled_pixel <= 16'b1110100011100100;
1762:oled_pixel <= 16'b1110100011100100;
1763:oled_pixel <= 16'b1110100011100100;
1764:oled_pixel <= 16'b1110100011100100;
1771:oled_pixel <= 16'b1110100011100100;
1772:oled_pixel <= 16'b1110100011100100;
1773:oled_pixel <= 16'b1110100011100100;
1774:oled_pixel <= 16'b1110100011100100;
1775:oled_pixel <= 16'b1110100011100100;
1776:oled_pixel <= 16'b1110100011100100;
1783:oled_pixel <= 16'b1110100011100100;
1784:oled_pixel <= 16'b1110100011100100;
1785:oled_pixel <= 16'b1110100011100100;
1786:oled_pixel <= 16'b1110100011100100;
1787:oled_pixel <= 16'b1110100011100100;
1788:oled_pixel <= 16'b1110100011100100;
1795:oled_pixel <= 16'b1110100011100100;
1796:oled_pixel <= 16'b1110100011100100;
1797:oled_pixel <= 16'b1110100011100100;
1798:oled_pixel <= 16'b1110100011100100;
1799:oled_pixel <= 16'b1110100011100100;
1800:oled_pixel <= 16'b1110100011100100;
1809:oled_pixel <= 16'b1110100011100100;
1810:oled_pixel <= 16'b1110100011100100;
1811:oled_pixel <= 16'b1110100011100100;
1812:oled_pixel <= 16'b1110100011100100;
1815:oled_pixel <= 16'b1110100011100100;
1816:oled_pixel <= 16'b1110100011100100;
1817:oled_pixel <= 16'b1110100011100100;
1818:oled_pixel <= 16'b1110100011100100;
default:oled_pixel<=0;
endcase

end
endmodule