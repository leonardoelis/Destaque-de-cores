%% Leitura da imagem
RGB = imread('arara_azul.png');
HSV = rgb2hsv(RGB);

H = HSV(:,:,1); % Matiz
S = HSV(:,:,2); % Saturação
V = HSV(:,:,3); % Intensidade

%% Criar máscara com a saturação
% Limiar de 10% do maior valor de saturação
limiar = .1*max(max(S));
s_mask = S>limiar;

%% Produto da Máscara com a Matiz
prod = H.*s_mask;
%subplot(2,2,2), imshow(prod); title('Matiz x Máscara')

%% Segmentação da imagem
mask = ((prod < 0.9) & (prod > 0.5));

% Tudo que é azul fica saturado em azul
% Tudo que não é azul fica em tons de cinza (saturação = zero)
HSV_seg = HSV;
HSV_seg(:,:,2) = mask; %Substitui a saturação
RGB_seg = hsv2rgb(HSV_seg);

figure
subplot(1,2,1), imshow(RGB);
subplot(1,2,2), imshow(RGB_seg); title('Tons de azul')
