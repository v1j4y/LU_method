! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

subroutine provide_h
  use c_mod
  use h_mod
  use rank_mod
  use x_mod
  implicit none
  character*(9) :: irp_here = 'provide_h'
  integer                   :: irp_err 
  logical                   :: irp_dimensions_OK
  if (.not.x_is_built) then
    call provide_x
  endif
  if (.not.c_is_built) then
    call provide_c
  endif
  if (.not.rank_is_built) then
    call provide_rank
  endif
 if (allocated (h) ) then
  irp_dimensions_OK = .True.
  irp_dimensions_OK = irp_dimensions_OK.AND.(SIZE(h,1)==(rank))
  irp_dimensions_OK = irp_dimensions_OK.AND.(SIZE(h,2)==(rank))
  if (.not.irp_dimensions_OK) then
   deallocate(h,stat=irp_err)
   if (irp_err /= 0) then
     print *, irp_here//': Deallocation failed: h'
     print *, ' size: (rank,rank)'
   endif
   if ((rank>0).and.(rank>0)) then
    allocate(h(rank,rank),stat=irp_err)
    if (irp_err /= 0) then
     print *, irp_here//': Allocation failed: h'
     print *, ' size: (rank,rank)'
    endif
   endif
  endif
 else
   if ((rank>0).and.(rank>0)) then
    allocate(h(rank,rank),stat=irp_err)
    if (irp_err /= 0) then
     print *, irp_here//': Allocation failed: h'
     print *, ' size: (rank,rank)'
    endif
   endif
 endif
 if (.not.h_is_built) then
  call bld_h
  h_is_built = .True.

 endif
end subroutine provide_h

subroutine bld_h
  use c_mod
  use h_mod
  use rank_mod
  use x_mod
    implicit none                                                         ! h.irp.f:   3
  character*(1) :: irp_here = 'h'                                         ! h.irp.f:   1
    integer :: i,j,k,l,m                                                  ! h.irp.f:   8
    real*8,allocatable :: temp(:,:)                                       ! h.irp.f:   9
    allocate(temp(rank,rank))                                             ! h.irp.f:  11
    temp=0d0                                                              ! h.irp.f:  13
    H=0d0                                                                 ! h.irp.f:  14
    do i=1,rank                                                           ! h.irp.f:  16
        do j=1,rank                                                       ! h.irp.f:  17
            do k=1,rank                                                   ! h.irp.f:  18
                temp(j,i)=temp(j,i)+EI(k,i)*X(j,k)                        ! h.irp.f:  19
            enddo                                                         ! h.irp.f:  20
        enddo                                                             ! h.irp.f:  21
    enddo                                                                 ! h.irp.f:  22
    write(6,*)'temp'                                                      ! h.irp.f:  24
    do i=1,rank                                                           ! h.irp.f:  25
        do j=1,rank                                                       ! h.irp.f:  26
            write(6,12)temp(j,i)                                          ! h.irp.f:  27
        enddo                                                             ! h.irp.f:  28
            write(6,*)                                                    ! h.irp.f:  29
    enddo                                                                 ! h.irp.f:  30
    do i=1,rank                                                           ! h.irp.f:  32
        do j=1,rank                                                       ! h.irp.f:  33
            do k=1,rank                                                   ! h.irp.f:  34
                H(j,i)=H(j,i)+CC(k,i)*temp(j,k)                           ! h.irp.f:  35
            enddo                                                         ! h.irp.f:  36
        enddo                                                             ! h.irp.f:  37
    enddo                                                                 ! h.irp.f:  38
   12   format((F5.2,'  '),$)                                             ! h.irp.f:  40
end subroutine bld_h
