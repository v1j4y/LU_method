subroutine irp_finalize_991214802
 use LU_mod
 use x_mod
 use rank_mod
 use c_mod
 use h_mod
  if (allocated(c)) then
    c_is_built = .False.
    deallocate(c)
  endif
  if (allocated(e)) then
    c_is_built = .False.
    deallocate(e)
  endif
  if (allocated(cc)) then
    c_is_built = .False.
    deallocate(cc)
  endif
  if (allocated(h)) then
    h_is_built = .False.
    deallocate(h)
  endif
  if (allocated(ll)) then
    ll_is_built = .False.
    deallocate(ll)
  endif
  if (allocated(li)) then
    ll_is_built = .False.
    deallocate(li)
  endif
  if (allocated(u)) then
    ll_is_built = .False.
    deallocate(u)
  endif
  if (allocated(x)) then
    x_is_built = .False.
    deallocate(x)
  endif
  if (allocated(ei)) then
    c_is_built = .False.
    deallocate(ei)
  endif
end
