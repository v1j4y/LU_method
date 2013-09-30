BEGIN_PROVIDER [real*8, LL, (rank,rank)]
&BEGIN_PROVIDER [real*8, LI, (rank,rank)]
&BEGIN_PROVIDER [real*8, U, (rank,rank)]

    implicit none
    ! BEGIN_DOC
    ! calculate the LU decomposition of
    ! a matrix
    ! END_DOC

    integer :: i,j,k,l,m

    U = 0d0

    do i=1,rank
        do j=1,rank
            if(i.eq.j)then
                LL(j,i)=1d0
                LI(j,i)=1d0
            else
                LL(j,i)=0d0
                LI(j,i)=0d0
            endif
        enddo
    enddo

    do j=1,rank-1
        do i=j+1,rank
                LI(j,i)=LI(j,i)+C(j,i)/C(j,j)
                LL(j,i)=LL(j,i)-C(j,i)/C(j,j)
        enddo

        do k=1,rank
            do l=1,rank
                do m=1,rank
                    U(k,l)=U(k,l) + LL(m,l)*C(k,m)
                enddo
            enddo
        enddo

            C=U
            U=0d0

        do i=j+1,rank
            LL(j,i)=0d0
        enddo
    enddo

        U=C
   12   format((F5.2,'  '),$)
END_PROVIDER
