! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

subroutine provide_x
  use x_mod
  use rank_mod
  use LU_mod
  implicit none
  character*(9) :: irp_here = 'provide_x'
  integer                   :: irp_err 
  logical                   :: irp_dimensions_OK
  if (.not.ll_is_built) then
    call provide_ll
  endif
  if (.not.rank_is_built) then
    call provide_rank
  endif
 if (allocated (x) ) then
  irp_dimensions_OK = .True.
  irp_dimensions_OK = irp_dimensions_OK.AND.(SIZE(x,1)==(rank))
  irp_dimensions_OK = irp_dimensions_OK.AND.(SIZE(x,2)==(rank))
  if (.not.irp_dimensions_OK) then
   deallocate(x,stat=irp_err)
   if (irp_err /= 0) then
     print *, irp_here//': Deallocation failed: x'
     print *, ' size: (rank,rank)'
   endif
   if ((rank>0).and.(rank>0)) then
    allocate(x(rank,rank),stat=irp_err)
    if (irp_err /= 0) then
     print *, irp_here//': Allocation failed: x'
     print *, ' size: (rank,rank)'
    endif
   endif
  endif
 else
   if ((rank>0).and.(rank>0)) then
    allocate(x(rank,rank),stat=irp_err)
    if (irp_err /= 0) then
     print *, irp_here//': Allocation failed: x'
     print *, ' size: (rank,rank)'
    endif
   endif
 endif
 if (.not.x_is_built) then
  call bld_x
  x_is_built = .True.

 endif
end subroutine provide_x

subroutine bld_x
  use x_mod
  use rank_mod
  use LU_mod
    implicit none                                                         ! x.irp.f:   3
  character*(1) :: irp_here = 'x'                                         ! x.irp.f:   1
    real*8,allocatable :: B(:,:),D(:,:)                                   ! x.irp.f:   8
    integer :: i,j,k,l,m                                                  ! x.irp.f:   9
    real*8 :: sum                                                         ! x.irp.f:  10
    allocate(B(rank,rank))                                                ! x.irp.f:  12
    allocate(D(rank,rank))                                                ! x.irp.f:  13
    do i=1,rank                                                           ! x.irp.f:  17
        do j=1,rank                                                       ! x.irp.f:  18
            if(j.eq.i)then                                                ! x.irp.f:  19
                B(j,i)=1d0                                                ! x.irp.f:  20
            else                                                          ! x.irp.f:  21
                B(j,i)=0d0                                                ! x.irp.f:  22
            endif                                                         ! x.irp.f:  23
        enddo                                                             ! x.irp.f:  24
    enddo                                                                 ! x.irp.f:  25
    D = 0d0                                                               ! x.irp.f:  27
    do i=1,rank                                                           ! x.irp.f:  29
        D(i,1)=B(i,1)/LL(1,1)                                             ! x.irp.f:  30
        do j=2,rank                                                       ! x.irp.f:  31
        sum=0d0                                                           ! x.irp.f:  32
            do k=1,j-1                                                    ! x.irp.f:  33
                sum =sum +( LI(k,j)*D(i,k))                               ! x.irp.f:  34
            enddo                                                         ! x.irp.f:  35
            D(i,j)=(B(i,j)-sum)/LI(j,j)                                   ! x.irp.f:  36
        enddo                                                             ! x.irp.f:  37
    enddo                                                                 ! x.irp.f:  38
    do i=rank,1,-1                                                        ! x.irp.f:  40
        X(i,rank)=D(i,rank)/U(rank,rank)                                  ! x.irp.f:  41
        do j=rank-1,1,-1                                                  ! x.irp.f:  42
        sum=0d0                                                           ! x.irp.f:  43
            do k=rank,j+1,-1                                              ! x.irp.f:  44
                sum =sum +( U(k,j)*X(i,k))                                ! x.irp.f:  45
            enddo                                                         ! x.irp.f:  46
            X(i,j)=(D(i,j)-sum)/U(j,j)                                    ! x.irp.f:  47
        enddo                                                             ! x.irp.f:  48
    enddo                                                                 ! x.irp.f:  49
   12   format((F5.2,'  '),$)                                             ! x.irp.f:  51
end subroutine bld_x
