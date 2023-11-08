using DrWatson
@quickactivate
function meteodo_numerico_explicito(m,n,Temp_inicial,δt,max_int=130,T_inf,h,L) #colocar o delta T sugerido aqui depois
    Temp=zeros(m,n,max_int)
    for i in 1:m
        for j in 1:n
            Temp[i,j,1]=Temp_inicial
        end
    end
        for t in 0:max_int #Nó 1
            Temp[1,n,(t+1)]=(1-4*τ-((2*τ*h*l)/k))*Temp[i,j,t]+2*τ(Temp[i+1,n,t]+Temp[i,(n-1),t]+((h*l*Tinf)/k))
            for i in 2:m/3 #nós parte superior esquerda
                Temp[i,n,t+1]=(1-4*τ-(2*τ*h*l/k))*Temp[i,n,t]+τ*(Temp[(i+1),n,t]+Temp[(i-1),n,t]+2*Temp[i,(n-1),t]+((2*h*l*T_inf)/k))
            end
            Temp[m/3,n,t+1]=(1-4*τ-((2*τ*l*T_inf)/k))*Temp[m/3,n,t] + (2*τ*(Temp[m/3,n-1,t] + Temp[(m/3)-1,n,t] + ((h*l*Temp_inf)/k))) #No da parte superior esquerda da direira
            for j in (n/2)+1: n-1  #nós da parte superior esquerda da direira
                T[m/3,j,t+1]=(1-4*τ-((2*τ*h*l)/k)) * Temp[m/3,j,t] + τ*(2*Temp[(m/3)-1,j,t]+ Temp[m/3,j-1,t] + Temp[m/3,j+1,t] + ((2*h*l*T_inf)/k))
            end 
            Temp[m/3,n/2,t+1]=(1-4*τ-((4*τ*h*l)/k)) * Temp[m/3,n/2,t] + ((τ/3) *(2*Temp[(m/3),(n/2)+1,t]+4*Temp[(m/3)-1,(n/2),t] + 2*Temp[(m/3)+1,(n/2),t] + 4*Temp[(m/3),(n/2)-1,t]
            + (4*h*l*T_inf)/k)) #Nó 1/2 n, 1/3 m
            for i in ((m/3)+1):(((2*m)/3)-1)
        end

    return Temp
end
