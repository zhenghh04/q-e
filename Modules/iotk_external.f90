! Input/Output Tool Kit (IOTK)
! Copyright (C) 2004 Giovanni Bussi
!
! This library is free software; you can redistribute it and/or
! modify it under the terms of the GNU Lesser General Public
! License as published by the Free Software Foundation; either
! version 2.1 of the License, or (at your option) any later version.
!
! This library is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
! Lesser General Public License for more details.
!
! You should have received a copy of the GNU Lesser General Public
! License along with this library; if not, write to the Free Software
! Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

!------------------------------------------------------------------------------!
! Inclusion of configuration file
#include "iotk_config.h"
!------------------------------------------------------------------------------!

# 2 "../include/iotk_auxmacros.spp"
#ifndef __IOTK_AUXMACROS
#define __IOTK_AUXMACROS

! The macros are defined with -D option or inside iotk_config.h
! The default values are set here
! Maximum rank of an array
#ifndef __IOTK_MAXRANK
#  define __IOTK_MAXRANK 7
#endif
! Minimum value used in iotk_free_unit
#ifndef __IOTK_UNITMIN
#  define __IOTK_UNITMIN 90000
#endif
! Maximum value used in iotk_free_unit
#ifndef __IOTK_UNITMAX
#  define __IOTK_UNITMAX 99999
#endif
! Kind for header in binary files
#ifndef __IOTK_HEADER_KIND
#  define __IOTK_HEADER_KIND selected_int_kind(8)
#endif
! Character (or eventually string) for newline
! It may be adjusted for particular systems
! Unix    achar(10)
! Mac-OS  achar(13)
! Windows ? (now it should be a single byte)
#ifndef __IOTK_NEWLINE
#  define __IOTK_NEWLINE achar(10)
#endif
! Character for EOS
#ifndef __IOTK_EOS
#  define __IOTK_EOS achar(0)
#endif
! These are the default kinds, which depend on the options used
! during the library compilation
! Only default characters are implemented
#define __IOTK_CHARACTER1 iotk_defkind_character
! For logical, integer and real types, the c precompiler
! looks for defined kinds. If no kind is found, the default
! is used as __IOTK_type1
# 46 "../include/iotk_auxmacros.spp"
#ifndef __IOTK_LOGICAL1
# 46 "../include/iotk_auxmacros.spp"
#ifndef __IOTK_LOGICAL2
# 46 "../include/iotk_auxmacros.spp"
#ifndef __IOTK_LOGICAL3
# 46 "../include/iotk_auxmacros.spp"
#ifndef __IOTK_LOGICAL4
# 48 "../include/iotk_auxmacros.spp"
#define __IOTK_LOGICAL1 iotk_defkind_LOGICAL
# 51 "../include/iotk_auxmacros.spp"
#endif
# 51 "../include/iotk_auxmacros.spp"
#endif
# 51 "../include/iotk_auxmacros.spp"
#endif
# 51 "../include/iotk_auxmacros.spp"
#endif
# 46 "../include/iotk_auxmacros.spp"
#ifndef __IOTK_INTEGER1
# 46 "../include/iotk_auxmacros.spp"
#ifndef __IOTK_INTEGER2
# 46 "../include/iotk_auxmacros.spp"
#ifndef __IOTK_INTEGER3
# 46 "../include/iotk_auxmacros.spp"
#ifndef __IOTK_INTEGER4
# 48 "../include/iotk_auxmacros.spp"
#define __IOTK_INTEGER1 iotk_defkind_INTEGER
# 51 "../include/iotk_auxmacros.spp"
#endif
# 51 "../include/iotk_auxmacros.spp"
#endif
# 51 "../include/iotk_auxmacros.spp"
#endif
# 51 "../include/iotk_auxmacros.spp"
#endif
# 46 "../include/iotk_auxmacros.spp"
#ifndef __IOTK_REAL1
# 46 "../include/iotk_auxmacros.spp"
#ifndef __IOTK_REAL2
# 46 "../include/iotk_auxmacros.spp"
#ifndef __IOTK_REAL3
# 46 "../include/iotk_auxmacros.spp"
#ifndef __IOTK_REAL4
# 48 "../include/iotk_auxmacros.spp"
#define __IOTK_REAL1 iotk_defkind_REAL
# 51 "../include/iotk_auxmacros.spp"
#endif
# 51 "../include/iotk_auxmacros.spp"
#endif
# 51 "../include/iotk_auxmacros.spp"
#endif
# 51 "../include/iotk_auxmacros.spp"
#endif
# 54 "../include/iotk_auxmacros.spp"
! Complex are treated indentically to reals
! These lines map the definitions.
# 57 "../include/iotk_auxmacros.spp"
#ifdef __IOTK_REAL1
#define __IOTK_COMPLEX1 __IOTK_REAL1
#else
#undef __IOTK_COMPLEX1
#endif
# 57 "../include/iotk_auxmacros.spp"
#ifdef __IOTK_REAL2
#define __IOTK_COMPLEX2 __IOTK_REAL2
#else
#undef __IOTK_COMPLEX2
#endif
# 57 "../include/iotk_auxmacros.spp"
#ifdef __IOTK_REAL3
#define __IOTK_COMPLEX3 __IOTK_REAL3
#else
#undef __IOTK_COMPLEX3
#endif
# 57 "../include/iotk_auxmacros.spp"
#ifdef __IOTK_REAL4
#define __IOTK_COMPLEX4 __IOTK_REAL4
#else
#undef __IOTK_COMPLEX4
#endif
# 63 "../include/iotk_auxmacros.spp"
! If the binary format is not defined, use *
#ifndef __IOTK_BINARY_FORMAT
#define __IOTK_BINARY_FORMAT "*"
#endif

! Some check 
#if __IOTK_MAXRANK > 7
#  error
#endif
#if __IOTK_MAXRANK < 1
#  error
#endif

#endif

# 30 "iotk_external.spp"

# 33 "iotk_external.spp"

# 35 "iotk_external.spp"
subroutine iotk_copyfile_x(source,dest,source_unit,dest_unit,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  character(len=*), optional, intent(in) :: source
  character(len=*), optional, intent(in) :: dest
  integer,          optional, intent(in) :: source_unit
  integer,          optional, intent(in) :: dest_unit
  integer,          optional, intent(out):: ierr
  integer :: ierrl,unit1,unit2
  integer :: iostat,length
  character(len=iotk_linlenx) :: line
  iostat = 0
  ierrl  = 0
  if(present(source) .eqv. present(source_unit)) then
    call iotk_error_issue(ierrl,"iotk_copyfile_x",__FILE__,__LINE__)
# 50 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 50 "iotk_external.spp"
call iotk_error_msg(ierrl,'Use exactly one between source and source_unit')
    goto 1
  end if
  if(present(dest)   .eqv. present(dest_unit)) then
    call iotk_error_issue(ierrl,"iotk_copyfile_x",__FILE__,__LINE__)
# 54 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 54 "iotk_external.spp"
call iotk_error_msg(ierrl,'Use exactly one between dest and dest_unit')
    goto 1
  end if
  if(present(source)) then
    call iotk_free_unit(unit1,ierr=ierrl)
    if(ierrl/=0) then
      call iotk_error_issue(ierrl,"iotk_copyfile_x",__FILE__,__LINE__)
# 60 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 60 "iotk_external.spp"
call iotk_error_msg(ierrl,'Error searching for a free unit')
      goto 1
    end if
    open(unit1,file=trim(iotk_strpad(source)),iostat=iostat)
    if(iostat/=0) then
      call iotk_error_issue(ierrl,"iotk_copyfile_x",__FILE__,__LINE__)
# 65 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 65 "iotk_external.spp"
call iotk_error_msg(ierrl,'messaggio')
# 65 "iotk_external.spp"
call iotk_error_write(ierrl,"sourcefile",trim(iotk_strpad(source)))
# 65 "iotk_external.spp"
call iotk_error_write(ierrl,"sourceunit",unit1)
# 65 "iotk_external.spp"
call iotk_error_write(ierrl,"iostat",iostat)
      goto 1
    end if
  else
    unit1=source_unit
  end if
  if(present(dest)) then
    call iotk_free_unit(unit2,ierr=ierrl)
    if(ierrl/=0) then
      call iotk_error_issue(ierrl,"iotk_copyfile_x",__FILE__,__LINE__)
# 74 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
      goto 1
    end if
    open(unit2,file=trim(iotk_strpad(dest)),iostat=iostat)
    if(iostat/=0) then
      call iotk_error_issue(ierrl,"iotk_copyfile_x",__FILE__,__LINE__)
# 79 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 79 "iotk_external.spp"
call iotk_error_msg(ierrl,'Error opening destination file')
# 79 "iotk_external.spp"
call iotk_error_write(ierrl,"destfile",trim(iotk_strpad(dest)))
# 79 "iotk_external.spp"
call iotk_error_write(ierrl,"destunit",unit2)
# 79 "iotk_external.spp"
call iotk_error_write(ierrl,"iostat",iostat)
      goto 1
    end if
  else
    unit2=dest_unit
  end if
  do
    call iotk_getline(unit1,line,length,ierrl)
    if(ierrl/=0) then
      call iotk_error_scan(ierrl,"iostat",iostat)
      if(iostat<0) then
        call iotk_error_clear(ierrl)
        exit
      end if
      call iotk_error_issue(ierrl,"iotk_copyfile_x",__FILE__,__LINE__)
# 93 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 93 "iotk_external.spp"
call iotk_error_msg(ierrl,'Error reading source file')
# 93 "iotk_external.spp"
call iotk_error_write(ierrl,"sourceunit",unit1)
      goto 1
    end if
    write(unit2,"(a)",iostat=iostat) line(1:length)
    if(iostat/=0) then
       call iotk_error_issue(ierrl,"iotk_copyfile_x",__FILE__,__LINE__)
# 98 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 98 "iotk_external.spp"
call iotk_error_msg(ierrl,'Error writing destination file')
# 98 "iotk_external.spp"
call iotk_error_write(ierrl,"destunit",unit2)
# 98 "iotk_external.spp"
call iotk_error_write(ierrl,"iostat",iostat)
       goto 1
    end if 
  end do
  iostat=0
  if(present(source)) then
    close(unit1,iostat=iostat)
    if(iostat/=0) then
       call iotk_error_issue(ierrl,"iotk_copyfile_x",__FILE__,__LINE__)
# 106 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 106 "iotk_external.spp"
call iotk_error_msg(ierrl,'Error closing source file')
# 106 "iotk_external.spp"
call iotk_error_write(ierrl,"sourcefile",trim(iotk_strpad(source)))
# 106 "iotk_external.spp"
call iotk_error_write(ierrl,"sourceunit",unit1)
# 106 "iotk_external.spp"
call iotk_error_write(ierrl,"iostat",iostat)
       goto 1
    end if 
  end if
  if(present(dest)) then
    close(unit2,iostat=iostat)
    if(iostat/=0) then
       call iotk_error_issue(ierrl,"iotk_copyfile_x",__FILE__,__LINE__)
# 113 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 113 "iotk_external.spp"
call iotk_error_msg(ierrl,'Error closing destination file')
# 113 "iotk_external.spp"
call iotk_error_write(ierrl,"destfile",trim(iotk_strpad(dest)))
# 113 "iotk_external.spp"
call iotk_error_write(ierrl,"destunit",unit2)
# 113 "iotk_external.spp"
call iotk_error_write(ierrl,"iostat",iostat)
       goto 1
    end if
  end if
1 continue
  if(present(ierr)) then
    ierr = ierrl
  else
    if(ierrl/=0) call iotk_error_handler(ierrl)
  end if
end subroutine iotk_copyfile_x

# 126 "iotk_external.spp"
subroutine iotk_link_x(unit,name,file,binary,raw,create,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer,                intent(in)  :: unit
  character(*),           intent(in)  :: name
  character(*),           intent(in)  :: file
  logical,      optional, intent(in)  :: binary
  logical,      optional, intent(in)  :: raw
  logical,      optional, intent(in)  :: create
  integer,      optional, intent(out) :: ierr
  logical :: lbinary,lraw,lcreate
  integer :: ierrl,iostat
  integer :: lunit,link_unit
  type(iotk_unit), pointer :: this_unit
  character(iotk_attlenx) :: attr
  character(iotk_fillenx) :: oldfile
  ierrl  = 0
  iostat = 0
  lbinary=.false.
  lraw   =.false.
  lcreate=.false.
  if(present(binary)) lbinary = binary
  if(present(raw))    lraw = raw
  if(present(create)) lcreate = create
  lunit = iotk_phys_unit(unit)
  call iotk_unit_get(lunit,pointer=this_unit)
  if(.not.associated(this_unit)) then
    call iotk_error_issue(ierrl,"iotk_link",__FILE__,__LINE__)
# 154 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 154 "iotk_external.spp"
call iotk_error_msg(ierrl,'Links do not apply to units which are not explicitly connected')
    goto 1
  end if
  call iotk_write_attr(attr,"iotk_link",iotk_strtrim(file),ierr=ierrl,first=.true.)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_link",__FILE__,__LINE__)
# 159 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  if(lbinary) then
    call iotk_write_attr(attr,"iotk_binary",lbinary,ierr=ierrl)
    if(ierrl/=0) then
      call iotk_error_issue(ierrl,"iotk_link",__FILE__,__LINE__)
# 165 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
      goto 1
    end if
  end if
  if(lraw) then
    call iotk_write_attr(attr,"iotk_raw",lraw,ierr=ierrl)
    if(ierrl/=0) then
      call iotk_error_issue(ierrl,"iotk_link",__FILE__,__LINE__)
# 172 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
      goto 1
    end if
  end if
  call iotk_write_begin(unit,name,attr,ierr=ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_link",__FILE__,__LINE__)
# 178 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  call iotk_write_comment(unit,"This is a link to the file indicated in the iotk_link attribute",ierr=ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_link",__FILE__,__LINE__)
# 183 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  call iotk_write_end  (unit,name,ierr=ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_link",__FILE__,__LINE__)
# 188 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  if(lcreate) then
    call iotk_free_unit(link_unit,ierrl)
    if(ierrl/=0) then
      call iotk_error_issue(ierrl,"iotk_link",__FILE__,__LINE__)
# 194 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
      goto 1
    end if
    inquire(unit=lunit,name=oldfile,iostat=iostat)
    if(iostat/=0) then
      call iotk_error_issue(ierrl,"iotk_link",__FILE__,__LINE__)
# 199 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 199 "iotk_external.spp"
call iotk_error_msg(ierrl,'Error inquiring')
# 199 "iotk_external.spp"
call iotk_error_write(ierrl,"unit",lunit)
# 199 "iotk_external.spp"
call iotk_error_write(ierrl,"file",trim(oldfile))
# 199 "iotk_external.spp"
call iotk_error_write(ierrl,"iostat",iostat)
      goto 1
    end if
    call iotk_open_write(link_unit,file=iotk_complete_filepath(file,trim(oldfile)), &
                                 binary=lbinary,raw=lraw,skip_root=.true.,ierr=ierrl)
    if(ierrl/=0) then
      call iotk_error_issue(ierrl,"iotk_link",__FILE__,__LINE__)
# 205 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
      goto 1
    end if
    call iotk_unit_parent(parent=lunit,son=link_unit,ierr=ierrl)
    if(ierrl/=0) then
      call iotk_error_issue(ierrl,"iotk_link",__FILE__,__LINE__)
# 210 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
      goto 1
    end if
  end if
1 continue
  if(present(ierr)) then
    ierr = ierrl
  else
    if(ierrl/=0) call iotk_error_handler(ierrl)
  end if
end subroutine iotk_link_x

# 223 "iotk_external.spp"
subroutine iotk_open_write_x(unit,file,attr,binary,new,raw,root,skip_root,skip_head,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer,                intent(in)  :: unit
  character(*), optional, intent(in)  :: file
  character(*), optional, intent(in)  :: attr
  logical,      optional, intent(in)  :: binary
  logical,      optional, intent(in)  :: new
  logical,      optional, intent(in)  :: raw
  character(*), optional, intent(in)  :: root
  logical,      optional, intent(in)  :: skip_root
  logical,      optional, intent(in)  :: skip_head
  integer,      optional, intent(out) :: ierr
! Opens a file properly
  integer :: iostat
  character(50) :: status,form
  character(iotk_namlenx) :: lroot
  character(iotk_attlenx) :: lattr
  integer :: ierrl
  logical :: lbinary,lraw,lnew,lskip_root,lskip_head
  ierrl = 0
  iostat = 0
  lroot = "Root"
  lraw = .false.
  lnew = .false.
  lbinary = .false.
  lskip_root = .false.
  lskip_head = .false.
  if(present(root)) lroot = root
  if(present(raw)) lraw=raw
  if(present(binary)) lbinary = binary
  if(present(new)) lnew = new
  if(present(skip_root)) lskip_root = skip_root
  if(lskip_root) lroot=""
  if(present(skip_head)) lskip_head = skip_head
  if(present(file)) then
    form = "formatted"
    if(lbinary) form = "unformatted"
    status = "unknown"
    if(lnew) status = "new"
    open(unit=unit,file=file,status=status,form=form,position="rewind",iostat=iostat,action="write")
    if(iostat/=0) then
      call iotk_error_issue(ierrl,"iotk_open_write",__FILE__,__LINE__)
# 266 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 266 "iotk_external.spp"
call iotk_error_msg(ierrl,'Error opening file')
# 266 "iotk_external.spp"
call iotk_error_write(ierrl,"unit",unit)
# 266 "iotk_external.spp"
call iotk_error_write(ierrl,"file",file)
# 266 "iotk_external.spp"
call iotk_error_write(ierrl,"binary",lbinary)
# 266 "iotk_external.spp"
call iotk_error_write(ierrl,"new",lnew)
# 266 "iotk_external.spp"
call iotk_error_write(ierrl,"iostat",iostat)
      goto 1
    end if
  else
    call iotk_inquire(unit,binary=lbinary,ierr=ierrl)
    if(ierrl/=0) then
      call iotk_error_issue(ierrl,"iotk_open_write",__FILE__,__LINE__)
# 272 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
      goto 1
    end if
  end if
  if(.not.lraw) then
    if(.not.lskip_head) then
      if(.not. lbinary) then
        write(unit,"(a)",iostat=iostat) '<?xml version="1.0"?>'
        if(iostat/=0) then
          call iotk_error_issue(ierrl,"iotk_open_write",__FILE__,__LINE__)
# 281 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 281 "iotk_external.spp"
call iotk_error_msg(ierrl,'Error writing XML tag')
# 281 "iotk_external.spp"
call iotk_error_write(ierrl,"unit",unit)
# 281 "iotk_external.spp"
call iotk_error_write(ierrl,"iostat",iostat)
          goto 1
        end if
      end if
      call iotk_write_attr(lattr,"version",trim(iotk_version),first=.true.,ierr=ierrl)
      if(ierrl/=0) then
        call iotk_error_issue(ierrl,"iotk_open_write",__FILE__,__LINE__)
# 287 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 287 "iotk_external.spp"
call iotk_error_msg(ierrl,'Error writing version attribute')
        goto 1
      end if
      call iotk_write_pi(unit,"iotk",lattr,ierr=ierrl)
      if(ierrl/=0) then
        call iotk_error_issue(ierrl,"iotk_open_write",__FILE__,__LINE__)
# 292 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 292 "iotk_external.spp"
call iotk_error_msg(ierrl,'Error writing version tag')
        goto 1
      end if
      call iotk_write_attr(lattr,"file_version",trim(iotk_file_version),first=.true.,ierr=ierrl)
      if(ierrl/=0) then
        call iotk_error_issue(ierrl,"iotk_open_write",__FILE__,__LINE__)
# 297 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 297 "iotk_external.spp"
call iotk_error_msg(ierrl,'Error writing file_version attribute')
        goto 1
      end if
      call iotk_write_pi(unit,"iotk",lattr,ierr=ierrl)
      if(ierrl/=0) then
        call iotk_error_issue(ierrl,"iotk_open_write",__FILE__,__LINE__)
# 302 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 302 "iotk_external.spp"
call iotk_error_msg(ierrl,'Error writing version tag')
        goto 1
      end if
      call iotk_write_attr(lattr,"binary",lbinary,first=.true.,ierr=ierrl)
      if(ierrl/=0) then
        call iotk_error_issue(ierrl,"iotk_open_write",__FILE__,__LINE__)
# 307 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 307 "iotk_external.spp"
call iotk_error_msg(ierrl,'Error writing binary attribute')
        goto 1
      end if
      call iotk_write_pi(unit,"iotk",lattr,ierr=ierrl)
      if(ierrl/=0) then
        call iotk_error_issue(ierrl,"iotk_open_write",__FILE__,__LINE__)
# 312 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 312 "iotk_external.spp"
call iotk_error_msg(ierrl,'Error writing binary tag')
        goto 1
      end if
      if(lbinary) then
        call iotk_write_attr(lattr,"binary_format",trim(iotk_binary_format),first=.true.,ierr=ierrl)
        if(ierrl/=0) then
          call iotk_error_issue(ierrl,"iotk_open_write",__FILE__,__LINE__)
# 318 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 318 "iotk_external.spp"
call iotk_error_msg(ierrl,'Error writing binary_format attribute')
          goto 1
        end if
        call iotk_write_pi(unit,"iotk",lattr,ierr=ierrl)
        if(ierrl/=0) then
          call iotk_error_issue(ierrl,"iotk_open_write",__FILE__,__LINE__)
# 323 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 323 "iotk_external.spp"
call iotk_error_msg(ierrl,'Error writing binary_format tag')
          goto 1
        end if
      end if
    end if
    if(.not.lskip_root) then
      lattr(1:1) = iotk_eos
      if(present(attr)) then
        call iotk_strcpy(lattr,attr,ierr=ierrl)
        if(ierrl/=0) then
          call iotk_error_issue(ierrl,"iotk_open_write",__FILE__,__LINE__)
# 333 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 333 "iotk_external.spp"
call iotk_error_msg(ierrl,'Error writing attributes from the root tag')
          goto 1
        end if
      end if
      call iotk_write_begin(unit,lroot,attr=lattr,ierr=ierrl)
      if(ierrl/=0) then
        call iotk_error_issue(ierrl,"iotk_open_write",__FILE__,__LINE__)
# 339 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 339 "iotk_external.spp"
call iotk_error_msg(ierrl,'Error writing the root tag')
        goto 1
      end if
    end if
  end if
  call iotk_unit_add(unit,root=lroot,raw=lraw,close_at_end=present(file),skip_root=lskip_root,ierr=ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_open_write",__FILE__,__LINE__)
# 346 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 346 "iotk_external.spp"
call iotk_error_msg(ierrl,'Error adding the unit to the list')
    goto 1
  end if
1 continue
  if(present(ierr)) then
    ierr = ierrl
  else
    if(ierrl/=0) call iotk_error_handler(ierrl)
  end if
end subroutine iotk_open_write_x

# 358 "iotk_external.spp"
recursive subroutine iotk_close_write_x(unit,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer,                intent(in)  :: unit
  integer,      optional, intent(out) :: ierr
! Closes a file properly
  logical :: binary
  integer :: ierrl,iostat
  type(iotk_unit), pointer :: this
  nullify(this)
  ierrl = 0
  iostat = 0
  call iotk_unit_get(unit,pointer=this)
  if(.not.associated(this)) then
    call iotk_error_issue(ierrl,"iotk_close_write",__FILE__,__LINE__)
# 373 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  call iotk_inquire(unit,binary,ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_close_write",__FILE__,__LINE__)
# 378 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  if(.not.this%raw) then
    if(.not.this%skip_root) then
      call iotk_write_end(unit,this%root,ierr=ierrl)
      if(ierrl/=0) then
        call iotk_error_issue(ierrl,"iotk_close_write",__FILE__,__LINE__)
# 385 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
        goto 1
      end if
    end if
  end if
  if(this%close_at_end) then
    if(.not.binary) then
      write(unit,*,iostat=iostat)
      if(iostat/=0) then
        call iotk_error_issue(ierrl,"iotk_close_write",__FILE__,__LINE__)
# 394 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 394 "iotk_external.spp"
call iotk_error_msg(ierrl,'unit')
# 394 "iotk_external.spp"
call iotk_error_write(ierrl,"iostat",iostat)
        goto 1
      end if
    end if
    close(unit,iostat=iostat)
    if(iostat/=0) then
      call iotk_error_issue(ierrl,"iotk_close_write",__FILE__,__LINE__)
# 400 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 400 "iotk_external.spp"
call iotk_error_msg(ierrl,'unit')
# 400 "iotk_external.spp"
call iotk_error_write(ierrl,"iostat",iostat)
      goto 1
    end if
  end if
  call iotk_unit_del(unit,ierr=ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_close_write",__FILE__,__LINE__)
# 406 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
1 continue
  if(present(ierr)) then
    ierr = ierrl
  else
    if(ierrl/=0) call iotk_error_handler(ierrl)
  end if
end subroutine iotk_close_write_x


# 419 "iotk_external.spp"
subroutine iotk_open_read_x(unit,file,attr,binary,raw,root,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer,                intent(in)  :: unit
  character(*), optional, intent(in)  :: file
  logical,      optional, intent(in)  :: binary
  logical,      optional, intent(in)  :: raw
  character(*), optional, intent(out) :: attr
  character(*), optional, intent(out) :: root
  integer,      optional, intent(out) :: ierr
  character(50)           :: status,form
  character(iotk_attlenx) :: lattr
  character(iotk_taglenx) :: tag
  character(iotk_namlenx) :: lroot
  integer                 :: ierrl,control,iostat
  logical                 :: lbinary,lraw
  ierrl = 0
  iostat = 0
  lbinary=.false.
  lraw=.false.
  lroot = " "
  lattr(1:1) = iotk_eos
  if(present(binary)) lbinary = binary
  if(present(raw)) lraw=raw
  if(present(file)) then
    form = "formatted"
    if(lbinary) form = "unformatted"
    open(unit=unit,file=trim(file(1:iotk_strlen(file))),status="old",form=form,position="rewind",iostat=iostat,action="read")
    if(iostat/=0) then
      call iotk_error_issue(ierrl,"iotk_open_read",__FILE__,__LINE__)
# 449 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 449 "iotk_external.spp"
call iotk_error_msg(ierrl,'unit')
# 449 "iotk_external.spp"
call iotk_error_write(ierrl,"file",trim(file(1:iotk_strlen(file))))
# 449 "iotk_external.spp"
call iotk_error_write(ierrl,"binary",lbinary)
# 449 "iotk_external.spp"
call iotk_error_write(ierrl,"iostat",iostat)
      goto 1
    end if
  else
    call iotk_inquire(unit,binary=lbinary,ierr=ierrl)
    if(ierrl/=0) then
      call iotk_error_issue(ierrl,"iotk_open_read",__FILE__,__LINE__)
# 455 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
      goto 1
    end if
  end if
  if(.not.lraw) then
    do
      call iotk_scan_tag(unit,+1,control,tag,lbinary,ierrl)
      if(ierrl/=0) then
        call iotk_error_issue(ierrl,"iotk_open_read",__FILE__,__LINE__)
# 463 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
        goto 1
      end if
      select case(control)
      case(1)
        call iotk_tag_parse(tag,lroot,lattr,ierrl)
        if(ierrl/=0) then
          call iotk_error_issue(ierrl,"iotk_open_read",__FILE__,__LINE__)
# 470 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
          goto 1
        end if
        exit
      case(2:3)
        call iotk_error_issue(ierrl,"iotk_open_read",__FILE__,__LINE__)
# 475 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 475 "iotk_external.spp"
call iotk_error_msg(ierrl,'End or empty tag at the beginning of a file')
# 475 "iotk_external.spp"
call iotk_error_write(ierrl,"unit",unit)
# 475 "iotk_external.spp"
call iotk_error_write(ierrl,"file",trim(file(1:iotk_strlen(file))))
# 475 "iotk_external.spp"
call iotk_error_write(ierrl,"binary",lbinary)
# 475 "iotk_external.spp"
call iotk_error_write(ierrl,"iostat",iostat)
        goto 1
      case(5)
        call iotk_tag_parse(tag,lroot,lattr,ierrl)
        if(ierrl/=0) then
          call iotk_error_issue(ierrl,"iotk_open_read",__FILE__,__LINE__)
# 480 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
          goto 1
        end if
        if(iotk_strcomp(lroot,"iotk")) then
          call iotk_check_iotk_attr(unit,lattr,ierrl)
          if(ierrl/=0) then
            call iotk_error_issue(ierrl,"iotk_open_read",__FILE__,__LINE__)
# 486 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
            goto 1
          end if
        end if
      end select
    end do
  end if
  if(present(root)) root = lroot
  if(present(attr)) call iotk_strcpy(attr,lattr,ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_open_read",__FILE__,__LINE__)
# 496 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  call iotk_unit_add(unit,root=lroot,raw=lraw,close_at_end=present(file),skip_root=.false.,ierr=ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_open_read",__FILE__,__LINE__)
# 501 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
1 continue
  if(present(ierr)) then
    ierr = ierrl
  else
    if(ierrl/=0) call iotk_error_handler(ierrl)
  end if
end subroutine iotk_open_read_x

# 513 "iotk_external.spp"
subroutine iotk_close_read_x(unit,ierr) 
  use iotk_base
  use iotk_interface
  implicit none
  integer,                intent(in)  :: unit
  integer,      optional, intent(out) :: ierr
  integer                 :: ierrl
  integer :: iostat
  type(iotk_unit), pointer :: this
  character(iotk_namlenx) :: root
  logical :: raw
  logical :: close_at_end
  ierrl = 0
  iostat = 0
  call iotk_unit_get(unit,pointer=this)
  if(.not.associated(this)) then
    call iotk_error_issue(ierrl,"iotk_close_read",__FILE__,__LINE__)
# 529 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  root = this%root
  close_at_end = this%close_at_end
  raw = this%raw
  call iotk_unit_del(unit,ierr=ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_close_read",__FILE__,__LINE__)
# 537 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  if(.not.raw) then      
    call iotk_scan_end(unit,root,ierr=ierrl)
    if(ierrl/=0) then
      call iotk_error_issue(ierrl,"iotk_close_read",__FILE__,__LINE__)
# 543 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
      goto 1
    end if
  end if
  if(close_at_end) then
    close(unit,iostat=iostat)
    if(iostat/=0) then
      call iotk_error_issue(ierrl,"iotk_close_read",__FILE__,__LINE__)
# 550 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 550 "iotk_external.spp"
call iotk_error_msg(ierrl,'unit')
# 550 "iotk_external.spp"
call iotk_error_write(ierrl,"iostat",iostat)
      goto 1
    end if
  end if
1 continue
  if(present(ierr)) then
    ierr = ierrl
  else
    if(ierrl/=0) call iotk_error_handler(ierrl)
  end if
end subroutine iotk_close_read_x


# 564 "iotk_external.spp"
subroutine iotk_write_begin_x(unit,name,attr,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer,                intent(in)  :: unit
  character(*),           intent(in)  :: name
  character(*), optional, intent(in)  :: attr
  integer,      optional, intent(out) :: ierr
  character(iotk_taglenx) :: tag
  character(iotk_attlenx) :: attrl
  character(iotk_fillenx) :: oldfile
  type(iotk_unit), pointer :: this_unit
  logical :: binary,raw
  integer :: ierrl,lunit,link_unit,iostat
  ierrl = 0
  iostat = 0
  lunit = iotk_phys_unit(unit)
  ierrl=0
  call iotk_unit_get(lunit,raw=raw,pointer=this_unit)
  if(raw) goto 1
  if(.not.iotk_check_name(name)) then
    call iotk_error_issue(ierrl,"iotk_write_begin",__FILE__,__LINE__)
# 585 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 585 "iotk_external.spp"
call iotk_error_msg(ierrl,'Wrong tag name')
# 585 "iotk_external.spp"
call iotk_error_write(ierrl,"name",name)
    goto 1
  end if
  attrl(1:1)=iotk_eos
  if(present(attr)) then
    call iotk_strcpy(attrl,attr,ierrl)
    if(ierrl/=0) then
      call iotk_error_issue(ierrl,"iotk_write_begin",__FILE__,__LINE__)
# 592 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
      goto 1
    end if
  end if
  call iotk_strcpy(tag,iotk_strtrim(name),ierr=ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_write_begin",__FILE__,__LINE__)
# 598 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  call iotk_strcat(tag,attrl,ierr=ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_write_begin",__FILE__,__LINE__)
# 603 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  call iotk_inquire(lunit,binary=binary,ierr=ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_write_begin",__FILE__,__LINE__)
# 608 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  call iotk_write_tag(lunit,1,tag,binary,ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_write_begin",__FILE__,__LINE__)
# 613 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 613 "iotk_external.spp"
call iotk_error_msg(ierrl,'Error writing tag')
# 613 "iotk_external.spp"
call iotk_error_write(ierrl,"name",name)
    goto 1
  end if
1 continue
  if(ierrl==0 .and. associated(this_unit)) then
    this_unit%level = this_unit%level + 1
  end if
  if(present(ierr)) then
    ierr = ierrl
  else
    if(ierrl/=0) call iotk_error_handler(ierrl)
  end if
end subroutine iotk_write_begin_x
    
# 628 "iotk_external.spp"
subroutine iotk_write_end_x(unit,name,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer,                intent(in)  :: unit
  character(*),           intent(in)  :: name
  integer,      optional, intent(out) :: ierr
  character(iotk_taglenx) :: tag
  logical :: binary,raw
  integer :: ierrl,lunit
  type(iotk_unit), pointer :: this_unit
  ierrl = 0
  lunit = iotk_phys_unit(unit)
  ierrl=0
  call iotk_unit_get(lunit,pointer=this_unit,raw=raw)
  if(.not.iotk_check_name(name)) then
    call iotk_error_issue(ierrl,"iotk_write_end",__FILE__,__LINE__)
# 644 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 644 "iotk_external.spp"
call iotk_error_msg(ierrl,'Wrong tag name')
# 644 "iotk_external.spp"
call iotk_error_write(ierrl,"name",iotk_strtrim(name))
    goto 1
  end if
  call iotk_strcpy(tag,iotk_strtrim(name),ierr=ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_write_end",__FILE__,__LINE__)
# 649 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  if(raw) goto 2
  call iotk_inquire(lunit,binary=binary,ierr=ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_write_end",__FILE__,__LINE__)
# 655 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  call iotk_write_tag(lunit,2,tag,binary,ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_write_end",__FILE__,__LINE__)
# 660 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
2 continue
  if(ierrl==0 .and. associated(this_unit)) then
    this_unit%level = this_unit%level - 1
  end if
  if(associated(this_unit) .and. unit/=lunit) then
    if(associated(this_unit%parent) .and. this_unit%level == 0 .and. this_unit%skip_root) then
      call iotk_close_write(lunit,ierr=ierrl)
      if(ierrl/=0) then
        call iotk_error_issue(ierrl,"iotk_write_end",__FILE__,__LINE__)
# 671 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
        goto 1
      end if
      lunit = iotk_phys_unit(unit)
      call iotk_unit_get(lunit,raw=raw,pointer=this_unit)
      if(.not.associated(this_unit)) then
        call iotk_error_issue(ierrl,"iotk_write_end",__FILE__,__LINE__)
# 677 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
        goto 1
      end if
    end if
  end if
1 continue
  if(present(ierr)) then
    ierr = ierrl
  else
    if(ierrl/=0) call iotk_error_handler(ierrl)
  end if
end subroutine iotk_write_end_x
    
# 691 "iotk_external.spp"
subroutine iotk_write_pi_x(unit,name,attr,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer,                intent(in)  :: unit
  character(*),           intent(in)  :: name
  character(*), optional, intent(in)  :: attr
  integer,      optional, intent(out) :: ierr
  character(iotk_taglenx) :: tag
  character(iotk_attlenx) :: attrl
  logical :: binary,raw
  integer :: ierrl,lunit
  ierrl = 0
  lunit = iotk_phys_unit(unit)
  ierrl=0
  call iotk_unit_get(lunit,raw=raw)
  if(raw) goto 1
  if(.not.iotk_check_name(name)) then
    call iotk_error_issue(ierrl,"iotk_write_pi",__FILE__,__LINE__)
# 709 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 709 "iotk_external.spp"
call iotk_error_msg(ierrl,'Wrong tag name')
# 709 "iotk_external.spp"
call iotk_error_write(ierrl,"name",iotk_strtrim(name))
    goto 1
  end if
  attrl(1:1)=iotk_eos
  if(present(attr)) then
    call iotk_strcpy(attrl,attr,ierrl)
    if(ierrl/=0) then
      call iotk_error_issue(ierrl,"iotk_write_pi",__FILE__,__LINE__)
# 716 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
      goto 1
    end if
  end if
  call iotk_strcpy(tag,iotk_strtrim(name),ierr=ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_write_pi",__FILE__,__LINE__)
# 722 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  call iotk_strcat(tag,attrl,ierr=ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_write_pi",__FILE__,__LINE__)
# 727 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1 
  end if
  call iotk_inquire(lunit,binary=binary,ierr=ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_write_pi",__FILE__,__LINE__)
# 732 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  call iotk_write_tag(lunit,5,tag,binary,ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_write_pi",__FILE__,__LINE__)
# 737 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
1 continue
  if(present(ierr)) then
    ierr = ierrl
  else
    if(ierrl/=0) call iotk_error_handler(ierrl)
  end if
end subroutine iotk_write_pi_x

# 749 "iotk_external.spp"
subroutine iotk_write_comment_x(unit,text,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer,                intent(in)  :: unit
  character(*),           intent(in)  :: text
  integer,      optional, intent(out) :: ierr
  integer :: ierrl,lunit
  integer :: taglen
  logical :: binary,raw
  character(iotk_taglenx) :: tag
  ierrl = 0
  lunit = iotk_phys_unit(unit)
  ierrl=0
  call iotk_unit_get(lunit,raw=raw)
  if(raw) goto 1
  call iotk_deescape(tag,text)
  call iotk_inquire(lunit,binary=binary,ierr=ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_write_comment",__FILE__,__LINE__)
# 768 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  call iotk_write_tag(lunit,4,tag,binary,ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_write_comment",__FILE__,__LINE__)
# 773 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
1 continue
  if(present(ierr)) then
    ierr = ierrl
  else
    if(ierrl/=0) call iotk_error_handler(ierrl)
  end if
end subroutine iotk_write_comment_x

# 785 "iotk_external.spp"
subroutine iotk_write_empty_x(unit,name,attr,ierr)
  use iotk_base
  use iotk_interface
  integer,                intent(in)  :: unit
  character(*),           intent(in)  :: name
  character(*), optional, intent(in)  :: attr
  integer,      optional, intent(out) :: ierr
  character(iotk_taglenx) :: tag
  character(iotk_attlenx) :: attrl
  logical :: binary,raw
  integer :: ierrl,lunit
  ierrl = 0
  lunit = iotk_phys_unit(unit)
  call iotk_unit_get(lunit,raw=raw)
  if(raw) goto 1
  if(.not.iotk_check_name(name)) then
    call iotk_error_issue(ierrl,"iotk_write_empty",__FILE__,__LINE__)
# 801 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 801 "iotk_external.spp"
call iotk_error_msg(ierrl,'Wrong tag name')
# 801 "iotk_external.spp"
call iotk_error_write(ierrl,"name",trim(name))
    goto 1
  end if
  attrl(1:1)=iotk_eos
  if(present(attr)) then
    call iotk_strcpy(attrl,attr,ierrl)
    if(ierrl/=0) then
      call iotk_error_issue(ierrl,"iotk_write_empty",__FILE__,__LINE__)
# 808 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
      goto 1
    end if
  end if
  call iotk_strcpy(tag,iotk_strtrim(name),ierr=ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_write_empty",__FILE__,__LINE__)
# 814 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  call iotk_strcat(tag,attrl,ierr=ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_write_empty",__FILE__,__LINE__)
# 819 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  call iotk_inquire(lunit,binary=binary,ierr=ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_write_empty",__FILE__,__LINE__)
# 824 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  call iotk_write_tag(lunit,3,tag,binary,ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_write_empty",__FILE__,__LINE__)
# 829 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
1 continue
  if(present(ierr)) then
    ierr = ierrl
  else
    if(ierrl/=0) call iotk_error_handler(ierrl)
  end if
end subroutine iotk_write_empty_x

# 841 "iotk_external.spp"
recursive subroutine iotk_scan_begin_x(unit,name,attr,found,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer,                intent(in)  :: unit
  character(*),           intent(in)  :: name
  character(*), optional, intent(out) :: attr
  logical,      optional, intent(out) :: found
  integer,      optional, intent(out) :: ierr
  character(iotk_namlenx) :: namel
  character(iotk_attlenx) :: attrl
  character(iotk_vallenx) :: link
  logical :: link_binary,link_raw
  integer :: link_unit
  logical :: binary
  integer :: ierrl,iostat
  logical :: link_found
  logical :: raw
  type(iotk_unit), pointer :: this_unit
  integer :: lunit
  character(iotk_fillenx) :: oldfile
  ierrl = 0
  call iotk_strcpy(namel,iotk_strtrim(name),ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_scan_begin",__FILE__,__LINE__)
# 865 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  iostat = 0
  lunit = iotk_phys_unit(unit)
  call iotk_unit_get(lunit,raw=raw,pointer=this_unit)
  if(raw) goto 1
  call iotk_inquire(lunit,binary=binary,ierr=ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_scan_begin",__FILE__,__LINE__)
# 874 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  call iotk_scan(lunit, 1,1,namel,attrl,binary,ierrl)
  if(ierrl>0) then
    call iotk_error_issue(ierrl,"iotk_scan_begin",__FILE__,__LINE__)
# 879 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  if(ierrl/=0)  then
    call iotk_error_clear(ierrl)
    call iotk_scan(lunit,-1,1,namel,attrl,binary,ierrl)
    if(ierrl/=0) then
      call iotk_error_issue(ierrl,"iotk_scan_begin",__FILE__,__LINE__)
# 886 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 886 "iotk_external.spp"
call iotk_error_msg(ierrl,'')
# 886 "iotk_external.spp"
call iotk_error_write(ierrl,"namel",(namel(1:iotk_strlen(namel))))
      goto 1
    end if
  end if
  call iotk_scan_attr(attrl,"iotk_link",link,found=link_found,ierr=ierrl)
  if(ierrl>0) then
    call iotk_error_issue(ierrl,"iotk_scan_begin",__FILE__,__LINE__)
# 892 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  call iotk_error_clear(ierrl)
  if(link_found) then
    call iotk_scan_attr(attrl,"iotk_binary",link_binary,default=.false.,ierr=ierrl)
    if(ierrl>0) then
      call iotk_error_issue(ierrl,"iotk_scan_begin",__FILE__,__LINE__)
# 899 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
      goto 1
    end if
    call iotk_error_clear(ierrl)
    call iotk_scan_attr(attrl,"iotk_raw",link_raw,default=.false.,ierr=ierrl)
    if(ierrl>0) then
      call iotk_error_issue(ierrl,"iotk_scan_begin",__FILE__,__LINE__)
# 905 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
      goto 1
    end if
    call iotk_error_clear(ierrl)
    call iotk_free_unit(link_unit,ierrl)
    if(ierrl/=0) then
      call iotk_error_issue(ierrl,"iotk_scan_begin",__FILE__,__LINE__)
# 911 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
      goto 1
    end if
    inquire(unit=lunit,name=oldfile,iostat=iostat)
    if(iostat/=0) then
      call iotk_error_issue(ierrl,"iotk_scan_begin",__FILE__,__LINE__)
# 916 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
      goto 1
    end if
    call iotk_open_read(link_unit,file=iotk_complete_filepath(link,oldfile),attr=attrl, &
      binary=link_binary,raw=link_raw,ierr=ierrl)
    if(ierrl/=0) then
      call iotk_error_issue(ierrl,"iotk_scan_begin",__FILE__,__LINE__)
# 922 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
      goto 1
    end if
    call iotk_unit_parent(parent=lunit,son=link_unit,ierr=ierrl)
    if(ierrl/=0) then
      call iotk_error_issue(ierrl,"iotk_scan_begin",__FILE__,__LINE__)
# 927 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
      goto 1
    end if
  end if
  if(present(attr)) call iotk_strcpy(attr,attrl,ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_scan_begin",__FILE__,__LINE__)
# 933 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
1 continue
  if(ierrl==0 .and. associated(this_unit)) then
    this_unit%level = this_unit%level + 1
!write(0,*) "LEVEL=",this_unit%level,"incrementato"
  end if
  if(present(found)) then
    found = .false.
    if(ierrl==0) found = .true.
  end if
  if(present(ierr)) then
    ierr = ierrl
  else
    if(ierrl>0 .or. .not.present(found)) call iotk_error_handler(ierrl)
  end if
end subroutine iotk_scan_begin_x

# 953 "iotk_external.spp"
recursive subroutine iotk_scan_end_x(unit,name,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer,                intent(in)  :: unit
  character(*),           intent(in)  :: name
  integer,      optional, intent(out) :: ierr
  character(iotk_namlenx) :: namel
  logical :: binary,raw
  character(iotk_attlenx) :: attrl
  integer :: ierrl
  integer :: lunit
  type(iotk_unit), pointer :: this_unit
  ierrl = 0
  call iotk_strcpy(namel,iotk_strtrim(name),ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_scan_end",__FILE__,__LINE__)
# 969 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  lunit = iotk_phys_unit(unit)
  call iotk_unit_get(lunit,raw=raw,pointer=this_unit)
  if(associated(this_unit)) then
    if(associated(this_unit%parent) .and. this_unit%level == 0) then
      this_unit => this_unit%parent
      call iotk_close_read(lunit,ierr=ierrl)
      if(ierrl/=0) goto 1
      lunit = iotk_phys_unit(unit)
      call iotk_unit_get(lunit,raw=raw,pointer=this_unit)
    end if
  end if
  if(raw) goto 1
  call iotk_inquire(lunit,binary=binary,ierr=ierrl)
  if(ierrl/=0) goto 1
  call iotk_scan(lunit,1,2,namel,attrl,binary,ierrl)
  if(ierrl/=0) goto 1
  if(iotk_strlen(attrl)/=0) then
    call iotk_error_issue(ierrl,"iotk_scan_end",__FILE__,__LINE__)
# 989 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 989 "iotk_external.spp"
call iotk_error_msg(ierrl,'An end tag should not contain attributes')
# 989 "iotk_external.spp"
call iotk_error_write(ierrl,"name",trim(name))
# 989 "iotk_external.spp"
call iotk_error_write(ierrl,"attr",attrl(1:iotk_strlen(attrl)))
    goto 1
  end if
  if(associated(this_unit)) this_unit%level = this_unit%level - 1
1 continue
  if(present(ierr)) then
    ierr = ierrl
  else
    if(ierrl/=0) call iotk_error_handler(ierrl)
  end if
end subroutine iotk_scan_end_x

# 1002 "iotk_external.spp"
subroutine iotk_scan_pi_x(unit,name,attr,found,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer,                intent(in)  :: unit
  character(*),           intent(in)  :: name
  character(*), optional, intent(out) :: attr
  logical,      optional, intent(out) :: found
  integer,      optional, intent(out) :: ierr
  character(iotk_namlenx) :: namel
  character(iotk_attlenx) :: attrl
  logical :: binary,raw
  integer :: ierrl,lunit
  ierrl = 0
  call iotk_strcpy(namel,iotk_strtrim(name),ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_scan_pi",__FILE__,__LINE__)
# 1018 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  lunit = iotk_phys_unit(unit)
  call iotk_unit_get(lunit,raw=raw)
  if(raw) goto 1
  call iotk_inquire(lunit,binary=binary,ierr=ierrl)
  if(ierrl/=0) goto 1
  call iotk_scan(lunit,1,5,namel,attrl,binary,ierrl)
  if(ierrl>0) goto 1
  if(ierrl<0) then
    call iotk_error_clear(ierrl)
    call iotk_scan(lunit,-1,5,namel,attrl,binary,ierrl)
  end if
  if(ierrl/=0) goto 1
  if(present(attr)) call iotk_strcpy(attr,attrl,ierrl)
  if(ierrl/=0) goto 1
1 continue
  if(present(found)) then
    found = .false.
    if(ierrl==0) found = .true.
  end if
  if(present(ierr)) then
    ierr = ierrl
  else
    if(ierrl>0 .or. .not.present(found)) call iotk_error_handler(ierrl)
  end if
end subroutine iotk_scan_pi_x

# 1048 "iotk_external.spp"
subroutine iotk_scan_empty_x(unit,name,attr,found,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer,                intent(in)  :: unit
  character(*),           intent(in)  :: name
  character(*), optional, intent(out) :: attr
  logical,      optional, intent(out) :: found
  integer,      optional, intent(out) :: ierr
  character(iotk_namlenx) :: namel
  character(iotk_attlenx) :: attrl
  logical :: binary,raw
  integer :: ierrl,lunit
  ierrl = 0
  call iotk_strcpy(namel,iotk_strtrim(name),ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_scan_empty",__FILE__,__LINE__)
# 1064 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  lunit = iotk_phys_unit(unit)
  call iotk_unit_get(lunit,raw=raw)
  if(raw) goto 1
  call iotk_inquire(lunit,binary=binary,ierr=ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_scan_empty",__FILE__,__LINE__)
# 1072 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  call iotk_scan(lunit,1,3,namel,attrl,binary,ierrl)
  if(ierrl>0) then
    call iotk_error_issue(ierrl,"iotk_scan_empty",__FILE__,__LINE__)
# 1077 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  if(ierrl<0) then
    call iotk_error_clear(ierrl)
    call iotk_scan(lunit,-1,3,namel,attrl,binary,ierrl)
  end if
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_scan_empty",__FILE__,__LINE__)
# 1085 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 1085 "iotk_external.spp"
call iotk_error_msg(ierrl,'')
# 1085 "iotk_external.spp"
call iotk_error_write(ierrl,"name",namel(1:iotk_strlen(namel)))
    goto 1
  end if
  if(present(attr)) call iotk_strcpy(attr,attrl,ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_scan_empty",__FILE__,__LINE__)
# 1090 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
1 continue
  if(present(found)) then
    found = .false.
    if(ierrl==0) found = .true.
  end if
  if(present(ierr)) then
    ierr = ierrl
  else
    if(ierrl>0 .or. .not.present(found)) call iotk_error_handler(ierrl)
  end if
end subroutine iotk_scan_empty_x

# 1106 "iotk_external.spp"
subroutine iotk_free_unit_x(unit,ierr)
  use iotk_base
  use iotk_interface
  implicit none
! This subroutine sets 'unit' to the number of
! an I/O unit which is free (i.e. not already opened).
! The search is carried out starting from unit
! 'unitmin' in a range of 'nsearch' units.
! The starting unit for the search is increased at each
! call, so that a number of subsequent ask can be done
! obtaining different units.
  integer,           intent(out) :: unit
  integer, optional, intent(out) :: ierr
  integer, save :: offset = 0
  logical       :: opened,exist
  integer       :: isearch,nsearch,unitmin
  integer       :: ierrl
  integer       :: iostat
  iostat = 0
  unitmin = iotk_unitmin
  nsearch = iotk_unitmax - iotk_unitmin + 1
  ierrl = 0 
  do isearch=0,nsearch-1
    unit = modulo(isearch+offset,nsearch) + unitmin
    inquire(unit=unit,opened=opened,exist=exist,iostat=iostat)
    if((.not.opened .and. exist) .or. iostat/=0) exit
  end do
  if(iostat/=0) then
    call iotk_error_issue(ierrl,"iotk_free_unit",__FILE__,__LINE__)
# 1134 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 1134 "iotk_external.spp"
call iotk_error_msg(ierrl,'Error inquiring')
# 1134 "iotk_external.spp"
call iotk_error_write(ierrl,"unit",unit)
# 1134 "iotk_external.spp"
call iotk_error_write(ierrl,"iostat",iostat)
    goto 1
  end if 
  if(isearch>=nsearch) then
    call iotk_error_issue(ierrl,"iotk_free_unit",__FILE__,__LINE__)
# 1138 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 1138 "iotk_external.spp"
call iotk_error_msg(ierrl,'There are no units left')
    goto 1
  end if 
1 continue
  offset = modulo(unit - unitmin + 1,nsearch)
  if(present(ierr)) then 
    ierr = ierrl
  else
    if(ierrl/=0) call iotk_error_handler(ierrl)
  end if
end subroutine iotk_free_unit_x

# 1151 "iotk_external.spp"
function iotk_phys_unit_x(unit)
  use iotk_base
  use iotk_interface
  implicit none
  integer, intent(in) :: unit
  integer :: iotk_phys_unit_x
  integer :: ierrl
  type(iotk_unit), pointer :: this
  ierrl = 0
  iotk_phys_unit_x = unit
  if(.not. iotk_units_init) then
    iotk_units_init = .true.
    nullify(iotk_units)
  end if
  call iotk_unit_get(unit,pointer=this)
  if(.not.associated(this)) then
    iotk_phys_unit_x = unit
    return
  end if
  do
    if(.not. associated(this%son)) exit
    this => this%son
  end do
  iotk_phys_unit_x = this%unit
end function iotk_phys_unit_x

# 1178 "iotk_external.spp"
subroutine iotk_unit_print_x(unit)
  use iotk_base
  use iotk_interface
  implicit none 
  integer, intent(in) :: unit
  type (iotk_unit), pointer :: this
  this => iotk_units
  write(unit,"(a)") "IOTK units"
  do
    if(.not. associated(this)) exit
    write(unit,"(a,i8)") "Unit :",this%unit
    write(unit,"(a,a,a,i8)") "Root :",trim(this%root),"Level:",this%level
    if(associated(this%son)) then
      write(unit,"(a,i8)") "Son :",this%son%unit
    end if
    if(associated(this%parent)) then
      write(unit,"(a,i8)") "Parent :",this%parent%unit
    end if
    this => this%next
  end do
  write(unit,"(a)") "end IOTK units"
end subroutine iotk_unit_print_x

# 1202 "iotk_external.spp"
subroutine iotk_unit_add_x(unit,root,raw,close_at_end,skip_root,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer,           intent(in)  :: unit
  character(*),      intent(in)  :: root
  logical,           intent(in)  :: raw
  logical,           intent(in)  :: close_at_end
  logical,           intent(in)  :: skip_root
  integer,           intent(out) :: ierr
  type (iotk_unit), pointer :: this
  ierr = 0
  if(.not. iotk_units_init) then
    iotk_units_init = .true.
    nullify(iotk_units)
  end if 
  this => iotk_units
  do
    if(.not.associated(this)) exit
    if(this%unit == unit) then
      call iotk_error_issue(ierr,"iotk_unit_add",__FILE__,__LINE__)
# 1222 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
# 1222 "iotk_external.spp"
call iotk_error_msg(ierr,'unit')
      return
    end if
    this => this%next
  end do
  allocate(this)
  this%unit      = unit
  this%root      = root
  this%skip_root = skip_root
  this%raw       = raw
  this%next  => iotk_units
  nullify(this%son)
  nullify(this%parent)
  this%level=0
  this%close_at_end=close_at_end
  iotk_units => this
end subroutine iotk_unit_add_x

# 1241 "iotk_external.spp"
subroutine iotk_inquire_x(unit,binary,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer,           intent(in)  :: unit
  logical,           intent(out) :: binary
  integer,           intent(out) :: ierr
  character(50) :: form,access,pad,blank
  logical :: opened
  integer :: iostat
  iostat = 0
  ierr = 0
  inquire(unit=unit,form=form,iostat=iostat,access=access,pad=pad,blank=blank,opened=opened)
  if(iostat/=0) then
    call iotk_error_issue(ierr,"iotk_inquire",__FILE__,__LINE__)
# 1255 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
# 1255 "iotk_external.spp"
call iotk_error_msg(ierr,'Error inquiring')
    return
  end if
  if(opened .and. iotk_toupper(form)=="UNFORMATTED") then
    binary = .true.
  else
    binary = .false.
  end if
  if(opened .and. iotk_toupper(access)/="SEQUENTIAL") then
    call iotk_error_issue(ierr,"iotk_inquire",__FILE__,__LINE__)
# 1264 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
    return
  end if
  if(.not. binary) then
    if(opened .and. iotk_toupper(blank)/="NULL") then
      call iotk_error_issue(ierr,"iotk_inquire",__FILE__,__LINE__)
# 1269 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
      return
    end if
    if(opened .and. iotk_toupper(pad)  /="YES") then
      call iotk_error_issue(ierr,"iotk_inquire",__FILE__,__LINE__)
# 1273 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
      return
    end if
  end if
end subroutine iotk_inquire_x

# 1280 "iotk_external.spp"
subroutine iotk_copy_tag_x(source,dest,maxsize,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer,           intent(in)  :: source
  integer,           intent(in)  :: dest
  integer, optional, intent(in)  :: maxsize
  integer, optional, intent(out) :: ierr
  logical :: source_binary,dest_binary
  integer :: ierrl,control,maxsizel
  character(iotk_taglenx) :: tag
  character(iotk_namlenx) :: name
  character(iotk_attlenx) :: attr
  character(iotk_vallenx) :: type
  type(iotk_unit), pointer :: this
  integer :: taglen           
  logical :: finish
  ierrl = 0         
  maxsizel = -1     
  if(present(maxsize)) maxsizel = maxsize 
  call iotk_inquire(source,binary=source_binary,ierr=ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_copy_tag",__FILE__,__LINE__)
# 1302 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
    goto 1
  end if
  call iotk_inquire(dest  ,binary=dest_binary,  ierr=ierrl)
  if(ierrl/=0) then
    call iotk_error_issue(ierrl,"iotk_copy_tag",__FILE__,__LINE__)
# 1307 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")            
    goto 1
  end if
  call iotk_unit_get(source,pointer=this)
  if(.not.associated(this)) then
    call iotk_error_issue(ierrl,"iotk_copy_tag",__FILE__,__LINE__)
# 1312 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 1312 "iotk_external.spp"
call iotk_error_msg(ierrl,'unit')  
    goto 1
  end if
  do
    call iotk_scan_tag(source,+1,control,tag,source_binary,ierrl)
    if(ierrl/=0) then
      call iotk_error_issue(ierrl,"iotk_copy_tag",__FILE__,__LINE__)
# 1318 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
      goto 1
    end if
    call iotk_tag_parse(tag,name,attr,ierrl)
    if(ierrl/=0) then
      call iotk_error_issue(ierrl,"iotk_copy_tag",__FILE__,__LINE__)
# 1323 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
      goto 1
    end if
    if(iotk_strcomp(name,this%root)) then
      call iotk_scan_tag(source,-1,control,tag,source_binary,ierrl)
      if(ierrl/=0) then
        call iotk_error_issue(ierrl,"iotk_copy_tag",__FILE__,__LINE__)
# 1329 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
        goto 1
      end if
      return
    end if
    call iotk_scan_attr(attr,"type",type,ierr=ierrl,eos=.true.,default=" ")
    if(ierrl<0) call iotk_error_clear(ierrl)
    if(ierrl/=0) then
      call iotk_error_issue(ierrl,"iotk_copy_tag",__FILE__,__LINE__)
# 1337 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
      goto 1
    end if
    if((iotk_strcomp(type,"real") .or. iotk_strcomp(type,"integer") .or. iotk_strcomp(type,"logical") &
                                  .or. iotk_strcomp(type,"character") .or. iotk_strcomp(type,"complex")) .and. control==1) then
      call iotk_copy_dat(source,dest,source_binary,dest_binary,name,attr,maxsize=maxsizel,ierr=ierrl)
      if(ierrl/=0) then
        call iotk_error_issue(ierrl,"iotk_copy_tag",__FILE__,__LINE__)
# 1344 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
        goto 1
      end if
      call iotk_scan_tag(source,+1,control,tag,source_binary,ierrl)
      if(ierrl/=0) then
        call iotk_error_issue(ierrl,"iotk_copy_tag",__FILE__,__LINE__)
# 1349 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
        goto 1
      end if
    else
      call iotk_write_tag(dest,control,tag,dest_binary,ierrl)
      if(ierrl/=0) then
        call iotk_error_issue(ierrl,"iotk_copy_tag",__FILE__,__LINE__)
# 1355 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
        goto 1
      end if
    end if
  end do
1 continue
  if(present(ierr)) then
    ierr = ierrl
  else
    if(ierrl/=0) call iotk_error_handler(ierrl)
  end if
end subroutine iotk_copy_tag_x

# 1369 "iotk_external.spp"
subroutine iotk_unit_del_x(unit,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer, intent(in)  :: unit
  integer, intent(out) :: ierr
  type (iotk_unit), pointer :: this,prev
  ierr = 0
  if(.not. iotk_units_init) then
    iotk_units_init = .true.
    nullify(iotk_units)
  end if
  nullify(prev)
  this => iotk_units
  do
    if(.not.associated(this)) then
      call iotk_error_issue(ierr,"iotk_unit_del",__FILE__,__LINE__)
# 1385 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
      return
    end if
    if(this%unit == unit) exit
    prev => this
    this => this%next
  end do
  if(associated(this%son)) then
    call iotk_error_issue(ierr,"iotk_unit_del",__FILE__,__LINE__)
# 1393 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
    return
  end if
  if(associated(this%parent)) then
  end if
  if(associated(this%parent)) nullify(this%parent%son)
  if(associated(prev)) then
    prev%next  => this%next
  else
    iotk_units => this%next
  end if
  deallocate(this)
end subroutine iotk_unit_del_x

# 1408 "iotk_external.spp"
subroutine iotk_unit_parent_x(parent,son,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer, intent(in) :: parent,son
  integer, intent(out) :: ierr
  type(iotk_unit), pointer :: this_parent,this_son
  ierr = 0
  call iotk_unit_get(parent,pointer=this_parent)
  if(.not.associated(this_parent)) then
    call iotk_error_issue(ierr,"iotk_unit_parent",__FILE__,__LINE__)
# 1418 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
    return
  end if
  call iotk_unit_get(son,pointer=this_son)
  if(.not.associated(this_son)) then
    call iotk_error_issue(ierr,"iotk_unit_parent",__FILE__,__LINE__)
# 1423 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
    return
  end if
  if(associated(this_parent%son)) then
    call iotk_error_issue(ierr,"iotk_unit_parent",__FILE__,__LINE__)
# 1427 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
    return
  end if
  if(associated(this_son%parent)) then
    call iotk_error_issue(ierr,"iotk_unit_parent",__FILE__,__LINE__)
# 1431 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
    return
  end if
  this_parent%son => this_son
  this_son%parent => this_parent
end subroutine iotk_unit_parent_x

# 1439 "iotk_external.spp"
subroutine iotk_unit_get_x(unit,raw,pointer)
  use iotk_base
  use iotk_interface
  implicit none
  integer,                intent(in)  :: unit
  logical,      optional, intent(out) :: raw
  type(iotk_unit), optional, pointer :: pointer
  type (iotk_unit), pointer :: this
  if(present(raw))  raw  = .false.
  if(present(pointer)) nullify(pointer)
  if(.not. iotk_units_init) then
    iotk_units_init = .true.
    nullify(iotk_units)
  end if
  this => iotk_units
  do
    if(.not.associated(this)) exit
    if(this%unit == unit) exit
    this => this%next
  end do
  if(associated(this)) then
    if(present(raw))  raw  = this%raw
    if(present(pointer)) pointer => this
  end if
end subroutine iotk_unit_get_x

# 1466 "iotk_external.spp"
subroutine iotk_parse_dat_x(attr,type,ikind,isize,ilen,fmt,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  character(*), intent(in)  :: attr
  character(*), intent(out) :: type
  integer,      intent(out) :: ikind
  integer,      intent(out) :: isize
  integer,      intent(out) :: ilen
  character(*), intent(out) :: fmt
  integer,      intent(out) :: ierr
  character(iotk_vallenx) :: typename
  integer :: typelen
  ierr = 0
  call iotk_scan_attr(attr,"type",typename,ierr=ierr,eos=.true.,default=iotk_eos)
  if(ierr<0) call iotk_error_clear(ierr)
  if(ierr/=0) then
    call iotk_error_issue(ierr,"iotk_parse_dat",__FILE__,__LINE__)
# 1483 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
    return
  end if
  typelen = iotk_strlen(typename)
  type = iotk_toupper(typename)
  call iotk_scan_attr(attr,"kind",ikind,ierr=ierr,default=-1)
  if(ierr<0) call iotk_error_clear(ierr)
  if(ierr/=0) then
    call iotk_error_issue(ierr,"iotk_parse_dat",__FILE__,__LINE__)
# 1491 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
    return
  end if
  call iotk_scan_attr(attr,"size",isize,ierr=ierr,default=-1)
  if(ierr<0) call iotk_error_clear(ierr)
  if(ierr/=0) then
    call iotk_error_issue(ierr,"iotk_parse_dat",__FILE__,__LINE__)
# 1497 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
    return
  end if
  call iotk_scan_attr(attr,"len", ilen, ierr=ierr,default=-1)
  if(ierr<0) call iotk_error_clear(ierr)
  if(ierr/=0) then
    call iotk_error_issue(ierr,"iotk_parse_dat",__FILE__,__LINE__)
# 1503 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
    return
  end if
  call iotk_scan_attr(attr,"fmt", fmt, ierr=ierr,eos=.true.,default="!"//iotk_eos)
  if(ierr<0) call iotk_error_clear(ierr)
  if(ierr/=0) then
    call iotk_error_issue(ierr,"iotk_parse_dat",__FILE__,__LINE__)
# 1509 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
    return
  end if
end subroutine iotk_parse_dat_x

# 1515 "iotk_external.spp"
subroutine iotk_set_options_x(unitmin,unitmax,getline_buffer,error_warn_overflow,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer, optional, intent(in) :: unitmin
  integer, optional, intent(in) :: unitmax
  integer, optional, intent(in) :: getline_buffer
  logical, optional, intent(in) :: error_warn_overflow
  integer, optional, intent(out):: ierr
  integer :: ierrl
  ierrl = 0
  if(present(error_warn_overflow)) then
    iotk_error_warn_overflow = error_warn_overflow
  end if
  if(present(unitmin)) then
    if(unitmin<0) then
      call iotk_error_issue(ierrl,"iotk_set_options",__FILE__,__LINE__)
# 1531 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
      goto 1 
    end if
    iotk_unitmin = unitmin 
  end if
  if(present(unitmax)) then
    if(unitmax<iotk_unitmin) then
      call iotk_error_issue(ierrl,"iotk_set_options",__FILE__,__LINE__)
# 1538 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
      goto 1
    end if
    iotk_unitmax = unitmax
  end if
  if(present(getline_buffer)) then
    if(getline_buffer<1) then
      call iotk_error_issue(ierrl,"iotk_set_options",__FILE__,__LINE__)
# 1545 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
      goto 1
    end if
    iotk_getline_buffer = getline_buffer
  end if
1 continue 
  if(present(ierr)) then
    ierr = ierrl
  else
    if(ierrl/=0) call iotk_error_handler(ierrl)
  end if
end subroutine iotk_set_options_x

# 1559 "iotk_external.spp"
subroutine iotk_get_options_x(unitmin,unitmax,getline_buffer,error_warn_overflow)
  use iotk_base
  use iotk_interface
  implicit none
  integer, optional, intent(out):: unitmin
  integer, optional, intent(out):: unitmax
  integer, optional, intent(out):: getline_buffer
  logical, optional, intent(out):: error_warn_overflow
  if(present(unitmin)) unitmin = iotk_unitmin
  if(present(unitmax)) unitmax = iotk_unitmax
  if(present(unitmax)) getline_buffer = iotk_getline_buffer
  if(present(error_warn_overflow)) error_warn_overflow = iotk_error_warn_overflow
end subroutine iotk_get_options_x

# 1574 "iotk_external.spp"
subroutine iotk_print_kinds_x
  use iotk_base
  use iotk_interface
  implicit none
  character(100) :: string
# 1580 "iotk_external.spp"
#ifdef __IOTK_LOGICAL1
  string = "logical(kind="//trim(iotk_itoa(__IOTK_LOGICAL1))//")"
  write(*,"(a)") trim(string)
#endif
# 1580 "iotk_external.spp"
#ifdef __IOTK_LOGICAL2
  string = "logical(kind="//trim(iotk_itoa(__IOTK_LOGICAL2))//")"
  write(*,"(a)") trim(string)
#endif
# 1580 "iotk_external.spp"
#ifdef __IOTK_LOGICAL3
  string = "logical(kind="//trim(iotk_itoa(__IOTK_LOGICAL3))//")"
  write(*,"(a)") trim(string)
#endif
# 1580 "iotk_external.spp"
#ifdef __IOTK_LOGICAL4
  string = "logical(kind="//trim(iotk_itoa(__IOTK_LOGICAL4))//")"
  write(*,"(a)") trim(string)
#endif
# 1586 "iotk_external.spp"
#ifdef __IOTK_INTEGER1
  string = "integer(kind="//trim(iotk_itoa(__IOTK_INTEGER1))//")"
  write(*,"(a)") trim(string)
#endif
# 1586 "iotk_external.spp"
#ifdef __IOTK_INTEGER2
  string = "integer(kind="//trim(iotk_itoa(__IOTK_INTEGER2))//")"
  write(*,"(a)") trim(string)
#endif
# 1586 "iotk_external.spp"
#ifdef __IOTK_INTEGER3
  string = "integer(kind="//trim(iotk_itoa(__IOTK_INTEGER3))//")"
  write(*,"(a)") trim(string)
#endif
# 1586 "iotk_external.spp"
#ifdef __IOTK_INTEGER4
  string = "integer(kind="//trim(iotk_itoa(__IOTK_INTEGER4))//")"
  write(*,"(a)") trim(string)
#endif
# 1592 "iotk_external.spp"
#ifdef __IOTK_REAL1
  string = "real(kind="//trim(iotk_itoa(__IOTK_REAL1))//")"
  write(*,"(a)") trim(string)
#endif
# 1592 "iotk_external.spp"
#ifdef __IOTK_REAL2
  string = "real(kind="//trim(iotk_itoa(__IOTK_REAL2))//")"
  write(*,"(a)") trim(string)
#endif
# 1592 "iotk_external.spp"
#ifdef __IOTK_REAL3
  string = "real(kind="//trim(iotk_itoa(__IOTK_REAL3))//")"
  write(*,"(a)") trim(string)
#endif
# 1592 "iotk_external.spp"
#ifdef __IOTK_REAL4
  string = "real(kind="//trim(iotk_itoa(__IOTK_REAL4))//")"
  write(*,"(a)") trim(string)
#endif
# 1597 "iotk_external.spp"
  string = "character(kind="//trim(iotk_itoa(__IOTK_CHARACTER1))//")"
  write(*,"(a)") trim(string)
end subroutine iotk_print_kinds_x


# 1603 "iotk_external.spp"
subroutine iotk_copy_dat_aux_x(source,dest,source_binary,dest_binary,name,type,ikind,isize,ilen,fmt,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer,      intent(in)  :: source
  integer,      intent(in)  :: dest
  logical,      intent(in)  :: source_binary
  logical,      intent(in)  :: dest_binary
  character(*), intent(in)  :: name
  character(*), intent(in)  :: type
  integer,      intent(in)  :: ikind
  integer,      intent(in)  :: isize
  integer,      intent(in)  :: ilen
  character(*), intent(in)  :: fmt
  integer,      intent(out) :: ierr
  
  logical  (kind=iotk_defkind_LOGICAL),           allocatable :: dat_lo(:)
  integer  (kind=iotk_defkind_INTEGER),           allocatable :: dat_in(:)
  real     (kind=iotk_defkind_REAL),              allocatable :: dat_re(:)
  complex  (kind=iotk_defkind_COMPLEX),           allocatable :: dat_co(:)
  character(kind=iotk_defkind_CHARACTER,len=ilen), allocatable :: dat_ch(:)
  
  ierr = 0
  select case(type(1:iotk_strlen(type)))
  case("LOGICAL")
    allocate(dat_lo(isize))
    call iotk_scan_dat_aux(source,dat_lo,ikind,ilen,fmt,ierr)
    if(ierr/=0) then
      call iotk_error_issue(ierr,"iotk_copy_dat_aux",__FILE__,__LINE__)
# 1631 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
      return
    end if
    call iotk_write_dat(dest,name,dat_lo,ierr=ierr,fmt=fmt)
    if(ierr/=0) then
      call iotk_error_issue(ierr,"iotk_copy_dat_aux",__FILE__,__LINE__)
# 1636 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
      return
    end if
    deallocate(dat_lo)
  case("INTEGER")
    allocate(dat_in(isize))
    call iotk_scan_dat_aux(source,dat_in,ikind,ilen,fmt,ierr)
    if(ierr/=0) then
      call iotk_error_issue(ierr,"iotk_copy_dat_aux",__FILE__,__LINE__)
# 1644 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
      return
    end if
    call iotk_write_dat(dest,name,dat_in,ierr=ierr,fmt=fmt)
    if(ierr/=0) then
      call iotk_error_issue(ierr,"iotk_copy_dat_aux",__FILE__,__LINE__)
# 1649 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
      return
    end if
    deallocate(dat_in)
  case("REAL")
    allocate(dat_re(isize))
    call iotk_scan_dat_aux(source,dat_re,ikind,ilen,fmt,ierr)
    if(ierr/=0) then
      call iotk_error_issue(ierr,"iotk_copy_dat_aux",__FILE__,__LINE__)
# 1657 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
      return
    end if
    call iotk_write_dat(dest,name,dat_re,ierr=ierr,fmt=fmt)
    if(ierr/=0) then
      call iotk_error_issue(ierr,"iotk_copy_dat_aux",__FILE__,__LINE__)
# 1662 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
      return
    end if
    deallocate(dat_re)
  case("COMPLEX")
    allocate(dat_co(isize))
    call iotk_scan_dat_aux(source,dat_co,ikind,ilen,fmt,ierr)
    if(ierr/=0) then
      call iotk_error_issue(ierr,"iotk_copy_dat_aux",__FILE__,__LINE__)
# 1670 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
      return
    end if
    call iotk_write_dat(dest,name,dat_co,ierr=ierr,fmt=fmt)
    if(ierr/=0) then
      call iotk_error_issue(ierr,"iotk_copy_dat_aux",__FILE__,__LINE__)
# 1675 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
      return
    end if
    deallocate(dat_co)
  case("CHARACTER")
    allocate(dat_ch(isize))
    call iotk_scan_dat_aux(source,dat_ch,ikind,ilen,fmt,ierr)
    if(ierr/=0) then
      call iotk_error_issue(ierr,"iotk_copy_dat_aux",__FILE__,__LINE__)
# 1683 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
      return
    end if
    call iotk_write_dat(dest,name,dat_ch,ierr=ierr,fmt=fmt)
    if(ierr/=0) then
      call iotk_error_issue(ierr,"iotk_copy_dat_aux",__FILE__,__LINE__)
# 1688 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
      return
    end if
    deallocate(dat_ch)
  end select
end subroutine iotk_copy_dat_aux_x


# 1697 "iotk_external.spp"
subroutine iotk_copy_dat_x(source,dest,source_binary,dest_binary,name,attr,maxsize,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer,      intent(in)  :: source
  integer,      intent(in)  :: dest
  logical,      intent(in)  :: source_binary
  logical,      intent(in)  :: dest_binary
  character(*), intent(in)  :: name
  character(*), intent(in)  :: attr
  integer,      intent(in)  :: maxsize
  integer,      intent(out) :: ierr
  character(9) :: type
  integer :: ikind,isize,ilen
  character(iotk_vallenx) :: fmt
  character(iotk_attlenx) :: attr1
  ierr = 0
  call iotk_parse_dat(attr,type,ikind,isize,ilen,fmt,ierr)
  if(ierr/=0) then
    call iotk_error_issue(ierr,"iotk_copy_dat",__FILE__,__LINE__)
# 1716 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
    return
  end if
  if(iotk_strcomp(type,iotk_eos)) then
    call iotk_error_issue(ierr,"iotk_copy_dat",__FILE__,__LINE__)
# 1720 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
    return
  end if
  if(isize==-1) then
    call iotk_error_issue(ierr,"iotk_copy_dat",__FILE__,__LINE__)
# 1724 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
    return
  end if
  if(ilen==-1 .and. iotk_strcomp(type,"CHARACTER")) then
    call iotk_error_issue(ierr,"iotk_copy_dat",__FILE__,__LINE__)
# 1728 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
    return
  end if
  if(isize<=maxsize .or. maxsize==-1 .or. dest_binary) then
    call iotk_copy_dat_aux(source,dest,source_binary,dest_binary,name,type,ikind,isize,ilen,fmt,ierr)
    if(ierr/=0) then
      call iotk_error_issue(ierr,"iotk_copy_dat",__FILE__,__LINE__)
# 1734 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
      return
    end if  
  else    
    call iotk_strcpy(attr1,attr,ierr=ierr)
    if(ierr/=0) then
      call iotk_error_issue(ierr,"iotk_copy_dat",__FILE__,__LINE__)
# 1740 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
      return
    end if
    call iotk_write_attr (attr1,"trunc",.true.,ierr=ierr)
    if(ierr/=0) then
      call iotk_error_issue(ierr,"iotk_copy_dat",__FILE__,__LINE__)
# 1745 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
      return
    end if
    call iotk_write_empty(dest,name,attr=attr1,ierr=ierr)
    if(ierr/=0) then
      call iotk_error_issue(ierr,"iotk_copy_dat",__FILE__,__LINE__)
# 1750 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
      return
    end if
  end if
end subroutine iotk_copy_dat_x


# 1758 "iotk_external.spp"
subroutine iotk_write_tag_x(unit,control,tag,binary,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer,                   intent(in)  :: unit
  integer,                   intent(in)  :: control
  character(iotk_taglenx),   intent(in)  :: tag
  logical,                   intent(in)  :: binary
  integer,                   intent(out) :: ierr
  integer(iotk_header_kind) :: header,header2
  integer :: taglen
  integer :: iostat,pos1,pos2
  character(4) :: begin,end
  iostat = 0
  ierr = 0
  taglen = iotk_strlen(tag)
  if(binary) then
    header  = control + taglen*(iotk_ncontrol+1)
    header2 = 128     + taglen*(iotk_ncontrol+1)
    write(unit,iostat=iostat) header
    if(iostat/=0) then
      call iotk_error_issue(ierr,"iotk_write_tag",__FILE__,__LINE__)
# 1779 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
# 1779 "iotk_external.spp"
call iotk_error_msg(ierr,'error writing the header record')
# 1779 "iotk_external.spp"
call iotk_error_write(ierr,"iostat",iostat)
    end if
    write(unit,iostat=iostat) header2,tag(1:taglen)
  else
    select case(control)
    case(1)
      begin = "<"
      end   = ">"
    case(2)
      begin = "</"
      end   = ">"
    case(3)
      begin = "<"
      end   = "/>"
    case(4)
      begin = "<!--"
      end   = "-->"
    case(5)
      begin = "<?"
      end   = "?>"
    end select
    pos1=0
    write(unit,"(a)",iostat=iostat,advance="no") trim(begin)
    do
      if(pos1+iotk_linlen >= taglen ) then
        pos2 = taglen+1
      else
        pos2 = pos1 + scan(tag(pos1+1:pos1+iotk_linlen)," ",back=.true.)
        if(pos2<=pos1) then
          pos2 = pos1+iotk_linlen + scan(tag(pos1+iotk_linlen+1:taglen)," ")
          if(pos2<=pos1+iotk_linlen) pos2=taglen+1
        end if
      end if
      write(unit,"(a)",iostat=iostat,advance="no") tag(pos1+1:pos2-1)
      pos1=pos2
      if(pos1>taglen) exit
      write(unit,*,iostat=iostat)
    end do
    write(unit,"(a)",iostat=iostat) trim(end)
  end if
  if(iostat/=0) then
    call iotk_error_issue(ierr,"iotk_write_tag",__FILE__,__LINE__)
# 1820 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
# 1820 "iotk_external.spp"
call iotk_error_msg(ierr,'error writing')
# 1820 "iotk_external.spp"
call iotk_error_write(ierr,"iostat",iostat)
  end if
end subroutine iotk_write_tag_x


# 1826 "iotk_external.spp"
subroutine iotk_check_iotk_attr_x(unit,attr,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer,                 intent(in)  :: unit
  character(iotk_attlenx), intent(in)  :: attr
  integer,                 intent(out) :: ierr
  character(iotk_vallenx) :: version,binary_format,file_version
  logical :: binary,rbinary,check
  integer :: pos1,pos2,attlen,itmp_major,itmp_minor
  ierr = 0
  call iotk_scan_attr(attr,"file_version",file_version,eos=.true.,ierr=ierr)
  if(ierr>0) then
    call iotk_error_issue(ierr,"iotk_check_iotk_attr",__FILE__,__LINE__)
# 1839 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
    return
  else if(ierr<0) then
    call iotk_error_clear(ierr)
  else
    attlen = iotk_strlen(file_version)
    pos1   = iotk_strscan(file_version,".")
    if(pos1<=1 .or. pos1>=attlen) then
      call iotk_error_issue(ierr,"iotk_check_iotk_attr",__FILE__,__LINE__)
# 1847 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
# 1847 "iotk_external.spp"
call iotk_error_msg(ierr,'Problems reading file version')
# 1847 "iotk_external.spp"
call iotk_error_write(ierr,"file_version",file_version(1:attlen))
# 1847 "iotk_external.spp"
call iotk_error_write(ierr,"attlen",attlen)
# 1847 "iotk_external.spp"
call iotk_error_write(ierr,"pos1",pos1)
      return
    end if
    pos2   = pos1 + verify(file_version(pos1+1:attlen),numbers)
    if(pos2==pos1+1) then
      call iotk_error_issue(ierr,"iotk_check_iotk_attr",__FILE__,__LINE__)
# 1852 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
# 1852 "iotk_external.spp"
call iotk_error_msg(ierr,'Problems reading file version')
# 1852 "iotk_external.spp"
call iotk_error_write(ierr,"file_version",file_version(1:attlen))
# 1852 "iotk_external.spp"
call iotk_error_write(ierr,"attlen",attlen)
# 1852 "iotk_external.spp"
call iotk_error_write(ierr,"pos1",pos1)
# 1852 "iotk_external.spp"
call iotk_error_write(ierr,"pos2",pos2)
      return
    end if
    if(pos2==pos1) pos2 = attlen+1
    call iotk_atoi(itmp_major,file_version(1:pos1-1),check)
    if(.not.check) then
      call iotk_error_issue(ierr,"iotk_check_iotk_attr",__FILE__,__LINE__)
# 1858 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
# 1858 "iotk_external.spp"
call iotk_error_msg(ierr,'Problems reading file version')
# 1858 "iotk_external.spp"
call iotk_error_write(ierr,"file_version",file_version(1:attlen))
      return
    end if
    call iotk_atoi(itmp_minor,file_version(pos1+1:pos2-1),check)
    if(.not.check) then
      call iotk_error_issue(ierr,"iotk_check_iotk_attr",__FILE__,__LINE__)
# 1863 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
# 1863 "iotk_external.spp"
call iotk_error_msg(ierr,'Problems reading file version')
# 1863 "iotk_external.spp"
call iotk_error_write(ierr,"file_version",file_version(1:attlen))
      return
    end if
    if(itmp_major > iotk_file_version_major .or. &
      (itmp_major==iotk_file_version_major .and. itmp_minor > iotk_file_version_minor) ) then
      call iotk_error_issue(ierr,"iotk_check_iotk_attr",__FILE__,__LINE__)
# 1868 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
# 1868 "iotk_external.spp"
call iotk_error_msg(ierr,'File version is newer than internal version')
# 1868 "iotk_external.spp"
call iotk_error_write(ierr,"file_version",file_version(1:attlen))
# 1868 "iotk_external.spp"
call iotk_error_write(ierr,"internal_version",iotk_file_version)
      return
    end if
  end if
  call iotk_scan_attr(attr,"binary",rbinary,ierr=ierr)
  if(ierr>0) then
    call iotk_error_issue(ierr,"iotk_check_iotk_attr",__FILE__,__LINE__)
# 1874 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
    return
  else if(ierr<0) then
    call iotk_error_clear(ierr)
  else
    call iotk_inquire(unit,binary,ierr=ierr)
    if(ierr/=0) then
      call iotk_error_issue(ierr,"iotk_check_iotk_attr",__FILE__,__LINE__)
# 1881 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
      return
    end if
    if(rbinary .neqv. binary) then
      call iotk_error_issue(ierr,"iotk_check_iotk_attr",__FILE__,__LINE__)
# 1885 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
      return
    end if
  end if
  call iotk_scan_attr(attr,"binary_format",binary_format,ierr=ierr)
  if(ierr>0) then
    call iotk_error_issue(ierr,"iotk_check_iotk_attr",__FILE__,__LINE__)
# 1891 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
    return
  else if(ierr<0) then
    call iotk_error_clear(ierr)
  else
    if(binary_format/=iotk_binary_format .and. binary_format/="*" .and. iotk_binary_format/="*") then
      call iotk_error_issue(ierr,"iotk_check_iotk_attr",__FILE__,__LINE__)
# 1897 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
# 1897 "iotk_external.spp"
call iotk_error_msg(ierr,'Binary format is not compatible')
      return
    end if
  end if
end subroutine iotk_check_iotk_attr_x

# 1904 "iotk_external.spp"
subroutine iotk_scan_tag_x(unit,direction,control,tag,binary,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer,                 intent(in)  :: unit
  integer,                 intent(in)  :: direction
  integer,                 intent(out) :: control
  character(iotk_taglenx), intent(out) :: tag
  logical,                 intent(in)  :: binary
  integer,                 intent(out) :: ierr

  integer(iotk_header_kind) :: header
  integer :: taglen,pos,pos1,res,length,iostat
  character(2) :: begin,end
  character(iotk_linlenx) :: line
  logical :: found
  ierr = 0
  iostat = 0
  tag  = " "
  if(binary) then
    found = .false.
    do
      if(direction<0) then
        backspace(unit,iostat=iostat)
        if(iostat/=0) then
          call iotk_error_issue(ierr,"iotk_scan_tag",__FILE__,__LINE__)
# 1929 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
# 1929 "iotk_external.spp"
call iotk_error_msg(ierr,' ')
# 1929 "iotk_external.spp"
call iotk_error_write(ierr,"iostat",iostat)
          return
        end if
      end if
      read(unit,iostat=iostat) header
      if(iostat/=0) then
        call iotk_error_issue(ierr,"iotk_scan_tag",__FILE__,__LINE__)
# 1935 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
# 1935 "iotk_external.spp"
call iotk_error_msg(ierr,' ')
# 1935 "iotk_external.spp"
call iotk_error_write(ierr,"iostat",iostat)
        return
      end if
      control = modulo(header,iotk_ncontrol+1)
      if(control/=0 .and. control/=128) then
        found = .true.
        taglen  = modulo(header/(iotk_ncontrol+1),iotk_taglenx+1)
        read(unit,iostat=iostat) header,tag(1:taglen)
        if(iostat/=0) then
          call iotk_error_issue(ierr,"iotk_scan_tag",__FILE__,__LINE__)
# 1944 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
# 1944 "iotk_external.spp"
call iotk_error_msg(ierr,' ')
# 1944 "iotk_external.spp"
call iotk_error_write(ierr,"iostat",iostat)
          return
        end if
        if(taglen<len(tag)) tag(taglen+1:taglen+1)=iotk_eos
      end if
      if(direction<0) then
        backspace(unit,iostat=iostat)
        if(iostat/=0) then
          call iotk_error_issue(ierr,"iotk_scan_tag",__FILE__,__LINE__)
# 1952 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
# 1952 "iotk_external.spp"
call iotk_error_msg(ierr,' ')
# 1952 "iotk_external.spp"
call iotk_error_write(ierr,"iostat",iostat)
          return
        end if
      end if
      if(found) exit
    end do
    if(direction<0) then
      backspace(unit,iostat=iostat)
      if(iostat/=0) then
        call iotk_error_issue(ierr,"iotk_scan_tag",__FILE__,__LINE__)
# 1961 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
# 1961 "iotk_external.spp"
call iotk_error_msg(ierr,' ')
# 1961 "iotk_external.spp"
call iotk_error_write(ierr,"iostat",iostat)
        return
      end if
    end if
  else
! RISISTEMARE IN MODO CHE SI POSSA AVERE NELLA TAG ANCHE < e >
    if(direction>=0) then
      taglen = 0
      do
        call iotk_getline(unit,line,length,ierr)
        if(ierr/=0) then
          call iotk_error_issue(ierr,"iotk_scan_tag",__FILE__,__LINE__)
# 1972 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
          return
        end if
!        pos = scan(line(1:length),"<")
        pos = iotk_strscan(line,"<")
        if(pos/=0) exit
      end do
      do
!        pos1 = scan(line(pos+1:length),">") + pos
        pos1 = iotk_strscan(line(pos+1:),">") + pos
        if(pos1/=pos) exit
        if(taglen+length-pos+1>len(tag)) then
          call iotk_error_issue(ierr,"iotk_scan_tag",__FILE__,__LINE__)
# 1984 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
# 1984 "iotk_external.spp"
call iotk_error_msg(ierr,'Tag too long')
          return
        end if
        tag(taglen+1:taglen+1) = " "
        tag(taglen+2:taglen+length-pos+1) = line(pos+1:length)
        taglen = taglen+length-pos+1
        pos = 0
        call iotk_getline(unit,line,length,ierr)
        if(ierr/=0) then
          call iotk_error_issue(ierr,"iotk_scan_tag",__FILE__,__LINE__)
# 1993 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")    
          return
        end if
      end do
      if(taglen+pos1-pos>len(tag)) then
        call iotk_error_issue(ierr,"iotk_scan_tag",__FILE__,__LINE__)
# 1998 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
# 1998 "iotk_external.spp"
call iotk_error_msg(ierr,'Tag too long')
        return
      end if
      tag(taglen+1:taglen+1) = " "
      tag(taglen+2:taglen+pos1-pos) = line(pos+1:pos1-1)
      taglen =taglen+pos1-pos
      res = len_trim(line(1:length))-pos1 ! LA LUNGHEZZA E' TRIMMATA. IN QUESTO MODO SI VA A CAPO
                                          ! SE CI SONO SOLO SPAZI
      if(res>0) then
        backspace(unit,iostat=iostat)
        if(iostat/=0) then
          call iotk_error_issue(ierr,"iotk_scan_tag",__FILE__,__LINE__)
# 2009 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
# 2009 "iotk_external.spp"
call iotk_error_msg(ierr,' ')
# 2009 "iotk_external.spp"
call iotk_error_write(ierr,"iostat",iostat)
          return
        end if
        call iotk_getline(unit,line,length,ierr)
        if(ierr/=0) then
          call iotk_error_issue(ierr,"iotk_scan_tag",__FILE__,__LINE__)
# 2014 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
          return
        end if
        backspace(unit,iostat=iostat)
        if(iostat/=0) then
          call iotk_error_issue(ierr,"iotk_scan_tag",__FILE__,__LINE__)
# 2019 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
# 2019 "iotk_external.spp"
call iotk_error_msg(ierr,' ')
# 2019 "iotk_external.spp"
call iotk_error_write(ierr,"iostat",iostat)
          return
        end if
        res = length-res
        read(unit,"(a)",iostat=iostat,advance='no') line(1:res)
        if(iostat/=0) then
          call iotk_error_issue(ierr,"iotk_scan_tag",__FILE__,__LINE__)
# 2025 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
# 2025 "iotk_external.spp"
call iotk_error_msg(ierr,'length')
# 2025 "iotk_external.spp"
call iotk_error_write(ierr,"res",res)
# 2025 "iotk_external.spp"
call iotk_error_write(ierr,"iostat",iostat)
          return
        end if
      end if
!      pos = verify(tag," ")
!      pos1 = len_trim(tag(1:taglen))
!      pos1 = taglen
       pos = 2
       pos1=taglen
    else
      call iotk_getline(unit,line,length,ierr)
      if(ierr/=0) then
        call iotk_error_issue(ierr,"iotk_scan_tag",__FILE__,__LINE__)
# 2037 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
        return
      end if
      res = length
!write(0,*) ">>>",res
      do
        backspace(unit,iostat=iostat)
        if(iostat/=0) then
          call iotk_error_issue(ierr,"iotk_scan_tag",__FILE__,__LINE__)
# 2045 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
          return
        end if
        call iotk_getline(unit,line,length,ierr)
        if(ierr/=0) then
          call iotk_error_issue(ierr,"iotk_scan_tag",__FILE__,__LINE__)
# 2050 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
          return
        end if
!write(0,*) ">>>%",length,res
        pos = length - res
        pos = scan(line(1:pos),">",back=.true.)
        backspace(unit,iostat=iostat)
        if(iostat/=0) then
          call iotk_error_issue(ierr,"iotk_scan_tag",__FILE__,__LINE__)
# 2058 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
          return
        end if
        if(pos/=0) exit
        res = 0
      end do
      taglen=len(tag)+1
      do
        pos1 = scan(line(1:pos-1),"<",back=.true.)
        res = taglen
        if(pos1>0) exit
!CHECK
        tag(res-1:res-1) = " "
        tag(res-pos:res-2) = line(1:pos-1)
        taglen=taglen-pos
        backspace(unit,iostat=iostat)
        if(iostat/=0) then
          call iotk_error_issue(ierr,"iotk_scan_tag",__FILE__,__LINE__)
# 2075 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
          return
        end if
        call iotk_getline(unit,line,length,ierr)
        if(ierr/=0) then
          call iotk_error_issue(ierr,"iotk_scan_tag",__FILE__,__LINE__)
# 2080 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
          return
        end if
        backspace(unit,iostat=iostat)
        if(iostat/=0) then
          call iotk_error_issue(ierr,"iotk_scan_tag",__FILE__,__LINE__)
# 2085 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
          return
        end if
        pos = length+1
      end do
!CHECK
      tag(res-1:res-1) = " "
      tag(res-pos+pos1:res-2) = line(pos1+1:pos-1)
      tag(1:len(tag)-res+pos-pos1+1)  =tag(res-pos+pos1:len(tag))
!write(0,*) "%%%%"//tag(1:len(tag)-res+pos-pos1+1)//"%%%%"
      read(unit,"(a)",iostat=iostat,advance="no") line(1:pos1-1)
      if(iostat/=0) then
        call iotk_error_issue(ierr,"iotk_scan_tag",__FILE__,__LINE__)
# 2097 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
        return
      end if
!      pos1 = len_trim(tag(1:len(tag)-res+pos-pos1+1))
      pos1 = len(tag)-res+pos-pos1+1-1
!      pos = verify(tag," ")
      pos = 1
    end if
    tag(pos1+1:pos1+1) = iotk_eos
!    write(0,*) "**",direction,"%"//(tag(1:iotk_strlen(tag)))//"%",pos,pos1
! UNA VOLTA RISISTEMATO SOPRA, FARE CONTROLLI PIU' STRINGENTI QUI
    if(tag(pos:pos)=="/" .and. tag(pos1:pos1)/="/") then
      control = 2
      tag = tag(pos+1:pos1)//iotk_eos
    else if(tag(pos:pos)/="/" .and. tag(pos1:pos1)=="/") then
      control = 3
      tag = tag(pos:pos1-1)//iotk_eos
    else if(tag(pos:pos)=="?" .and. tag(pos1:pos1)=="?") then
      control = 5
      tag = tag(pos+1:pos1-1)//iotk_eos
    else if(tag(pos:pos+2)=="!--" .and. tag(pos1-1:pos1)=="--") then
      control = 4
      tag = tag(pos+3:pos1-2)//iotk_eos
    else
      control = 1
      tag = tag(pos:pos1)//iotk_eos
    end if
!    write(0,*) "**",control,"%"//(tag(1:iotk_strlen(tag)))//"%"
  end if
end subroutine iotk_scan_tag_x

# 2129 "iotk_external.spp"
subroutine iotk_scan_x(unit,direction,control,name,attr,binary,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer,                 intent(in)  :: unit
  integer,                 intent(in)  :: direction
  integer,                 intent(in)  :: control
  character(iotk_namlenx), intent(in)  :: name
  character(iotk_attlenx), intent(out) :: attr
  logical,                 intent(in)  :: binary
  integer,                 intent(out) :: ierr

  character(iotk_taglenx) :: tag
  character(iotk_namlenx) :: r_name
  integer :: level,r_control,pos,pos1
  logical :: lall,match

  ierr = 0
  if(control==2 .and. direction<0) then
    call iotk_error_issue(ierr,"iotk_scan",__FILE__,__LINE__)
# 2148 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
    return
  end if
  level = 0
  ierr = 0
  do
    lall=.false.
    if(direction>=0 .and. level==0) lall=.true.
    if(direction<0  .and. level==0 .and. control/=1) lall=.true.
    if(direction<0  .and. level==1 .and. control==1) lall=.true.
    call iotk_scan_tag(unit,direction,r_control,tag,binary,ierr)
    if(ierr/=0) then
      call iotk_error_issue(ierr,"iotk_scan",__FILE__,__LINE__)
# 2160 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
      return
    end if
    if(r_control==4) cycle
    if(lall .or. r_control==5) then
      call iotk_tag_parse(tag,r_name,attr,ierr)
      if(ierr/=0) then
        call iotk_error_issue(ierr,"iotk_scan",__FILE__,__LINE__)
# 2167 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
# 2167 "iotk_external.spp"
call iotk_error_msg(ierr,'direction')
# 2167 "iotk_external.spp"
call iotk_error_write(ierr,"control",control)
        return
      end if
    end if
    match = lall .and. r_control==control .and. iotk_strcomp(r_name,iotk_strtrim(name))
    if(r_control==5) then
      if(r_name=="iotk") then
        call iotk_check_iotk_attr(unit,attr,ierr)
        if(ierr/=0) then
          call iotk_error_issue(ierr,"iotk_scan",__FILE__,__LINE__)
# 2176 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
          return
        end if
      end if
    end if
    select case(direction)
    case(0:)
      select case(r_control)
      case(1)
        if(level==0 .and. match) exit
        level = level + 1
      case(2)
        if(level==0 .and. match) exit
        if(level==0) then
          call iotk_scan_tag(unit,-1,r_control,tag,binary,ierr)
          if(ierr/=0) then
            call iotk_error_issue(ierr,"iotk_scan",__FILE__,__LINE__)
# 2192 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
            return
          end if
          call iotk_error_issue(ierr,"iotk_scan",__FILE__,__LINE__)
# 2195 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
# 2195 "iotk_external.spp"
call iotk_error_msg(ierr,'direction')
          ierr = - ierr
          return
        end if
        level = level - 1
      case(3)
        if(level==0 .and. match) exit
      case(5)
        if(level==0 .and. match) exit
      end select
    case(:-1)
      select case(r_control)
      case(2)
        level = level + 1
      case(1)
        if(level==1 .and. match) exit
        if(level==0) then
          call iotk_scan_tag(unit,+1,r_control,tag,binary,ierr)
          if(ierr/=0) then
            call iotk_error_issue(ierr,"iotk_scan",__FILE__,__LINE__)
# 2214 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
            return
          end if
          call iotk_error_issue(ierr,"iotk_scan",__FILE__,__LINE__)
# 2217 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
          ierr = - ierr
          return
        end if
        level = level - 1
      case(3)
        if(level==0 .and. match) exit
      case(5)
        if(level==0 .and. match) exit
      end select
    end select
  end do
  if(direction<0) then
    call iotk_scan_tag(unit,+1,r_control,tag,binary,ierr)
    if(ierr/=0) then
      call iotk_error_issue(ierr,"iotk_scan",__FILE__,__LINE__)
# 2232 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
    end if
  end if
end subroutine iotk_scan_x

# 2238 "iotk_external.spp"
subroutine iotk_getline_x(unit,line,length,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer,            intent(in)  :: unit
  character(len=*),   intent(out) :: line
  integer, optional,  intent(out) :: length
  integer, optional,  intent(out) :: ierr
  integer :: iostat
#if defined __IOTK_WORKAROUND1
  character(len=iotk_linlenx) :: buffer
#else
  character(len=iotk_getline_buffer) :: buffer
#endif
  integer :: pos,buflen,ierrl,pos1
  logical :: eor
  pos = 0
  ierrl=0
#ifdef __IOTK_WORKAROUND1
! Prima soluzione: Lettura advancing
  read(unit,"(a)",iostat=iostat) buffer
  if(iostat/=0) then
    call iotk_error_issue(ierrl,"iotk_getline",__FILE__,__LINE__)
# 2260 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 2260 "iotk_external.spp"
call iotk_error_msg(ierrl,'')
# 2260 "iotk_external.spp"
call iotk_error_write(ierrl,"iostat",iostat)
    goto 2
  end if
  buflen = len_trim(buffer)
  line(1:buflen) = buffer(1:buflen)
  line(buflen+1:buflen+1) = iotk_eos
  if(present(length)) length = buflen
#else
  do
    eor = .true.
    read(unit,"(a)",iostat=iostat,eor=1,size=buflen,advance="no") buffer
3   continue
    eor = .false.
    if(iostat/=0) then
      call iotk_error_issue(ierrl,"iotk_getline",__FILE__,__LINE__)
# 2274 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
      call iotk_error_write(ierrl,"iostat",iostat)
      goto 2
    end if
1   continue
    if(buflen==0) exit
    pos1 = min(pos+buflen,len(line))
    line(pos+1:pos1) = buffer(1:pos1-pos)
    pos = pos1
    if(eor .or. pos>=len(line)) exit
  end do
  if(pos<len(line)) line(pos+1:pos+1) = iotk_eos
  if(present(length)) length = pos
  if(pos>=len(line)) then
    call iotk_error_issue(ierrl,"iotk_getline",__FILE__,__LINE__)
# 2288 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 2288 "iotk_external.spp"
call iotk_error_msg(ierrl,'Line too long')
    read(unit,*,iostat=iostat)
    if(iostat/=0) then
      call iotk_error_issue(ierrl,"iotk_getline",__FILE__,__LINE__)
# 2291 "iotk_external.spp"
call iotk_error_msg(ierrl,"CVS Revision: 1.15 ")
# 2291 "iotk_external.spp"
call iotk_error_msg(ierrl,'iostat')
      goto 2
    end if
  end if
#endif
2 continue
  if(present(ierr)) then
    ierr = ierrl
  else
    if(ierrl/=0) call iotk_error_handler(ierrl)
  end if
  
end subroutine iotk_getline_x

# 2306 "iotk_external.spp"
function iotk_index_scal(index)
  use iotk_base
  use iotk_interface
  integer,           intent(in) :: index
  character(len=range(index)+3) :: iotk_index_scal
  iotk_index_scal="."//iotk_itoa(index)
end function iotk_index_scal
  
# 2315 "iotk_external.spp"
function iotk_index_vec(index)
  use iotk_base
  use iotk_interface
  implicit none
  integer,                         intent(in) :: index(:)
  character(len=(range(index)+3)*size(index)) :: iotk_index_vec
  integer :: length,i
  length = 0
  iotk_index_vec = " "
  do i = 1,size(index)
    iotk_index_vec(length+1:length+1+(range(index)+3)) = "."//iotk_itoa(index(i))
    length = len_trim(iotk_index_vec)
  end do
end function iotk_index_vec


# 2332 "iotk_external.spp"
subroutine iotk_tag_parse_x(tag,name,attr,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  character(iotk_taglenx), intent(in)  :: tag
  character(iotk_namlenx), intent(out) :: name
  character(iotk_attlenx), intent(out) :: attr
  integer,                 intent(out) :: ierr
  integer :: pos,lenatt,lentag
  ierr = 0
  lentag=iotk_strlen(tag)
  if(verify(tag(1:1),iotk_namcharfirst)/=0) then
    call iotk_error_issue(ierr,"iotk_tag_parse",__FILE__,__LINE__)
# 2344 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
# 2344 "iotk_external.spp"
call iotk_error_msg(ierr,'Wrong syntax in tag')
    call iotk_error_write(ierr,"tag",tag(1:lentag))
    return
  end if
  pos = scan(tag(1:lentag)," ")
  if(pos==0) pos=lentag+1
  if(pos>len(name)+1) then
    call iotk_error_issue(ierr,"iotk_tag_parse",__FILE__,__LINE__)
# 2351 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
# 2351 "iotk_external.spp"
call iotk_error_msg(ierr,'Tag name too long')
    return
   end if
  name = tag(1:pos-1)
  if(pos<=len(name)) name(pos:pos) = iotk_eos
  lenatt = len_trim(tag(pos:lentag))
  if(lenatt>iotk_attlenx) then
    call iotk_error_issue(ierr,"iotk_tag_parse",__FILE__,__LINE__)
# 2358 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
# 2358 "iotk_external.spp"
call iotk_error_msg(ierr,'Attribute string too long')
    return
  end if
  if(lenatt>0) then
    attr(1:lenatt) = tag(pos:pos+lenatt-1)
    if(lenatt+1<=len(attr)) attr(lenatt+1:lenatt+1)=iotk_eos
  else
    attr(1:1)=iotk_eos
  end if
end subroutine iotk_tag_parse_x

# 2370 "iotk_external.spp"
function iotk_complete_filepath_x(newfile,oldfile)
  use iotk_base
  use iotk_interface
  implicit none
  character(len=*), intent(in) :: newfile
  character(len=*), intent(in) :: oldfile
  character(len=len(newfile)+len(oldfile)) :: iotk_complete_filepath_x
  character(len=len(oldfile)) :: prefix
  integer :: pos
  if(newfile(1:1)=="/") then
    iotk_complete_filepath_x = newfile
  else
    pos = scan(oldfile,"/",back=.true.)
    prefix = " "
    if(pos>0) prefix = oldfile(1:pos)
    iotk_complete_filepath_x = trim(prefix)//trim(newfile)
  end if
end function iotk_complete_filepath_x

# 2390 "iotk_external.spp"
function iotk_check_name_x(name)
  use iotk_base
  use iotk_interface
  implicit none
  character(len=*), intent(in) :: name
  logical                      :: iotk_check_name_x
! Checks a single name
  integer :: len_name
  iotk_check_name_x = .true.
  len_name = len_trim(name)
  if(len_name>iotk_namlenx) iotk_check_name_x = .false.
  if(verify(name(1:1),iotk_namcharfirst)/=0) iotk_check_name_x = .false.
  if(len_name>1) then
    if(verify(name(2:len_name),iotk_namchar)/=0) iotk_check_name_x = .false.
  end if
end function iotk_check_name_x

# 2408 "iotk_external.spp"
function iotk_atol_x(a,check)
  use iotk_base
  use iotk_interface
  implicit none
  character(len=*),  intent(in)  :: a
  logical, optional, intent(out) :: check
  logical :: iotk_atol_x
  integer :: i
  iotk_atol_x = .false.
  if(present(check)) check = .false.
  if(len(a)==0) return
  do i = 1 , len(a)
    if(a(i:i)/=" " .and. a(i:i)/=".") exit
  end do
  if(i>len(a)) return
  if(present(check)) check = .true.
  if(a(i:i)=="T" .or. a(i:i)=="t") then
    iotk_atol_x = .true.
  else if(a(i:i)=="F" .or. a(i:i)=="f") then
    iotk_atol_x = .false.
  else
    if(present(check)) check = .false.
  end if
end function iotk_atol_x

# 2434 "iotk_external.spp"
#ifdef __IOTK_INTEGER1
subroutine iotk_atoi1(i,a,check)
  use iotk_base
  use iotk_interface
  implicit none
  character(len=*),                  intent(in)  :: a
  logical, optional,                 intent(out) :: check
  integer(kind=__IOTK_INTEGER1), intent(out) :: i
  logical :: minus
  integer :: pos,index,ii
! AGGIUNGERE DEI CHECK SULL'OVERFLOW
  minus = .false.
  i = 0
  if(present(check)) check = .false.
  if(len(a)==0) return
  do ii = 1 , len(a)
    if(a(ii:ii)/=" ") exit
  end do
  if(ii>len(a)) return
  if(a(ii:ii)=="-") then
    minus = .true.
    ii = ii + 1
  else if(a(ii:ii)=="+") then
    ii = ii + 1
  end if
  if(ii>len(a)) return
  pos = ii
  do ii=pos,len(a)
    index = iachar(a(ii:ii)) - iachar("0")
    if(index<0 .or. index>9) exit
    i = i*10 + index
  end do
  if(minus) i = - i
  if(present(check)) then
    pos = ii
    do ii=pos,len(a)
      if(a(ii:ii)/=" ") return
    end do
    check = .true.
  end if
end subroutine iotk_atoi1
#endif
# 2434 "iotk_external.spp"
#ifdef __IOTK_INTEGER2
subroutine iotk_atoi2(i,a,check)
  use iotk_base
  use iotk_interface
  implicit none
  character(len=*),                  intent(in)  :: a
  logical, optional,                 intent(out) :: check
  integer(kind=__IOTK_INTEGER2), intent(out) :: i
  logical :: minus
  integer :: pos,index,ii
! AGGIUNGERE DEI CHECK SULL'OVERFLOW
  minus = .false.
  i = 0
  if(present(check)) check = .false.
  if(len(a)==0) return
  do ii = 1 , len(a)
    if(a(ii:ii)/=" ") exit
  end do
  if(ii>len(a)) return
  if(a(ii:ii)=="-") then
    minus = .true.
    ii = ii + 1
  else if(a(ii:ii)=="+") then
    ii = ii + 1
  end if
  if(ii>len(a)) return
  pos = ii
  do ii=pos,len(a)
    index = iachar(a(ii:ii)) - iachar("0")
    if(index<0 .or. index>9) exit
    i = i*10 + index
  end do
  if(minus) i = - i
  if(present(check)) then
    pos = ii
    do ii=pos,len(a)
      if(a(ii:ii)/=" ") return
    end do
    check = .true.
  end if
end subroutine iotk_atoi2
#endif
# 2434 "iotk_external.spp"
#ifdef __IOTK_INTEGER3
subroutine iotk_atoi3(i,a,check)
  use iotk_base
  use iotk_interface
  implicit none
  character(len=*),                  intent(in)  :: a
  logical, optional,                 intent(out) :: check
  integer(kind=__IOTK_INTEGER3), intent(out) :: i
  logical :: minus
  integer :: pos,index,ii
! AGGIUNGERE DEI CHECK SULL'OVERFLOW
  minus = .false.
  i = 0
  if(present(check)) check = .false.
  if(len(a)==0) return
  do ii = 1 , len(a)
    if(a(ii:ii)/=" ") exit
  end do
  if(ii>len(a)) return
  if(a(ii:ii)=="-") then
    minus = .true.
    ii = ii + 1
  else if(a(ii:ii)=="+") then
    ii = ii + 1
  end if
  if(ii>len(a)) return
  pos = ii
  do ii=pos,len(a)
    index = iachar(a(ii:ii)) - iachar("0")
    if(index<0 .or. index>9) exit
    i = i*10 + index
  end do
  if(minus) i = - i
  if(present(check)) then
    pos = ii
    do ii=pos,len(a)
      if(a(ii:ii)/=" ") return
    end do
    check = .true.
  end if
end subroutine iotk_atoi3
#endif
# 2434 "iotk_external.spp"
#ifdef __IOTK_INTEGER4
subroutine iotk_atoi4(i,a,check)
  use iotk_base
  use iotk_interface
  implicit none
  character(len=*),                  intent(in)  :: a
  logical, optional,                 intent(out) :: check
  integer(kind=__IOTK_INTEGER4), intent(out) :: i
  logical :: minus
  integer :: pos,index,ii
! AGGIUNGERE DEI CHECK SULL'OVERFLOW
  minus = .false.
  i = 0
  if(present(check)) check = .false.
  if(len(a)==0) return
  do ii = 1 , len(a)
    if(a(ii:ii)/=" ") exit
  end do
  if(ii>len(a)) return
  if(a(ii:ii)=="-") then
    minus = .true.
    ii = ii + 1
  else if(a(ii:ii)=="+") then
    ii = ii + 1
  end if
  if(ii>len(a)) return
  pos = ii
  do ii=pos,len(a)
    index = iachar(a(ii:ii)) - iachar("0")
    if(index<0 .or. index>9) exit
    i = i*10 + index
  end do
  if(minus) i = - i
  if(present(check)) then
    pos = ii
    do ii=pos,len(a)
      if(a(ii:ii)/=" ") return
    end do
    check = .true.
  end if
end subroutine iotk_atoi4
#endif
# 2477 "iotk_external.spp"

# 2479 "iotk_external.spp"
#ifdef __IOTK_INTEGER1
function iotk_itoa1(i,length)
  use iotk_base
  use iotk_interface
  implicit none
  integer(kind=__IOTK_INTEGER1), intent(in)  :: i
  integer, optional, intent(out)                 :: length
  character(len=range(i)+2) :: iotk_itoa1
  integer(kind=__IOTK_INTEGER1) :: itmp
  integer :: pos,pos1
  character(len=range(i)+2) :: tmp
  itmp = abs(i)
  do pos = 1 , len(tmp)
    tmp(pos:pos) = achar( modulo(itmp,int(10,kind(itmp))) + iachar("0") )
    itmp = itmp/10
    if(itmp==0) exit
    if(pos==len(tmp)) exit
  end do
  if(i<0) then
    tmp(pos+1:pos+1)="-"
    pos = pos + 1
  end if
  do pos1=1,pos
    iotk_itoa1(pos1:pos1) = tmp(pos-pos1+1:pos-pos1+1)
  end do
  if(present(length)) length = pos
  do pos1=pos+1,len(iotk_itoa1)
    iotk_itoa1(pos1:pos1) = " "
  end do
end function iotk_itoa1
#endif
# 2479 "iotk_external.spp"
#ifdef __IOTK_INTEGER2
function iotk_itoa2(i,length)
  use iotk_base
  use iotk_interface
  implicit none
  integer(kind=__IOTK_INTEGER2), intent(in)  :: i
  integer, optional, intent(out)                 :: length
  character(len=range(i)+2) :: iotk_itoa2
  integer(kind=__IOTK_INTEGER2) :: itmp
  integer :: pos,pos1
  character(len=range(i)+2) :: tmp
  itmp = abs(i)
  do pos = 1 , len(tmp)
    tmp(pos:pos) = achar( modulo(itmp,int(10,kind(itmp))) + iachar("0") )
    itmp = itmp/10
    if(itmp==0) exit
    if(pos==len(tmp)) exit
  end do
  if(i<0) then
    tmp(pos+1:pos+1)="-"
    pos = pos + 1
  end if
  do pos1=1,pos
    iotk_itoa2(pos1:pos1) = tmp(pos-pos1+1:pos-pos1+1)
  end do
  if(present(length)) length = pos
  do pos1=pos+1,len(iotk_itoa2)
    iotk_itoa2(pos1:pos1) = " "
  end do
end function iotk_itoa2
#endif
# 2479 "iotk_external.spp"
#ifdef __IOTK_INTEGER3
function iotk_itoa3(i,length)
  use iotk_base
  use iotk_interface
  implicit none
  integer(kind=__IOTK_INTEGER3), intent(in)  :: i
  integer, optional, intent(out)                 :: length
  character(len=range(i)+2) :: iotk_itoa3
  integer(kind=__IOTK_INTEGER3) :: itmp
  integer :: pos,pos1
  character(len=range(i)+2) :: tmp
  itmp = abs(i)
  do pos = 1 , len(tmp)
    tmp(pos:pos) = achar( modulo(itmp,int(10,kind(itmp))) + iachar("0") )
    itmp = itmp/10
    if(itmp==0) exit
    if(pos==len(tmp)) exit
  end do
  if(i<0) then
    tmp(pos+1:pos+1)="-"
    pos = pos + 1
  end if
  do pos1=1,pos
    iotk_itoa3(pos1:pos1) = tmp(pos-pos1+1:pos-pos1+1)
  end do
  if(present(length)) length = pos
  do pos1=pos+1,len(iotk_itoa3)
    iotk_itoa3(pos1:pos1) = " "
  end do
end function iotk_itoa3
#endif
# 2479 "iotk_external.spp"
#ifdef __IOTK_INTEGER4
function iotk_itoa4(i,length)
  use iotk_base
  use iotk_interface
  implicit none
  integer(kind=__IOTK_INTEGER4), intent(in)  :: i
  integer, optional, intent(out)                 :: length
  character(len=range(i)+2) :: iotk_itoa4
  integer(kind=__IOTK_INTEGER4) :: itmp
  integer :: pos,pos1
  character(len=range(i)+2) :: tmp
  itmp = abs(i)
  do pos = 1 , len(tmp)
    tmp(pos:pos) = achar( modulo(itmp,int(10,kind(itmp))) + iachar("0") )
    itmp = itmp/10
    if(itmp==0) exit
    if(pos==len(tmp)) exit
  end do
  if(i<0) then
    tmp(pos+1:pos+1)="-"
    pos = pos + 1
  end if
  do pos1=1,pos
    iotk_itoa4(pos1:pos1) = tmp(pos-pos1+1:pos-pos1+1)
  end do
  if(present(length)) length = pos
  do pos1=pos+1,len(iotk_itoa4)
    iotk_itoa4(pos1:pos1) = " "
  end do
end function iotk_itoa4
#endif
# 2511 "iotk_external.spp"

# 2513 "iotk_external.spp"
#ifdef __IOTK_LOGICAL1
function iotk_ltoa1(l)
  use iotk_base
  use iotk_interface
  implicit none
  logical(kind=__IOTK_LOGICAL1), intent(in) :: l
  character                                     :: iotk_ltoa1
  if(l) then
    iotk_ltoa1 = "T"
  else
    iotk_ltoa1 = "F"
  end if
end function iotk_ltoa1
#endif
# 2513 "iotk_external.spp"
#ifdef __IOTK_LOGICAL2
function iotk_ltoa2(l)
  use iotk_base
  use iotk_interface
  implicit none
  logical(kind=__IOTK_LOGICAL2), intent(in) :: l
  character                                     :: iotk_ltoa2
  if(l) then
    iotk_ltoa2 = "T"
  else
    iotk_ltoa2 = "F"
  end if
end function iotk_ltoa2
#endif
# 2513 "iotk_external.spp"
#ifdef __IOTK_LOGICAL3
function iotk_ltoa3(l)
  use iotk_base
  use iotk_interface
  implicit none
  logical(kind=__IOTK_LOGICAL3), intent(in) :: l
  character                                     :: iotk_ltoa3
  if(l) then
    iotk_ltoa3 = "T"
  else
    iotk_ltoa3 = "F"
  end if
end function iotk_ltoa3
#endif
# 2513 "iotk_external.spp"
#ifdef __IOTK_LOGICAL4
function iotk_ltoa4(l)
  use iotk_base
  use iotk_interface
  implicit none
  logical(kind=__IOTK_LOGICAL4), intent(in) :: l
  character                                     :: iotk_ltoa4
  if(l) then
    iotk_ltoa4 = "T"
  else
    iotk_ltoa4 = "F"
  end if
end function iotk_ltoa4
#endif
# 2528 "iotk_external.spp"

function iotk_basefmt_x(type,ikind,ilen)
  use iotk_base
  use iotk_interface
  implicit none
  character(100)           :: iotk_basefmt_x
  integer,      intent(in) :: ikind,ilen
  character(*), intent(in) :: type
  integer :: nexp,exp,ndig,baselen
  logical, save :: first_call = .true.
# 2539 "iotk_external.spp"
#ifdef __IOTK_INTEGER1
  integer (__IOTK_INTEGER1) :: example_INTEGER1
  character(46), save :: save_basefmt_integer1 = ""
#endif
#ifdef __IOTK_REAL1
  real (__IOTK_REAL1) :: example_REAL1
  character(46), save :: save_basefmt_real1 = ""
#endif
# 2539 "iotk_external.spp"
#ifdef __IOTK_INTEGER2
  integer (__IOTK_INTEGER2) :: example_INTEGER2
  character(46), save :: save_basefmt_integer2 = ""
#endif
#ifdef __IOTK_REAL2
  real (__IOTK_REAL2) :: example_REAL2
  character(46), save :: save_basefmt_real2 = ""
#endif
# 2539 "iotk_external.spp"
#ifdef __IOTK_INTEGER3
  integer (__IOTK_INTEGER3) :: example_INTEGER3
  character(46), save :: save_basefmt_integer3 = ""
#endif
#ifdef __IOTK_REAL3
  real (__IOTK_REAL3) :: example_REAL3
  character(46), save :: save_basefmt_real3 = ""
#endif
# 2539 "iotk_external.spp"
#ifdef __IOTK_INTEGER4
  integer (__IOTK_INTEGER4) :: example_INTEGER4
  character(46), save :: save_basefmt_integer4 = ""
#endif
#ifdef __IOTK_REAL4
  real (__IOTK_REAL4) :: example_REAL4
  character(46), save :: save_basefmt_real4 = ""
#endif
# 2548 "iotk_external.spp"
  if(first_call) then
# 2550 "iotk_external.spp"
#ifdef __IOTK_INTEGER1
    baselen = range(example_INTEGER1) + 1
    save_basefmt_integer1 = "(i"//trim(iotk_itoa(baselen))//")"
#endif
#ifdef __IOTK_REAL1
    ndig = precision(example_REAL1)+1
    exp = range(example_REAL1)+1
    nexp = 1
    do
      if(exp < 10) exit
      exp = exp / 10
      nexp = nexp + 1
    end do
    baselen = nexp+ndig-1+5
    save_basefmt_real1 = "(ES"//trim(iotk_itoa(baselen))//"." &
                //trim(iotk_itoa(ndig-1))//"E"//trim(iotk_itoa(nexp))//")"

#endif
# 2550 "iotk_external.spp"
#ifdef __IOTK_INTEGER2
    baselen = range(example_INTEGER2) + 1
    save_basefmt_integer2 = "(i"//trim(iotk_itoa(baselen))//")"
#endif
#ifdef __IOTK_REAL2
    ndig = precision(example_REAL2)+1
    exp = range(example_REAL2)+1
    nexp = 1
    do
      if(exp < 10) exit
      exp = exp / 10
      nexp = nexp + 1
    end do
    baselen = nexp+ndig-1+5
    save_basefmt_real2 = "(ES"//trim(iotk_itoa(baselen))//"." &
                //trim(iotk_itoa(ndig-1))//"E"//trim(iotk_itoa(nexp))//")"

#endif
# 2550 "iotk_external.spp"
#ifdef __IOTK_INTEGER3
    baselen = range(example_INTEGER3) + 1
    save_basefmt_integer3 = "(i"//trim(iotk_itoa(baselen))//")"
#endif
#ifdef __IOTK_REAL3
    ndig = precision(example_REAL3)+1
    exp = range(example_REAL3)+1
    nexp = 1
    do
      if(exp < 10) exit
      exp = exp / 10
      nexp = nexp + 1
    end do
    baselen = nexp+ndig-1+5
    save_basefmt_real3 = "(ES"//trim(iotk_itoa(baselen))//"." &
                //trim(iotk_itoa(ndig-1))//"E"//trim(iotk_itoa(nexp))//")"

#endif
# 2550 "iotk_external.spp"
#ifdef __IOTK_INTEGER4
    baselen = range(example_INTEGER4) + 1
    save_basefmt_integer4 = "(i"//trim(iotk_itoa(baselen))//")"
#endif
#ifdef __IOTK_REAL4
    ndig = precision(example_REAL4)+1
    exp = range(example_REAL4)+1
    nexp = 1
    do
      if(exp < 10) exit
      exp = exp / 10
      nexp = nexp + 1
    end do
    baselen = nexp+ndig-1+5
    save_basefmt_real4 = "(ES"//trim(iotk_itoa(baselen))//"." &
                //trim(iotk_itoa(ndig-1))//"E"//trim(iotk_itoa(nexp))//")"

#endif
# 2569 "iotk_external.spp"
    first_call = .false.
  end if
  select case(type)
  case("LOGICAL")
    iotk_basefmt_x = "(l1)"
  case("INTEGER")
    select case(ikind)
# 2577 "iotk_external.spp"
#ifdef __IOTK_INTEGER1
    case(__IOTK_INTEGER1)
      iotk_basefmt_x = save_basefmt_integer1
#endif
# 2577 "iotk_external.spp"
#ifdef __IOTK_INTEGER2
    case(__IOTK_INTEGER2)
      iotk_basefmt_x = save_basefmt_integer2
#endif
# 2577 "iotk_external.spp"
#ifdef __IOTK_INTEGER3
    case(__IOTK_INTEGER3)
      iotk_basefmt_x = save_basefmt_integer3
#endif
# 2577 "iotk_external.spp"
#ifdef __IOTK_INTEGER4
    case(__IOTK_INTEGER4)
      iotk_basefmt_x = save_basefmt_integer4
#endif
# 2582 "iotk_external.spp"
    end select
  case("REAL")
    select case(ikind)
# 2586 "iotk_external.spp"
#ifdef __IOTK_REAL1
    case(__IOTK_REAL1)
      iotk_basefmt_x = save_basefmt_real1
#endif
# 2586 "iotk_external.spp"
#ifdef __IOTK_REAL2
    case(__IOTK_REAL2)
      iotk_basefmt_x = save_basefmt_real2
#endif
# 2586 "iotk_external.spp"
#ifdef __IOTK_REAL3
    case(__IOTK_REAL3)
      iotk_basefmt_x = save_basefmt_real3
#endif
# 2586 "iotk_external.spp"
#ifdef __IOTK_REAL4
    case(__IOTK_REAL4)
      iotk_basefmt_x = save_basefmt_real4
#endif
# 2591 "iotk_external.spp"
    end select
  case("COMPLEX")
    select case(ikind)
# 2595 "iotk_external.spp"
#ifdef __IOTK_REAL1
    case(__IOTK_REAL1)
      iotk_basefmt_x = "("//trim(save_basefmt_real1)//",',',"//trim(save_basefmt_real1)//")"
#endif
# 2595 "iotk_external.spp"
#ifdef __IOTK_REAL2
    case(__IOTK_REAL2)
      iotk_basefmt_x = "("//trim(save_basefmt_real2)//",',',"//trim(save_basefmt_real2)//")"
#endif
# 2595 "iotk_external.spp"
#ifdef __IOTK_REAL3
    case(__IOTK_REAL3)
      iotk_basefmt_x = "("//trim(save_basefmt_real3)//",',',"//trim(save_basefmt_real3)//")"
#endif
# 2595 "iotk_external.spp"
#ifdef __IOTK_REAL4
    case(__IOTK_REAL4)
      iotk_basefmt_x = "("//trim(save_basefmt_real4)//",',',"//trim(save_basefmt_real4)//")"
#endif
# 2600 "iotk_external.spp"
    end select
  case("CHARACTER")
    if(ilen>=0) then
      iotk_basefmt_x = "(a"//trim(iotk_itoa(ilen))//")"
    else
      iotk_basefmt_x = "(a)"
    end if
  end select
end function iotk_basefmt_x

function iotk_wfmt_x(type,ikind,isize,ilen)
  use iotk_base
  use iotk_interface
  implicit none
  integer,       intent(in)  :: ikind
  character(*),  intent(in)  :: type
  integer,       intent(in)  :: isize
  integer,       intent(in)  :: ilen
  character(150)             :: iotk_wfmt_x
  if(isize==1) then
    iotk_wfmt_x = "("//trim(iotk_basefmt(type,ikind,ilen))//")"
  else
    iotk_wfmt_x = "("//trim(iotk_itoa(isize))//"("//trim(iotk_basefmt(type,ikind,ilen)) &
                //",:,','))"
  end if
!write(0,*) "FMT:"//trim(iotk_wfmt_x)
end function iotk_wfmt_x

function iotk_toupper_x(str)
  use iotk_base
  use iotk_interface
  implicit none
  character(len=*), intent(in) :: str
  character(len=len(str))      :: iotk_toupper_x
  integer :: i,pos
  do i = 1,len(str)
    if(str(i:i)==iotk_eos) exit
    pos=scan(lowalphabet,str(i:i))
    if(pos==0) then
      iotk_toupper_x(i:i) = str(i:i)
    else
      iotk_toupper_x(i:i) = upalphabet(pos:pos)
    end if
  end do
  if(i<=len(iotk_toupper_x)) iotk_toupper_x(i:i) = iotk_eos
end function iotk_toupper_x

function iotk_tolower_x(str)
  use iotk_base
  use iotk_interface
  implicit none
  character(len=*), intent(in) :: str
  character(len=len(str))      :: iotk_tolower_x
  integer :: i,pos
  do i = 1,len(str)
    if(str(i:i)==iotk_eos) exit
    pos=scan(upalphabet,str(i:i))
    if(pos==0) then
      iotk_tolower_x(i:i) = str(i:i)
    else
      iotk_tolower_x(i:i) = lowalphabet(pos:pos)
    end if
  end do
  if(i<=len(iotk_tolower_x)) iotk_tolower_x(i:i) = iotk_eos
end function iotk_tolower_x

subroutine iotk_escape_x(to,from)
  use iotk_base
  use iotk_interface
  implicit none
  character(len=*), intent(in) :: from
  character(len=*), intent(out):: to
  integer :: pos,pos1,semic,fromlen
  pos = 1
  pos1 = 1
  fromlen = iotk_strlen(from)
  do  
    if(pos>fromlen) exit
    if(from(pos:pos)=="&" .and. pos/=fromlen) then
      semic = scan(from(pos+1:fromlen),";")
      if(semic<=1) to(pos1:pos1)="&"
      select case(from(pos+1:pos+semic-1))
      case("amp")
        to(pos1:pos1)="&"
      case("lt")
        to(pos1:pos1)="<"
      case("gt")
        to(pos1:pos1)=">"
      case("quot")
        to(pos1:pos1)='"'
      case("apos")
        to(pos1:pos1)="'"
      case default
        to(pos1:pos1+semic) = from(pos:pos+semic)
        pos1 = pos1 + semic
      end select
      pos = pos + semic
    else
      to(pos1:pos1)=from(pos:pos)
    end if
    pos = pos + 1
    pos1 = pos1 + 1
    if(pos1>len(to)) exit
  end do  
  if(pos1<=len(to)) to(pos1:pos1)=iotk_eos
end subroutine iotk_escape_x

subroutine iotk_deescape_x(to,from,quot,apos)
  use iotk_base
  use iotk_interface
  implicit none
  character(len=*), intent(in)  :: from
  character(len=*), intent(out) :: to
  logical, optional, intent(in) :: quot,apos
  logical :: lquot,lapos
  integer :: pos,pos1
  lquot=.false.
  lapos=.false.
  if(present(quot)) lquot = quot
  if(present(apos)) lapos = apos
  pos = 1
  pos1 = 1
  do
    if(pos>len(from) .or. pos1>len(to)) exit ! i due test devono essere separati
    if(from(pos:pos)==iotk_eos) exit
    select case(from(pos:pos))
    case("&")
      if(pos1+4<=len(to)) to(pos1:pos1+4)="&amp;"
      pos1=pos1+4
    case("<")
      if(pos1+3<=len(to)) to(pos1:pos1+3)="&lt;"
      pos1=pos1+3
    case(">")
      if(pos1+3<=len(to)) to(pos1:pos1+3)="&gt;"
      pos1=pos1+3
    case('"')
      if(lquot) then
        if(pos1+5<=len(to)) to(pos1:pos1+5)="&quot;"
        pos1=pos1+5
      else
        to(pos1:pos1) = from(pos:pos)
      end if
    case("'")
      if(lapos) then
        if(pos1+5<=len(to)) to(pos1:pos1+5)="&apos;"
        pos1=pos1+5
      else
        to(pos1:pos1) = from(pos:pos)
      end if
    case default
      to(pos1:pos1) = from(pos:pos)
    end select
    pos = pos + 1
    pos1 = pos1 + 1
  end do
  if(pos1<=len(to)) to(pos1:pos1)=iotk_eos
end subroutine iotk_deescape_x

function iotk_strtrim_x(str)
  use iotk_base
  use iotk_interface
  implicit none
  character(len=*), intent(in) :: str
  character(len=len(str))      :: iotk_strtrim_x
  integer :: lentrim
  lentrim = len_trim(str(1:iotk_strlen(str)))
  iotk_strtrim_x(1:lentrim) = str(1:lentrim)
  if(lentrim<=len(iotk_strtrim_x)) iotk_strtrim_x(lentrim+1:lentrim+1) = iotk_eos
end function iotk_strtrim_x

function iotk_strlen_trim_x(str)
  use iotk_base
  use iotk_interface
  implicit none
  character(len=*), intent(in) :: str
  integer                      :: iotk_strlen_trim_x
  iotk_strlen_trim_x = len_trim(str(1:iotk_strlen(str)))
end function iotk_strlen_trim_x

function iotk_strscan_x(string,set,back)
  use iotk_interface
  implicit none
  character(len=*),  intent(in) :: string
  character(len=*),  intent(in) :: set
  logical, optional, intent(in) :: back
  integer                       :: iotk_strscan_x
  logical :: backl
  backl = .false.
  if(present(back)) backl=back
  iotk_strscan_x = scan(string(1:iotk_strlen(string)),set(1:iotk_strlen(set)),backl)
end function iotk_strscan_x

function iotk_strlen_x(str)
  use iotk_base
  implicit none
  character(len=*), intent(in) :: str
  integer :: iotk_strlen_x
  integer :: pos
  pos = scan(str,iotk_eos) - 1
  if(pos>=0) then
    iotk_strlen_x = pos
  else
    iotk_strlen_x = len(str)
  end if
end function iotk_strlen_x

function iotk_strpad_x(str)
  use iotk_base
  use iotk_interface
  implicit none
  character(len=*), intent(in) :: str
  character(len=len(str))      :: iotk_strpad_x
  integer :: strlen
  strlen = iotk_strlen(str)
  iotk_strpad_x(1:strlen) = str(1:strlen)
  if(strlen<len(iotk_strpad_x)) iotk_strpad_x(strlen+1:) = " "
end function iotk_strpad_x

# 2819 "iotk_external.spp"
subroutine iotk_strcpy_x(to,from,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  character(len=*), intent(out):: to
  character(len=*), intent(in) :: from
  integer,          intent(out):: ierr
  integer :: i,fromlen
  ierr = 0
  do i=1,min(len(from),len(to))
    if(from(i:i)==iotk_eos) exit
    to(i:i)=from(i:i)
  end do
  if(i>len(to) .and. i<=len(from)) then
    if(from(i:i)/=iotk_eos) then
      call iotk_error_issue(ierr,"iotk_strcpy",__FILE__,__LINE__)
# 2834 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
      return
    end if
  end if
  if(i<=len(to)) to(i:i) = iotk_eos
end subroutine iotk_strcpy_x

# 2842 "iotk_external.spp"
subroutine iotk_strcat_x(to,from,ierr)
  use iotk_base
  use iotk_interface
  implicit none
  character(len=*), intent(inout):: to
  character(len=*), intent(in) :: from
  integer,          intent(out):: ierr
  integer :: tolen,fromlen
  ierr = 0
  tolen = iotk_strlen(to)
  fromlen = iotk_strlen(from)
  if(tolen+fromlen>len(to)) then
    call iotk_error_issue(ierr,"iotk_strcat",__FILE__,__LINE__)
# 2854 "iotk_external.spp"
call iotk_error_msg(ierr,"CVS Revision: 1.15 ")
  end if
  if(ierr/=0) return
  to(tolen+1:tolen+fromlen) = from(1:fromlen)
  if(tolen+fromlen+1<=len(to)) to(tolen+fromlen+1:tolen+fromlen+1)=iotk_eos
end subroutine iotk_strcat_x

# 2862 "iotk_external.spp"
function iotk_strcomp_x(str1,str2)
  use iotk_base
  implicit none
  logical :: iotk_strcomp_x
  character(len=*), intent(in) :: str1,str2
  integer :: i
  iotk_strcomp_x = .false.
  do i=1,min(len(str1),len(str2))
    if(str1(i:i)/=str2(i:i)) return
    if(str1(i:i)==iotk_eos) exit
  end do
  if(i>len(str1)) then
    if(i<=len(str2)) then
      if(str2(i:i)/=iotk_eos) return
    end if
  else if(i>len(str2)) then
    if(i<=len(str1)) then
      if(str1(i:i)/=iotk_eos) return
    end if
  end if
  iotk_strcomp_x = .true.
end function iotk_strcomp_x


! ERROR ROUTINES
subroutine iotk_error_init_e(error)
  use iotk_base
  use iotk_interface
  implicit none
  type(iotk_error), intent(out) :: error
  nullify(error%str)
end subroutine iotk_error_init_e

subroutine iotk_error_init_i(ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer, intent(out) :: ierr
  ierr = 0
end subroutine iotk_error_init_i

subroutine iotk_error_clear_e(error)
  use iotk_base
  use iotk_interface
  implicit none
  type(iotk_error), intent(inout) :: error
  if(associated(error%str)) deallocate(error%str)
end subroutine iotk_error_clear_e

subroutine iotk_error_clear_i(ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer, intent(inout) :: ierr
  if(abs(ierr)>0 .and. abs(ierr)<=iotk_error_pool_size) then
    if(iotk_error_pool_used(abs(ierr))) then
      call iotk_error_clear(iotk_error_pool(abs(ierr)))
      iotk_error_pool_used(abs(ierr)) = .false.
    end if
  end if
  ierr = 0
end subroutine iotk_error_clear_i

function iotk_error_add_x()
  use iotk_base
  use iotk_interface
  implicit none
  integer :: iotk_error_add_x
  do iotk_error_add_x = 1 , iotk_error_pool_size
    if(.not. iotk_error_pool_used(iotk_error_add_x)) exit
  end do
  if(iotk_error_add_x>iotk_error_pool_size) then
    iotk_error_add_x = iotk_error_pool_size
    if(iotk_error_warn_overflow) then
write(0,*) "Warning: ERROR OVERFLOW"
call iotk_error_print(iotk_error_pool(iotk_error_pool_size),0)
    end if
    call iotk_error_clear(iotk_error_pool(iotk_error_add_x))
  end if
  iotk_error_pool_used(iotk_error_add_x) = .true.
  call iotk_error_init(iotk_error_pool(iotk_error_add_x))
end function iotk_error_add_x

subroutine iotk_error_append_e(error,str)
  use iotk_base
  use iotk_interface
  implicit none
  type(iotk_error), intent(inout) :: error
  character(len=*), intent(in)    :: str
  character, pointer :: tmp(:)
  integer :: i,strlen
  strlen = min(len(str),iotk_error_linelength)
  if(.not.associated(error%str)) then
    allocate(error%str(strlen+1))
    do i = 1 , strlen
      error%str(i) = str(i:i)
    end do
    error%str(strlen+1) = iotk_newline
  else
    tmp => error%str
    allocate(error%str(size(tmp)+strlen+1))
    error%str (1:size(tmp)) = tmp
    do i = 1 , strlen
      error%str (size(tmp)+i) = str(i:i)
    end do
    error%str(size(tmp)+strlen+1) = iotk_newline
    deallocate(tmp)
  end if
end subroutine iotk_error_append_e

subroutine iotk_error_append_i(ierr,str)
  use iotk_base
  use iotk_interface
  implicit none
  integer, intent(inout) :: ierr
  character(len=*), intent(in)    :: str
  if(ierr==0) ierr = iotk_error_add()
  if(abs(ierr)>iotk_error_pool_size) return
  if(.not. iotk_error_pool_used(abs(ierr))) return
  call iotk_error_append(iotk_error_pool(abs(ierr)),str)
end subroutine iotk_error_append_i

subroutine iotk_error_print_e(error,unit)
  use iotk_base
  use iotk_interface
  implicit none
  type(iotk_error), intent(in) :: error
  integer,          intent(in) :: unit
  integer :: i
  if(.not.associated(error%str)) return
  do i=1,size(error%str)
    write(unit,"(a)",advance='no') error%str(i)
  end do
end subroutine iotk_error_print_e

subroutine iotk_error_print_i(ierr,unit)
  use iotk_base
  use iotk_interface
  implicit none
  integer, intent(in) :: ierr
  integer, intent(in) :: unit
  if(ierr==0) return
  if(abs(ierr)>iotk_error_pool_size) return
  if(.not. iotk_error_pool_used(abs(ierr))) return
  call iotk_error_print(iotk_error_pool(abs(ierr)),unit)
end subroutine iotk_error_print_i

subroutine iotk_error_issue_e(error,sub,file,line)
  use iotk_base
  use iotk_interface
  implicit none
  type(iotk_error), intent(inout) :: error
  character(len=*), intent(in)    :: sub
  character(len=*), intent(in)    :: file
  integer,          intent(in)    :: line
  call iotk_error_append(error,"# ERROR IN: "//trim(sub)//" ("//trim(file)//":"//trim(iotk_itoa(line))//")")
end subroutine iotk_error_issue_e

subroutine iotk_error_issue_i(ierr,sub,file,line)
  use iotk_base
  use iotk_interface
  implicit none
  integer,          intent(inout) :: ierr
  character(len=*), intent(in)    :: sub
  character(len=*), intent(in)    :: file
  integer,          intent(in)    :: line
  if(ierr==0) ierr = iotk_error_add()
  if(abs(ierr)>iotk_error_pool_size) return
  if(.not. iotk_error_pool_used(abs(ierr))) return
  call iotk_error_issue(iotk_error_pool(abs(ierr)),sub,file,line)
end subroutine iotk_error_issue_i

subroutine iotk_error_msg_e(error,msg)
  use iotk_base
  use iotk_interface
  implicit none
  type(iotk_error), intent(inout) :: error
  character(len=*), intent(in)    :: msg
  call iotk_error_append(error,"# "//msg)
end subroutine iotk_error_msg_e

subroutine iotk_error_msg_i(ierr,msg)
  use iotk_base
  use iotk_interface
  implicit none
  integer,          intent(inout) :: ierr
  character(len=*), intent(in)    :: msg
  if(ierr==0) ierr = iotk_error_add()
  if(abs(ierr)>iotk_error_pool_size) return
  if(.not. iotk_error_pool_used(abs(ierr))) return
  call iotk_error_msg(iotk_error_pool(abs(ierr)),msg)
end subroutine iotk_error_msg_i

function iotk_error_check_e(error)
  use iotk_base
  use iotk_interface
  implicit none
  type(iotk_error), intent(in) :: error
  logical :: iotk_error_check_e
  iotk_error_check_e = .false.
  if(associated(error%str)) iotk_error_check_e = .true.
end function iotk_error_check_e

function iotk_error_check_i(ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer, intent(in) :: ierr
  logical :: iotk_error_check_i
  iotk_error_check_i = .false.
  if(ierr==0) return
  if(abs(ierr)>iotk_error_pool_size) return
  if(.not. iotk_error_pool_used(abs(ierr))) return
  iotk_error_check_i = .true.
end function iotk_error_check_i

subroutine iotk_error_write_character_e(error,name,val)
  use iotk_base
  use iotk_interface
  implicit none
  type(iotk_error), intent(inout) :: error
  character(len=*), intent(in)    :: name
  character(len=*), intent(in)    :: val
  integer :: namelen,vallen
  namelen=verify(name,alphabet_//numbers//".()%")-1
  if(namelen<0) namelen=len(name)
  vallen =scan  (name,iotk_newline)-1
  if(vallen<0) vallen=len(val)
  call iotk_error_append(error,name(1:namelen)//"="//val(1:vallen))
end subroutine iotk_error_write_character_e

subroutine iotk_error_write_character_i(ierr,name,val)
  use iotk_base
  use iotk_interface
  implicit none
  integer, intent(inout) :: ierr
  character(len=*), intent(in)    :: name
  character(len=*), intent(in)    :: val
  if(ierr==0) ierr = iotk_error_add()
  if(abs(ierr)>iotk_error_pool_size) return
  if(.not. iotk_error_pool_used(abs(ierr))) return
  call iotk_error_write(iotk_error_pool(abs(ierr)),name,val)
end subroutine iotk_error_write_character_i

subroutine iotk_error_write_logical_e(error,name,val)
  use iotk_base
  use iotk_interface
  implicit none
  type(iotk_error), intent(inout) :: error
  character(len=*), intent(in)    :: name
  logical,          intent(in)    :: val
  integer :: namelen
  character :: valc
  namelen=verify(name,alphabet_//numbers//".()%")-1
  if(namelen<0) namelen=len(name)
  valc="F"
  if(val) valc="T"
  call iotk_error_append(error,name(1:namelen)//"="//valc)
end subroutine iotk_error_write_logical_e

subroutine iotk_error_write_logical_i(ierr,name,val)
  use iotk_base
  use iotk_interface
  implicit none
  integer, intent(inout) :: ierr
  character(len=*), intent(in)    :: name
  logical,          intent(in)    :: val
  if(ierr==0) ierr = iotk_error_add()
  if(abs(ierr)>iotk_error_pool_size) return
  if(.not. iotk_error_pool_used(abs(ierr))) return
  call iotk_error_write(iotk_error_pool(abs(ierr)),name,val)
end subroutine iotk_error_write_logical_i 

subroutine iotk_error_write_integer_e(error,name,val)
  use iotk_base
  use iotk_interface
  implicit none
  type(iotk_error), intent(inout) :: error
  character(len=*), intent(in)    :: name
  integer,          intent(in)    :: val
  integer :: namelen
  namelen=verify(name,alphabet_//numbers//".()%")-1
  if(namelen<0) namelen=len(name)
  call iotk_error_append(error,name(1:namelen)//"="//trim(iotk_itoa(val)))
end subroutine iotk_error_write_integer_e

subroutine iotk_error_write_integer_i(ierr,name,val)
  use iotk_base
  use iotk_interface
  implicit none
  integer, intent(inout) :: ierr
  character(len=*), intent(in)    :: name
  integer,          intent(in)    :: val
  if(ierr==0) ierr = iotk_error_add()
  if(abs(ierr)>iotk_error_pool_size) return
  if(.not. iotk_error_pool_used(abs(ierr))) return
  call iotk_error_write(iotk_error_pool(abs(ierr)),name,val)
end subroutine iotk_error_write_integer_i

subroutine iotk_error_scan_character_e(error,name,val)
  use iotk_base
  use iotk_interface
  implicit none
  type(iotk_error), intent(in) :: error
  character(len=*), intent(in) :: name
  character(len=*), intent(out):: val
  integer :: i1,i2,i3
  logical :: newline,found
  val=""
  found = .false.
  if(.not.associated(error%str)) return
  do i1 = size(error%str) , 0 , -1
    newline = .false.
    if(i1==0) newline = .true.
    if(.not.newline) then
      if(error%str(i1)==iotk_newline) newline = .true.
    end if
    if(newline) then
      do i2=1,len(name)
        if(i1+i2 > size(error%str)) goto 1
        if(error%str(i1+i2)/=name(i2:i2)) goto 1
      end do
      if(i1+i2 > size(error%str)) goto 1
      if(error%str(i1+i2)/="=") goto 1 
      found=.true.
      exit
    end if
1 continue
  end do
  val=""
  if(found) then
    do i3=1,len(val)
      if(i1+i2+i3>size(error%str)) exit
      if(error%str(i1+i2+i3)==iotk_newline) exit
      val(i3:i3)=error%str(i1+i2+i3)
    end do
  end if
end subroutine iotk_error_scan_character_e

subroutine iotk_error_scan_character_i(ierr,name,val)
  use iotk_base
  use iotk_interface
  implicit none
  integer, intent(in) :: ierr
  character(len=*), intent(in) :: name
  character(len=*), intent(out):: val
  val = ""
  if(ierr==0) return
  if(abs(ierr)>iotk_error_pool_size) return
  if(.not. iotk_error_pool_used(abs(ierr))) return
  call iotk_error_scan(iotk_error_pool(abs(ierr)),name,val)
end subroutine iotk_error_scan_character_i

subroutine iotk_error_scan_logical_e(error,name,val)
  use iotk_base
  use iotk_interface
  implicit none
  type(iotk_error), intent(in) :: error
  character(len=*), intent(in) :: name
  logical,          intent(out):: val
  character :: valc
  val = .false.
  call iotk_error_scan(error,name,valc)
  if(valc=="T" .or. valc=="t") val=.true.
end subroutine iotk_error_scan_logical_e

subroutine iotk_error_scan_logical_i(ierr,name,val)
  use iotk_base
  use iotk_interface
  implicit none
  integer, intent(in) :: ierr
  character(len=*), intent(in) :: name
  logical,          intent(out):: val
  val = .false.
  if(ierr==0) return
  if(abs(ierr)>iotk_error_pool_size) return
  if(.not. iotk_error_pool_used(abs(ierr))) return
  call iotk_error_scan(iotk_error_pool(abs(ierr)),name,val)
end subroutine iotk_error_scan_logical_i

subroutine iotk_error_scan_integer_e(error,name,val)
  use iotk_base
  use iotk_interface
  implicit none
  type(iotk_error), intent(in) :: error
  character(len=*), intent(in) :: name
  integer,          intent(out):: val
  character(range(val)+2) :: valc
  call iotk_error_scan(error,name,valc)
  call iotk_atoi(val,valc)
end subroutine iotk_error_scan_integer_e

subroutine iotk_error_scan_integer_i(ierr,name,val)
  use iotk_base
  use iotk_interface
  implicit none
  integer, intent(in) :: ierr
  character(len=*), intent(in) :: name
  integer,          intent(out):: val
  val = 0
  if(ierr==0) return
  if(abs(ierr)>iotk_error_pool_size) return
  if(.not. iotk_error_pool_used(abs(ierr))) return
  call iotk_error_scan(iotk_error_pool(abs(ierr)),name,val)
end subroutine iotk_error_scan_integer_i

function iotk_error_pool_pending_x()
  use iotk_base
  use iotk_interface
  implicit none
  integer :: iotk_error_pool_pending_x
  iotk_error_pool_pending_x = count (iotk_error_pool_used)
end function iotk_error_pool_pending_x

subroutine iotk_error_handler_x(ierr)
  use iotk_base
  use iotk_interface
  implicit none
  integer, intent(in) :: ierr
  integer :: pending,i
#ifdef __IOTK_MPI_ABORT
  include 'mpif.h'
  integer :: ierrx
#endif
  if(ierr==0) return
  do i = 1 , iotk_error_linelength
    write(0,"(a)",advance='no') "#"
  end do
  write(0,*)
  pending = iotk_error_pool_pending()
  if(pending>1) then
    write(0,"(a)") "# WARNING: there are pending errors"
    do i = 1 , iotk_error_pool_size
      if(iotk_error_pool_used(i) .and. i/=abs(ierr)) then
        write(0,"(a)") "# PENDING ERROR (ierr="//trim(iotk_itoa(i))//")"
        call iotk_error_print(i,0)
      end if
    end do
  end if
  write(0,"(a)") "# UNRECOVERABLE ERROR (ierr="//trim(iotk_itoa(ierr))//")"
  call iotk_error_print(ierr,0)
  do i = 1 , iotk_error_linelength
    write(0,"(a)",advance='no') "#"
  end do
  write(0,*)
#ifdef __IOTK_MPI_ABORT
  call MPI_Abort(MPI_COMM_WORLD,1,ierrx)
#else
  stop
#endif
end subroutine iotk_error_handler_x
