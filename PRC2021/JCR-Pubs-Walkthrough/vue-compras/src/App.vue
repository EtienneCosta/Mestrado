<template>  
  <div class="w3-container">
    <h1 class="w3-header w3-black">Lista de Compras</h1>
    <br>
    <h2>{{autor}}</h2>
    <br>
<table class="w3-table-all">
  <tr>
    <th>Nome</th>
    <th>Quantidade</th>
    <th>Operações</th>

  </tr>
  
  <tr v-for="(c,i) in compras" :key="i">
    <td>{{c.nome}}</td>
    <td>{{c.quantidade}}</td>
    <td>
      <button type="button" @click="inserir(i)" class="btn btn-primary">Inserir</button>
      <button type="button" @click="apagar(i)" class="btn btn-danger">Remover</button>
    
      </td>
  </tr> 

</table>
  
  </div>
</template>

<script>

export default {
  name: "App",
  data (){
    return {

      compras:[
        { nome:'Peixe', quantidade:'10'},
        { nome:'Carne', quantidade:'7'},
        { nome:'Frutas', quantidade:'5'},
        { nome:'Vegetais', quantidade:'10'}
      ],
    autor:"Etienne Costa"

    }
  },

  methods:{
    apagar: function (x){
          this.compras[x].quantidade--;

      if(this.compras[x].quantidade==0){
        alert("Produto removido com sucesso ...");
        this.compras.splice(x,1);
      }

    },
    inserir: function(x){
                this.compras[x].quantidade++;
    }
  }

};
</script>

<style>
.w3-container{
text-align: center;
}
</style>
