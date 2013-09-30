BEGIN_PROVIDER [real*8, C,(rank,rank)]
&BEGIN_PROVIDER [real*8, e,(rank)]

    implicit none
    ! BEGIN_DOC
    ! coefficient matrix
    ! END_DOC

    integer :: i,j

    c(1,1) = 1
    c(1,2) = 2
    c(1,3) = 3
!   c(1,4) = 0

    c(2,1) = 1
    c(2,2) = 1
    c(2,3) = 1
!   c(2,4) = 1

    c(3,1) = 2
    c(3,2) = 0
    c(3,3) = 1
!   c(3,4) = 1

!   c(4,1) = 0
!   c(4,2) = 1
!   c(4,3) = 1
!   c(4,4) = 1

!   print coefficient matrix

    write(6,*)'coefficient matrix C'
    do i=1,rank
        do j=1,rank
            write(6,12)c(j,i)
        enddo
            write(6,*)
    enddo

    e(1) = 1
    e(2) = 2
    e(3) = 3
!   e(4) = 4

   12   format((F5.2,'  '),$)
END_PROVIDER
