! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

subroutine provide_ll
  use c_mod
  use rank_mod
  use LU_mod
  implicit none
  character*(10) :: irp_here = 'provide_ll'
  integer                   :: irp_err 
  logical                   :: irp_dimensions_OK
  if (.not.c_is_built) then
    call provide_c
  endif
  if (.not.rank_is_built) then
    call provide_rank
  endif
 if (allocated (ll) ) then
  irp_dimensions_OK = .True.
  irp_dimensions_OK = irp_dimensions_OK.AND.(SIZE(ll,1)==(rank))
  irp_dimensions_OK = irp_dimensions_OK.AND.(SIZE(ll,2)==(rank))
  if (.not.irp_dimensions_OK) then
   deallocate(ll,stat=irp_err)
   if (irp_err /= 0) then
     print *, irp_here//': Deallocation failed: ll'
     print *, ' size: (rank,rank)'
   endif
   if ((rank>0).and.(rank>0)) then
    allocate(ll(rank,rank),stat=irp_err)
    if (irp_err /= 0) then
     print *, irp_here//': Allocation failed: ll'
     print *, ' size: (rank,rank)'
    endif
   endif
  endif
 else
   if ((rank>0).and.(rank>0)) then
    allocate(ll(rank,rank),stat=irp_err)
    if (irp_err /= 0) then
     print *, irp_here//': Allocation failed: ll'
     print *, ' size: (rank,rank)'
    endif
   endif
 endif
 if (allocated (li) ) then
  irp_dimensions_OK = .True.
  irp_dimensions_OK = irp_dimensions_OK.AND.(SIZE(li,1)==(rank))
  irp_dimensions_OK = irp_dimensions_OK.AND.(SIZE(li,2)==(rank))
  if (.not.irp_dimensions_OK) then
   deallocate(li,stat=irp_err)
   if (irp_err /= 0) then
     print *, irp_here//': Deallocation failed: li'
     print *, ' size: (rank,rank)'
   endif
   if ((rank>0).and.(rank>0)) then
    allocate(li(rank,rank),stat=irp_err)
    if (irp_err /= 0) then
     print *, irp_here//': Allocation failed: li'
     print *, ' size: (rank,rank)'
    endif
   endif
  endif
 else
   if ((rank>0).and.(rank>0)) then
    allocate(li(rank,rank),stat=irp_err)
    if (irp_err /= 0) then
     print *, irp_here//': Allocation failed: li'
     print *, ' size: (rank,rank)'
    endif
   endif
 endif
 if (allocated (u) ) then
  irp_dimensions_OK = .True.
  irp_dimensions_OK = irp_dimensions_OK.AND.(SIZE(u,1)==(rank))
  irp_dimensions_OK = irp_dimensions_OK.AND.(SIZE(u,2)==(rank))
  if (.not.irp_dimensions_OK) then
   deallocate(u,stat=irp_err)
   if (irp_err /= 0) then
     print *, irp_here//': Deallocation failed: u'
     print *, ' size: (rank,rank)'
   endif
   if ((rank>0).and.(rank>0)) then
    allocate(u(rank,rank),stat=irp_err)
    if (irp_err /= 0) then
     print *, irp_here//': Allocation failed: u'
     print *, ' size: (rank,rank)'
    endif
   endif
  endif
 else
   if ((rank>0).and.(rank>0)) then
    allocate(u(rank,rank),stat=irp_err)
    if (irp_err /= 0) then
     print *, irp_here//': Allocation failed: u'
     print *, ' size: (rank,rank)'
    endif
   endif
 endif
 if (.not.ll_is_built) then
  call bld_ll
  ll_is_built = .True.

 endif
end subroutine provide_ll

subroutine bld_ll
  use c_mod
  use rank_mod
  use LU_mod
    implicit none                                                        ! LU.irp.f:   5
  character*(2) :: irp_here = 'll'                                       ! LU.irp.f:   1
    integer :: i,j,k,l,m                                                 ! LU.irp.f:  11
    U = 0d0                                                              ! LU.irp.f:  13
    do i=1,rank                                                          ! LU.irp.f:  15
        do j=1,rank                                                      ! LU.irp.f:  16
            if(i.eq.j)then                                               ! LU.irp.f:  17
                LL(j,i)=1d0                                              ! LU.irp.f:  18
                LI(j,i)=1d0                                              ! LU.irp.f:  19
            else                                                         ! LU.irp.f:  20
                LL(j,i)=0d0                                              ! LU.irp.f:  21
                LI(j,i)=0d0                                              ! LU.irp.f:  22
            endif                                                        ! LU.irp.f:  23
        enddo                                                            ! LU.irp.f:  24
    enddo                                                                ! LU.irp.f:  25
    do j=1,rank-1                                                        ! LU.irp.f:  27
        do i=j+1,rank                                                    ! LU.irp.f:  28
                LI(j,i)=LI(j,i)+C(j,i)/C(j,j)                            ! LU.irp.f:  29
                LL(j,i)=LL(j,i)-C(j,i)/C(j,j)                            ! LU.irp.f:  30
        enddo                                                            ! LU.irp.f:  31
        do k=1,rank                                                      ! LU.irp.f:  33
            do l=1,rank                                                  ! LU.irp.f:  34
                do m=1,rank                                              ! LU.irp.f:  35
                    U(k,l)=U(k,l) + LL(m,l)*C(k,m)                       ! LU.irp.f:  36
                enddo                                                    ! LU.irp.f:  37
            enddo                                                        ! LU.irp.f:  38
        enddo                                                            ! LU.irp.f:  39
            C=U                                                          ! LU.irp.f:  41
            U=0d0                                                        ! LU.irp.f:  42
        do i=j+1,rank                                                    ! LU.irp.f:  44
            LL(j,i)=0d0                                                  ! LU.irp.f:  45
        enddo                                                            ! LU.irp.f:  46
    enddo                                                                ! LU.irp.f:  47
        U=C                                                              ! LU.irp.f:  49
   12   format((F5.2,'  '),$)                                            ! LU.irp.f:  50
end subroutine bld_ll
