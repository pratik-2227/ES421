N = 10;
x = linspace(1,10,N); % check the dimension
y = randi(10,[1,N]);

y = y'; %changing from row to column matrix 

% prepare G matrix  - Dimension (N+1) x (N+1)
%    [x0^0  x0^1  x1^2 ..... x1^N]
%    |x1^0  x1^1  x1^2 ..... x1^N|
%    |x2^0  x2^1  x2^2 ..... x2^N|
%G = |x3^0  x3^1  x3^2 ..... x3^N|
%    |:  :   :     :     :    :  |
%    [xN^0  xN^1  xN^2 ..... xN^N]

for i=1:N
  for j=1:N
    G(i,j)=x(i).^(j-1);
  end
end

data = y;

%finding the model parameters 
m = inv(G)*data; % m is column vector (N+1 x 1)

%now interpolating for 1000 values of x and finding values of yi(y-interpolated)
xi = linspace(x(1),x(end),1000);
xi = xi';


%preparing G1 matrix (1000x5)
for i=1:1000
    for j=1:N
        G1(i,j) = xi(i).^(j-1);
    end
end

%finding values of yi(y-interpolated)
yi = G1*m; %yi a column vector(1000x1)

%pplotting the values 
plot(x,y,'o');
hold on
plot(xi,yi);


