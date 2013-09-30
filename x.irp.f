BEGIN_PROVIDER [real*8, X,(rank,rank)]

    implicit none
    ! BEGIN_DOC
    ! calculate X linear system of equations
    ! END_DOC

    real*8,allocatable :: B(:,:),D(:,:)
    integer :: i,j,k,l,m
    real*8 :: sum

    allocate(B(rank,rank))
    allocate(D(rank,rank))

!   B = I

    do i=1,rank
        do j=1,rank
            if(j.eq.i)then
                B(j,i)=1d0
            else
                B(j,i)=0d0
            endif
        enddo
    enddo

    D = 0d0

    do i=1,rank
        D(i,1)=B(i,1)/LL(1,1)
        do j=2,rank
        sum=0d0
            do k=1,j-1
                sum += LI(k,j)*D(i,k)
            enddo
            D(i,j)=(B(i,j)-sum)/LI(j,j)
        enddo
    enddo

    do i=rank,1,-1
        X(i,rank)=D(i,rank)/U(rank,rank)
        do j=rank-1,1,-1
        sum=0d0
            do k=rank,j+1,-1
                sum += U(k,j)*X(i,k)
            enddo
            X(i,j)=(D(i,j)-sum)/U(j,j)
        enddo
    enddo

   12   format((F5.2,'  '),$)
END_PROVIDER
