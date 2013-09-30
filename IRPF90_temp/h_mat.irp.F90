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
  use c_mod
  use x_mod
  use rank_mod
  use LU_mod
    implicit none                                                     ! h_mat.irp.f:   2
  character*(5) :: irp_here = 'hamil'                                 ! h_mat.irp.f:   1
    real*8,allocatable :: eI(:,:)                                     ! h_mat.irp.f:   3
    integer :: i,j,k,l                                                ! h_mat.irp.f:   4
  if (.not.x_is_built) then
    call provide_x
  endif
  if (.not.ll_is_built) then
    call provide_ll
  endif
  if (.not.rank_is_built) then
    call provide_rank
  endif
    allocate (eI(rank,rank))                                          ! h_mat.irp.f:   6
    do i=1,rank                                                       ! h_mat.irp.f:  10
        do j=1,rank                                                   ! h_mat.irp.f:  11
            if(j.eq.i)then                                            ! h_mat.irp.f:  12
  if (.not.c_is_built) then
    call provide_c
  endif
            EI(j,i)=E(i)                                              ! h_mat.irp.f:  13
            else                                                      ! h_mat.irp.f:  14
            EI(j,i)=0d0                                               ! h_mat.irp.f:  15
            endif                                                     ! h_mat.irp.f:  16
        enddo                                                         ! h_mat.irp.f:  17
    enddo                                                             ! h_mat.irp.f:  18
    write(6,*)'LU decomposition of C'                                 ! h_mat.irp.f:  23
    write(6,*)'L'                                                     ! h_mat.irp.f:  24
    do i=1,rank                                                       ! h_mat.irp.f:  25
        do j=1,rank                                                   ! h_mat.irp.f:  26
            write(6,12)LI(j,i)                                        ! h_mat.irp.f:  27
        enddo                                                         ! h_mat.irp.f:  28
            write(6,*)                                                ! h_mat.irp.f:  29
    enddo                                                             ! h_mat.irp.f:  30
    write(6,*)'U'                                                     ! h_mat.irp.f:  32
    do i=1,rank                                                       ! h_mat.irp.f:  33
        do j=1,rank                                                   ! h_mat.irp.f:  34
            write(6,12)U(j,i)                                         ! h_mat.irp.f:  35
        enddo                                                         ! h_mat.irp.f:  36
            write(6,*)                                                ! h_mat.irp.f:  37
    enddo                                                             ! h_mat.irp.f:  38
    write(6,*)'Inverse X of C'                                        ! h_mat.irp.f:  42
    do i=1,rank                                                       ! h_mat.irp.f:  43
        do j=1,rank                                                   ! h_mat.irp.f:  44
            write(6,12)X(j,i)                                         ! h_mat.irp.f:  45
        enddo                                                         ! h_mat.irp.f:  46
            write(6,*)                                                ! h_mat.irp.f:  47
    enddo                                                             ! h_mat.irp.f:  48
    write(6,*)'Hamiltonian H = C*E*C-1'                               ! h_mat.irp.f:  52
    do i=1,rank                                                       ! h_mat.irp.f:  53
        do j=1,rank                                                   ! h_mat.irp.f:  54
            write(6,12)X(j,i)                                         ! h_mat.irp.f:  55
        enddo                                                         ! h_mat.irp.f:  56
            write(6,*)                                                ! h_mat.irp.f:  57
    enddo                                                             ! h_mat.irp.f:  58
   12   format((F5.2,'  '),$)                                         ! h_mat.irp.f:  61
contains                                                              ! h_mat.irp.f:  62
end                                                                   ! h_mat.irp.f:  64
