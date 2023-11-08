using DrWatson
@quickactivate
function meteodo_numerico_explicito(m,n,Temp_inicial,δt,max_int=130) #colocar o delta T sugerido aqui depois
    Temp=zeros(m,n,max_int)
    for i in 1:m
        for j in 1:n
            Temp[i,j,1]=Temp_inicial
        end
    end
        for t in 0:max_int #Nó 1
            Temp[1,n,(t+1)]=(1-4*τ-((2*τhl)/k))*T[i,j,t]+2*τ(Temp[i+1,n,t]+Temp[i,(n-1),t]+((h*l*Tinf)/k))
            for i=2:m/3 #nós parte superior esquerda
                Temp[i,n,t+1]=(1-4*τ-(2*τ*h*l/k))*Temp[i,n,t]+τ*(Temp[i+1,n,t]+Temp[i-1,n,t]+2*Temp[i,n-1,t]+((2*h*l*T_inf)/k))
            end
            Temp[m/3,n,t+1]=
        end

    return Temp
end
