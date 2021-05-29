<template>
      <div class="w3-container">
    <h1 class="w3-header w3-black">Ontobud Users</h1>
    <br>
    <br>
<table class="w3-table-all">
  <tr>
    <th>Username</th>
    <th>Email</th>
  </tr>

  <tr v-for="(u,i) in users" :key="i">
    <td>{{u.name}}</td>
    <td>{{u.email}}</td>
  </tr> 
</table>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: "Users",

  data: function (){
    return {
      users: []
    }
  },
  methods:{
    getUsers: function (){
        axios.get('http://localhost:8080/ontobud/api/users')
            .then(dados =>  {
                console.log(dados.data)
               this.users=dados.data;
            })
            .catch(e =>{
                console.log("Erro na obtenção dos utilizadores ..." +e);
            })
    },
  },
    created(){
      this.getUsers();
  }

};
</script>

<style>
.w3-container{
text-align: center;
}
</style>
