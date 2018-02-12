clear;
A=load('native_speakers.txt');

x=2013:2017;

for i=1:22
    res(i,:)=polyfit(x,A(i,:),1);
end

data = A;

xx=2018:2068;

for i=1:22
    data(i,6:56)=polyval(res(i,:),xx);
    data(i,57)=i;
end

data=sortrows(data,-56);

for i=1:10
    num(i)=data(i,57);
end

colorspec = {[1 0 0];[0 1 0];[0 0 1];[1 1 0];[1 0 1];[0 1 1];[0 0 0];[0.1 0.5 0.9];[0.9 0.5 0.1];[0.4 0.3 0.2]};

figure;
for i=1:10
    plot(2013:2068,data(i,1:56),'Color',colorspec{i});
    hold on;
    p(i).Color=colorspec{i};
end


hold off;

title('Forecast the total speakers of the different languages in next 50 years(Top 10)');
xlabel('Years');
ylabel('Population(million)');
legend('Chinese','Spanish','Hindustani','Arabic','English','Bengali','Punjabi','Portuguese','Persian','Malay','Location','NorthWest');
% legend(Country(num(1)),)
set(gca,'FontSize',15);
set(findall(gca, 'Type', 'Line'),'LineWidth',2);
legend('boxoff');