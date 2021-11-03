function result  = anti_symmetry(input_vector)
    %把输入的向量转化成成反对称矩阵
    %input_vector:[a1 a2 a3]';
    %result: 
    %[
    %    0   -a3  a2
    %    a3   0  -a1
    %   -a2  a1   0
    %]
    shape = size(input_vector);
    if(shape(1)~=3 || shape(2)~=1)
        error("[-] anti_symmetry failed: input is not a 3x1 vector!");
    end
    result = zeros(3,3);
    result(1,1) = 0;
    result(1,2) = -input_vector(3);
    result(1,3) = input_vector(2);
    result(2,1) = input_vector(3);
    result(2,2) = 0;
    result(2,3) = -input_vector(1);
    result(3,1) = -input_vector(2);
    result(3,2) = input_vector(1);
    result(3,3) = 0;
end