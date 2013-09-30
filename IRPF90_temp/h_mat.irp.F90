! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

program irp_program                                                   ! hamil:   0
 call hamil                                                           ! h_mat.irp.f:   0
 call irp_finalize_991214802()                                        ! h_mat.irp.f:   0
end program                                                           ! h_mat.irp.f:   0
subroutine hamil                                                      ! h_mat.irp.f:   1
  use x_mod
  use h_mod
  use rank_mod
  use LU_mod
    implicit none                                                     ! h_mat.irp.f:   2
  character*(5) :: irp_here = 'hamil'                                 ! h_mat.irp.f:   1
    integer :: i,j,k,l                                                ! h_mat.irp.f:   3
  if (.not.h_is_built) then
    call provide_h
  endif
  if (.not.ll_is_built) then
    call provide_ll
  endif
  if (.not.rank_is_built) then
    call provide_rank
  endif
  if (.not.x_is_built) then
    call provide_x
  endif
    write(6,*)'LU decomposition of C'                                 ! h_mat.irp.f:   8
    write(6,*)'L'                                                     ! h_mat.irp.f:   9
    do i=1,rank                                                       ! h_mat.irp.f:  10
        do j=1,rank                                                   ! h_mat.irp.f:  11
            write(6,12)LI(j,i)                                        ! h_mat.irp.f:  12
        enddo                                                         ! h_mat.irp.f:  13
            write(6,*)                                                ! h_mat.irp.f:  14
    enddo                                                             ! h_mat.irp.f:  15
    write(6,*)'U'                                                     ! h_mat.irp.f:  17
    do i=1,rank                                                       ! h_mat.irp.f:  18
        do j=1,rank                                                   ! h_mat.irp.f:  19
            write(6,12)U(j,i)                                         ! h_mat.irp.f:  20
        enddo                                                         ! h_mat.irp.f:  21
            write(6,*)                                                ! h_mat.irp.f:  22
    enddo                                                             ! h_mat.irp.f:  23
    write(6,*)'Inverse X of C'                                        ! h_mat.irp.f:  27
    do i=1,rank                                                       ! h_mat.irp.f:  28
        do j=1,rank                                                   ! h_mat.irp.f:  29
            write(6,12)X(j,i)                                         ! h_mat.irp.f:  30
        enddo                                                         ! h_mat.irp.f:  31
            write(6,*)                                                ! h_mat.irp.f:  32
    enddo                                                             ! h_mat.irp.f:  33
    write(6,*)'Hamiltonian H = C*E*C-1'                               ! h_mat.irp.f:  37
    do i=1,rank                                                       ! h_mat.irp.f:  38
        do j=1,rank                                                   ! h_mat.irp.f:  39
            write(6,12)H(j,i)                                         ! h_mat.irp.f:  40
        enddo                                                         ! h_mat.irp.f:  41
            write(6,*)                                                ! h_mat.irp.f:  42
    enddo                                                             ! h_mat.irp.f:  43
   12   format((F5.2,'  '),$)                                         ! h_mat.irp.f:  46
contains                                                              ! h_mat.irp.f:  47
end                                                                   ! h_mat.irp.f:  49
