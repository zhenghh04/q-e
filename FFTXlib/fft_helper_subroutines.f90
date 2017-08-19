MODULE fft_helper_subroutines

  IMPLICIT NONE
  SAVE

CONTAINS

  SUBROUTINE tg_reduce_rho( rhos, tmp_rhos, desc )
     USE fft_param
     USE fft_types,      ONLY : fft_type_descriptor

     TYPE(fft_type_descriptor), INTENT(in) :: desc
     REAL(DP), INTENT(INOUT)  :: tmp_rhos(:,:)
     REAL(DP), INTENT(OUT) :: rhos(:,:)

     INTEGER :: ierr, from, ir3, ioff, nxyp, ioff_tg

     IF ( desc%nproc2 > 1 ) THEN
#ifdef __MPI
        CALL MPI_ALLREDUCE( MPI_IN_PLACE, tmp_rhos, SIZE(tmp_rhos), MPI_DOUBLE_PRECISION, MPI_SUM, desc%comm2, ierr )
#endif
     ENDIF
     !
     !BRING CHARGE DENSITY BACK TO ITS ORIGINAL POSITION
     !
     !If the current processor is not the "first" processor in its
     !orbital group then does a local copy (reshuffling) of its data
     !
     nxyp = desc%nr1x * desc%my_nr2p
     DO ir3 = 1, desc%my_nr3p
        ioff    = desc%nr1x * desc%my_nr2p * (ir3-1)
        ioff_tg = desc%nr1x * desc%nr2x    * (ir3-1) + desc%nr1x * desc%my_i0r2p
        rhos(ioff+1:ioff+nxyp,:) = rhos(ioff+1:ioff+nxyp,:) + tmp_rhos(ioff_tg+1:ioff_tg+nxyp,:)
     END DO
  END SUBROUTINE

  SUBROUTINE tg_get_nnr( desc, right_nnr )
     USE fft_param
     USE fft_types,      ONLY : fft_type_descriptor
     TYPE(fft_type_descriptor), INTENT(in) :: desc
     INTEGER, INTENT(OUT) :: right_nnr
     right_nnr = desc%nnr
  END SUBROUTINE

  SUBROUTINE tg_get_local_nr3( desc, val )
     USE fft_param
     USE fft_types,      ONLY : fft_type_descriptor
     TYPE(fft_type_descriptor), INTENT(in) :: desc
     INTEGER, INTENT(OUT) :: val
     val = desc%my_nr3p
  END SUBROUTINE

  SUBROUTINE tg_get_recip_inc( desc, val )
     USE fft_param
     USE fft_types,      ONLY : fft_type_descriptor
     TYPE(fft_type_descriptor), INTENT(in) :: desc
     INTEGER, INTENT(OUT) :: val
     val = desc%nnr
  END SUBROUTINE


END MODULE fft_helper_subroutines