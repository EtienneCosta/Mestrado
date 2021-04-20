<template>
  <div class="w3-container">
    <br>
    <h1>Authors</h1>
    <table class="w3-table-all">
      <tr>
        <th>#</th>
        <th>Id</th>
        <th>Name</th>
        <th>Number of Publications</th>
      </tr>
      <tr v-for="(u,i) in authors" :key="i">
        <td>{{i}}</td>
        <td>{{ u.id }}</td>
        <td>{{ u.name }}</td>
        <td @click="goRepo(u.id)">{{ u.total }}</td>
      </tr>
    </table>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Authors",

  data() {
    return {
      authors: null,
    };
  },
  methods: {
    goRepo: function (id) {
      this.$router.push("/authors/pubs/" + id);
    },
  },
  created() {
    axios.get("http://localhost:7777/authors")
      .then((res) => {
        this.authors = res.data;
      })
      .catch(e => {console.log("Erro na obtenção de autores "+e )})
  }
};
</script>
