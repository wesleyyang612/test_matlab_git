init_time = save_T0{1}.Ta+save_T0{1}.Tv+save_T0{1}.Td;

tmp = init_time;
for i = 1:7
    tmp = tmp + save_T_neg2pos{i}.Ta+save_T_neg2pos{i}.Tv+save_T_neg2pos{i}.Td;
    tmp = tmp + save_T_pos2neg{i}.Ta+save_T_pos2neg{i}.Tv+save_T_pos2neg{i}.Td;
end 

vel8_neg2pos_left  = tmp + save_T_neg2pos{8}.Ta;
vel8_neg2pos_right = vel8_neg2pos_left+save_T_neg2pos{8}.Tv;

vel8_pos2neg_left  = vel8_neg2pos_right + save_T_neg2pos{8}.Td + save_T_pos2neg{8}.Ta;
vel8_pos2neg_right = vel8_pos2neg_left+save_T_pos2neg{8}.Tv;



