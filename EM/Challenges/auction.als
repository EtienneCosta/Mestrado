sig Artigo {
	oferta : Pessoa -> Valor
}
sig Valor {}
sig Pessoa {
	leiloes : set Artigo
}

pred inv1 {
	// O mesmo artigo não pode ser leiloado por duas pessoas diferentes
  
  all a : Artigo | lone leiloes.a

}


pred inv2 {
	// Uma pessoa não pode fazer ofertas em artigos que está a leiloar
  
  all p : Pessoa | no p.leiloes & oferta.Valor.p 
  
  

}


pred inv3 {
	// Não pode haver duas ofertas de igual valor para o mesmo artigo
  
  all a : Artigo, v : Valor | lone( a.oferta & Pessoa->v)


}