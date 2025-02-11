module log
  use precision
  use config, only: log_filename => con_log_filename
  use fio, only: open_file_to_write
  implicit none

  public log_funit

  public open_log, write_log, close_log

  integer(kind=si) :: log_funit

contains
  subroutine open_log()
    implicit none
    call open_file_to_write(log_filename, log_funit)
  end subroutine open_log

  subroutine write_log(n, residual)
    implicit none
    integer(kind=di), intent(in) :: n
    real(kind=dp), intent(in) :: residual
    write(unit=log_funit, fmt="(I6, 1x, E15.7)") n, residual
  end subroutine write_log

  subroutine close_log()
    implicit none
    close(log_funit)
  end subroutine close_log
end module log
