## Copyright (C) 2001 Paul Kienzle <pkienzle@users.sf.net>
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; see the file COPYING. If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn  {Function File} {} dct2 (@var{x})
## @deftypefnx {Function File} {} dct2 (@var{x}, @var{m}, @var{n})
## @deftypefnx {Function File} {} dct2 (@var{x}, [@var{m}, @var{n}])
## Compute the 2-D discrete cosine transform of matrix @var{x}.  If
## @var{m} and @var{n} are specified, the input is padded or trimmed
## to the desired size.
## @seealso{dct, idct, idct2}
## @end deftypefn

function y = dct2 (x, m, n)

  if (nargin < 1 || nargin > 3)
    print_usage;
  endif

  if nargin == 1
    [m, n] = size(x);
  elseif (nargin == 2)
    n = m(2);
    m = m(1);
  endif

  if m == 1
    y = dct (x.', n).';
  elseif n == 1
    y = dct (x, m);
  else
    y = dct (dct (x, m).', n).';
  endif

endfunction
