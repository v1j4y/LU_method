BEGIN_PROVIDER [real*8 , H, (rank,rank)]

    implicit none
    ! BEGIN_DOC
    ! Hamiltonian : H = C*E*X
    ! END_DOC

    integer :: i,j,k,l,m
    real*8,allocatable :: temp(:,:)

    allocate(temp(rank,rank))

    temp=0d0
    H=0d0

    do i=1,rank
        do j=1,rank
            do k=1,rank
                temp(j,i)=temp(j,i)+EI(k,i)*X(j,k)
            enddo
        enddo
    enddo

    write(6,*)'temp'
    do i=1,rank
        do j=1,rank
            write(6,12)temp(j,i)
        enddo
            write(6,*)
    enddo

    do i=1,rank
        do j=1,rank
            do k=1,rank
                H(j,i)=H(j,i)+CC(k,i)*temp(j,k)
            enddo
        enddo
    enddo

   12   format((F5.2,'  '),$)
END_PROVIDER
