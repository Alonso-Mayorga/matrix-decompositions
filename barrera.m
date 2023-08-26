function[xh, fxh] = barrera(f, l, u, e, lambda, rest, it)
[x, fx] = random_walk(f, l, u, e, lambda, it);
mu = 100;
i = 0;
while i < 5
    fh = f;
    rest = rest
    for j = 1:length(rest)
        fh = @(u) fh(u) + mu*rest{j}(u)
    end
    [xh, fxh] = random_walk(fh, l, u, e, lambda, it)
    if mu == 100 | fh(x) - fxh < e
        i = i + 1
    else
        x = xh; fx = fxh;
        i = 0
    end
    mu = mu/10
    if mu < 10^-50
        break
    end
        if length(l) == 2 % Dibuja la función y el punto óptimo del paso actual durante 0.5 segundos si estamos optimizando en 2d
        rx = [l(1), u(1)]
        ry = [l(2), u(2)]
        ffh = @(u) f(u)
        for j = 1:length(rest)
            ffh = @(u) ffh(u) + mu*rest{j}(u);
        end

        dibujar_funcion(ffh, rx, ry, 250, [x(2)], [x(1)])
        pause(0.5)
        if i < 5 %Borra el dibujo salvo en el último paso
            clf
        end
    end
end