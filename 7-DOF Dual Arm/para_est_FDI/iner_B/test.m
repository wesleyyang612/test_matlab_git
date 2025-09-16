close all
sequence = jointacttorque_filtered(:,4);
len = length(sequence);
len6 = len/6;
piece1 = sequence(4*len6:5*len6);
piece2 = sequence(5*len6:6*len6);

figure
plot(piece1)
hold on
plot(piece2)

figure
plot(piece1)
hold on
plot(flip(piece2))

figure
plot(piece1-flip(piece2))







