function c = conv(c,varargin)
%conv   convolve all traces with the final trace
% c = CONV(c) convolves all traces with the final trace. By default the new
% correlation object has traces that are 2*N-1 samples long, where the
% original traces are of length N. Because all traces ...

% Author: Michael West, Geophysical Institute, Univ. of Alaska Fairbanks
% $Date$
% $Revision$


% READ & CHECK ARGUMENTS
if (nargin>2)
    error('Wrong number of inputs');
end;

% GENERAL PARAMETERS
c = verify(c);
nTraces = c.ntraces;
keyTrace = nTraces;


X = fft(double(c.traces));             
Y = repmat( fft(double(c.traces(keyTrace))) , 1 , nTraces );    

save

Z = ifft(X.*conj(Y));  
for n = 1:nTraces
    c.traces(n).data =  Z(:,n);
end
end