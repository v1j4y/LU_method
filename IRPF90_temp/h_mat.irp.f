program hamil
    implicit none
    integer :: i,j,k,l

!   invert coefficient matrix
!!  calculate the LU decomposition

    write(6,*)'LU decomposition of C'
    write(6,*)'L'
    do i=1,rank
        do j=1,rank
            write(6,12)LI(j,i)
        enddo
            write(6,*)
    enddo

    write(6,*)'U'
    do i=1,rank
        do j=1,rank
            write(6,12)U(j,i)
        enddo
            write(6,*)
    enddo

!!  solve for linear system of equations

    write(6,*)'Inverse X of C'
    do i=1,rank
        do j=1,rank
            write(6,12)X(j,i)
        enddo
            write(6,*)
    enddo

!   calculate C*E*C-1

    write(6,*)'Hamiltonian H = C*E*C-1'
    do i=1,rank
        do j=1,rank
            write(6,12)H(j,i)
        enddo
            write(6,*)
    enddo


   12   format((F5.2,'  '),$)
contains
    !TODO
end program hamil
