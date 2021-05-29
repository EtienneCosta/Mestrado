<template>
      <div class="w3-container">
    <h1 class="w3-header w3-black">Ontobud Users</h1>
    <br>
    <br>
<table class="w3-table-all">
  <tr>
    <th>ID</th>
    <th>TITLE</th>
    <th>URI</th>
  </tr>

  <tr  v-for="(r,i) in repos" :key="i">
    <td @click="goRepo(r.id.value)"> {{r.id.value}} </td>
    <td>{{r.title.value}}</td>
    <td>{{r.uri.value}}</td>
  </tr> 
</table>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: "Repos",

  data: function (){
    return {
      repos: []
    }
  },
  methods:{
    getRepos: function (){
        axios.get('http://localhost:8080/ontobud/api/rdf4j/management/listRepos')
            .then(dados =>  {
               this.repos=dados.data;
            })
            .catch(e =>{
                console.log("Erro na obtenção dos repositórios ..." +e);
            })
    },

    goRepo: function(id){
        this.$router.push("/repos/" + id);

    }
  },
    created(){
      this.getRepos();
  }

};
</script>

<style>
.w3-container{
text-align: center;
}
</style>
