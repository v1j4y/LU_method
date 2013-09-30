! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

subroutine provide_c
  use c_mod
  use rank_mod
  implicit none
  character*(9) :: irp_here = 'provide_c'
  integer                   :: irp_err 
  logical                   :: irp_dimensions_OK
  if (.not.rank_is_built) then
    call provide_rank
  endif
 if (allocated (c) ) then
  irp_dimensions_OK = .True.
  irp_dimensions_OK = irp_dimensions_OK.AND.(SIZE(c,1)==(rank))
  irp_dimensions_OK = irp_dimensions_OK.AND.(SIZE(c,2)==(rank))
  if (.not.irp_dimensions_OK) then
   deallocate(c,stat=irp_err)
   if (irp_err /= 0) then
     print *, irp_here//': Deallocation failed: c'
     print *, ' size: (rank,rank)'
   endif
   if ((rank>0).and.(rank>0)) then
    allocate(c(rank,rank),stat=irp_err)
    if (irp_err /= 0) then
     print *, irp_here//': Allocation failed: c'
     print *, ' size: (rank,rank)'
    endif
   endif
  endif
 else
   if ((rank>0).and.(rank>0)) then
    allocate(c(rank,rank),stat=irp_err)
    if (irp_err /= 0) then
     print *, irp_here//': Allocation failed: c'
     print *, ' size: (rank,rank)'
    endif
   endif
 endif
 if (allocated (cc) ) then
  irp_dimensions_OK = .True.
  irp_dimensions_OK = irp_dimensions_OK.AND.(SIZE(cc,1)==(rank))
  irp_dimensions_OK = irp_dimensions_OK.AND.(SIZE(cc,2)==(rank))
  if (.not.irp_dimensions_OK) then
   deallocate(cc,stat=irp_err)
   if (irp_err /= 0) then
     print *, irp_here//': Deallocation failed: cc'
     print *, ' size: (rank,rank)'
   endif
   if ((rank>0).and.(rank>0)) then
    allocate(cc(rank,rank),stat=irp_err)
    if (irp_err /= 0) then
     print *, irp_here//': Allocation failed: cc'
     print *, ' size: (rank,rank)'
    endif
   endif
  endif
 else
   if ((rank>0).and.(rank>0)) then
    allocate(cc(rank,rank),stat=irp_err)
    if (irp_err /= 0) then
     print *, irp_here//': Allocation failed: cc'
     print *, ' size: (rank,rank)'
    endif
   endif
 endif
 if (allocated (e) ) then
  irp_dimensions_OK = .True.
  irp_dimensions_OK = irp_dimensions_OK.AND.(SIZE(e,1)==(rank))
  if (.not.irp_dimensions_OK) then
   deallocate(e,stat=irp_err)
   if (irp_err /= 0) then
     print *, irp_here//': Deallocation failed: e'
     print *, ' size: (rank)'
   endif
   if ((rank>0)) then
    allocate(e(rank),stat=irp_err)
    if (irp_err /= 0) then
     print *, irp_here//': Allocation failed: e'
     print *, ' size: (rank)'
    endif
   endif
  endif
 else
   if ((rank>0)) then
    allocate(e(rank),stat=irp_err)
    if (irp_err /= 0) then
     print *, irp_here//': Allocation failed: e'
     print *, ' size: (rank)'
    endif
   endif
 endif
 if (allocated (ei) ) then
  irp_dimensions_OK = .True.
  irp_dimensions_OK = irp_dimensions_OK.AND.(SIZE(ei,1)==(rank))
  irp_dimensions_OK = irp_dimensions_OK.AND.(SIZE(ei,2)==(rank))
  if (.not.irp_dimensions_OK) then
   deallocate(ei,stat=irp_err)
   if (irp_err /= 0) then
     print *, irp_here//': Deallocation failed: ei'
     print *, ' size: (rank,rank)'
   endif
   if ((rank>0).and.(rank>0)) then
    allocate(ei(rank,rank),stat=irp_err)
    if (irp_err /= 0) then
     print *, irp_here//': Allocation failed: ei'
     print *, ' size: (rank,rank)'
    endif
   endif
  endif
 else
   if ((rank>0).and.(rank>0)) then
    allocate(ei(rank,rank),stat=irp_err)
    if (irp_err /= 0) then
     print *, irp_here//': Allocation failed: ei'
     print *, ' size: (rank,rank)'
    endif
   endif
 endif
 if (.not.c_is_built) then
  call bld_c
  c_is_built = .True.

 endif
end subroutine provide_c

subroutine bld_c
  use c_mod
  use rank_mod
    implicit none                                                         ! c.irp.f:   6
  character*(1) :: irp_here = 'c'                                         ! c.irp.f:   1
    integer :: i,j                                                        ! c.irp.f:  11
    c(1,1) = 1                                                            ! c.irp.f:  13
    c(1,2) = 2                                                            ! c.irp.f:  14
    c(1,3) = 3                                                            ! c.irp.f:  15
    c(2,1) = 1                                                            ! c.irp.f:  18
    c(2,2) = 1                                                            ! c.irp.f:  19
    c(2,3) = 1                                                            ! c.irp.f:  20
    c(3,1) = 2                                                            ! c.irp.f:  23
    c(3,2) = 0                                                            ! c.irp.f:  24
    c(3,3) = 1                                                            ! c.irp.f:  25
    write(6,*)'coefficient matrix C'                                      ! c.irp.f:  35
    do i=1,rank                                                           ! c.irp.f:  36
        do j=1,rank                                                       ! c.irp.f:  37
            write(6,12)c(j,i)                                             ! c.irp.f:  38
        enddo                                                             ! c.irp.f:  39
            write(6,*)                                                    ! c.irp.f:  40
    enddo                                                                 ! c.irp.f:  41
    CC=C                                                                  ! c.irp.f:  43
    e(1) = 1                                                              ! c.irp.f:  45
    e(2) = 2                                                              ! c.irp.f:  46
    e(3) = 3                                                              ! c.irp.f:  47
    do i=1,rank                                                           ! c.irp.f:  52
        do j=1,rank                                                       ! c.irp.f:  53
            if(j.eq.i)then                                                ! c.irp.f:  54
            EI(j,i)=E(i)                                                  ! c.irp.f:  55
            else                                                          ! c.irp.f:  56
            EI(j,i)=0d0                                                   ! c.irp.f:  57
            endif                                                         ! c.irp.f:  58
        enddo                                                             ! c.irp.f:  59
    enddo                                                                 ! c.irp.f:  60
   12   format((F5.2,'  '),$)                                             ! c.irp.f:  63
end subroutine bld_c
