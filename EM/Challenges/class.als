sig Sala {
	curso : set Curso,
	edificio : set Edificio
}

sig Edificio {}
sig Curso {}

pred spec {
	// adivinhe as restrições deste modelo
    
    all s : Sala  |  one s.edificio
    all s : Sala  |  lone  s.curso
    all c : Curso |  some curso.c
    all c : Curso |  one curso.c.edificio
   
    
	}