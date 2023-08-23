%% Examples
if 1
    clear all
    close all
    n = 10;
    xi = linspace(-1,1,n);
    x = linspace(-1,1,1000);
    
    if 1
        % Create Lagrange polynomials
        for j =1:n
            yi = zeros(n,1);
            yi(j) = 1; % L3
            
            % lagrange
            y =lagrange(xi,yi,x);
            plot(x,y,'Linewidth',2,'Displayname','lagrange');
        end
    end
    
    %==========================
    % Test Example
    yi = [3 2 2 1 0 -3 -4 1 2 4]; % for n=10
    
    %plot
    plot(xi, yi, 'o','MarkerSize',10,'MarkerFaceColor','r','MarkerEdgeColor','k')
    hold on
    
    % lagrange
    y =lagrange(xi,yi,x);
    plot(x,y,'Linewidth',2,'Displayname','lagrange');
    
    % linear
    y = interp1(xi,yi,x);
    plot(x,y,'b','Linewidth',2,'Displayname','linear')
    
    % spline
    y = interp1(xi,yi,x,'spline');
    plot(x,y,'g','Linewidth',2,'Displayname','in-built cubic spline')
    
    legend
    ax = gca;
    ax.FontSize = 16;
end



function [val] = lagrange(xi,yi,x)
% Function for performing lagrange interpolation
% INPUT
%   x       interpolation points
%   f       function values
%   y       evaluate the interpolation polynomial at points y

%
n = length(xi);
%
% if x is a row vector, transform it to a column vector
%
if size(xi,1)==1
    xi = xi';
end
%
% compute weights using the interpolation points
%
for j=1:n
    dif = xi(j) - [xi(1:j-1);xi(j+1:n)];
    w(j) = 1/prod(dif);
end

m = length(x);
val = zeros(m,1);
%
%  evaluate the interpolation polynomial at y
%
for i = 1:m
    sum=0;
    for j=1:n
        diff2=x(i)-[xi(1:j-1);xi(j+1:n)];
        pro=prod(diff2);
        v(j)=pro*w(j);
        sum=sum + v(j)*yi(j);
 
    end
    val(i)=sum;      
end
end