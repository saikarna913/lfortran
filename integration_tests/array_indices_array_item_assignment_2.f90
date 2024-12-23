program array_indices_array_item_assignment_2

real :: Q(4), R(4), S(4)

R = [1, 4, 2, 3]
S = [3, 2, 1, 4]

Q = 5.0

Q(trueloc(R < S)) = Q(trueloc(R < S)) + 1.0
Q(trueloc(R >= S)) = -Q(trueloc(R >= S)) - 1.0

print *, Q
if( any(Q /= [6.0, -6.0, -6.0, 6.0]) ) error stop

contains

function trueloc(x) result(loc)

logical, intent(in) :: x(:)
integer(4), allocatable :: loc(:)
integer :: i, j

allocate(loc(count(x)))

j = 1
do i = 1, size(x)
    if( x(i) ) then
        loc(j) = i
        j = j + 1
    end if
end do

end function trueloc

end program